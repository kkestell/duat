#!/usr/bin/env bash

docker build --tag=duat .
docker run \
    -it \
    --rm \
    -v duat-build:/duat/build \
    -v duat-deps:/duat/deps \
    --mount type=bind,source="$(pwd)/config",target=/duat/config \
    --mount type=bind,source="$(pwd)/iso",target=/duat/iso \
    --mount type=bind,source="$(pwd)/scripts",target=/duat/scripts \
    duat \
    /bin/bash
