#!/bin/sh

#> FETCH 9e0d2ca75c7e275fdc758255bf4b03afb3d65d1543602746907c933b6901c3b8
#>  FROM https://static.rust-lang.org/dist/rustc-1.92.0-src.tar.gz

rm -rf /tmp/temp-rust-1.92
mkdir -p /tmp/temp-rust-1.92; cd /tmp/temp-rust-1.92
export PATH="/usr/busybox/bin:$PATH"
tar --strip-components=1 -xf /tmp/downloads/rustc-1.92.0-src.tar.gz
       
cat << EOF > config.toml
[build]
cargo = "/tmp/temp-rust-1.91/build/x86_64-unknown-linux-gnu/stage2-tools-bin/cargo"
rustc = "/tmp/temp-rust-1.91/build/x86_64-unknown-linux-gnu/stage3/bin/rustc"
full-bootstrap = true
vendor = true
extended = true
[llvm]
ninja = false
download-ci-llvm = false
EOF

PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig" LD_LIBRARY_PATH="/tmp/temp-rust-1.91/build/x86_64-unknown-linux-gnu/stage3/lib/rustlib/x86_64-unknown-linux-gnu/lib:/usr/local/lib64:/usr/lib" python3 ./x.py build --stage 3 && rm -rf /tmp/temp-rust-1.90
