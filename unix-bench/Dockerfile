## -*- mode:dockerfile -*-

FROM ubuntu:21.10

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
# gcc
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential

USER ${USER}
SHELL ["/bin/bash", "-c"]

## end
