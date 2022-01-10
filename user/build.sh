#!/usr/bin/env bash
set -e

SCRIPT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
CC=clang-13
ROOT=$SCRIPT_DIR/root

if [ ! -d musl ]; then
    git clone -b v1.2.2 --depth=1 https://github.com/ifduyue/musl.git
fi

if [ ! -d $ROOT ]; then
    mkdir $ROOT

    pushd musl
    ./configure --prefix=$ROOT CC=clang-13
    make install CC=clang-13
    popd # musl
fi

pushd src

pushd init
make install CC=clang-13 PREFIX=$ROOT/bin
popd # init

popd # src

pushd root
find . | cpio -oHnewc | gzip --best > ../initramfs.gz
popd # root