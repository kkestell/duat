#!/usr/bin/env bash
set -o xtrace

rm -rf /duat/build/$ARCH/initramfs

mkdir -p /duat/build/$ARCH/initramfs/{bin,dev,home,mnt,proc,root,sys,tmp,var} 
chmod a+rwxt /duat/build/$ARCH/initramfs/tmp

pushd /duat/build/$ARCH/initramfs

rsync -ar /duat/build/$ARCH/busybox/* ./

mkdir -p /duat/iso/$ARCH
find . | cpio -oHnewc | gzip --best > /duat/iso/$ARCH/initramfs.gz

popd # build/$ARCH/initramfs
