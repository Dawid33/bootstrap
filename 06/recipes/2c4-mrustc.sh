#!/store/2b2-busybox/bin/ash

#> FETCH baf1e86311e004a638b35730b4d7e72644938a6bbbbf65a862245b92ba5325ad
#>  FROM https://github.com/thepowersgang/mrustc/archive/refs/tags/v0.11.2.tar.gz
#>    AS mrustc-0.11.2.tar.gz
 
#  FETCH 96f934d60d281948b515fee979f0fd2cde4ef83afd9881ed0469245814c868e7
#   FROM https://github.com/thepowersgang/mrustc/archive/refs/tags/rustc_bootstrapped-v1.74.tar.gz
#     AS rustc_bootstrapped-v1.74.tar.gz

#> FETCH 882b584bc321c5dcfe77cdaa69f277906b936255ef7808fcd5c7492925cf1049
#>  FROM https://static.rust-lang.org/dist/rustc-1.74.0-src.tar.gz
#>    AS rustc-1.74.0-src.tar.gz

#> FETCH 022a27286df67900a044d227d9db69d4732ec3d833e4ffc259c4425ed71eed80
#>  FROM https://static.rust-lang.org/dist/rustc-1.75.0-src.tar.gz
 
export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2a7-cmake/bin"
export PATH="$PATH:/store/2c3-perl/bin"
export PATH="$PATH:/store/2a8-python/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2b3-gnumake/wrappers"
export PATH="$PATH:/store/2b9-binutils/bin"

rm -rf /tmp/2c4-mrustc
mkdir -p /tmp/2c4-mrustc; cd /tmp/2c4-mrustc
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: unpacking mrustc sources..."
tar --strip-components=1 -xf /downloads/mrustc-0.11.2.tar.gz

echo "### $0: building mrustc..."
cp /downloads/rustc-1.74.0-src.tar.gz rustc-1.74.0-src.tar.gz

echo "### $0: aliasing cc to gcc..."
mkdir -p aliases;
ln -sf /store/2b4-gnugcc13/bin/gcc aliases/cc
export PATH="/tmp/2c4-mrustc/aliases:$PATH"

set -e
export RUSTC_VERSION=1.74.0 MRUSTC_TARGET_VER=1.74 OUTDIR_SUF=-1.74.0
export RUSTC_TARGET=x86_64-unknown-linux-gnu
export LIBRARY_PATH="/store/2b4-gnugcc13/lib:/store/2c1-zlib/lib"
export LD_LIBRARY_PATH="/store/2b4-gnugcc13/lib:/store/2c1-zlib/lib"
export CPATH="/store/2c1-zlib/include:/store/2b4-gnugcc13/include"
export PARLEVEL=$NPROC
export SHELL=/store/2b2-busybox/bin/ash

sed -i 's|env.push_back("RUSTC", parent.m_compiler_path);|env.push_back("RUSTC", "/tmp/2c4-mrustc/tools/bin/mrustc");|' tools/minicargo/build.cpp
sed -i 's|RUSTC_ENV_VARS += LD_LIBRARY_PATH=$(abspath $(OUTDIR))|RUSTC_ENV_VARS += LD_LIBRARY_PATH=$(abspath $(OUTDIR))\nRUSTC_ENV_VARS += REAL_LIBRARY_PATH=/store/2b4-gnugcc13/lib:$(abspath $(OUTDIR))|' minicargo.mk

mkdir -p output-1.74.0
cp -r /store/2c1-zlib/lib/* output-1.74.0

make -j $NPROC -o rustc-1.74.0-src.tar.gz 
mkdir -p tools/bin
cp -r bin/* tools/bin
make CC=gcc -j $NPROC -f minicargo.mk -o rustc-1.74.0-src.tar.gz LIBS

RUSTC_INSTALL_BINDIR=bin make CC=gcc -f minicargo.mk -o rustc-1.74.0-src.tar.gz rustc-1.74.0-src/build/bin/llvm-config
export PARLEVEL=1
RUSTC_INSTALL_BINDIR=bin make CC=gcc -f minicargo.mk -o rustc-1.74.0-src.tar.gz output-1.74.0/rustc
./output-1.74.0/rustc --version

rm -rf ./output-1.74.0/cargo-build
LIBGIT2_SY_USE_PKG_CONFIG=1 make CC=gcc -f minicargo.mk -o rustc-1.74.0-src.tar.gz output-1.74.0/cargo
./output-1.74.0/cargo --version

 
export LIBRARY_PATH="/store/2b4-gnugcc13/lib:/store/2c1-zlib/lib:/store/2c0-glibc/lib"
export LD_LIBRARY_PATH="/store/2b4-gnugcc13/lib:/store/2c1-zlib/lib:/store/2c0-glibc/lib"
export MAKEFLAGS=-j8
rm -r run_rustc/output-1.74.0/*
make CC=gcc -C run_rustc RUSTC_VERSION=1.74.0
PREFIX=/temp/2c4-mrustc/run_rustc/output-1.74.0/prefix/
cat ./rustc-1.74.0-src/library/test/Cargo.toml

# mkdir -p /store/2c4-mrustc
# cp ./output-1.74.0/* /store/2c4-mrustc


echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2c4 /store/2c4-mrustc )
