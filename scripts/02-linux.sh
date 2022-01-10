#!/usr/bin/env bash

ARCH=x86_64
CROSS_COMPILE=../$ARCH-linux-musl-cross/bin/$ARCH-linux-musl-

if [ ! -d deps/linux ]; then
    git clone -b v5.15 --depth=1 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git deps/linux
fi

cp config/linux.config deps/linux/.config

mkdir -p build/linux

pushd deps/linux

make -j8
cp arch/x86_64/boot/bzImage ../../iso/kernel.gz

popd # deps/linux