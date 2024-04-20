#!/usr/bin/env bash
set -o xtrace
set -e

PKG_NAME="busybox"
PKG_DIR="/duat/pkg/$PKG_NAME"
SOURCE_DIR="$PKG_DIR/src"
INSTALL_DIR="/duat/build/$ARCH/initramfs"

if [ ! -d $SOURCE_DIR ]; then
    git clone -b 1_35_stable --depth=1 https://github.com/mirror/busybox $SOURCE_DIR
fi

cp $PKG_DIR/busybox.config $SOURCE_DIR/.config

pushd $SOURCE_DIR

CROSS_COMPILE=/duat/deps/$ARCH-linux-musl-cross/bin/$ARCH-linux-musl- LDFLAGS=--static make -j8
CROSS_COMPILE=/duat/deps/$ARCH-linux-musl-cross/bin/$ARCH-linux-musl- LDFLAGS=--static make install CONFIG_PREFIX="$INSTALL_DIR"

popd