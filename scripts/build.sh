#!/bin/bash

cd strap; RUST_BACKTRACE=1 cargo build --color=always 2>&1 | less -R +F 
