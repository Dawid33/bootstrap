#!/bin/sh
set -uex

rm -rf /tmp/host-zlib
mkdir -p /tmp/host-zlib; cd /tmp/host-zlib
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/zlib-1.3.1.tar.gz
cmake -DCMAKE_INSTALL_PREFIX=/usr -B build;
cd build; make install





