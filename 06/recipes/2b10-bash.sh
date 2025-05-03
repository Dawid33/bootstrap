#!/store/2b2-busybox/bin/ash

#> FETCH 0cfb5c9bb1a29f800a97bd242d19511c997a1013815b805e0fdd32214113d6be
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/bash-5.1.8.tar.gz

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b7-gawk/bin"
export PATH="$PATH:/store/2b8-bison/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2b10-bash
rm -rf /store/2b10-bash
mkdir -p /tmp/2b10-bash; cd /tmp/2b10-bash
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir aliases;
ln -s /store/2b2-busybox/bin/ash aliases/sh
ln -s /store/2b6-grep/bin/grep aliases/grep
export PATH="/tmp/2b10-bash/aliases:$PATH"

echo "### $0: unpacking GNU GLIBC 13 sources..."
tar --strip-components=1 -xf /downloads/bash-5.1.8.tar.gz

echo "### $0: building GNU GLIBC 13"

sed -i 's|/bin/pwd|/store/2b2-busybox/bin/pwd|' configure

mkdir build && cd build;
export CC=gcc
ash ../configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	--without-bash-malloc \
	--enable-static-link \
	--prefix=/store/2b10-bash \
	--exec-prefix=/store/2b10-bash 

mkdir -p /bin
ln -fs /store/2b2-busybox/bin/ash /bin/sh
make -j $NPROC
echo "### $0: installing GNU GLIBC 13"
make -j $NPROC install-strip
rm -rf /bin

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2b10-bash )
