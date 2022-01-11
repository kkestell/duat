#!/usr/bin/env bash

# https://musl.cc/aarch64-linux-musl-cross.tgz

ARCH=x86_64

mkdir -p deps

if [ ! -d deps/$ARCH-linux-musl-cross ]; then
    curl https://musl.cc/x86_64-linux-musl-cross.tgz | tar -zxf - -C deps
fi
