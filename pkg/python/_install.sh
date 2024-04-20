#!/usr/bin/env bash
set -o xtrace
set -e

PKG_NAME="python"
PKG_DIR="/duat/pkg/$PKG_NAME"
SOURCE_DIR="$PKG_DIR/src"
INSTALL_DIR="/duat/build/$ARCH/initramfs"

if [ ! -d $SOURCE_DIR ]; then
    git clone -b 3.9 --depth=1 https://github.com/python/cpython $SOURCE_DIR
fi

pushd $SOURCE_DIR

export CROSS_COMPILE=/duat/deps/$ARCH-linux-musl-cross/bin/$ARCH-linux-musl-
export CC=${CROSS_COMPILE}gcc
export READELF=${CROSS_COMPILE}readelf

CONFIG_SITE=/duat/pkg/python/config.site ./configure --host=$ARCH-linux-musl --build=$(./config.guess) --enable-optimizations --disable-ipv6 --prefix="$INSTALL_DIR"
make
DESTDIR="$INSTALL_DIR" make install

# LDFLAGS="-static" ./configure --prefix=/usr --host=$ARCH-linux-musl --disable-shared --enable-static
# make -j8
# make DESTDIR=$INSTALL_DIR install

popd
