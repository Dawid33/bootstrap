../busybox mkdir -p downloads; cd downloads
sources="gettext-0.24.tar.gz Python-3.12.0.tar.xz bison-3.8.2.tar.xz perl-5.40.2.tar.gz texinfo-7.2.tar.xz util-linux-2.40.4.tar.gz cmake-3.27.4.tar.gz zlib-1.3.1.tar.gz pkg-config-0.29.2.tar.gz bzip2-1.0.8.tar.gz tar-1.35.cpio.gz cpio-2.15.tar.gz gcc-11.4.0.tar.xz mpc-1.3.1.tar.gz mpfr-4.2.1.tar.xz gmp-6.3.0.tar.xz busybox-1.37.0.tar.bz2 gdb-16.3.tar.gz openssl-3.5.0.tar.gz rustc-1.90.0-src.tar.gz"

for source in $sources; do
  if test -e $source; then
    echo "OK $source"
  else
    ../../busybox wget "http://static.dawidsobczak.com/redox-toolchain-bootstrap/$source"
  fi
done

# Sources declared in recipes with "#> FETCH <sha256>", "#>  FROM <url>" and optional "#>    AS <file>"
for recipe in ../recipes/*.sh; do
  hash=""; url=""; file=""
  while read -r line; do
    case "$line" in
      "#> FETCH "*) hash="${line#\#> FETCH }" ;;
      "#>  FROM "*) url="${line#\#>  FROM }" ;;
      "#>    AS "*) file="${line#\#>    AS }" ;;
      *)
        if test -n "$hash" && test -n "$url"; then
          file="${file:-$(basename "$url")}"
          test -e "$file" || ../../busybox wget -O "$file" "$url"
          echo "$hash  $file" | ../../busybox sha256sum -c || exit 1
        fi
        hash=""; url=""; file="" ;;
    esac
  done < "$recipe"
done

cd ..
