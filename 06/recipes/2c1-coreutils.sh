#!/store/2b2-busybox/bin/ash

#> FETCH e8bb26ad0293f9b5a1fc43fb42ba970e312c66ce92c1b0b16713d7500db251bf
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/coreutils-9.7.tar.xz
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

rm -rf /tmp/2c1-coreutils
mkdir -p /tmp/2c1-coreutils; cd /tmp/2c1-coreutils
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."

echo "### $0: unpacking GNU GAWK sources..."
tar --strip-components=1 -xf /downloads/coreutils-9.7.tar.xz

echo "### $0: building GNU GAWK"
FORCE_UNSAFE_CONFIGURE=1 ash configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	--prefix=/store/2c1-coreutils
# sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
# 	./build-aux/install-sh po/Makefile
make -j $NPROC
echo "### $0: installing GNU GAWK"
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2c1-coreutils )
