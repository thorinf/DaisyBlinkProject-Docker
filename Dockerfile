FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    make \
    build-essential \
    gcc-arm-none-eabi \
    gdb-multiarch \
    usbutils \
    dfu-util \
    openocd \
    udev \
    libc6-dev \         
    libstdc++-arm-none-eabi-newlib \  
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
