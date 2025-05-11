#!/store/2b2-busybox/bin/ash

rm -rf /tmp/host-rust
mkdir -p /tmp/host-rust; cd /tmp/host-rust
tar --strip-components=1 -xf /tmp/downloads/rustc-1.75.0-src.tar.gz

# export PATH="/tmp/temp-mrustc/build-rustc/output/bin:$PATH"

# mkdir -p build/x86_64-unknown-linux-gnu/stage0
# cp -r /tmp/temp-mrustc/build-rustc/output/* build/x86_64-unknown-linux-gnu/stage0
       
cat << EOF > config.toml
[build]
cargo = "/tmp/temp-mrustc/build-rustc/output/cargo"
rustc = "/tmp/temp-mrustc/build-rustc/output/rustc"
full-bootstrap = true
vendor = true
extended = true
[llvm]
ninja = false
download-ci-llvm = false
EOF

LD_LIBRARY_PATH=/tmp/temp-mrustc/build-rustc/output/lib/rustlib/x86_64-unknown-linux-gnu/lib python3 ./x.py build --stage 3

