#!/store/2b2-busybox/bin/ash

#> FETCH 889249bdc79b0a32f2911c3f7c0049c60eb90b9c9ad75aab367022fb3e216e41
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/buildroot-2025.02.tar.xz 

#> FETCH 7fe3cf3daf95ee93b47e568e85f4d341a1f9ae91766b4f9a9cdc29737dea4988
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/fakeroot_1.36.orig.tar.gz

#> FETCH c77a38fcf25b21fd8209d20d35638744344ded239cfc7df80138bf46d3c6b16d
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/tar-1.35.cpio.gz
 
#> FETCH ed2cd1f058f22f682e700c5be408975db62025a14863a5a6700ee93d5927504e
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/glibc-2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163.tar.gz
 
#> FETCH ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/mpc-1.3.1.tar.gz
 
#> FETCH 97203a72cae99ab89a067fe2210c1cbf052bc492b479eca7d226d9830883b0bd
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/acl-2.3.2.tar.xz
 
#> FETCH 0845e9621c9543a13f484e94584a49ffc0129970e9914624235fc1d061a0c083
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/gcc-13.3.0.tar.xz
 
#> FETCH f01d58cd6d9d77fbdca9eb4bbd5ead1988228fdb73d6f7a201f5f8d6b118b469
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/automake-1.16.5.tar.xz
 
#> FETCH 7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/libtool-2.4.6.tar.xz
 
#> FETCH 63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/m4-1.4.19.tar.xz
 
#> FETCH 13f74202a3c4c51118b797a39ea4200d3f6cfbe224da6d1d95bb938480132dfd
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/binutils-2.43.1.tar.xz
 
#> FETCH f2e97b0ab7ce293681ab701915766190d607a1dba7fae8a718138150b700a70b
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/attr-2.5.2.tar.xz
 
#> FETCH ffd195bd567dbaffc3b98b23fd00aad0537680c9896171e44fe3ff79e28ac33d
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/mpfr-4.1.1.tar.xz
 
#> FETCH d73bf057bec04434b169d1b61641936f7d0c97ceb923a281f32e35dd4dcc6531
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/linux-6.12.19.tar.xz
 
#> FETCH ba885c1319578d6c94d46e9b0dceb4014caafe2490e437a0dbca3f270a223f5a
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/autoconf-2.72.tar.xz
 
#> FETCH 9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/bison-3.8.2.tar.xz
 
#> FETCH 694db764812a6236423d4ff40ceb7b6c4c441301b72ad502bb5c27e00cd56f78
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/gawk-5.3.1.tar.xz
 
#> FETCH a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/gmp-6.3.0.tar.xz
 
#> FETCH 97203a72cae99ab89a067fe2210c1cbf052bc492b479eca7d226d9830883b0bd
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/acl-2.3.2.tar.xz

set -uex

export PATH="/store/2c1-coreutils/bin"
export PATH="$PATH:/store/2b2-busybox/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b10-bash/bin"
export PATH="$PATH:/store/2b11-file/bin"
export PATH="$PATH:/store/2c3-perl/bin"
export PATH="$PATH:/store/2c1-rsync/bin"
export PATH="$PATH:/store/2c1-patch/bin"
export PATH="$PATH:/store/2c1-find/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2c1-buildroot
rm -rf /store/2c1-buildroot
mkdir -p /tmp/2c1-buildroot; cd /tmp/2c1-buildroot
if [ -e /ccache/setup ]; then . /ccache/setup; fi

mkdir -p aliases;
ln -s /store/2c1-patch/bin/patch aliases/patch
ln -s /store/2c1-find/bin/find aliases/find
export PATH="/tmp/2c1-buildroot/aliases:$PATH"

echo "### $0: unpacking buildroot sources..."
tar --strip-components=1 -xf /downloads/buildroot-2025.02.tar.xz

mkdir dl; cd dl;
mkdir fakeroot tar glibc mpc acl gcc automake libtool m4 binutils attr mpfr linux autoconf bison gawk gmp
cd ..
cp /downloads/fakeroot_1.36.orig.tar.gz dl/fakeroot/fakeroot_1.36.orig.tar.gz
cp /downloads/tar-1.35.cpio.gz dl/tar/tar-1.35.cpio.gz
cp /downloads/glibc-2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163.tar.gz dl/glibc/glibc-2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163.tar.gz
cp /downloads/mpc-1.3.1.tar.gz dl/mpc/mpc-1.3.1.tar.gz
cp /downloads/acl-2.3.2.tar.xz dl/acl/acl-2.3.2.tar.xz
cp /downloads/gcc-13.3.0.tar.xz dl/gcc/gcc-13.3.0.tar.xz
cp /downloads/automake-1.16.5.tar.xz dl/automake/automake-1.16.5.tar.xz
cp /downloads/libtool-2.4.6.tar.xz dl/libtool/libtool-2.4.6.tar.xz
cp /downloads/m4-1.4.19.tar.xz dl/m4/m4-1.4.19.tar.xz
cp /downloads/binutils-2.43.1.tar.xz dl/binutils/binutils-2.43.1.tar.xz
cp /downloads/attr-2.5.2.tar.xz dl/attr/attr-2.5.2.tar.xz
cp /downloads/mpfr-4.1.1.tar.xz dl/mpfr/mpfr-4.1.1.tar.xz
cp /downloads/linux-6.12.19.tar.xz dl/linux/linux-6.12.19.tar.xz
cp /downloads/autoconf-2.72.tar.xz dl/autoconf/autoconf-2.72.tar.xz
cp /downloads/bison-3.8.2.tar.xz dl/bison/bison-3.8.2.tar.xz
cp /downloads/gawk-5.3.1.tar.xz dl/gawk/gawk-5.3.1.tar.xz
cp /downloads/gmp-6.3.0.tar.xz dl/gmp/gmp-6.3.0.tar.xz
cp /recipes/buildroot.config .config

mkdir -p /bin
mkdir -p /usr/bin
ln -fs /store/2b2-busybox/bin/ash /bin/sh
ln -fs /store/2b10-bash/bin/bash /bin/bash
ln -fs /store/2b2-busybox/bin/true /bin/true
ln -fs /store/2b11-file/bin/file /usr/bin/file
ln -fs /store/2c1-patch/bin/patch /usr/bin/patch
ln -fs /store/2b2-busybox/bin/env /usr/bin/env
make -j $NPROC
echo "### $0: installing buildroot"
make -j $NPROC install-strip
rm -rf /bin
rm -rf /usr

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2c1-buildroot )
