#!/bin/sh

rm -rf /tmp/host-rust-1.91
mkdir -p /tmp/host-rust-1.91; cd /tmp/host-rust-1.91
export PATH="/usr/busybox/bin:$PATH"
tar --strip-components=1 -xf /tmp/downloads/rustc-1.91.0-src.tar.gz
       
cat << EOF > config.toml
[build]
cargo = "/tmp/temp-rust-1.90/build/x86_64-unknown-linux-gnu/stage3-tools-bin/cargo"
rustc = "/tmp/temp-rust-1.90/build/x86_64-unknown-linux-gnu/stage3/bin/rustc"
full-bootstrap = true
vendor = true
extended = true
[llvm]
ninja = false
download-ci-llvm = false
EOF

PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig" LD_LIBRARY_PATH="/tmp/temp-rust-1.90/build/x86_64-unknown-linux-gnu/stage3/lib/rustlib/x86_64-unknown-linux-gnu/lib:/usr/local/lib64:/usr/lib" python3 ./x.py build --stage 3
mkdir -p /usr/local/rust
rm -rf /tmp/temp-rust-1.89
# cp -r /tmp/host-rust-1.90/build/x86_64-unknown-linux-gnu/stage3* /usr/local/rust/


