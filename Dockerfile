FROM debian:12

RUN apt update && apt install -y \
    curl \
    git \
    python3 \
    build-essential \
    pkg-config \
    cmake \
    python3-pil \
    libusb-1.0-0-dev \
    libsdl2-dev \
    libudisks2-dev \
    libglib2.0-dev \
    libpng-dev \
    libncurses-dev \
    libmpfr-dev \
    libmpc-dev \
    libgmp-dev \
    libppl-dev \
    flex \
    texinfo \
    dialog \
    sudo \
    python3-pip-whl \
    python3-setuptools-whl \
    python3-venv \
    python3.11-venv

WORKDIR /casio

RUN git clone --depth=1 "https://git.planet-casio.com/Lephenixnoir/GiteaPC" /casio/giteapc
RUN cd /casio/giteapc && python3 giteapc.py install -y Lephenixnoir/GiteaPC

ENV PATH="$PATH:/root/.local/bin"

RUN giteapc install -y Lephenixnoir/fxsdk:noudisks2 Lephenixnoir/sh-elf-binutils Lephenixnoir/sh-elf-gcc Lephenixnoir/sh-elf-gdb
RUN giteapc install -y Lephenixnoir/OpenLibm Vhex-Kernel-Core/fxlibc
RUN giteapc install -y Lephenixnoir/sh-elf-gcc
RUN giteapc install -y Lephenixnoir/gint Lephenixnoir/libprof
RUN giteapc install -y cake/cahute@0.6
