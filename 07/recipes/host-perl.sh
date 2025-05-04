#!/bin/sh
set -uex

rm -rf /tmp/host-perl
mkdir -p /tmp/host-perl; cd /tmp/host-perl
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/perl-5.40.2.tar.gz

export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
sh Configure -des                                         \
             -D prefix=/usr                               \
             -D vendorprefix=/usr                         \
             -D useshrplib                                \
             -D privlib=/usr/lib/perl5/5.40/core_perl     \
             -D archlib=/usr/lib/perl5/5.40/core_perl     \
             -D sitelib=/usr/lib/perl5/5.40/site_perl     \
             -D sitearch=/usr/lib/perl5/5.40/site_perl    \
             -D vendorlib=/usr/lib/perl5/5.40/vendor_perl \
             -D vendorarch=/usr/lib/perl5/5.40/vendor_perl
make 
make install
