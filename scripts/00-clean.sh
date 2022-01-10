#!/usr/bin/env bash

rm -rf build iso/initramfs.gz iso/kernel.gz

pushd deps/linux
make clean
popd # deps/linux

pushd deps/toybox
make clean
popd # deps/toybox

