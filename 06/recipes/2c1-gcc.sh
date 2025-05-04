#!/store/2b2-busybox/bin/ash

#> FETCH a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/gmp-6.3.0.tar.xz

#> FETCH 277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/mpfr-4.2.1.tar.xz

#> FETCH 617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/mpc-1.3.1.tar.gz

#> FETCH a7b39bc69cbf9e25826c5a60ab26477001f7c08d85cec04bc0e29cabed6f3cc9
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/gcc-13.3.0.tar.xz
 
set -uex

export PATH="/store/2b7-gawk/bin"
export PATH="$PATH:/fs/tools/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b5-m4/bin"
export PATH="$PATH:/store/2c4-autoconf/bin"
export PATH="$PATH:/store/2c4-automake/bin"
export PATH="$PATH:/store/2c0-libtool/bin"
export PATH="$PATH:/store/2b2-busybox/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"

rm -rf /tmp/2c1-gcc
rm -rf /store/2c1-gcc
mkdir -p /tmp/2c1-gcc; cd /tmp/2c1-gcc
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir aliases; ln -s /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2c1-gcc/aliases:$PATH"

echo "### $0: unpacking GNU GCC 13 sources..."
mkdir gmp mpfr mpc
tar --strip-components=1 -xf /downloads/gcc-13.3.0.tar.xz
tar --strip-components=1 -xf /downloads/gmp-6.3.0.tar.xz -C gmp
tar --strip-components=1 -xf /downloads/mpfr-4.2.1.tar.xz -C mpfr
tar --strip-components=1 -xf /downloads/mpc-1.3.1.tar.gz -C mpc

echo "### $0: fixing up GNU GCC 13 sources..."
# If building on x86_64, change the default directory name for 64-bit libraries to “lib”
sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64

sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	missing move-if-change mkdep mkinstalldirs symlink-tree install-sh \
	gcc/exec-tool.in libgcc/mkheader.sh config.guess config.sub configure \
	mpfr/tools/get_patches.sh gcc/configure
sed -i 's|^\(\s*\)sh |\1/store/2b2-busybox/bin/ash |' \
	libgcc/Makefile.in
sed -i 's|m64=../lib64|m64=../lib|' gcc/config/i386/t-linux64

# Override the building rule of libgcc and libstdc++ headers, to allow building these
# libraries with POSIX threads support
sed '/thread_header =/s/@.*@/gthr-posix.h/' \
    -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in

mkdir build; cd build
ash ../configure                                   \
    --build=$(../config.guess)                     \
    --host=x86_64-linux-gnu                        \
    --target=x86_64-linux-gnu                      \
    LDFLAGS_FOR_TARGET=-L/tmp/2c1-gcc/x86_64-linux-gnu/libgcc \
    --prefix=/usr                                  \
    --with-build-sysroot=/fs                       \
		--disable-libquadmath \
		--disable-fixed-point \
		--disable-lto \
		--disable-libgomp \
		--disable-multilib \
		--disable-multiarch \
		--disable-libmudflap \
		--disable-libssp \
		--disable-nls \
		--disable-libitm \
		--disable-libsanitizer \
		--disable-cet \
		--disable-gnu-unique-object \
		--disable-gcov \
		--disable-checking \
    --disable-dependency-tracking \
    --enable-languages=c,c++

echo "### $0: building GNU GCC 13"
make -j $NPROC
make DESTDIR=/fs install
ln -sv gcc /fs/usr/bin/cc
