FROM silkeh/clang:13
RUN apt-get update && apt-get install -y \
  git \
  curl \
  xz-utils \
  flex \
  bison \
  bc \
  libelf-dev \
  cpio \
  ncurses-dev \
  && rm -rf /var/lib/apt/lists/*
RUN useradd -ms /bin/bash duat
USER duat
WORKDIR /home/duat
