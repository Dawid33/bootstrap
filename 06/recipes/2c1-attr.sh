#!/store/2b2-busybox/bin/ash

#> FETCH f2e97b0ab7ce293681ab701915766190d607a1dba7fae8a718138150b700a70b
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/attr-2.5.2.tar.xz

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b7-gawk/bin"
export PATH="$PATH:/store/2b8-bison/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2c1-attr
rm -rf /store/2c1-attr
mkdir -p /tmp/2c1-attr; cd /tmp/2c1-attr
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir aliases;
ln -s /store/2b2-busybox/bin/ash aliases/sh
ln -s /store/2b6-grep/bin/grep aliases/grep
export PATH="/tmp/2c1-attr/aliases:$PATH"

echo "### $0: unpacking libacl sources..."
tar --strip-components=1 -xf /downloads/attr-2.5.2.tar.xz

echo "### $0: building libacl"

sed -i 's|/bin/pwd|/store/2b2-busybox/bin/pwd|' configure
mkdir build && cd build;

ash ../configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	--prefix=/store/2c1-attr

# TODO: find where /bin/sh is used
make -j $NPROC
echo "### $0: installing acl"
make -j $NPROC install

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2c1-attr )

