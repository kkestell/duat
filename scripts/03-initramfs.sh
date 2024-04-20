#!/usr/bin/env bash
set -o xtrace

rm -rf /duat/build/$ARCH/initramfs

mkdir -p /duat/build/$ARCH/initramfs/{bin,dev,etc/init.d,home,mnt,proc,root,sys/dev,tmp,var} 
chmod a+rwxt /duat/build/$ARCH/initramfs/tmp

pushd /duat/build/$ARCH/initramfs || exit

cat > etc/inittab << EOF
::sysinit:/etc/init.d/rcS
ttyS0::askfirst:/bin/sh
::respawn:/sbin/getty 115200 /dev/tty0
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

chvt 1

ip link set eth0 up
ifconfig eth0 10.0.2.15 netmask 255.255.255.0
route add default gw 10.0.2.2

mkdir /home/user
adduser -D -h /home/user user
EOF
chmod 0755 etc/init.d/rcS

cat > etc/passwd << EOF
root:x:0:0:root:/root:/bin/sh
user:x:1000:1000:user:/home/user:/bin/sh
EOF

cat > etc/shadow << EOF
root::10933:0:99999:7:::
user::10933:0:99999:7:::
EOF

cat > etc/resolv.conf << EOF
nameserver 8.8.8.8
EOF

cat > etc/nsswitch.conf << EOF
hosts:      files dns
EOF

popd || exit # build/initramfs
