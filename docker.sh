#!/usr/bin/env bash

docker build --tag=duat .
docker run \
    -it \
    --rm \
    -v duat-deps:/duat/deps \
    -v duat-build:/duat/build \
    --mount type=bind,source="$(pwd)/iso",target=/duat/iso \
    --mount type=bind,source="$(pwd)/scripts",target=/duat/scripts \
    --mount type=bind,source="$(pwd)/src",target=/duat/src \
    --mount type=bind,source="$(pwd)/config",target=/duat/config \
    duat \
    /bin/bash
