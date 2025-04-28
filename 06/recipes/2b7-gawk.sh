#!/store/2b2-busybox/bin/ash

#> FETCH f8c3486509de705192138b00ef2c00bbbdd0e84c30d5c07d23fc73a9dc4cc9cc
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/gawk-5.3.2.tar.xz

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2b7-gawk
mkdir -p /tmp/2b7-gawk; cd /tmp/2b7-gawk
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir -p aliases; ln -s /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2b7-gawk/aliases:$PATH"

grep -rl -- "/bin/sh" . | xargs sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|g';

echo "### $0: unpacking GNU GAWK sources..."
tar --strip-components=1 -xf /downloads/gawk-5.3.2.tar.xz

echo "### $0: building GNU GAWK"
ash configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	CFLAGS=-O2 CXX_FLAGS=-O2 \
	CFLAGS_FOR_TARGET=-O2 CXXFLAGS_FOR_TARGET=-O2 \
	--prefix=/store/2b7-gawk \
	--disable-dependency-tracking
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/install-sh extension/po/Makefile po/Makefile
make -j $NPROC
echo "### $0: installing GNU GAWK"
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2b7 /store/2b7-gawk )
