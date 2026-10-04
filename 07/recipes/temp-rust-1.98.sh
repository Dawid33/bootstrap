#!/bin/sh

#> FETCH dc9f8b917b32444d6c7ac43cc1b409013d3a9a633338bb60c14cdae1d15ee65a
#>  FROM https://static.rust-lang.org/dist/rustc-1.98.1-src.tar.gz

rm -rf /tmp/temp-rust-1.98
mkdir -p /tmp/temp-rust-1.98; cd /tmp/temp-rust-1.98
export PATH="/usr/busybox/bin:$PATH"
tar --strip-components=1 -xf /tmp/downloads/rustc-1.98.1-src.tar.gz
       
cat << EOF > config.toml
[build]
cargo = "/tmp/temp-rust-1.97/build/x86_64-unknown-linux-gnu/stage2-tools-bin/cargo"
rustc = "/tmp/temp-rust-1.97/build/x86_64-unknown-linux-gnu/stage3/bin/rustc"
full-bootstrap = true
vendor = true
extended = true
[llvm]
ninja = false
download-ci-llvm = false
EOF

PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig" LD_LIBRARY_PATH="/tmp/temp-rust-1.97/build/x86_64-unknown-linux-gnu/stage3/lib/rustlib/x86_64-unknown-linux-gnu/lib:/usr/local/lib64:/usr/lib" python3 ./x.py build --stage 3 && rm -rf /tmp/temp-rust-1.96
