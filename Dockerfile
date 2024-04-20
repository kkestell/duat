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

  autoconf \
  automake \
  libtool \
  pkg-config \
  gettext \
  autopoint \
  texinfo \

  libfreetype6-dev \
  libfontconfig1-dev \
  libglib2.0-dev \
  libexpat1-dev \
  libpng-dev \

  && rm -rf /var/lib/apt/lists/*
WORKDIR /duat
ENV ARCH=x86_64
