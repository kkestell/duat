#!/usr/bin/env bash

if [ ! -d deps/toybox ]; then
    git clone -b 0.8.6 --depth=1 https://github.com/landley/toybox.git deps/toybox
fi

cp config/$ARCH/toybox.config deps/toybox/.config

mkdir -p build/$ARCH/toybox

pushd deps/toybox

CROSS_COMPILE=../$ARCH-linux-musl-cross/bin/$ARCH-linux-musl- LDFLAGS=--static make -j8
PREFIX=../../build/$ARCH/toybox make install_flat

popd # deps/toybox