#!/bin/sh
set -uex

rm -rf /tmp/host-bzip2
mkdir -p /tmp/host-bzip2; cd /tmp/host-bzip2
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/bzip2-1.0.8.tar.gz

export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
make 
make PREFIX=/usr install
