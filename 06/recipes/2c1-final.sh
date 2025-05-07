#!/store/2b2-busybox/bin/ash

set -uex
export PATH="/tmp/2c1-buildroot/output/host/bin"
export PATH="$PATH:/store/2b2-busybox/bin"
export PATH="$PATH:/store/2c1-coreutils/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"

rm -rf /fs
mkdir -p /fs; cd /fs;
tar --strip-components=1 -xf /store/2c1-buildroot/rootfs.tar
cd ..

# Fix up rootfs because the rsync build in 06 is likely broken 
rm /fs/lib64 /fs/linuxrc
ln -s /lib /fs/lib64

useless="var media mnt opt run sys proc etc dev root"
for name in ${useless}; do rm -r /fs/${name}; done

progs="ash ls arch cat cp dmesg false gunzip linux32 lsattr mount nice printenv rmdir setserial sync uname ash chattr cpio dnsdomainname fdflush gzip linux64 mkdir mountpoint  nuke ps run-parts  sh tar usleep base32 chgrp date  dumpkmap fgrep hostname  ln mknod mt pidof pwd sed sleep touch vi base64 chmod dd echo getopt kill login mktemp  mv ping resume setarch stty true watch chown df egrep grep link ls more netstat pipe_progress rm setpriv su umount zcat"
for name in ${progs}; do
	rm /fs/bin/${name}
	ln -s busybox /fs/bin/${name}
done
chmod -R u=rwx,go=rx /fs/bin/*

sbin_progs="arp freeramdisk halt ifdown ip iproute makedevs mkswap poweroff run-init sulogin sysctl vconfig blkid fsck hdparm ifup ipaddr iprule loadkmap mdev modprobe reboot runlevel swapoff syslogd watchdog devmem fstrim hwclock init iplink iptunnel losetup mkdosfs nameif rmmod setconsole swapon udhcpc fdisk getty ifconfig insmod ipneigh klogd lsmod mke2fs pivot_root route start-stop-daemon switch_root uevent"
for name in ${sbin_progs}; do
	rm /fs/sbin/${name}
	ln -s ../bin/busybox /fs/sbin/${name}
done
chmod -R u=rwx,go=rx /fs/sbin/*

usrbin_progs="[ bzcat dc factor last lsusb nl paste seq sort time unix2dos w yes [[ deallocvt fallocate head lzcat patch setfattr top unlink wc chrt diff find hexdump lzma nohup printf setkeycodes tr unlzma wget chvt dirname flock hexedit lzopcat nproc setsid svc traceroute unlzop which cksum dos2unix fold hostid less nslookup sha1sum svok tree unxz who ascii clear du free id logger md5sum readlink sha256sum tail truncate unzip whoami awk cmp eject fuser install logname mesg realpath sha3sum tee ts uptime xargs basename crc32 ipcrm lsof microcom od renice sha512sum telnet tsort uudecode xxd bc crontab env getfattr ipcs lspci mkfifo openvt reset shred test tty uuencode xz bunzip2 cut expr killall lsscsi mkpasswd passwd resize tftp uniq vlock xzcat"
for name in ${usrbin_progs}; do
	rm /fs/usr/bin/${name}
	ln -s ../../bin/busybox /fs/usr/bin/${name}
done
chmod -R u=rwx,go=rx /fs/usr/bin/*

mkdir -p /fs/usr/include
cp -r /store/2a6-linux-headers/* /fs/usr/include


rm -rf /tmp/2c1-final
rm -rf /store/2c1-final
mkdir -p /tmp/2c1-final; cd /tmp/2c1-final
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir aliases; ln -s /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2c1-final/aliases:$PATH"

echo "### $0: unpacking GNU GCC 13 sources..."
mkdir gmp mpfr mpc isl
tar --strip-components=1 -xf /downloads/gcc-13.3.0.tar.xz
tar --strip-components=1 -xf /downloads/gmp-6.1.0.tar.xz -C gmp
tar --strip-components=1 -xf /downloads/mpfr-3.1.4.tar.xz -C mpfr
tar --strip-components=1 -xf /downloads/mpc-1.0.3.tar.gz -C mpc
tar --strip-components=1 -xf /downloads/isl-0.18.tar.bz2 -C isl

echo "### $0: fixing up GNU GCC 13 sources..."
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	missing move-if-change mkdep mkinstalldirs symlink-tree install-sh \
	gcc/exec-tool.in libgcc/mkheader.sh
sed -i 's|^\(\s*\)sh |\1/store/2b2-busybox/bin/ash |' \
	libgcc/Makefile.in
sed -i 's|LIBGCC2_DEBUG_CFLAGS = -g|LIBGCC2_DEBUG_CFLAGS = |' \
	libgcc/Makefile.in
# sed -i 's|m64=../lib64|m64=../lib|' gcc/config/i386/t-linux64
# sed -i 's|"os/gnu-linux"|"os/generic"|' libstdc++-v3/configure.host
# see libtool's 74c8993c178a1386ea5e2363a01d919738402f30
sed -i 's/| \$NL2SP/| sort | $NL2SP/' ltmain.sh */ltmain.sh

echo "### $0: building GNU GCC 13"
mkdir -p /fs/tools
ash configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	CFLAGS=-O2 CXX_FLAGS=-O2 \
	CFLAGS_FOR_TARGET=-O2 CXXFLAGS_FOR_TARGET=-O2 \
	--with-sysroot=/fs \
	--with-native-system-header-dir=/usr/include \
	--prefix=/fs/usr \
	--enable-languages=c,c++ \
	--disable-libquadmath --disable-decimal-float --disable-fixed-point \
	--disable-lto \
	--disable-libgomp \
	--disable-multilib \
	--disable-multiarch \
	--disable-libmudflap \
	--disable-libssp \
	--disable-nls \
	--disable-libitm \
	--disable-libsanitizer \
	--disable-cet \
	--disable-gnu-unique-object \
	--disable-gcov \
	--disable-checking \
	--host x86_64-buildroot-linux-gnu
make -j $NPROC
make -j $NPROC install-strip
