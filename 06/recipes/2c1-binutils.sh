#!/store/2b2-busybox/bin/ash

#> FETCH e316477a914f567eccc34d5d29785b8b0f5a10208d36bbacedcc39048ecfe024
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/binutils-2.38.tar.xz

set -uex

export PATH="/store/2b7-gawk/bin"
export PATH="$PATH:/fs/tools/bin"
export PATH="$PATH:/store/2b5-m4/bin"
export PATH="$PATH:/store/2c4-autoconf/bin"
export PATH="$PATH:/store/2c4-automake/bin"
export PATH="$PATH:/store/2c0-libtool/bin"
export PATH="$PATH:/store/2c3-perl/bin"
export PATH="$PATH:/store/2b2-busybox/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"

rm -rf /tmp/2c1-binutils
mkdir -p /tmp/2c1-binutils; cd /tmp/2c1-binutils
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir -p aliases; ln -sf /store/2b2-busybox/bin/ash aliases/sh
ln -s /store/1-stage1/protobusybox/bin/true aliases/makeinfo
export PATH="/tmp/2c1-binutils/aliases:$PATH"

tar --strip-components=1 -xf /downloads/binutils-2.38.tar.xz 

sed '6031s/$add_dir//' -i ltmain.sh
mkdir -v build
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' config.guess configure install-sh missing
cd build
ash ../configure               \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=x86_64-linux-gnu    \
    --disable-nls              \
    --enable-shared            \
    --enable-gprofng=no        \
    --disable-werror           \
    --enable-64-bit-bfd        \
    --enable-new-dtags         \
    --enable-default-hash-style=gnu
make -j $NPROC
make DESTDIR=/fs install
rm -fv /fs/usr/lib/libbfd.a
rm -fv /fs/usr/lib/libctf.a
rm -fv /fs/usr/lib/libcft-nobfd.a
rm -fv /fs/usr/lib/libopcodes.a
rm -fv /fs/usr/lib/libsframe.a
rm -fv /fs/usr/lib/libbfd.la
rm -fv /fs/usr/lib/libctf.la
rm -fv /fs/usr/lib/libcft-nobfd.la
rm -fv /fs/usr/lib/libopcodes.la
rm -fv /fs/usr/lib/libsframe.la
