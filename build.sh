#!/bin/sh

# ./ci/rooted ash ./ci/initboot.sh
# proot --rootfs=06/stage -0 --bind=/dev -w / /store/0-tcc-seed -I /protosrc/tinycc/include -nostdinc -nostdlib -Werror -run \
# 		/recipes/1-stage1.c
# ./ci/rooted_06 /recipes/2a0-static-gnumake.sh
# ./ci/rooted_06 /recipes/2a1-static-binutils.sh
# ./ci/rooted_06 /recipes/2a2-static-gnugcc4-c.sh
# ./ci/rooted_06 /recipes/2a3-intermediate-musl.sh
# ./ci/rooted_06 /recipes/2a4-gnugcc4-cpp.sh
# ./ci/rooted_06 /recipes/2a5-gnugcc10.sh
# ./ci/rooted_06 /recipes/2a6-linux-headers.sh
# ./ci/rooted_06 /recipes/2a7-cmake.sh
# ./ci/rooted_06 /recipes/2a8-python.sh
# ./ci/rooted_06 /recipes/2a9-intermediate-clang.sh
# ./ci/rooted_06 /recipes/2b0-musl.sh
# ./ci/rooted_06 /recipes/2b1-clang.sh
./ci/rooted_06 /recipes/2b2-busybox.sh
./ci/rooted_06 /recipes/2b3-gnumake.sh
./ci/rooted_06 /recipes/2b4-gnugcc13.sh
./ci/rooted_06 /recipes/2b5-m4.sh
./ci/rooted_06 /recipes/2b6-grep.sh
./ci/rooted_06 /recipes/2b7-gawk.sh
./ci/rooted_06 /recipes/2b8-bison.sh
./ci/rooted_06 /recipes/2c3-perl.sh
./ci/rooted_06 /recipes/2c4-autoconf.sh
./ci/rooted_06 /recipes/2c4-automake.sh
./ci/rooted_06 /recipes/2c0-libtool.sh
/./ci/rooted_06 recipes/2b11-file.sh

# Making final cross compiled fs
./ci/rooted_06 /recipes/2c4-binutils.sh
./ci/rooted_06 /recipes/2c1-gcc-intermediate.sh
./ci/rooted_06 /recipes/2c0-glibc.sh
./ci/rooted_06 /recipes/2c1-libstdc++.sh
./ci/rooted_06 /recipes/2c1-crosstools.sh
./ci/rooted_06 /recipes/2c1-binutils.sh
./ci/rooted_06 /recipes/2c1-gcc.sh

