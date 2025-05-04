#!/bin/sh
set -uex

rm -rf /tmp/host-cpio
mkdir -p /tmp/host-cpio; cd /tmp/host-cpio
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/cpio-2.15.tar.gz

./configure --prefix=/usr
make 
make install
