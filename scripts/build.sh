#!/usr/bin/env bash

set -o xtrace
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

"$SCRIPT_DIR"/01-toolchain.sh
"$SCRIPT_DIR"/02-linux.sh
"$SCRIPT_DIR"/03-initramfs.sh
"$SCRIPT_DIR"/04-packages.sh
"$SCRIPT_DIR"/05-iso.sh
