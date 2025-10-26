use landlock::{
    ABI, Access, AccessFs, Ruleset, RulesetAttr, RulesetCreatedAttr, RulesetError, RulesetStatus,
    path_beneath_rules,
};
use std::collections::BTreeMap;
use unshare::{Command, Namespace};

use clap::{Parser, Subcommand};
use log::{error, info};
use mlua::{
    Error, FromLua, FromLuaMulti, IntoLua, Lua, LuaOptions, ObjectLike, StdLib, TablePairs,
};
use serde::{Deserialize, Serialize};
use simplelog::{Config, SimpleLogger};
mod runtime;

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
    steps: BTreeMap<String, Step>,
}

#[derive(Clone, Debug)]
struct Step {
    pkg_name: String,
    version: String,
    step_name: String,
    deps: BTreeMap<String, mlua::Value>,
    action: mlua::Function,
}

impl FromLua for Step {
    fn from_lua(value: mlua::Value, _lua: &Lua) -> mlua::Result<Self> {
        let table = value.as_table().unwrap();
        let version: String = table.get("version").unwrap();
        let pkg_name: String = table.get("pkg_name").unwrap();
        let name: String = table.get("step_name").unwrap();
        let deps: BTreeMap<String, mlua::Value> = table.get("deps").unwrap();
        let action: mlua::Function = table.get("action").expect("Step must have action.");
        Ok(Self {
            deps,
            action,
            version,
            step_name: name,
            pkg_name,
        })
    }
}

impl FromLua for Version {
    fn from_lua(value: mlua::Value, _lua: &Lua) -> mlua::Result<Self> {
        let steps: BTreeMap<String, Step> = value
            .as_table()
            .unwrap()
            .pairs()
            .map(|entry| {
                let (k, v) = entry.unwrap();
                return (k, v);
            })
            .collect();
        Ok(Self { steps })
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
            step,
            rooted,
            version,
        }) => {
            let strap_path = if *rooted {
                "/strap"
            } else {
                "/home/dawids/.local/share/strap"
            };
            let mut runtime =
                runtime::Runtime::new(name, strap_path, "/official/bootstrap/tcc-triplet.lua");

            if *rooted {
                // Run step in rooted environment
                runtime.run_step_rooted(version, step);
            } else {
                // Setup rooted environment and call self as rooted program.
                info!("{:?}", runtime.setup_and_run_step(version, step));
            }
        }
        None => {}
    }
}
