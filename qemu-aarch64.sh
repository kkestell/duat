#!/bin/bash

qemu-system-aarch64 \
    -kernel iso/aarch64/kernel.gz \
    -initrd iso/aarch64/initramfs.gz \
    -M virt \
    -m 1024
