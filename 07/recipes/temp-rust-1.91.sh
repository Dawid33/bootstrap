#!/bin/sh

#> FETCH 38dce205d39f61571261f0444237a1ce9efecb970e760d8ec4d957af5b445723
#>  FROM https://static.rust-lang.org/dist/rustc-1.91.1-src.tar.gz

rm -rf /tmp/temp-rust-1.91
mkdir -p /tmp/temp-rust-1.91; cd /tmp/temp-rust-1.91
export PATH="/usr/busybox/bin:$PATH"
tar --strip-components=1 -xf /tmp/downloads/rustc-1.91.1-src.tar.gz
       
cat << EOF > config.toml
[build]
cargo = "/tmp/temp-rust-1.90/build/x86_64-unknown-linux-gnu/stage2-tools-bin/cargo"
rustc = "/tmp/temp-rust-1.90/build/x86_64-unknown-linux-gnu/stage3/bin/rustc"
full-bootstrap = true
vendor = true
extended = true
[llvm]
ninja = false
download-ci-llvm = false
EOF

PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig" LD_LIBRARY_PATH="/tmp/temp-rust-1.90/build/x86_64-unknown-linux-gnu/stage3/lib/rustlib/x86_64-unknown-linux-gnu/lib:/usr/local/lib64:/usr/lib" python3 ./x.py build --stage 3 && rm -rf /tmp/temp-mrustc
