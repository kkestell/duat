#!/bin/bash

qemu-system-$ARCH \
    -boot d \
    -cdrom iso/$ARCH/duat-$ARCH.iso \
    -m 1024