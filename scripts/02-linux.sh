#!/usr/bin/env bash

FLAGS="CC=clang-13 LD=ld.lld-13 AR=llvm-ar-13 NM=llvm-nm-13 STRIP=llvm-strip-13 OBJCOPY=llvm-objcopy-13 OBJDUMP=llvm-objdump-13 READELF=llvm-readelf-13 HOSTCC=clang-13 HOSTCXX=clang++-13 HOSTAR=llvm-ar-13 HOSTLD=ld.lld-13"

if [ ! -d deps/linux ]; then
    git clone -b v5.15 --depth=1 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git deps/linux
fi

cp config/linux.config deps/linux/.config

mkdir -p build/linux

pushd deps/linux

make -j8 $FLAGS
cp arch/x86_64/boot/bzImage ../../iso/kernel.gz

popd # deps/linux