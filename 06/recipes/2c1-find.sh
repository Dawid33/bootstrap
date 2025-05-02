#!/store/2b2-busybox/bin/ash

#> FETCH a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d547573cb08065fd462fe
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/findutils-4.9.0.tar.xz

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

rm -rf /tmp/2c1-find
mkdir -p /tmp/2c1-find; cd /tmp/2c1-find
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."

echo "### $0: unpacking GNU GAWK sources..."
tar --strip-components=1 -xf /downloads/findutils-4.9.0.tar.xz

echo "### $0: building GNU GAWK"
ash configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	--prefix=/store/2c1-find
# sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
# 	./build-aux/install-sh po/Makefile
make -j $NPROC
echo "### $0: installing GNU GAWK"
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2c1-find )
