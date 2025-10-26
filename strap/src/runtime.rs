use std::{
    collections::BTreeMap,
    io::{BufRead, BufReader},
    path::PathBuf,
    process::Stdio,
    str::FromStr,
};

use clap::Arg;
use log::{error, info};
use mlua::{FromLua, Lua, LuaOptions, StdLib};
use serde::{Deserialize, Serialize};
use unshare::Namespace;

use crate::{PkgDerivation, Step, Version};

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
            cmd.stdout(Stdio::piped());
            cmd.current_dir(working_directory);
            while let Some(arg) = iter.next() {
                cmd.arg(arg.unwrap().1);
            }
            let mut child = cmd.spawn().unwrap();
            let reader = child.stdout.take().unwrap();
            let bufread = BufReader::new(reader);
            for x in bufread.lines() {
                println!("{}", x.unwrap());
            }
            Ok(())
        })
        .unwrap();
    let rust = lua.create_table_from([("exec", exec)]).unwrap();
    globals.set("rust", rust).unwrap();
}

type Artifacts = Vec<String>;

// impl FromLua for Artifacts {
//     fn from_lua(value: mlua::Value, lua: &Lua) -> mlua::Result<Self> {
//         let table = value.as_table().unwrap();
//         let tags: BTreeMap<String, String> = table.get("tags").unwrap();
//         return Ok(Artifacts { tags });
//     }
// }

// A general struct for managing information during a step executions runtime
pub struct Runtime {
    lua: Lua,
    pkg: PkgDerivation,
    name: String,
    base_path: PathBuf,
}

impl Runtime {
    pub fn new(name: &str, base_path: &str, script_path: &str) -> Self {
        let script =
            std::fs::read_to_string(format!("{}/repos{}", base_path, script_path)).unwrap();
        let mut lua = Lua::new_with(StdLib::ALL_SAFE, LuaOptions::new()).unwrap();

        load_lua_globals(&mut lua, format!("{}/repos/?.lua", base_path).as_str());
        let chunk = lua.load(script);
        let output: mlua::Value = chunk.eval().unwrap();
        let pkg_list = output
            .as_table()
            .expect("return from script should be a list of packages.");
        let mut pkg: Option<PkgDerivation> = None;
        for pair in pkg_list.pairs::<String, mlua::Value>() {
            let val: mlua::Value = pair.unwrap().1;
            let pkg_derivation = PkgDerivation::from(val);
            if &pkg_derivation.name == name {
                pkg = Some(pkg_derivation.clone());
                break;
            }
        }
        let pkg = if let Some(pkg) = pkg {
            pkg
        } else {
            panic!("Package {:?} could not be found", name);
        };
        Self {
            pkg,
            base_path: PathBuf::from_str(base_path).unwrap(),
            name: name.to_string(),
            lua,
        }
    }

    pub fn run_step_rooted(&self, version: &str, step: &str) {
        // TODO: Put in checks to ensure this function fails if called in a
        // non-chroot context.
        let version = self
            .try_match_version(version)
            .expect(&format!("Could not find build for version {:?}", version));
        let step = version.steps.get(step).unwrap();
        let result = step.action.call::<Artifacts>(()).unwrap();
        let data = serde_json::to_string_pretty(&result).unwrap();
        std::fs::write("/strap/artifacts.json", data.as_bytes()).unwrap();
    }

    pub fn try_match_version(&self, version_name: &str) -> Option<&Version> {
        let mut version: Option<&Version> = None;
        for (version_regex, version_info) in &self.pkg.versions {
            let re = regex::Regex::new(version_regex).unwrap();
            if re.is_match(version_name) {
                version = Some(version_info);
                break;
            }
        }
        version
    }
    pub fn setup_and_run_step_inner(
        &mut self,
        pkg_name: &str,
        version_name: &str,
        step_name: &str,
    ) -> Artifacts {
        let version = self.try_match_version(version_name).expect(&format!(
            "Could not find build for version {:?}",
            version_name
        ));
        let step = version.steps.get(step_name).unwrap().clone();

        let path = format!(
            "{}/steps/{}/{}",
            self.base_path.to_str().unwrap(),
            pkg_name,
            step_name
        );

        let artifacts = format!("{}/strap/artifacts.json", path);
        let read_artifacts = || {
            let data = std::fs::read_to_string(&artifacts).unwrap();
            return serde_json::from_str(&data).unwrap();
        };

        if std::fs::exists(&artifacts).unwrap() {
            return read_artifacts();
        }

        info!("Setting up '{} {} {}", pkg_name, version_name, step_name);
        if std::fs::exists(&path).unwrap() {
            std::fs::remove_dir_all(&path).unwrap();
        }
        std::fs::create_dir_all(format!("{}/strap", &path)).unwrap();
        std::fs::create_dir_all(format!("{}/dev", &path)).unwrap();
        std::fs::File::create(format!("{}/dev/null", &path)).unwrap();
        for (name, dep) in step.deps.clone().iter() {
            match dep.type_name() {
                "string" => {
                    let location = dep.as_string().unwrap().to_string_lossy();
                    let url = match url::Url::parse(&location) {
                        Ok(url) => url,
                        Err(e) => panic!("failed to parse url: {} because {}", location, e),
                    };
                    match url.scheme() {
                        "git" => {
                            info!("git clone for '{} {} {}", pkg_name, version_name, step_name);
                            let output = std::process::Command::new("git")
                                .arg("clone")
                                .arg(url.path())
                                .arg(format!("{}/{}", path, name))
                                .output()
                                .unwrap();

                            if !output.status.success() {
                                error!("Git clone failed: {}", output.status);
                            }
                        }
                        "inner" => {
                            self.setup_and_run_step_inner(
                                &self.pkg.name.clone(),
                                version_name,
                                url.path(),
                            );
                        }
                        _ => panic!("Unknown url scheme: {}", url.scheme()),
                    }
                }
                _ => {
                    panic!("Bad dep type: {:?}", dep)
                }
            }
        }
        std::process::Command::new("cp")
            .arg("-r")
            .arg(format!("{}/repos", self.base_path.to_str().unwrap()))
            .arg(format!("{}/strap/repos", path))
            .output()
            .unwrap();
        std::fs::hard_link(
            std::env::current_exe().unwrap(),
            format!("{}/strap/strap", path),
        )
        .unwrap();
        // Launch self as rooted app
        info!("Running '{} {} {}", pkg_name, version_name, step_name);
        let mut child = unshare::Command::new("/strap/strap")
            .arg("run")
            .arg(&self.name)
            .arg(version_name)
            .arg(step_name)
            .arg("--rooted")
            .unshare([&Namespace::User])
            .chroot_dir(path)
            .current_dir("/")
            .stdout(unshare::Stdio::Pipe)
            .spawn()
            .unwrap();
        let reader = child.stdout.take().unwrap();
        let bufread = BufReader::new(reader);
        for x in bufread.lines() {
            println!("{}", x.unwrap());
        }
        return read_artifacts();
    }

    pub fn setup_and_run_step(&mut self, version_name: &str, step_name: &str) -> Artifacts {
        self.setup_and_run_step_inner(&self.pkg.name.clone(), version_name, step_name)
    }
}
