use std::{cell::RefCell, collections::BTreeMap, rc::Rc};

use clap::{Parser, Subcommand};
use mlua::{Lua, LuaOptions, StdLib};
use serde::Deserialize;

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    #[command(subcommand)]
    command: Option<Commands>,
}

#[derive(Subcommand, Debug)]
enum Commands {
    Run { name: String },
}

#[derive(Deserialize, Clone, Debug)]
struct PkgDeclaration {
    name: String,
    source: String,
    metadata: BTreeMap<String, String>,
}

impl PkgDeclaration {
    pub fn new(name: String, source: String, metadata: BTreeMap<String, String>) -> Self {
        Self {
            name,
            metadata,
            source,
        }
    }
}

// Recursively read and execute repo luau files. Collect and return a list of
// packages that they register.
fn load_package_list(path: &str) -> BTreeMap<String, PkgDeclaration> {
    let script = std::fs::read_to_string(path).unwrap();
    let lua = Lua::new_with(StdLib::ALL, LuaOptions::new()).unwrap();
    let globals = lua.globals();
    let packages = Rc::new(RefCell::new(BTreeMap::new()));
    let packages_ref = packages.clone();
    let register = lua
        .create_function_mut(move |_, (package, source): (mlua::Table, String)| {
            let mut name: Option<String> = None;
            let mut metadata = BTreeMap::new();
            for entry in package.pairs::<String, mlua::Value>() {
                if let Ok((k, v)) = entry {
                    match k.as_str() {
                        "name" => {
                            name = Some(
                                v.as_string()
                                    .expect("name of package must be a string.")
                                    .to_string_lossy(),
                            );
                        }
                        _ => {
                            let value = v.as_string().expect(
                                format!("value for key {:?} value must be a string.", k).as_str(),
                            );
                            metadata.insert(k, value.to_string_lossy());
                        }
                    }
                }
            }

            if let Some(name) = name {
                packages_ref
                    .borrow_mut()
                    .insert(name.clone(), PkgDeclaration::new(name, source, metadata));
                Ok(false)
            } else {
                println!("Error: Package cannot be defined without a name key.");
                Ok(true)
            }
        })
        .unwrap();
    globals.set("register", register).unwrap();
    let chunk = lua.load(script);
    chunk.exec().unwrap();
    return packages.borrow().clone();
}

struct PkgBuild {}

pub fn main() {
    let cli = Args::parse();
    let path = "pkgs/repo.luau";
    match &cli.command {
        Some(Commands::Run { name }) => {
            let packages = load_package_list(path);
            if let Some(pkg) = packages.get(name) {
                // TODO: Determine if file path or url
                let script_path = format!("{}/{}", path, &pkg.source);
                println!("{}", script_path);
                let script = std::fs::read_to_string(script_path).unwrap();
                println!("{}", script);
            } else {
            }
        }
        None => {}
    }
}
