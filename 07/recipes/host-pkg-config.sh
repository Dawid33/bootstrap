#!/bin/sh
set -uex

rm -rf /tmp/host-pkg-config
mkdir -p /tmp/host-pkg-config; cd /tmp/host-pkg-config
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/pkg-config-0.29.2.tar.gz
./configure --prefix=/usr --with-internal-glib
make -j $NPROC
make install
