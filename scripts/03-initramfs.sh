#!/usr/bin/env bash

mkdir -p build/initramfs/bin

pushd src
make -j8 ROOT=../build/musl
make install PREFIX=../build/initramfs/bin
popd # src

pushd build/initramfs
find . | cpio -oHnewc | gzip --best > ../../iso/initramfs.gz
popd # build/initramfs
