FROM debian:bullseye
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
  software-properties-common \
  build-essential \
  git \
  curl \
  xz-utils \
  flex \
  bison \
  bc \
  libelf-dev \
  cpio \
  ncurses-dev \
  wget \
  libssl-dev \
  rsync \
  xorriso \
  grub-common \
  grub-pc-bin \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /duat
ENV ARCH=x86_64
