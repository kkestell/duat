# Duat

## User

```
$ docker build --tag=duat-user .
$ docker run -it --rm --mount type=bind,source="$(pwd)",target=/home/duat duat-user make -j8
```