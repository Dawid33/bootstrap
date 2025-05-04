#!/store/2b2-busybox/bin/ash

#> FETCH f8c3486509de705192138b00ef2c00bbbdd0e84c30d5c07d23fc73a9dc4cc9cc
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/gawk-5.3.2.tar.xz

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b7-gawk/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2b8-ncurses
mkdir -p /tmp/2b8-ncurses; cd /tmp/2b8-ncurses
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir -p aliases; ln -s /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2b8-ncurses/aliases:$PATH"

echo "### $0: unpacking GNU GAWK sources..."
tar --strip-components=1 -xf /downloads/ncurses-6.2.tar.gz
mkdir -p build
cd build
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	../configure
ash ../configure AWK=gawk
make -C include
make -C progs tic
cd ..
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' config.guess
ash ./configure --prefix=/usr            \
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
make DESTDIR=/store/2b8-ncurses TIC_PATH=/tmp/2b8-ncurses/build/progs/tic install

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2b8 /store/2b8-ncurses )
