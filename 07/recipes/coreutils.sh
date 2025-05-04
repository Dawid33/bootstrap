#!/bin/ash
set -uex

mkdir -p /tmp/coreutils
tar -xf /tmp/downloads/coreutils-9.7.tar.xz
./configure 
make -j $NPROC
make -j $NPROC install-strip
