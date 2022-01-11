#!/usr/bin/env bash
set -o xtrace

if [ ! -d deps/linux ]; then
    git clone -b v5.15 --depth=1 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git deps/linux
fi

cp config/$ARCH/linux.config deps/linux/.config

mkdir -p build/linux/$ARCH

pushd deps/linux

if [ "$ARCH" = "aarch64" ]; then
    KARCH=arm64
else
    KARCH=$ARCH
fi

CROSS_COMPILE=../$ARCH-linux-musl-cross/bin/$ARCH-linux-musl- ARCH=$KARCH make -j8

mkdir -p ../../iso/$ARCH

if [ "$ARCH" = "aarch64" ]; then
    cp arch/$KARCH/boot/Image.gz ../../iso/$ARCH/kernel.gz
else
    cp arch/$KARCH/boot/bzImage ../../iso/$ARCH/kernel.gz
fi

popd # deps/linux