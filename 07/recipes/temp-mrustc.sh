#!/bin/bash
set -uex

# rm -rf /tmp/temp-mrustc
mkdir -p /tmp/temp-mrustc; cd /tmp/temp-mrustc
export PATH="/usr/busybox/bin:$PATH"
tar --strip-components=1 -xf /tmp/downloads/mrustc-0.11.2.tar.gz
cp /tmp/downloads/rustc-1.74.0-src.tar.gz rustc-1.74.0-src.tar.gz

set -e
export RUSTC_VERSION=1.74.0 MRUSTC_TARGET_VER=1.74 OUTDIR_SUF=-1.74.0
export RUSTC_TARGET=x86_64-unknown-linux-gnu
export PARLEVEL=$NPROC

sed -i 's|env.push_back("RUSTC", parent.m_compiler_path);|env.push_back("RUSTC", "/tmp/temp-mrustc/tools/bin/mrustc");|' tools/minicargo/build.cpp
mkdir -p output-1.74.0

echo "### $0: building mrustc..."
make -j $NPROC -o rustc-1.74.0-src.tar.gz 
make RUSTCSRC -o rustc-1.74.0-src.tar.gz 
mkdir -p tools/bin
cp -r bin/* tools/bin
make CC=gcc -f minicargo.mk -o rustc-1.74.0-src.tar.gz LIBS

echo "### $0: building minicargo and supporting rust libraries..."
RUSTC_INSTALL_BINDIR=bin make -j $NPROC CC=gcc -f minicargo.mk -o rustc-1.74.0-src.tar.gz rustc-1.74.0-src/build/bin/llvm-config

export PARLEVEL=1
RUSTC_INSTALL_BINDIR=bin make CC=gcc -f minicargo.mk -o rustc-1.74.0-src.tar.gz output-1.74.0/rustc
./output-1.74.0/rustc --version

echo "### $0: building rustc and with mrustc..."
rm -rf ./output-1.74.0/cargo-build
LIBGIT2_SY_USE_PKG_CONFIG=1 make CC=gcc -f minicargo.mk -o rustc-1.74.0-src.tar.gz output-1.74.0/cargo
./output-1.74.0/cargo --version
 
echo "### $0: re-building rustc with rustc that was compiled by mrustc..."

rm -rf /tmp/2c4-mrustc/run_rustc/output-1.74.0
make CC=x86_64-linux-gnu-gcc -C run_rustc RUSTC_VERSION=1.74.0
PREFIX=/tmp/2c4-mrustc/run_rustc/output-1.74.0/prefix/
cat ./rustc-1.74.0-src/library/test/Cargo.toml

# mkdir -p /store/2c4-mrustc
# cp ./output-1.74.0/* /store/2c4-mrustc
