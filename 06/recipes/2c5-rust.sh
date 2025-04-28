#!/store/2b2-busybox/bin/ash

# FETCH bddacba2c4008d27d6beb486dc701f8e39d7ce073053749c4d2c56013b6d2999
#  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/rustc-1.85.0-x86_64-unknown-linux-gnu.tar.gz

# FETCH b3ad21966023d24fac039385201dc4109a2f25e6f7a0a5b2a0910eccfdc0c4a9
#  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/rust-std-1.85.0-x86_64-unknown-linux-gnu.tar.gz

# FETCH e27ffcafa0c7a8eee305085155530974ba62edf5278548ba6de4e0674f55c372
#  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/cargo-1.85.0-x86_64-unknown-linux-gnu.tar.gz

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2a7-cmake/bin"
export PATH="$PATH:/store/2c4-mrustc"
export PATH="$PATH:/store/2a8-python/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2b1-clang/bin"
export PATH="$PATH:/store/2c2-pkg-config/bin"
export PATH="$PATH:/store/2b3-gnumake/wrappers"
export PATH="$PATH:/store/2b9-binutils/bin"

rm -rf /tmp/2c5-rust
mkdir -p /tmp/2c5-rust; cd /tmp/2c5-rust
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: unpacking rust sources..."
tar --strip-components=1 -xf /downloads/rustc-1.75.0-src.tar.gz

echo "### $0: aliasing curl to true..."
mkdir aliases;
ln -s /store/1-stage1/protobusybox/bin/true aliases/curl
export PATH="/tmp/2c5-rust/aliases:$PATH"

set -e
export LD_LIBRARY_PATH="/store/2c1-zlib/lib"

mkdir -p build/x86_64-unknown-linux-gnu/stage0
cp -r /store/2c4-mrustc/* build/x86_64-unknown-linux-gnu/stage0
       
cat << EOF > config.toml
[build]
cargo = "/store/2c4-mrustc/cargo"
rustc = "/store/2c4-mrustc/rustc"
full-bootstrap = true
vendor = true
extended = true
[llvm]
ninja = false
download-ci-llvm = false
EOF
LD_LIBRARY_PATH=/store/2c4-mrustc python3 ./x.py build --stage 3

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/4b /store/2c5-rust )
