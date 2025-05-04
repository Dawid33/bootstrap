#!/bin/sh
set -uex

rm -rf /tmp/host-gettext
mkdir -p /tmp/host-gettext; cd /tmp/host-gettext
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/gettext-0.24.tar.gz

export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
./configure --disable-shared
make 
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
