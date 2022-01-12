#!/usr/bin/env bash

rm -rf build iso/aarch64 iso/x86_64

pushd deps/linux
make clean
popd # deps/linux

pushd deps/toybox
make clean
popd # deps/toybox

