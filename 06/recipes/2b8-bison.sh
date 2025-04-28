#!/store/2b2-busybox/bin/ash

#> FETCH 1e0a14a8bf52d878e500c33d291026b9ebe969c27b3998d4b4285ab6dbce4527
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/bison-3.8.tar.xz

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b5-m4/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2b8-bison
mkdir -p /tmp/2b8-bison; cd /tmp/2b8-bison
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir -p aliases; ln -s /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2b8-bison/aliases:$PATH"

echo "### $0: unpacking GNU GAWK sources..."
tar --strip-components=1 -xf /downloads/bison-3.8.tar.xz

echo "### $0: building GNU GAWK"
ash configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	CFLAGS=-O2 CXX_FLAGS=-O2 \
	CFLAGS_FOR_TARGET=-O2 CXXFLAGS_FOR_TARGET=-O2 \
	--prefix=/store/2b8-bison \
	--disable-dependency-tracking
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/install-sh ./build-aux/move-if-change po/Makefile runtime-po/Makefile \
	gnulib-po/Makefile

make -j $NPROC
echo "### $0: installing GNU GAWK"
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2b8-bison )
