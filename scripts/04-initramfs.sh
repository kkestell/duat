#!/usr/bin/env bash

rm -rf build/initramfs

mkdir -p build/initramfs/{bin,dev,home,mnt,proc,root,sys,tmp,var} 
chmod a+rwxt build/initramfs/tmp

pushd build/initramfs

cat > init << EOL
#!/bin/sh
 
mount -t proc none /proc
mount -t sys none /sys
 
exec /bin/sh
EOL

chmod +x init

cp -a ../toybox/. ./bin

find . | cpio -oHnewc | gzip --best > ../../iso/initramfs.gz

popd # build/initramfs
