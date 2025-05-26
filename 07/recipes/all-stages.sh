#!/bin/sh
set -uex

export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
# Setup host with extra software needed
/tmp/recipes/host-python.sh
/tmp/recipes/host-bzip2.sh
/tmp/recipes/host-busybox.sh
/tmp/recipes/host-gettext.sh
/tmp/recipes/host-bison.sh
/tmp/recipes/host-perl.sh
/tmp/recipes/host-texinfo.sh
/tmp/recipes/host-util-linux.sh
/tmp/recipes/host-cmake.sh
/tmp/recipes/host-zlib.sh
/tmp/recipes/host-pkg-config.sh
/tmp/recipes/host-openssl.sh
/tmp/recipes/temp-mrustc.sh
/tmp/recipes/temp-rust-1.76.sh
/tmp/recipes/temp-rust-1.77.sh
/tmp/recipes/temp-rust-1.78.sh
/tmp/recipes/temp-rust-1.79.sh
/tmp/recipes/temp-rust-1.80.sh
/tmp/recipes/temp-rust-1.81.sh
/tmp/recipes/temp-rust-1.82.sh
/tmp/recipes/temp-rust-1.83.sh
/tmp/recipes/temp-rust-1.84.sh
/tmp/recipes/temp-rust-1.85.sh
/tmp/recipes/host-rust-1.86.sh


