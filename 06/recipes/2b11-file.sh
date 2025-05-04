#!/store/2b2-busybox/bin/ash


#> FETCH 73c5f11a8edf0fded2fe3471b23a7fccb3f3369a13ea612529b869c8dc96aa2b
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/FILE5_46.tar.gz
set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b5-m4/bin"
export PATH="$PATH:/store/2c4-autoconf/bin"
export PATH="$PATH:/store/2c4-automake/bin"
export PATH="$PATH:/store/2c0-libtool/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"

rm -rf /tmp/2b11-file
rm -rf /store/2b11-file
mkdir -p /tmp/2b11-file; cd /tmp/2b11-file
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir -p aliases;
ln -s /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2b11-file/aliases:$PATH"

echo "### $0: unpacking file sources..."
tar --strip-components=1 -xf /downloads/FILE5_46.tar.gz

libtoolize --force
aclocal
autoheader
automake --force-missing --add-missing
autoconf
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' config.sub configure 
ash ./configure \
	--disable-bzlib      \
	--disable-libseccomp \
	--disable-xzlib      \
	--disable-zlib \
	--prefix=/store/2b11-file

make -j $NPROC
echo "### $0: installing file"
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2b11-file )
