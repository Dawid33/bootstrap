#!/store/2b2-busybox/bin/ash

#> FETCH da8ebb2ce4dcf46b90098daf962cffa68f4b4f62ea60f798d0ef12929ede6adf   
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/libtool-2.4.5.tar.gz

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b5-m4/bin"
export PATH="$PATH:/store/2c4-autoconf/bin"
export PATH="$PATH:/store/2c4-automake/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2c0-libtool
rm -rf /store/2c0-libtool
mkdir -p /tmp/2c0-libtool; cd /tmp/2c0-libtool
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir -p aliases; ln -s /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2c0-libtool/aliases:$PATH"

echo "### $0: unpacking GNU GAWK sources..."
tar --strip-components=1 -xf /downloads/libtool-2.4.5.tar.xz

echo "### $0: building GNU GAWK"
ash ./configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	--prefix=/store/2c0-libtool

sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/install-sh ./build-aux/extract-trace ./build-aux/inline-source

make -j $NPROC
echo "### $0: installing GNU GAWK"
make -j $NPROC install-strip

sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' /store/2c0-libtool/bin/libtoolize

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2c0-libtool )
