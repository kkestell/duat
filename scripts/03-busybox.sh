#!/usr/bin/env bash
set -o xtrace

if [ ! -d deps/busybox ]; then
    git clone -b 1_35_stable --depth=1 https://github.com/mirror/busybox deps/busybox
fi

cp config/$ARCH/busybox.config deps/busybox/.config

mkdir -p build/$ARCH/busybox

pushd deps/busybox

CROSS_COMPILE=../$ARCH-linux-musl-cross/bin/$ARCH-linux-musl- LDFLAGS=--static make install -j8

popd # deps/toybox