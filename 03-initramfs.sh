#!/usr/bin/env bash

find . | cpio -oHnewc | gzip --best > ../initramfs.gz