#!/bin/sh
set -uex

rm -rf /tmp/host-gdb
mkdir -p /tmp/host-gdb; cd /tmp/host-gdb
mkdir gmp mpfr
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/gdb-16.3.tar.gz
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/gmp-6.3.0.tar.xz -C gmp
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/mpfr-4.2.1.tar.xz -C mpfr
./configure LDLAGS="-static-libgcc -static-libstdc++" --prefix=/usr 
make -j $NPROC
make install
