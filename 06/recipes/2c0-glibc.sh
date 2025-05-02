#!/store/2b2-busybox/bin/ash

#> FETCH a5a26b22f545d6b7d7b3dd828e11e428f24f4fac43c934fb071b6a7d0828e901
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/glibc-2.41.tar.xz
 
set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b7-gawk/bin"
export PATH="$PATH:/store/2b8-bison/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2c0-glibc
rm -rf /store/2c0-glibc
mkdir -p /tmp/2c0-glibc; cd /tmp/2c0-glibc
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir aliases;
ln -s /store/2b2-busybox/bin/ash aliases/sh
ln -s /store/2b6-grep/bin/grep aliases/grep
export PATH="/tmp/2c0-glibc/aliases:$PATH"

echo "### $0: unpacking GNU GLIBC 13 sources..."
tar --strip-components=1 -xf /downloads/glibc-2.41.tar.xz

echo "### $0: building GNU GLIBC 13"

sed -i 's|/bin/pwd|/store/2b2-busybox/bin/pwd|' configure
mkdir build && cd build;

ash ../configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	CFLAGS='-Wno-error=attribute-alias -O2' \
	--prefix=/store/2c0-glibc \
	--disable-nscd \
	--with-headers='/store/2a6-linux-headers/include'

# TODO: find where /bin/sh is used
mkdir -p /bin
ln -fs /store/2b2-busybox/bin/ash /bin/sh
make -j $NPROC
echo "### $0: installing GNU GLIBC 13"
make -j $NPROC install
rm -rf /bin

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2c0-glibc )
