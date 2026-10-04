#!/bin/sh

# FTL (https://github.com/nuta/ftl) built offline with the nightly from host-rust-1.101.sh.
# Needs: x86_64-unknown-linux-musl std (host-musl.sh + host-rust-1.101.sh), GNU cpio (host-cpio.sh).

#> FETCH 417aff185f93b89d3644b26270c0e294750443c3222097d5f82dea948b8e8536
#>  FROM https://github.com/nuta/ftl/archive/0ea4a9811bd9650348bb672c710dfcf7445e2a46.tar.gz
#>    AS ftl-0ea4a98.tar.gz
#
# crates.io dependencies: Cargo.lock, apps/*/Cargo.lock and, for -Z build-std,
# rust-src's library/Cargo.lock (nightly-2026-10-04, db8f076d2).
#
#> FETCH e567177890eb1617b1f774005b66b26b2377afd138a2ca37aae7d8f0c81429d4
#>  FROM https://static.crates.io/crates/addr2line/addr2line-0.27.1.crate
#
#> FETCH 320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa
#>  FROM https://static.crates.io/crates/adler2/adler2-2.0.1.crate
#
#> FETCH 683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923
#>  FROM https://static.crates.io/crates/allocator-api2/allocator-api2-0.2.21.crate
#
#> FETCH 1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0
#>  FROM https://static.crates.io/crates/atomic-waker/atomic-waker-1.1.2.crate
#
#> FETCH fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04
#>  FROM https://static.crates.io/crates/bytes/bytes-1.12.1.crate
#
#> FETCH 509591b7bcd67f4ef775afad7662703b4935daaa6ec0e5605cfb1090b32a2b6d
#>  FROM https://static.crates.io/crates/cc/cc-1.4.3.crate
#
#> FETCH 9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801
#>  FROM https://static.crates.io/crates/cfg-if/cfg-if-1.0.4.crate
#
#> FETCH ad5208a115eaba24916f7456929832e310a81518c641f93fee4f89aa93aa3675
#>  FROM https://static.crates.io/crates/dlmalloc/dlmalloc-0.2.14.crate
#
#> FETCH 877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f
#>  FROM https://static.crates.io/crates/equivalent/equivalent-1.0.2.crate
#
#> FETCH d45db016d36b838f563236e9193d0ee6ce38f3f68b6c94e914b4929c96bbb890
#>  FROM https://static.crates.io/crates/find-msvc-tools/find-msvc-tools-0.1.11.crate
#
#> FETCH 77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb
#>  FROM https://static.crates.io/crates/foldhash/foldhash-0.2.0.crate
#
#> FETCH 5efc85edd5b83e8394f4371dd0da6859dff63dd387dab8568fece6af4cde6f84
#>  FROM https://static.crates.io/crates/fortanix-sgx-abi/fortanix-sgx-abi-0.6.1.crate
#
#> FETCH b1f9e3d69d39e4862ffed03ed071a76f9a13ba1d9109d355b0f0aa6b15e393c4
#>  FROM https://static.crates.io/crates/futures-channel/futures-channel-0.3.34.crate
#
#> FETCH 92d699e522242e69e3003b94ecc1f960f3a5e015aa7c5d7486e65ad01dd94f5e
#>  FROM https://static.crates.io/crates/futures-core/futures-core-0.3.34.crate
#
#> FETCH cfe4fbac503b8d1f88e6676011885f34b7174f46e59956bba534ba83abded4df
#>  FROM https://static.crates.io/crates/getopts/getopts-0.2.24.crate
#
#> FETCH 1033caf0b349c518623b5396bfb2cf0bddf44f0306d543a250e5743297aafd10
#>  FROM https://static.crates.io/crates/gimli/gimli-0.34.0.crate
#
#> FETCH ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a
#>  FROM https://static.crates.io/crates/hashbrown/hashbrown-0.17.1.crate
#
#> FETCH e17592d60ebacc7d5e169f4663c5f84f9161cc90328abcfe8456f41e4dfcb284
#>  FROM https://static.crates.io/crates/hermit-abi/hermit-abi-0.5.3.crate
#
#> FETCH 918d3568bebf352712bc2ef3d46a8bcf1a75b373be6539de198e9105cbbf9ce0
#>  FROM https://static.crates.io/crates/http/http-1.5.0.crate
#
#> FETCH 6dbf3de79e51f3d586ab4cb9d5c3e2c14aa28ed23d180cf89b4df0454a69cc87
#>  FROM https://static.crates.io/crates/httparse/httparse-1.10.1.crate
#
#> FETCH ca2a8f2913ee65f60facd6a5905613afaa448497a0230cc41ce022d93290bc2c
#>  FROM https://static.crates.io/crates/http-body/http-body-1.1.0.crate
#
#> FETCH 23169fe34a5fbcdd3f3862e78fb9b6fccd5f02a6dc6f732547005d45631ce71c
#>  FROM https://static.crates.io/crates/http-body-util/http-body-util-0.1.5.crate
#
#> FETCH df3b46402a9d5adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9
#>  FROM https://static.crates.io/crates/httpdate/httpdate-1.0.3.crate
#
#> FETCH 27b501faa50e7a26c3d3560ca625132f4078a17771f4810baf70475ae48cbe43
#>  FROM https://static.crates.io/crates/hyper/hyper-1.11.1.crate
#
#> FETCH 96547c2556ec9d12fb1578c4eaf448b04993e7fb79cbaad930a656880a6bdfa0
#>  FROM https://static.crates.io/crates/hyper-util/hyper-util-0.1.20.crate
#
#> FETCH 8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682
#>  FROM https://static.crates.io/crates/itoa/itoa-1.0.18.crate
#
#> FETCH 3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2
#>  FROM https://static.crates.io/crates/libc/libc-0.2.189.crate
#
#> FETCH cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98
#>  FROM https://static.crates.io/crates/memchr/memchr-2.8.3.crate
#
#> FETCH b63fbc4a50860e98e7b2aa7804ded1db5cbc3aff9193adaff57a6931bf7c4b4c
#>  FROM https://static.crates.io/crates/miniz_oxide/miniz_oxide-0.9.1.crate
#
#> FETCH 4b18443e9c262bfe8fa82f51666e2642c53393f7e5c27b3e1aeab922cff5b9d8
#>  FROM https://static.crates.io/crates/mio/mio-1.2.3.crate
#
#> FETCH 9f3c01b588c6d37e3f4f065712c4f33e12fad17ad4152a70e8346991e2bbe92e
#>  FROM https://static.crates.io/crates/moto-rt/moto-rt-0.17.4.crate
#
#> FETCH 2e5a6c098c7a3b6547378093f5cc30bc54fd361ce711e05293a5cc589562739b
#>  FROM https://static.crates.io/crates/object/object-0.39.1.crate
#
#> FETCH a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd
#>  FROM https://static.crates.io/crates/pin-project-lite/pin-project-lite-0.2.17.crate
#
#> FETCH 985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9
#>  FROM https://static.crates.io/crates/proc-macro2/proc-macro2-1.0.107.crate
#
#> FETCH 1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001
#>  FROM https://static.crates.io/crates/quote/quote-1.0.47.crate
#
#> FETCH b9ef1d0d795eb7d84685bca4f72f3649f064e6641543d3a8c415898726a57b41
#>  FROM https://static.crates.io/crates/rand/rand-0.9.5.crate
#
#> FETCH 76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c
#>  FROM https://static.crates.io/crates/rand_core/rand_core-0.9.5.crate
#
#> FETCH 513962919efc330f829edb2535844d1b912b0fbe2ca165d613e4e8788bb05a5a
#>  FROM https://static.crates.io/crates/rand_xorshift/rand_xorshift-0.4.0.crate
#
#> FETCH 69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f
#>  FROM https://static.crates.io/crates/r-efi/r-efi-5.3.0.crate
#
#> FETCH dc2f58ef3ca9bb0f9c44d9aa8537601bcd3df94cc9314a40178cadf7d4466354
#>  FROM https://static.crates.io/crates/r-efi-alloc/r-efi-alloc-2.1.0.crate
#
#> FETCH b74b56ffa8bb2830709a538c2cbcae9aa062db0d2a42563bfb09bdaae44020eb
#>  FROM https://static.crates.io/crates/rustc-demangle/rustc-demangle-0.1.28.crate
#
#> FETCH 6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d
#>  FROM https://static.crates.io/crates/rustc-hash/rustc-hash-2.1.3.crate
#
#> FETCH bfe6f213fb658c8fb95baabd5420393438cf5a98d707f5dd701d9197c705f71e
#>  FROM https://static.crates.io/crates/rustc-literal-escaper/rustc-literal-escaper-0.0.8.crate
#
#> FETCH f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba
#>  FROM https://static.crates.io/crates/shlex/shlex-2.0.1.crate
#
#> FETCH ba467056f1b547ed52077911161fc86985becbc60e8e1857c8a144dab0def891
#>  FROM https://static.crates.io/crates/smallvec/smallvec-1.16.1.crate
#
#> FETCH c3d1e2c7f27f8d4cb10542a02c49005dbd6e93095799d6f3be745fae9f8fedd4
#>  FROM https://static.crates.io/crates/socket2/socket2-0.6.5.crate
#
#> FETCH 8593e8e72159ed2257d083c7a454a85cbf854f37a0966d8d483aff8c8a3ebcee
#>  FROM https://static.crates.io/crates/syn/syn-3.0.6.crate
#
#> FETCH 202caea871b69668250d242070849eb495be178ed697a3e98aebce5bc81a0bed
#>  FROM https://static.crates.io/crates/tokio/tokio-1.53.1.crate
#
#> FETCH 78773a2a397f451582ce068015985c33193cf6dea8b74d2a639fe457b2f07b0e
#>  FROM https://static.crates.io/crates/tokio-macros/tokio-macros-2.7.2.crate
#
#> FETCH d245f478577f809a851594d02313b640fb437e0bb33866753cff937863096954
#>  FROM https://static.crates.io/crates/unicode-ident/unicode-ident-1.0.26.crate
#
#> FETCH 4b134ada16dda9e435abe2a6d76a01d497bc60707357845a15f9b0ed42dc88ce
#>  FROM https://static.crates.io/crates/unwinding/unwinding-0.2.10.crate
#
#> FETCH 79e5fe15afde1305478b35e2cb717fff59f485428534cf49cfdbfa4723379bf6
#>  FROM https://static.crates.io/crates/vex-sdk/vex-sdk-0.27.1.crate
#
#> FETCH ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b
#>  FROM https://static.crates.io/crates/wasi/wasi-0.11.1+wasi-snapshot-preview1.crate
#
#> FETCH b5e26842486624357dbeb8f0381cf1fb42f022291fd787d4a816768fec8cc760
#>  FROM https://static.crates.io/crates/wasip1/wasip1-1.0.0.crate
#
#> FETCH 89aafd4b69fb41a64cfd5d7f214cde92ab422ec4d9bcd55fcc816d3f5f49bbf3
#>  FROM https://static.crates.io/crates/wasip2/wasip2-2.0.1+wasi-0.2.12.crate
#
#> FETCH f1d5749fdf69bb9400562eba50f8f25f5cd800ef4b74300038b6f99ae7409674
#>  FROM https://static.crates.io/crates/wasip3/wasip3-0.9.0+wasi-0.3.0.crate
#
#> FETCH f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5
#>  FROM https://static.crates.io/crates/windows-link/windows-link-0.2.1.crate
#
#> FETCH ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc
#>  FROM https://static.crates.io/crates/windows-sys/windows-sys-0.61.2.crate
#
#> FETCH 53cb4b5556c3a791e86838ea287782bdafa704d55b0e68b5b81a3a16b9ea5f4b
#>  FROM https://static.crates.io/crates/wit-bindgen/wit-bindgen-0.62.0.crate

