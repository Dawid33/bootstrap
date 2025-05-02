#!/store/2b2-busybox/bin/ash

#> FETCH 10d4647cfbb543a7f9ae3e5f6851ec49305232ea7621aed24c7cfbb0bef4b70d
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/perl-5.40.2.tar.gz
 
export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b3-gnumake/wrappers"
export SHELL=/store/2b2-busybox/bin/ash

rm -r /tmp/2c3-perl
mkdir -p /tmp/2c3-perl; cd /tmp/2c3-perl
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: unpacking zlib sources..."
tar --strip-components=1 -xf /downloads/perl-5.40.2.tar.gz

echo "### $0: building zlib..."
mkdir -p /store/2c3-perl

ash ./Configure -des -Dcc=gcc -Dprefix=/store/2c3-perl
make -j $NPROC
make install

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2c3 /store/2c3-perl )





