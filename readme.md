# Duat

> Slowly goes the Boat of Ra, passing through the Duat, to regions of thick darkness, of horror and dismay, where the dead have their habitations, and Apep lies in wait for the coming of Ra. Thus passes the first hour of the night, and the second hour is at hand.

## About

* Linux
* Musl
* Toybox

## Getting Started

Create and SSH into the build container:

```
$ ./docker.sh
```

Install GCC/musl toolchain, build Linux, toybox, and an initramfs.

```
# ./scripts/01-toolchain.sh
# ./scripts/02-linux.sh
# ./scripts/03-toybox.sh
# ./scripts/04-initramfs.sh
```

Exit the build container and run in QEMU.

```
$ ./qemu.sh
```

Press `ctrl+a`, `c`, `q`, `enter` to quit QEMU.

## Development

### Reconfiguring Linux

```
# make menuconfig -j8 ARCH=x86_64 CROSS_COMPILE=../x86_64-linux-musl-cross/bin/x86_64-linux-musl-
# cp ./.config ../../config/linux.config
```

### Reconfiguring Toybox

```
# make menuconfig -j8 ARCH=x86_64 CROSS_COMPILE=../x86_64-linux-musl-cross/bin/x86_64-linux-musl-
# cp ./.config ../../config/toybox.config
```