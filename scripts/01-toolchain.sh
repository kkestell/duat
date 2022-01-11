#!/usr/bin/env bash

mkdir -p deps

if [ ! -d deps/$ARCH-linux-musl-cross ]; then
    curl https://musl.cc/$ARCH-linux-musl-cross.tgz | tar -zxf - -C deps
fi
