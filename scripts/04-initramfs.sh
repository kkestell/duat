#!/usr/bin/env bash
set -o xtrace

rm -rf build/initramfs

mkdir -p /duat/build/$ARCH/initramfs/{bin,dev,etc/{init.d,udhcp},home,mnt,proc,root,sys,tmp,var} 
chmod a+rwxt /duat/build/$ARCH/initramfs/tmp

pushd build/initramfs

cat > init << EOL
#!/bin/sh
 
mount -t proc none /proc
mount -t sys none /sys
 
exec /bin/sh
EOL

cp /duat/deps/busybox/examples/udhcp/simple.script etc/udhcp/config.sh

echo "::sysinit:/bin/sh" >> etc/inittab

cat > etc/inittab << EOF
::sysinit:/etc/init.d/rcS
ttyS0::askfirst:/bin/sh
::ctrlaltdel:/sbin/reboot
::shutdown:/sbin/swapoff -a
::shutdown:/bin/umount -a -r
::restart:/sbin/init
EOF

cat > etc/init.d/rcS << EOF
#!/bin/sh

mount -vt proc proc proc
mount -vt sysfs sysfs sys

/sbin/mdev -s

ip link set eth0 up
udhcpc -i eth0 -s /etc/udhcp/simple.script
EOF
chmod 0755 etc/init.d/rcS

cat > etc/passwd << EOF
root:x:0:0:root:/root:/bin/sh
EOF

cat > etc/shadow << EOF
root::10933:0:99999:7:::
EOF

cat > etc/resolv.conf << EOF
nameserver 8.8.8.8
EOF

cat > etc/nsswitch.conf << EOF
hosts:      files dns
EOF

mknod dev/null c 1 3
mknod -m 666 dev/ttyS0 c 4 64

mkdir -p /duat/build/$ARCH
find . | cpio -oHnewc | gzip --best > /duat/build/$ARCH/initramfs.gz

cp -a ../toybox/. ./bin

find . | cpio -oHnewc | gzip --best > ../../iso/initramfs.gz

popd # build/initramfs
