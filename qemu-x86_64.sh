#!/bin/bash

qemu-system-x86_64 \
    -kernel iso/x86_64/kernel.gz \
    -initrd iso/x86_64/initramfs.gz \
    -nographic \
    -append "console=ttyS0" \
    -m 512