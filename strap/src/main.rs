use landlock::{
    ABI, Access, AccessFs, Ruleset, RulesetAttr, RulesetCreatedAttr, RulesetError, RulesetStatus,
    path_beneath_rules,
};
use std::{
    cell::RefCell,
    collections::BTreeMap,
    fs,
    io::{BufRead, BufReader, Read},
    path::PathBuf,
    process::Stdio,
    rc::Rc,
};
use unshare::{Command, Namespace};

use clap::{Parser, Subcommand};
use log::{error, info};
use mlua::{
    Error, FromLua, FromLuaMulti, IntoLua, Lua, LuaOptions, ObjectLike, StdLib, TablePairs,
};
use serde::{Deserialize, Serialize};
use simplelog::{Config, SimpleLogger};

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    #[command(subcommand)]
    command: Option<Commands>,
}

#[derive(Subcommand, Debug)]
enum Commands {
    Run {
        name: String,
        version: String,
        step: String,
        #[clap(long, short, action)]
        rooted: bool,
    },
}

#[derive(Clone, Debug)]
struct PkgDerivation {
    name: String,
    versions: BTreeMap<String, Version>,
}

#[derive(Clone, Debug)]
struct Version {
    sources: BTreeMap<String, String>,
    steps: BTreeMap<String, mlua::Function>,
}

impl FromLua for Version {
    fn from_lua(value: mlua::Value, _lua: &Lua) -> mlua::Result<Self> {
        let table = value.as_table().unwrap();
        let sources: BTreeMap<String, String> = table.get("sources").expect("Package must steps.");
        let steps: BTreeMap<String, mlua::Function> =
            table.get("steps").expect("Package must steps.");
        Ok(Self { sources, steps })
    }
}

impl From<mlua::Value> for PkgDerivation {
    fn from(value: mlua::Value) -> Self {
        let table = value
            .as_table()
            .expect("Package must be a table of k/v pairs.");
        let name: String = table.get("name").expect("Package must have a name.");
        let versions: BTreeMap<String, Version> =
            table.get("versions").expect("Package must steps.");
        PkgDerivation { name, versions }
    }
}

pub fn load_lua_globals(lua: &mut Lua, path: &str) {
    let globals = lua.globals();
    let package: mlua::Table = globals.get("package").unwrap();
    package.set("path", path).unwrap();
    let sh = lua
        .create_function(|_, cmd: String| -> Result<String, mlua::Error> {
            let output = std::process::Command::new("sh")
                .arg("-c")
                .arg(cmd)
                .output()
                .expect("Failed to execute command");
            let output = String::from_utf8(output.stdout).unwrap();
            println!("{}", output);
            Ok(output)
        })
        .unwrap();
    globals.set("sh", sh).unwrap();

    let info = lua
        .create_function(|_, input: String| Ok(info!("{}", input)))
        .unwrap();
    globals.set("info", info).unwrap();

    let exec = lua
        .create_function(|_, (input, working_directory): (mlua::Table, String)| {
            let mut iter = input.pairs::<usize, String>().into_iter();
            let name = iter.next().unwrap().unwrap().1;
            let mut cmd = std::process::Command::new(name);
            cmd.current_dir(working_directory);
            while let Some(arg) = iter.next() {
                cmd.arg(arg.unwrap().1);
            }
            println!(
                "{}",
                String::from_utf8(cmd.output().unwrap().stdout).unwrap()
            );
            Ok(())
        })
        .unwrap();
    let rust = lua.create_table_from([("exec", exec)]).unwrap();
    globals.set("rust", rust).unwrap();
}

fn run_step() {}

