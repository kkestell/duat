#!/usr/bin/env bash
set -o xtrace
set -e

PKG_NAME="nano"
PKG_DIR="/duat/pkg/$PKG_NAME"
SOURCE_DIR="$PKG_DIR/src"
INSTALL_DIR="/duat/build/$ARCH/initramfs"

if [ ! -d $SOURCE_DIR ]; then
    git clone --depth=1 https://github.com/madnight/nano $SOURCE_DIR
fi

pushd $SOURCE_DIR

./autogen.sh
LDFLAGS="-static" ./configure --prefix=/usr --host=$ARCH-linux-musl --disable-shared --enable-static
make -j8
make DESTDIR=$INSTALL_DIR install

popd
