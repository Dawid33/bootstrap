#!/bin/sh
set -uex

rm -rf /tmp/host-zlib
mkdir -p /tmp/host-zlib; cd /tmp/host-zlib
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/pkg-config-0.29.2.tar.gz
./configure --prefix=/usr --with-internal-glib
make
make install
