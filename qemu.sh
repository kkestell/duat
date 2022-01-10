#!/bin/bash

qemu-system-x86_64 \
    -kernel iso/kernel.gz \
    -initrd iso/initramfs.gz \
    -nographic \
    -append "console=ttyS0" \
    -m 512