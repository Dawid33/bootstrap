#!/store/2b2-busybox/bin/ash

#> FETCH 97203a72cae99ab89a067fe2210c1cbf052bc492b479eca7d226d9830883b0bd
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/acl-2.3.2.tar.xz 

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b7-gawk/bin"
export PATH="$PATH:/store/2b8-bison/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2c1-acl
rm -rf /store/2c1-acl
mkdir -p /tmp/2c1-acl; cd /tmp/2c1-acl
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir aliases;
ln -s /store/2b2-busybox/bin/ash aliases/sh
ln -s /store/2b6-grep/bin/grep aliases/grep
export PATH="/tmp/2c1-acl/aliases:$PATH"

echo "### $0: unpacking libacl sources..."
tar --strip-components=1 -xf /downloads/acl-2.3.2.tar.xz

echo "### $0: building libacl"

sed -i 's|/bin/pwd|/store/2b2-busybox/bin/pwd|' configure
mkdir build && cd build;

export LIBRARY_PATH="/store/2c1-attr/lib"
export LD_LIBRARY_PATH="/store/2c1-attr/lib"
ash ../configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	CFLAGS='-I /store/2c1-attr/include' \
	--prefix=/store/2c1-acl

# TODO: find where /bin/sh is used
make -j $NPROC
echo "### $0: installing acl"
make -j $NPROC install

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2c1-acl )

