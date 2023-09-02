## -*- mode:dockerfile -*-

FROM ubuntu:22.04

# RUN sed -i.bak -e "s%http://[^ ]\+%http://jp.archive.ubuntu.com/ubuntu/%g" /etc/apt/sources.list

################
# timezone
RUN apt update \
    && apt install -y --no-install-recommends \
    tzdata

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

################
# base
RUN apt update \
    && apt install -y --no-install-recommends \
    sudo git git-lfs curl wget unzip screen less net-tools

################
# Create User

ARG UID=1000
ARG USER=guest
ARG PASSWORD=password
RUN useradd -m --uid ${UID} --groups sudo ${USER} \
  && echo ${USER}:${PASSWORD} | chpasswd

################
# OpenVINO

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    cmake-curses-gui \
    libssl-dev \
    ca-certificates \
    libboost-regex-dev \
    libgtk2.0-dev \
    pkg-config \
    unzip \
    automake \
    libtool \
    autoconf \
    shellcheck \
    patchelf \
    cython3 \
    python3-pip \
    python3-enchant \
    python3-setuptools \
    python3-dev \
    python3-numpy \
    python3-scipy \
    python3-yaml \
    libcairo2-dev \
    libpango1.0-dev \
    libglib2.0-dev \
    libgtk2.0-dev \
    libswscale-dev \
    libavcodec-dev \
    libavformat-dev \
    libgstreamer1.0-0 \
    gstreamer1.0-plugins-base \
    libusb-1.0-0-dev \
    libopenblas-dev \
    libpng-dev \
    scons

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1

# ################
# # gcc 9
# 
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     gcc-9 g++-9
# 
# RUN sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9
# RUN sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9

#####

USER ${USER}
SHELL ["/bin/bash", "-c"]

## end
