#!/usr/bin/env bash

ARCH=x86_64
CROSS_COMPILE=../$ARCH-linux-musl-cross/bin/$ARCH-linux-musl-

if [ ! -d deps/toybox ]; then
    git clone -b 0.8.6 --depth=1 https://github.com/landley/toybox.git deps/toybox
fi

cp config/toybox.config deps/toybox/.config

mkdir -p build/toybox

pushd deps/toybox

make -j8 LDFLAGS=--static
make install_flat PREFIX=../../build/toybox

popd # deps/toybox