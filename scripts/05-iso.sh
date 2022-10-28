#!/usr/bin/env bash
set -o xtrace

mkdir -p /duat/build/$ARCH/iso/boot/grub
mkdir -p /duat/iso/$ARCH

cat > /duat/build/$ARCH/iso/boot/grub/grub.cfg << EOF
menuentry "Duat" {
    linux /boot/kernel.gz console=ttyS0
    initrd /boot/initramfs.gz
}
EOF

cp /duat/build/$ARCH/kernel.gz /duat/build/$ARCH/iso/boot
cp /duat/build/$ARCH/initramfs.gz /duat/build/$ARCH/iso/boot

grub-mkrescue -o /duat/iso/$ARCH/duat-$ARCH.iso /duat/build/$ARCH/iso
