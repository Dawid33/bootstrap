#!/bin/sh
set -uex

rm -rf /tmp/host-openssl
mkdir -p /tmp/host-openssl; cd /tmp/host-openssl
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/openssl-3.5.0.tar.gz

export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
./Configure 
make -j $NPROC
make install
