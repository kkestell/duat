FROM ubuntu:21.10
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
  software-properties-common \
  make \
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
  && rm -rf /var/lib/apt/lists/*
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
RUN useradd -ms /bin/bash ra
USER ra
WORKDIR /home/ra
COPY . ./