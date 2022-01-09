#!/bin/bash

qemu-system-x86_64 \
    -kernel kernel/linux/arch/x86_64/boot/bzImage \
    -initrd user/initramfs.gz \
    -nographic \
    -append "console=ttyS0" \
    -m 512