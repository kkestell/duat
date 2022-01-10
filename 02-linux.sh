#!/usr/bin/env bash

if [ ! -d deps/linux ]; then
    git clone -b v5.15 --depth=1 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
fi

cp linux.config deps/linux/.config

mkdir -p build/linux

pushd deps/linux

make -j8 CC=clang-13 LLVM=1
cp arch/x86_64/boot/bzImage ../../build/linux/kernel

popd # deps/linux