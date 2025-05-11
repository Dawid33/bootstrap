#!/store/2b2-busybox/bin/ash

#> FETCH a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/gmp-6.3.0.tar.xz

#> FETCH 277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/mpfr-4.2.1.tar.xz

#> FETCH ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8
#>  FROM http://www.multiprecision.org/downloads/mpc-1.3.1.tar.gz

#> FETCH 0845e9621c9543a13f484e94584a49ffc0129970e9914624235fc1d061a0c083
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/gcc-13.3.0.tar.xz

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"

rm -rf /tmp/2c1-gcc-intermediate
mkdir -p /tmp/2c1-gcc-intermediate; cd /tmp/2c1-gcc-intermediate
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir aliases; ln -s /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2c1-gcc-intermediate/aliases:$PATH"

echo "### $0: unpacking GNU GCC 13 sources..."
mkdir gmp mpfr mpc 
tar --strip-components=1 -xf /downloads/gcc-13.3.0.tar.xz
tar --strip-components=1 -xf /downloads/gmp-6.3.0.tar.xz -C gmp
tar --strip-components=1 -xf /downloads/mpfr-4.2.1.tar.xz -C mpfr
tar --strip-components=1 -xf /downloads/mpc-1.3.1.tar.gz -C mpc

echo "### $0: fixing up GNU GCC 13 sources..."
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	missing move-if-change mkdep mkinstalldirs symlink-tree install-sh \
	gcc/exec-tool.in libgcc/mkheader.sh mpfr/tools/get_patches.sh

sed -i 's|^\(\s*\)sh |\1/store/2b2-busybox/bin/ash |' \
	libgcc/Makefile.in
sed -i 's|m64=../lib64|m64=../lib|' gcc/config/i386/t-linux64

echo "### $0: building GNU GCC 13"
mkdir build; cd build;
ash ../configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	--target=x86_64-linux-gnu \
	--prefix=/fs/tools        \
	--with-glibc-version=2.39 \
	--with-sysroot=/fs        \
	--with-newlib             \
	--without-headers         \
	--enable-default-pie      \
	--enable-default-ssp      \
	--disable-libquadmath --disable-decimal-float --disable-fixed-point \
	--disable-lto \
	--disable-libgomp \
	--disable-multilib \
	--without-static-standard-libraries \
	--disable-multiarch \
	--disable-libmudflap \
	--disable-libssp \
	--disable-libitm \
	--disable-libsanitizer \
	--disable-cet \
	--disable-gnu-unique-object \
	--disable-gcov \
	--disable-checking \
	--disable-nls             \
	--disable-shared          \
	--disable-multilib        \
	--disable-threads         \
	--disable-libatomic       \
	--disable-libgomp         \
	--disable-libquadmath     \
	--disable-libssp          \
	--disable-libvtv          \
	--disable-libstdcxx       \
  --disable-dependency-tracking \
	--enable-languages=c,c++
make -j $NPROC
make -j $NPROC install-strip

cd ..
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  $(dirname $(/fs/tools/bin/x86_64-linux-gnu-gcc -print-libgcc-file-name))/include/limits.h
