#!/store/1-stage1/protobusybox/bin/ash

set -uex

export SOURCE_DATE_EPOCH=0

# Setup toolchain for building... the toolchain
/recipes/2a0-static-gnumake.sh
/recipes/2a1-static-binutils.sh
/recipes/2a2-static-gnugcc4-c.sh
/recipes/2a3-intermediate-musl.sh
/recipes/2a4-gnugcc4-cpp.sh
/recipes/2a5-gnugcc10.sh
/recipes/2a6-linux-headers.sh
/recipes/2a7-cmake.sh
/recipes/2a8-python.sh
/recipes/2a9-intermediate-clang.sh
/recipes/2b0-musl.sh
/recipes/2b1-clang.sh
/recipes/2b2-busybox.sh
/recipes/2b3-gnumake.sh
/recipes/2b4-gnugcc13.sh
/recipes/2b5-m4.sh
/recipes/2b6-grep.sh
/recipes/2b7-gawk.sh
/recipes/2b8-bison.sh
/recipes/2c3-perl.sh
/recipes/2c4-autoconf.sh
/recipes/2c4-automake.sh
/recipes/2c0-libtool.sh
/recipes/2c1-coreutils.sh
/recipes/2b10-bash.sh
/recipes/2c1-patch.sh
/recipes/2c1-find.sh
/recipes/2c1-zstd.sh
/recipes/2c1-xxhash.sh
/recipes/2c1-rsync.sh
/recipes/2b11-file.sh
/recipes/2c1-buildroot.sh
# /recipes/2c1-gettext.sh
# TESTING=2c2-pkg-config
# TESTING=2c4-automake
# TESTING=2c4-autoconf
# TESTING=2c4-patchelf
# TESTING=2c4-mrustc
# TESTING=2c1-zlib
# TESTING=2a8-python
# TESTING=2c3-perl
# TESTING=2c0-libtool
# TESTING=2c1-gettext
# TESTING=2b10-bash
# TESTING=2b11-file
# TESTING=2c1-buildroot

