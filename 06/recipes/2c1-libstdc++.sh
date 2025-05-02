#!/store/2b2-busybox/bin/ash

#> FETCH 68dadacce515b0f8a54f510edf07c1b636492bcdb8e8d54c56eb216225d16989
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/gmp-6.1.0.tar.xz

#> FETCH 761413b16d749c53e2bfd2b1dfaa3b027b0e793e404b90b5fbaeef60af6517f5
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/mpfr-3.1.4.tar.xz

#> FETCH 617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/mpc-1.0.3.tar.gz

#> FETCH 6b8b0fd7f81d0a957beb3679c81bbb34ccc7568d5682844d8924424a0dadcb1b
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/isl-0.18.tar.bz2

#> FETCH 0845e9621c9543a13f484e94584a49ffc0129970e9914624235fc1d061a0c083
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/gcc-13.3.0.tar.xz

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b7-gawk/bin"
export PATH="$PATH:/store/2b4-gnugcc13-cross/bin"
export PATH="$PATH:/store/2c3-perl/bin"
export PATH="$PATH:/store/2b9-binutils/bin"

rm -rf /tmp/2c1-libstdc++
rm -rf /store/2c1-libstdc++
mkdir -p /tmp/2c1-libstdc++; cd /tmp/2c1-libstdc++
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir aliases; ln -s /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2c1-libstdc++/aliases:$PATH"

echo "### $0: unpacking GNU GCC 13 sources..."
mkdir gmp mpfr mpc isl
tar --strip-components=1 -xf /downloads/gcc-13.3.0.tar.xz

echo "### $0: fixing up GNU GCC 13 sources..."
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	missing move-if-change mkdep mkinstalldirs symlink-tree install-sh \
	gcc/exec-tool.in libgcc/mkheader.sh
sed -i 's|^\(\s*\)sh |\1/store/2b2-busybox/bin/ash |' \
	libgcc/Makefile.in
sed -i 's|LIBGCC2_DEBUG_CFLAGS = -g|LIBGCC2_DEBUG_CFLAGS = |' \
	libgcc/Makefile.in
sed -i 's|m64=../lib64|m64=../lib|' gcc/config/i386/t-linux64
# see libtool's 74c8993c178a1386ea5e2363a01d919738402f30
sed -i 's/| \$NL2SP/| sort | $NL2SP/' ltmain.sh */ltmain.sh

echo "### $0: building GNU GCC 13"
mkdir build; cd build
ash ../libstdc++-v3/configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
  --prefix=/store/2b4-gnugcc13-cross  \
  --disable-multilib              \
  --disable-nls                   \
  --disable-libstdcxx-pch         \
  --with-gxx-include-dir=/store/2b4-gnugcc13-cross/x86_64-linux-gnu/include/c++/13.3.0 \
  --host=x86_64-linux-gnu \
  --build=x86_64-linux-gnu
make -j $NPROC
echo "### $0: installing GNU GCC 13"
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2c1-libstdc++ )
