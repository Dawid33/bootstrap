#!/bin/bash

RUST_BACKTRACE=1 cargo build --target=x86_64-unknown-linux-musl --manifest-path strap/Cargo.toml --color=always 2>&1 | less -R +F 
