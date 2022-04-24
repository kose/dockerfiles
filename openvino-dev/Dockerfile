## -*- mode:dockerfile -*-

FROM ubuntu:20.04
# FROM ubuntu:21.10

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
    python3-pip \
    python3

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1

RUN pip install tensorflow openvino-dev

###############

USER ${USER}
SHELL ["/bin/bash", "-c"]

## end
