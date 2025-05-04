#!/store/2b2-busybox/bin/ash

set -uex

#> FETCH 30306e0c76e0f9f1f0de987cf1c82a5c21e1ce6568b9227f7da5b71cbea86c9d
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/ncurses-6.2.tar.gz
 
#> FETCH 63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/m4-1.4.19.tar.xz

#> FETCH 9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1f8a4014da621ff
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/bash-5.2.37.tar.gz

#> FETCH e8bb26ad0293f9b5a1fc43fb42ba970e312c66ce92c1b0b16713d7500db251bf
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/coreutils-9.7.tar.xz
 
#> FETCH c80a3c2bf87e252fe7d605b8ba6bf928d75a90b55f3bfcf7c4a4f337ec62fc31
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/diffutils-3.11.tar.gz
 
#> FETCH 73c5f11a8edf0fded2fe3471b23a7fccb3f3369a13ea612529b869c8dc96aa2b
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/FILE5_46.tar.gz

#> FETCH 1387e0b67ff247d2abde998f90dfbf70c1491391a59ddfecb8ae698789f0a4f5
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/findutils-4.10.0.tar.xz

#> FETCH f8c3486509de705192138b00ef2c00bbbdd0e84c30d5c07d23fc73a9dc4cc9cc
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/gawk-5.3.2.tar.xz

#> FETCH 2649b27c0e90e632eadcd757be06c6e9a4f48d941de51e7c0f83ff76408a07b9
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/grep-3.12.tar.xz

#> FETCH 01a7b881bd220bfdf615f97b8718f80bdfd3f6add385b993dcf6efd14e8c0ac6
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/gzip-1.14.tar.xz
 
#> FETCH f87cee69eec2b4fcbf60a396b030ad6aa3415f192aa5f7ee84cad5e11f7f5ae3
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/patch-2.8.tar.xz

#> FETCH 6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/sed-4.9.tar.xz

#> FETCH 507825b599356c10dca1cd720c9d0d0c9d5400b9de300af00e4d1ea150795543
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/xz-5.8.1.tar.gz
 
export PATH="/store/2b7-gawk/bin"
export PATH="$PATH:/fs/tools/bin"
export PATH="$PATH:/store/2b5-m4/bin"
export PATH="$PATH:/store/2c4-autoconf/bin"
export PATH="$PATH:/store/2c4-automake/bin"
export PATH="$PATH:/store/2c0-libtool/bin"
export PATH="$PATH:/store/2b2-busybox/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"

rm -rf /tmp/2c1-crosstools
mkdir -p /tmp/2c1-crosstools; cd /tmp/2c1-crosstools
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir -p aliases; ln -sf /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2c1-crosstools/aliases:$PATH"

mkdir m4
tar --strip-components=1 -xf /downloads/m4-1.4.19.tar.xz -C m4
cd m4
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/config.guess
ash configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	CFLAGS=-O2 CXX_FLAGS=-O2 \
	CFLAGS_FOR_TARGET=-O2 CXXFLAGS_FOR_TARGET=-O2 \
	--prefix=/usr \
	--host=x86_64-linux-gnu \
	--build=$(build-aux/config.guess) \
	--disable-dependency-tracking
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/install-sh po/Makefile ./build-aux/config.guess
make -j $NPROC
echo "### $0: installing GNU GAWK"
make DESTDIR=/fs install-strip
cd ..

mkdir -p ncurses
tar --strip-components=1 -xf /downloads/ncurses-6.2.tar.gz -C ncurses
mkdir -p ncurses/build
cd ncurses/build
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	../configure
OLD=$PATH
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
ash ../configure AWK=gawk
make -C include
make -C progs tic
cd ..
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' config.guess
ash ./configure --prefix=/usr            \
            --host=x86_64-linux-gnu      \
            --build=$(./config.guess)     \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-normal             \
            --with-cxx-shared            \
            --without-debug              \
            --without-ada                \
            --disable-stripping \
            AWK=gawk
make -j $NPROC
make DESTDIR=/fs TIC_PATH=/tmp/2c1-crosstools/ncurses/build/progs/tic install
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
    -i /fs/usr/include/curses.h
cd ..
            
mkdir -p bash;  
tar --strip-components=1 -xf /downloads/bash-5.2.37.tar.gz -C bash
cd bash
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' support/config.guess configure
export LD_LIBRARY_PATH="/fs/usr/lib"
ash ./configure --prefix=/usr                   \
            --build=$(ash support/config.guess) \
            --host=x86_64-linux-gnu             \
            --without-bash-malloc
make -j $NPROC
make DESTDIR=/fs install
mkdir -p /fs/bin
ln -sfv bash /fs/bin/sh
cd ..
export PATH=$OLD

mkdir -p coreutils;  
tar --strip-components=1 -xf /downloads/coreutils-9.7.tar.xz -C coreutils
cd coreutils
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' build-aux/config.guess build-aux/install-sh configure 
./configure --prefix=/usr                     \
            --host=x86_64-linux-gnu           \
            --build=$(build-aux/config.guess) \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' po/Makefile
