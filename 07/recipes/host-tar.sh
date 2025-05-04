#!/bin/sh
set -uex

rm -rf /tmp/host-tar
mkdir -p /tmp/host-tar; cd /tmp/host-tar
gzip -cd /tmp/downloads/tar-1.35.cpio.gz | cpio -R root:root -idmv
mv tar-1.35/* .
rm -rf tar-1.35

export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
FORCE_UNSAFE_CONFIGURE=1 ./configure --prefix=/usr
make 
make install
