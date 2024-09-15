FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    make \
    build-essential \
    gcc-arm-none-eabi \
    gdb-multiarch \
    dfu-util \
    openocd \
    udev \
    usbutils \          
    libc6-dev \         
    libstdc++-arm-none-eabi-newlib \  
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN usermod -aG dialout,plugdev vscode

ENV DEBIAN_FRONTEND=dialog

RUN sudo service udev restart