set -uex

rm -rf /tmp/ftl
mkdir -p /tmp/ftl/src /tmp/ftl/vendor /tmp/ftl/cargo-home
cd /tmp/ftl/src
tar --strip-components=1 -xf /tmp/downloads/ftl-0ea4a98.tar.gz

# Busybox goes last so GNU cpio (needs -0) wins over busybox cpio.
export PATH="/usr/local/bin:$PATH:/usr/busybox/bin"
export LD_LIBRARY_PATH="/usr/local/lib:/usr/local/lib64:/usr/lib"

# Vendor the crates fetched above into a cargo directory source.
awk '/^#> FETCH /{h=$3} /^#>  FROM https:\/\/static.crates.io\//{n=split($3,a,"/"); print h, a[n]}' "$0" |
while read hash crate; do
  tar -xzf "/tmp/downloads/$crate" -C /tmp/ftl/vendor
  printf '{"files":{},"package":"%s"}' "$hash" > "/tmp/ftl/vendor/${crate%.crate}/.cargo-checksum.json"
done

export CARGO_HOME=/tmp/ftl/cargo-home
cat << EOF2 > $CARGO_HOME/config.toml
[source.crates-io]
replace-with = "vendored"
[source.vendored]
directory = "/tmp/ftl/vendor"
[net]
offline = true
EOF2

RELEASE=1 ./build.sh

mkdir -p /opt/ftl
cp ftl.elf lx.elf initfs.cpio /opt/ftl/
