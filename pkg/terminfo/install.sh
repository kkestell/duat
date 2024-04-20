#!/usr/bin/env bash
set -o xtrace
set -e

PKG_SRC="/duat/pkg/terminfo/src"
INSTALL_DIR="/duat/build/$ARCH/initramfs/usr/share"

cp -r /lib/terminfo $INSTALL_DIR

# Set TERMINFO to a custom directory
#export TERMINFO=/path/to/custom/terminfo

# Compile the source file to that directory
#tic -o $TERMINFO myterm.src

# # Directories for terminfo and termcap
# TERMINFODIR="build/$ARCH/terminfo/usr/share"
# TERMCAPDIR="build/$ARCH/termcap/etc"

# # Create directories if not existent
# mkdir -p $TERMINFODIR
# mkdir -p $TERMCAPDIR

# # Download and decompress terminfo and termcap
# curl -L -o $TERMINFODIR/terminfo.gz https://invisible-island.net/datafiles/current/terminfo.src.gz
# curl -L -o $TERMCAPDIR/termcap.gz https://invisible-island.net/datafiles/current/termcap.src.gz

# gzip -d $TERMINFODIR/terminfo.gz
# gzip -d $TERMCAPDIR/termcap.gz
