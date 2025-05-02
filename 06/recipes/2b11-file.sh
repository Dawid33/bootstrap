#!/store/2b2-busybox/bin/ash


#> FETCH   
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/FILE5_27.tar.gz
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

# sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' configure
grep -rl -- "/bin/sh" . | xargs sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|g';
echo "### $0: building file"

libtoolize --force
aclocal
autoheader
automake --force-missing --add-missing
autoconf
./configure
ash ./configure \
	--prefix=/store/2b11-file

# export LD_LIBRARY_PATH="/store/2c0-libtool/lib"
make -j $NPROC
echo "### $0: installing file"
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2b11-file )