fn restrict_thread() -> Result<(), RulesetError> {
    let abi = ABI::V1;
    let status = Ruleset::default()
        .handle_access(AccessFs::from_all(abi))?
        .create()?
        // Read-only access to /usr, /etc and /dev.
        .add_rules(path_beneath_rules(
            &["/usr", "/etc", "/dev"],
            AccessFs::from_read(abi),
        ))?
        // Read-write access to /home and /tmp.
        .add_rules(path_beneath_rules(
            &["/home", "/tmp"],
            AccessFs::from_all(abi),
        ))?
        .restrict_self()?;
    match status.ruleset {
        // The FullyEnforced case must be tested by the developer.
        RulesetStatus::FullyEnforced => println!("Fully sandboxed."),
        RulesetStatus::PartiallyEnforced => println!("Partially sandboxed."),
        // Users should be warned that they are not protected.
        RulesetStatus::NotEnforced => println!("Not sandboxed! Please update your kernel."),
    }
    Ok(())
}

pub fn main() {
    SimpleLogger::init(log::LevelFilter::Info, Config::default()).unwrap();
    let cli = Args::parse();
    match &cli.command {
        Some(Commands::Run {
            name,
            step: step_name,
            rooted,
            version,
        }) => {
            let strap = if *rooted {
                "/strap"
            } else {
                "/home/dawids/.local/share/strap"
            };
            println!("script path: {}/repos/official/bootstrap/00.lua", strap);
            let script =
                std::fs::read_to_string(format!("{}/repos/official/bootstrap/00.lua", strap))
                    .unwrap();
            let mut lua = Lua::new_with(StdLib::ALL_SAFE, LuaOptions::new()).unwrap();

            load_lua_globals(&mut lua, format!("{}/repos/?.lua", strap).as_str());
            let chunk = lua.load(script);
            let output: mlua::Value = chunk.eval().unwrap();
            let pkg_list = output
                .as_table()
                .expect("return from script should be a list of packages.");
            let mut pkg: Option<(PkgDerivation, Version)> = None;
            for pair in pkg_list.pairs::<String, mlua::Value>() {
                let val: mlua::Value = pair.unwrap().1;
                let pkg_derivation = PkgDerivation::from(val);
                if &pkg_derivation.name != name {
                    continue;
                }

                for (version_regex, version_info) in &pkg_derivation.versions {
                    let re = regex::Regex::new(version_regex).unwrap();
                    if re.is_match(version) {
                        if let Some(_) = version_info.steps.get(step_name) {
                            pkg = Some((pkg_derivation.clone(), version_info.clone()));
                        } else {
                            error!("No step '{}' for pacakge.", step_name);
                        }
                        break;
                    }
                }
            }

            let pkg = if let Some(pkg) = pkg {
                pkg
            } else {
                panic!("Package {:?} could not be found", name);
            };

            if *rooted {
                let step = pkg.1.steps.get(step_name).unwrap();
                step.call::<()>(()).unwrap();
            } else {
                let path = format!("{}/steps/{}/{}", strap, pkg.0.name, step_name);
                if std::fs::exists(&path).unwrap() {
                    std::fs::remove_dir_all(&path).unwrap();
                }
                std::fs::create_dir_all(format!("{}/strap", &path)).unwrap();
                std::fs::create_dir_all(format!("{}/dev", &path)).unwrap();
                std::fs::File::create(format!("{}/dev/null", &path)).unwrap();
                for (name, location) in pkg.1.sources {
                    std::process::Command::new("git")
                        .arg("clone")
                        .arg(location)
                        .arg(format!("{}/{}", path, name))
                        .output()
                        .unwrap();
                }
                std::process::Command::new("cp")
                    .arg("-r")
                    .arg(format!("{}/repos", strap))
                    .arg(format!("{}/strap/repos", path))
                    .output()
                    .unwrap();
                std::fs::hard_link(
                    std::env::current_exe().unwrap(),
                    format!("{}/strap/strap", path),
                )
                .unwrap();
                unshare::Command::new("/strap/strap")
                    .arg("run")
                    .arg(name)
                    .arg(version)
                    .arg(step_name)
                    .arg("--rooted")
                    .unshare([&Namespace::User])
                    .chroot_dir(path)
                    .current_dir("/")
                    .status()
                    .unwrap();
            }
        }
        None => {}
    }
}
