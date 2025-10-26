#!/busybox ash

/busybox mkdir -p /06/stage/dev/shm
/busybox mknod -m 666 /06/stage/dev/null c 1 3
/busybox ash initboot.sh
(cd 06 && /busybox ash ./ci_stage1.sh)
/busybox chroot /06/stage /recipes/2a0-static-gnumake.sh
/busybox chroot /06/stage /recipes/2a1-static-binutils.sh
/busybox chroot /06/stage /recipes/2a2-static-gnugcc4-c.sh
/busybox chroot /06/stage /recipes/2a3-intermediate-musl.sh
/busybox chroot /06/stage /recipes/2a4-gnugcc4-cpp.sh
/busybox chroot /06/stage /recipes/2a5-gnugcc10.sh
/busybox chroot /06/stage /recipes/2a6-linux-headers.sh
/busybox chroot /06/stage /recipes/2a7-cmake.sh
/busybox chroot /06/stage /recipes/2a8-python.sh
/busybox chroot /06/stage /recipes/2a9-intermediate-clang.sh
/busybox chroot /06/stage /recipes/2b0-musl.sh
/busybox chroot /06/stage /recipes/2b1-clang.sh
/busybox chroot /06/stage /recipes/2b2-busybox.sh
/busybox chroot /06/stage /recipes/2b3-gnumake.sh
/busybox chroot /06/stage /recipes/2b4-gnugcc13.sh
/busybox chroot /06/stage /recipes/2b5-m4.sh
/busybox chroot /06/stage /recipes/2b6-grep.sh
/busybox chroot /06/stage /recipes/2b7-gawk.sh
/busybox chroot /06/stage /recipes/2b8-bison.sh
/busybox chroot /06/stage /recipes/2c3-perl.sh
/busybox chroot /06/stage /recipes/2c4-autoconf.sh
/busybox chroot /06/stage /recipes/2c4-automake.sh
/busybox chroot /06/stage /recipes/2c0-libtool.sh
/busybox chroot /06/stage /recipes/2b11-file.sh

# Making final fs
/busybox chroot /06/stage /recipes/2c4-binutils.sh
/busybox chroot /06/stage /recipes/2c1-gcc-intermediate.sh
/busybox chroot /06/stage /recipes/2c0-glibc.sh
/busybox chroot /06/stage /recipes/2c1-libstdc++.sh
/busybox chroot /06/stage /recipes/2c1-crosstools.sh
/busybox chroot /06/stage /recipes/2c1-binutils
/busybox chroot /06/stage /recipes/2c1-gcc
