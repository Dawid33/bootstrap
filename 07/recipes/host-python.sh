#!/bin/sh
set -uex

rm -rf /tmp/host-python
mkdir -p /tmp/host-python; cd /tmp/host-python
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/Python-3.12.0.tar.xz

export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
./configure --prefix=/usr   \
            --enable-shared \
            --without-static-libpython \
            --with-ensurepip=no
make
make install
