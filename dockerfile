FROM ubuntu:21.10
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
  && rm -rf /var/lib/apt/lists/*
WORKDIR /duat
