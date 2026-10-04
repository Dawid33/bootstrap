#!/bin/sh

#> FETCH 93f6eecc634afd5e421a6bcf0a3695218009c7038127cc551d2b1a3e4183a6ae
#>  FROM https://static.rust-lang.org/dist/2026-10-04/rustc-nightly-src.tar.gz
#>    AS rustc-nightly-2026-10-04-src.tar.gz

rm -rf /tmp/temp-rust-1.101
mkdir -p /tmp/temp-rust-1.101; cd /tmp/temp-rust-1.101
export PATH="/usr/busybox/bin:$PATH"
tar --strip-components=1 -xf /tmp/downloads/rustc-nightly-2026-10-04-src.tar.gz
       
cat << EOF > config.toml
[build]
cargo = "/tmp/temp-rust-1.100/build/x86_64-unknown-linux-gnu/stage2-tools-bin/cargo"
rustc = "/tmp/temp-rust-1.100/build/x86_64-unknown-linux-gnu/stage3/bin/rustc"
full-bootstrap = true
vendor = true
extended = true
target = ["x86_64-unknown-linux-gnu", "x86_64-unknown-linux-musl"]
[rust]
lld = true
[llvm]
ninja = false
download-ci-llvm = false
[target.x86_64-unknown-linux-musl]
musl-root = "/usr/local/musl"
cc = "/usr/local/musl/bin/musl-gcc"
cxx = "/usr/local/musl/bin/musl-g++"
EOF

PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig" LD_LIBRARY_PATH="/tmp/temp-rust-1.100/build/x86_64-unknown-linux-gnu/stage3/lib/rustlib/x86_64-unknown-linux-gnu/lib:/usr/local/lib64:/usr/lib" python3 ./x.py build --stage 3 && rm -rf /tmp/temp-rust-1.99
PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig" LD_LIBRARY_PATH="/tmp/temp-rust-1.100/build/x86_64-unknown-linux-gnu/stage3/lib/rustlib/x86_64-unknown-linux-gnu/lib:/usr/local/lib64:/usr/lib" python3 ./x.py install
