#!/store/2b2-busybox/bin/ash

#> FETCH baf1e86311e004a638b35730b4d7e72644938a6bbbbf65a862245b92ba5325ad
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/mrustc-0.11.2.tar.gz
#>    AS mrustc-0.11.2.tar.gz
 
#> FETCH 882b584bc321c5dcfe77cdaa69f277906b936255ef7808fcd5c7492925cf1049
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/rustc-1.74.0-src.tar.gz
#>    AS rustc-1.74.0-src.tar.gz

#> FETCH 5b739f45bc9d341e2d1c570d65d2375591e22c2d23ef5b8a37711a0386abc088
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/rustc-1.75.0-src.tar.gz
 
export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2c0-glibc/bin"
export PATH="$PATH:/store/2c0-glibc/lib"
export PATH="$PATH:/store/2a7-cmake/bin"
export PATH="$PATH:/store/2c4-patchelf/bin"
export PATH="$PATH:/store/2c3-perl/bin"
export PATH="$PATH:/store/2a8-python/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2b3-gnumake/wrappers"
export PATH="$PATH:/store/2b9-binutils/bin"
# rm -rf /tmp/2c4-mrustc
mkdir -p /tmp/2c4-mrustc; cd /tmp/2c4-mrustc
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: unpacking mrustc sources..."
tar --strip-components=1 -xf /downloads/mrustc-0.11.2.tar.gz

echo "### $0: building mrustc..."
cp /downloads/rustc-1.74.0-src.tar.gz rustc-1.74.0-src.tar.gz

echo "### $0: aliasing cc to gcc..."

SYSROOT=/store/2c0-glibc
LINKER=$SYSROOT/lib/ld-linux-x86-64.so.2
export _LDFLAG="--dynamic-linker=$SYSROOT/lib/libc.so.1 -B/store/2b4-gnugcc13/lib -L/store/2b4-gnugcc13/lib -B/store/2c0-glibc/lib"
export _NEWINC="-I$SYSROOT/include"
export _REALCC="-I$SYSROOT/include"
mkdir -p wrappers
echo '#!/store/1-stage1/protobusybox/bin/ash' > wrappers/cc
echo 'exec gcc -Wl,$_LDFLAG "$@"' >> wrappers/cc
chmod +x wrappers/cc 
export PATH="/tmp/2c4-mrustc/wrappers:$PATH"

set -e
export RUSTC_VERSION=1.74.0 MRUSTC_TARGET_VER=1.74 OUTDIR_SUF=-1.74.0
export RUSTC_TARGET=x86_64-unknown-linux-gnu
# export LIBRARY_PATH="/store/2b4-gnugcc13/lib:/store/2c1-zlib/lib"
# export LD_LIBRARY_PATH="/store/2b4-gnugcc13/lib:/store/2c1-zlib/lib"
# export CPATH="/store/2c1-zlib/include:/store/2b4-gnugcc13/include"
export PARLEVEL=$NPROC
export SHELL=/store/2b2-busybox/bin/ash

sed -i 's|env.push_back("RUSTC", parent.m_compiler_path);|env.push_back("RUSTC", "/tmp/2c4-mrustc/tools/bin/mrustc");|' tools/minicargo/build.cpp
sed -i 's|RUSTC_ENV_VARS += LD_LIBRARY_PATH=$(abspath $(OUTDIR))|RUSTC_ENV_VARS += LD_LIBRARY_PATH=$(abspath $(OUTDIR))\nRUSTC_ENV_VARS += REAL_LIBRARY_PATH=/store/2b4-gnugcc13/lib:$(abspath $(OUTDIR))|' minicargo.mk
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' run_rustc/rustc_proxy.sh

# mkdir -p output-1.74.0
# cp -r /store/2c1-zlib/lib/* output-1.74.0

echo "### $0: building mrustc..."
# make -j $NPROC -o rustc-1.74.0-src.tar.gz 
# mkdir -p tools/bin
# cp -r bin/* tools/bin
# make CC=gcc -j $NPROC -f minicargo.mk -o rustc-1.74.0-src.tar.gz LIBS

echo "### $0: building minicargo and supporting rust libraries..."
# RUSTC_INSTALL_BINDIR=bin make CC=gcc -f minicargo.mk -o rustc-1.74.0-src.tar.gz rustc-1.74.0-src/build/bin/llvm-config
# export PARLEVEL=1
# RUSTC_INSTALL_BINDIR=bin make CC=gcc -f minicargo.mk -o rustc-1.74.0-src.tar.gz output-1.74.0/rustc
# ./output-1.74.0/rustc --version

echo "### $0: building rustc and with mrustc..."
# rm -rf ./output-1.74.0/cargo-build
# LIBGIT2_SY_USE_PKG_CONFIG=1 make CC=gcc -f minicargo.mk -o rustc-1.74.0-src.tar.gz output-1.74.0/cargo
# ./output-1.74.0/cargo --version
 
echo "### $0: re-building rustc with rustc that was compiled by mrustc..."
# sed -i 's|/bin/bash|/store/2b2-busybox/bin/ash|' /store/2c0-glibc/bin/ldd

# patchelf --remove-rpath /store/2c0-glibc/lib/ld-linux-x86-64.so.2
# patchelf --set-rpath /store/2b0-musl/lib /store/2b4-gnugcc13/lib/libgcc_s.so.1
# patchelf --set-rpath /store/2b0-musl/lib  /store/2c1-zlib/lib/libz.so.1.3.1

# /store/2c1-zlib/lib/libz.so.1.3.1
/tmp/2c4-mrustc/run_rustc/output-1.74.0/build-std2/release/build/libc-be83dff7b8585a08/build-script-build

export LIBRARY_PATH="/store/2c1-zlib/lib"
export LD_LIBRARY_PATH="/store/2c1-zlib/lib:/store/2b0-glibc/lib:/store/2b4-gnugcc13/lib"
# export CPATH="/store/2c1-zlib/include:/store/2b4-gnugcc13/include:/store/2c0-glibc/include"
export MAKEFLAGS=-j8
rm -rf /tmp/2c4-mrustc/run_rustc/output-1.74.0
make CC=x86_64-linux-gnu-gcc -C run_rustc RUSTC_VERSION=1.74.0
PREFIX=/tmp/2c4-mrustc/run_rustc/output-1.74.0/prefix/
cat ./rustc-1.74.0-src/library/test/Cargo.toml

# mkdir -p /store/2c4-mrustc
# cp ./output-1.74.0/* /store/2c4-mrustc

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2c4 /store/2c4-mrustc )
