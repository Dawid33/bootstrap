#!/bin/sh
set -uex

rm -rf /tmp/host-texinfo
mkdir -p /tmp/host-texinfo; cd /tmp/host-texinfo
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/texinfo-7.2.tar.xz 

export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
./configure --prefix=/usr
make
make install
