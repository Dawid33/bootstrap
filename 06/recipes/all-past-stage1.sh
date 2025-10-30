#!/store/1-stage1/protobusybox/bin/ash

set -uex

export NPROC=10
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
/recipes/2b11-file.sh

# Making final cross compiled fs
/recipes/2c4-binutils.sh
/recipes/2c1-gcc-intermediate.sh
/recipes/2c0-glibc.sh
/recipes/2c1-libstdc++.sh
/recipes/2c1-crosstools.sh
/recipes/2c1-binutils.sh
/recipes/2c1-gcc.sh

