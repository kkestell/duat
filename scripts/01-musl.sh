#!/usr/bin/env bash

mkdir -p deps

if [ ! -d deps/musl ]; then
    git clone -b v1.2.2 --depth=1 https://github.com/ifduyue/musl.git deps/musl
fi

mkdir -p build/musl

pushd deps/musl

./configure --prefix=../../build/musl CC=clang-13
make install CC=clang-13

popd # deps/musl