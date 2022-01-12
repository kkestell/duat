#!/usr/bin/env bash
set -o xtrace

if [ ! -d /duat/deps/linux ]; then
    git clone -b v5.15 --depth=1 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git deps/linux
fi

cp /duat/config/$ARCH/linux.config /duat/deps/linux/.config

pushd /duat/deps/linux

if [ "$ARCH" = "aarch64" ]; then
    KARCH=arm64
else
    KARCH=$ARCH
fi

CROSS_COMPILE=/duat/deps/$ARCH-linux-musl-cross/bin/$ARCH-linux-musl- ARCH=$KARCH make -j8

mkdir -p /duat/iso/$ARCH

if [ "$ARCH" = "aarch64" ]; then
    cp arch/$KARCH/boot/Image.gz /duat/iso/$ARCH/kernel.gz
else
    cp arch/$KARCH/boot/bzImage /duat/iso/$ARCH/kernel.gz
fi

popd # deps/linux