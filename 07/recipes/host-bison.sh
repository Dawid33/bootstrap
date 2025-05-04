#!/bin/sh
set -uex

rm -rf /tmp/host-bison
mkdir -p /tmp/host-bison; cd /tmp/host-bison/
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/bison-3.8.2.tar.xz

export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
./configure --prefix /usr
make 
make install
