#  environment: Ubuntu20.04, openvino, VNC
#
# docker build -t openvino \
#    --build-arg USER=usename \
#    --build-arg PASSWD=password \
#    .
#
#
# docker run -d -p 5901:5901 -p 2022:22 \
#       --name openvino openvino
#
FROM ubuntu:20.04

LABEL maintainer "KOSEKI Yoshinori <koseki.y@gmail.com>"

# RUN sed -i.bak -e "s%http://[^ ]\+%http://jp.archive.ubuntu.com/ubuntu/%g" /etc/apt/sources.list

ENV DEBIAN_FRONTEND=noninteractive

################
# timezone
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

################
# base

RUN apt update \
    && apt install -y --no-install-recommends \
    curl git wget unzip screen

################
# base: sshd

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

################
# Create User

ARG USER=guest
ARG PASSWD=password

RUN apt update \
    && apt install -y --no-install-recommends \
    git less sudo
RUN useradd -m ${USER}
RUN echo "${USER}:${PASSWD}" | chpasswd
RUN usermod -aG sudo ${USER}
RUN chsh -s /bin/bash ${USER}

################
## vencerver

RUN apt update \
    && apt install -y --no-install-recommends \
    ubuntu-desktop \
    gnome-panel \
    gnome-settings-daemon \
    gnome-system-monitor \
    metacity \
    nautilus \
    gnome-terminal \
    tightvncserver \
    xterm

################
# OpenVINO

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    cmake-curses-gui \
    libgtk2.0-dev \
    pkg-config \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libdc1394-22-dev \
    libusb-dev \
    scons \
    cython \
    python3-dev \
    python3-pip \
    python3-numpy \
    python3-scipy \
    python3-yaml

RUN rm -f /usr/bin/python ; ln -s /usr/bin/python3 /usr/bin/python

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

## end
