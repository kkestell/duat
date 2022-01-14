#!/bin/bash

mkdir -p disk/EFI/BOOT
cp iso/x86_64/kernel.gz disk/EFI/BOOT/BOOTX64.EFI
hdiutil create -fs fat32 -ov -size 48m -volname UEFI -format UDTO -srcfolder disk iso/x86_64/boot.cdr
rm -rf disk

qemu-system-x86_64 \
  -L bios/OVMF.fd \
  -nographic \
  #-drive format=raw,file=iso/x86_64/boot.cdr \
  #--nographic \
  #-cdrom iso/x86_64/duat-x86_64.iso \
  #-hda iso/x86_64/boot.cdr
  -m 1024

# qemu-system-x86_64 \
#     -boot d \
#     -cdrom iso/x86_64/duat-x86_64.iso \
#     -m 1024