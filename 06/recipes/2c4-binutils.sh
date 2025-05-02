#!/store/2b2-busybox/bin/ash

#> FETCH 67be9198476cc37436e2801de649f4ad80bf0d02430d86aff63c6b59b6e23987
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/binutils-with-gold-2.44.tar.xz

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b7-gawk/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2c3-perl/bin"
export PATH="$PATH:/store/2b9-binutils/bin"

mkdir -p /tmp/2c4-binutils; cd /tmp/2c4-binutils
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: unpacking binutils sources..."
tar --strip-components=1 -xf /downloads/binutils-with-gold-2.44.tar.xz

echo "### $0: building static binutils..."
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' install-sh
SYSROOT=/store/2c0-glibc

mkdir -p build; cd build;
ash ../configure \
	CONFIG_SHELL=/store/2b2-busybox/bin/ash \
	SHELL=/store/2b2-busybox/bin/ash \
	--prefix=/store/2c4-binutils \
	--disable-nls       \
	--enable-gprofng=no \
	--disable-werror    \
	--enable-new-dtags  \
	--enable-default-hash-style=gnu

make -j $NPROC

echo "### $0: installing static binutils..."
make -j $NPROC install

echo "### $0: checking for build path leaks..."
( ! grep -rF /store/2c4-binutils )
