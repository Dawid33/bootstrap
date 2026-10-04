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
/tmp/recipes/temp-rust-1.90.sh
/tmp/recipes/temp-rust-1.91.sh
/tmp/recipes/temp-rust-1.92.sh
/tmp/recipes/temp-rust-1.93.sh
/tmp/recipes/temp-rust-1.94.sh
/tmp/recipes/temp-rust-1.95.sh
/tmp/recipes/temp-rust-1.96.sh
/tmp/recipes/temp-rust-1.97.sh
/tmp/recipes/temp-rust-1.98.sh
/tmp/recipes/temp-rust-1.99.sh
/tmp/recipes/temp-rust-1.100.sh
/tmp/recipes/host-musl.sh
/tmp/recipes/host-rust-1.101.sh
/tmp/recipes/host-cpio.sh
/tmp/recipes/ftl.sh


