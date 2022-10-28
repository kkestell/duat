# Duat

> Slowly goes the Boat of Ra, passing through the Duat, to regions of thick darkness, of horror and dismay, where the dead have their habitations, and Apep lies in wait for the coming of Ra. Thus passes the first hour of the night, and the second hour is at hand.

## About

* Linux
* Musl
* Busybox

## Getting Started

Create and SSH into the build container:

```
$ ./docker.sh
```

Install GCC/musl toolchain, build Linux, Busybox, an initramfs, and generate a bootable ISO.

```
# ./scripts/build.sh
```

Exit the build container and run in QEMU.

```
$ ARCH=x86_64 ./qemu.sh
```

## Development

### Reconfiguring Linux

```
# cd deps/linux
# make menuconfig -j8 ARCH=x86_64 CROSS_COMPILE=../x86_64-linux-musl-cross/bin/x86_64-linux-musl-
# cp ./.config ../../config/$ARCH/linux.config
```

### Reconfiguring Busybox

```
# cd deps/busybox
# make menuconfig -j8 ARCH=x86_64 CROSS_COMPILE=../x86_64-linux-musl-cross/bin/x86_64-linux-musl-
# cp ./.config ../../config/$ARCH/busybox.config
```