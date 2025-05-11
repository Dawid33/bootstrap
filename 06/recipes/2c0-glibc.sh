#!/store/2b2-busybox/bin/ash

#> FETCH 97f84f3b7588cd54093a6f6389b0c1a81e70d99708d74963a2e3eab7c7dc942d
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/glibc-2.39.tar.gz
set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/fs/tools/bin"
export PATH="$PATH:/store/2b7-gawk/bin"
export PATH="$PATH:/store/2b8-bison/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2c0-glibc
mkdir -p /tmp/2c0-glibc; cd /tmp/2c0-glibc
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir aliases;
ln -s /store/2b2-busybox/bin/ash aliases/sh
ln -s /store/2b6-grep/bin/grep aliases/grep
export PATH="/tmp/2c0-glibc/aliases:$PATH"

echo "### $0: unpacking GNU GLIBC 13 sources..."
tar --strip-components=1 -xf /downloads/glibc-2.39.tar.gz


ln -sfv ../lib/ld-linux-x86-64.so.2 /fs/lib64

mkdir -p /fs/usr/include
cp -r /store/2a6-linux-headers/include/* /fs/usr/include 

sed -i 's|/bin/pwd|/store/2b2-busybox/bin/pwd|' configure
mkdir build && cd build;
ash ../configure                             \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	LDFLAGS="-shared-libgcc" \
	CFLAGS='-O2' \
	--prefix=/usr                      \
	--host=x86_64-linux-gnu                    \
	--build=$(../scripts/config.guess) \
	--enable-kernel=4.19                \
	--with-headers=/fs/usr/include    \
	--disable-nscd                     \
	libc_cv_slibdir=/usr/lib

# TODO: find where /bin/sh is used
mkdir -p /bin
ln -fs /store/2b2-busybox/bin/ash /bin/sh
make -j $NPROC
echo "### $0: installing GNU GLIBC 13"
make -j $NPROC DESTDIR=/fs install
rm -rf /bin
sed '/RTLDLIST=/s@/usr@@g' -i /fs/usr/bin/ldd

