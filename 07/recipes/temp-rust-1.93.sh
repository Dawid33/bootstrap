#!/bin/sh

#> FETCH 4c230a44b3d9c9f3cef950943719f8380058d27c91fda5e36a9a947ef013e01f
#>  FROM https://static.rust-lang.org/dist/rustc-1.93.1-src.tar.gz

rm -rf /tmp/temp-rust-1.93
mkdir -p /tmp/temp-rust-1.93; cd /tmp/temp-rust-1.93
export PATH="/usr/busybox/bin:$PATH"
tar --strip-components=1 -xf /tmp/downloads/rustc-1.93.1-src.tar.gz
       
cat << EOF > config.toml
[build]
cargo = "/tmp/temp-rust-1.92/build/x86_64-unknown-linux-gnu/stage2-tools-bin/cargo"
rustc = "/tmp/temp-rust-1.92/build/x86_64-unknown-linux-gnu/stage3/bin/rustc"
full-bootstrap = true
vendor = true
extended = true
[llvm]
ninja = false
download-ci-llvm = false
EOF

PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig" LD_LIBRARY_PATH="/tmp/temp-rust-1.92/build/x86_64-unknown-linux-gnu/stage3/lib/rustlib/x86_64-unknown-linux-gnu/lib:/usr/local/lib64:/usr/lib" python3 ./x.py build --stage 3 && rm -rf /tmp/temp-rust-1.91
