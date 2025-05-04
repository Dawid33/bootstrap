#!/bin/sh
set -uex

export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
# Setup host with extra software needed
# /tmp/recipes/host-cpio.sh
# /tmp/recipes/host-bzip2.sh
# /tmp/recipes/host-tar.sh
/tmp/recipes/host-gettext.sh
/tmp/recipes/host-bison.sh
/tmp/recipes/host-perl.sh
/tmp/recipes/host-python.sh
/tmp/recipes/host-texinfo.sh
/tmp/recipes/host-util-linux.sh
/tmp/recipes/host-cmake.sh
/tmp/recipes/host-zlib.sh
/tmp/recipes/host-pkg-config.sh
/tmp/recipes/host-gcc11.sh


