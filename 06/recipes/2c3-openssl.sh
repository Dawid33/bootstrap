#!/store/2b2-busybox/bin/ash

# FETCH 344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0
#  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/openssl-3.5.0.tar.gz
 
export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2b9-binutils/bin"
export PATH="$PATH:/store/2c3-perl/bin"
export PATH="$PATH:/store/2b3-gnumake/wrappers"
export SHELL=/store/2b2-busybox/bin/ash
 
rm -rf /tmp/2c3-openssl  
mkdir -p /tmp/2c3-openssl; cd /tmp/2c3-openssl
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: unpacking zlib sources..."
tar --strip-components=1 -xf /downloads/openssl-3.5.0.tar.gz

echo "### $0: building zlib..."
mkdir -p /store/2c3-openssl

export CPATH='/store/2a6-linux-headers/include' 
perl ./Configure --prefix=/store/2c3-openssl --openssldir=/store/2c3-openssl
make -j $NPROC 
make install

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2c3 /store/2c3-openssl )


