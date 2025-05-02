#!/store/2b2-busybox/bin/ash

#> FETCH f87cee69eec2b4fcbf60a396b030ad6aa3415f192aa5f7ee84cad5e11f7f5ae3
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/patch-2.8.tar.xz

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b5-m4/bin"
export PATH="$PATH:/store/2c4-autoconf/bin"
export PATH="$PATH:/store/2c4-automake/bin"
export PATH="$PATH:/store/2c0-libtool/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2b10-bash/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2c1-patch
mkdir -p /tmp/2c1-patch; cd /tmp/2c1-patch
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."

echo "### $0: unpacking GNU GAWK sources..."
tar --strip-components=1 -xf /downloads/patch-2.8.tar.xz

echo "### $0: building GNU GAWK"
ash configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	--prefix=/store/2c1-patch
# sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
# 	./build-aux/install-sh po/Makefile
make -j $NPROC
echo "### $0: installing GNU GAWK"
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2c1-patch )
