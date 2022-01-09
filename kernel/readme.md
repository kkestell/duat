# Duat

## Kernel

```
$ docker build --tag=duat-kernel .
$ docker run -it --rm --mount type=bind,source="$(pwd)",target=/home/duat duat-kernel make -j8
```