make -j $NPROC
make DESTDIR=/fs install
mv -v /fs/usr/bin/chroot              /fs/usr/sbin
mkdir -pv /fs/usr/share/man/man8
mv -v /fs/usr/share/man/man1/chroot.1 /fs/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/'                   /fs/usr/share/man/man8/chroot.8
cd ..

mkdir -p diffutils;  
tar --strip-components=1 -xf /downloads/diffutils-3.11.tar.gz -C diffutils
ls
cd diffutils
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' build-aux/config.guess configure 
ash ./configure --prefix=/usr   \
            --host=x86_64-linux-gnu \
            --build=$(./build-aux/config.guess)
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' po/Makefile
make -j $NPROC
make DESTDIR=/fs install

mkdir -p file;  
tar --strip-components=1 -xf /downloads/FILE5_46.tar.gz -C file
cd file
libtoolize --force
aclocal
autoheader
automake --force-missing --add-missing
autoconf
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' config.guess config.sub configure 
ash ./configure --prefix=/usr   \
            --host=x86_64-linux-gnu \
            --build=$(./config.guess)
make -j $NPROC FILE_COMPILE=/store/2b11-file/bin/file
make DESTDIR=/fs install
rm -fv /fs/usr/lib/libmagic.la

mkdir -p findutils;
tar --strip-components=1 -xf /downloads/findutils-4.10.0.tar.xz -C findutils
cd findutils
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' ./build-aux/config.sub configure ./build-aux/mkinstalldirs  
ash ./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=x86_64-linux-gnu \
            --build=$(build-aux/config.guess)
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' po/Makefile
make -j $NPROC
make DESTDIR=/fs install
cd ..

mkdir -p gawk;
tar --strip-components=1 -xf /downloads/gawk-5.3.2.tar.xz -C gawk
cd gawk
sed -i 's/extras//' Makefile.in
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/config.sub ./build-aux/config.guess configure ./build-aux/install-sh  \
	./extension/configure 
ash ./configure --prefix=/usr \
            --host=x86_64-linux-gnu \
            --build=$(build-aux/config.guess)
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' extension/po/Makefile po/Makefile 
make -j $NPROC
make DESTDIR=/fs install
cd ..

mkdir -p grep;
tar --strip-components=1 -xf /downloads/grep-3.12.tar.xz -C grep
cd grep
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/config.sub ./build-aux/config.guess configure ./build-aux/install-sh
ash ./configure --prefix=/usr \
            --host=x86_64-linux-gnu \
            --build=$(build-aux/config.guess)
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' po/Makefile 
make -j $NPROC
make DESTDIR=/fs install
cd ..

mkdir -p gzip;
tar --strip-components=1 -xf /downloads/gzip-1.14.tar.xz -C gzip
cd gzip
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/config.sub ./build-aux/config.guess configure ./build-aux/install-sh
ash ./configure --prefix=/usr --host=x86_64-linux-gnu
make -j $NPROC
make DESTDIR=/fs install
cd ..

mkdir -p make;
tar --strip-components=1 -xf /downloads/make-4.4.1.tar.gz -C make
cd make
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/config.sub ./build-aux/config.guess configure ./build-aux/install-sh
ash ./configure --prefix=/usr \
	--without-guile \
	--host=x86_64-linux-gnu \
	--build=$(build-aux/config.guess)
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' po/Makefile 
make -j $NPROC
make DESTDIR=/fs install
cd ..

mkdir -p patch;
tar --strip-components=1 -xf /downloads/patch-2.8.tar.xz -C patch
cd patch
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/config.sub ./build-aux/config.guess configure ./build-aux/install-sh
ash ./configure --prefix=/usr \
	--host=x86_64-linux-gnu \
	--build=$(build-aux/config.guess)
make -j $NPROC
make DESTDIR=/fs install
cd ..

mkdir -p sed;
tar --strip-components=1 -xf /downloads/sed-4.9.tar.xz -C sed
cd sed
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/config.sub ./build-aux/config.guess configure ./build-aux/install-sh
ash ./configure --prefix=/usr \
	--host=x86_64-linux-gnu \
	--build=$(build-aux/config.guess)
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' po/Makefile 
make -j $NPROC
make DESTDIR=/fs install
cd ..

mkdir -p tar; cd tar
gzip -cd /downloads/tar-1.35.cpio.gz | cpio -idmv
mv tar-1.35/* .
rm -rf tar-1.35
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/config.sub ./build-aux/config.guess configure ./build-aux/install-sh
ash ./configure --prefix=/usr \
	--host=x86_64-linux-gnu \
	--build=$(build-aux/config.guess)
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' po/Makefile 
make -j $NPROC
make DESTDIR=/fs install
cd ..

mkdir -p xz;
tar --strip-components=1 -xf /downloads/xz-5.8.1.tar.gz -C xz
cd xz
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/config.sub ./build-aux/config.guess configure ./build-aux/install-sh
ash ./configure --prefix=/usr \
	--host=x86_64-linux-gnu \
	--build=$(build-aux/config.guess) \
	--disable-static \
	--docdir=/usr/share/doc/xz-5.6.4
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' po/Makefile 
make -j $NPROC
make DESTDIR=/fs install
cd ..
rm -v /fs/usr/lib/liblzma.la
