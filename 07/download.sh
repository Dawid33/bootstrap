mkdir -p downloads; cd downloads
sources="gettext-0.24.tar.gz Python-3.12.0.tar.xz bison-3.8.2.tar.xz perl-5.40.2.tar.gz texinfo-7.2.tar.xz util-linux-2.40.4.tar.gz cmake-3.27.4.tar.gz zlib-1.3.1.tar.gz pkg-config-0.29.2.tar.gz bzip2-1.0.8.tar.gz tar-1.35.cpio.gz cpio-2.15.tar.gz mrustc-0.11.2.tar.gz gcc-11.4.0.tar.xz mpc-1.3.1.tar.gz mpfr-4.2.1.tar.xz gmp-6.3.0.tar.xz busybox-1.37.0.tar.bz2 gdb-16.3.tar.gz "

for source in $sources; do
  if test -e $source; then
    echo "OK $source"
  else
    wget "http://static.dawidsobczak.com/redox-toolchain-bootstrap/$source"
  fi
done
cd ..
