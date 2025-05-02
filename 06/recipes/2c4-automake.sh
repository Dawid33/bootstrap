#!/store/2b2-busybox/bin/ash

#> FETCH f01d58cd6d9d77fbdca9eb4bbd5ead1988228fdb73d6f7a201f5f8d6b118b469
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/automake-1.16.5.tar.xz

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b5-m4/bin"
export PATH="$PATH:/store/2c4-autoconf/bin"
export PATH="$PATH:/store/2c3-perl/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2c4-automake
mkdir -p /tmp/2c4-automake; cd /tmp/2c4-automake
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir -p aliases; ln -s /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2c4-automake/aliases:$PATH"

echo "### $0: unpacking GNU GAWK sources..."
tar --strip-components=1 -xf /downloads/automake-1.16.5.tar.xz

sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' lib/install-sh

echo "### $0: building GNU GAWK"
ash configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	CFLAGS=-O2 CXX_FLAGS=-O2 \
	CFLAGS_FOR_TARGET=-O2 CXXFLAGS_FOR_TARGET=-O2 \
	--prefix=/store/2c4-automake
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' pre-inst-env
make -j $NPROC
echo "### $0: installing GNU GAWK"
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2c4-automake )
