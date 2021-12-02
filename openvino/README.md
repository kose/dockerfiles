# OpenVINO(arm_plugin) on Ubuntu20.04, VNC, aarch64 (M1 MacBook, Docker)

# Introduction

Working [OpenVINO](https://github.com/openvinotoolkit) on arm_plugin

# Environment

- M1 MacBook Air (2020)
- M1 PRO MacBook PRO (2021)

# Build

```
docker build -t mediapipe . --build-arg USER=username --build-arg PASSWD=password
```

# Run

```
docker run -d -p 5901:5901 -p 2022:22 -v usr-local:/usr/local -v $HOME/docker:/home/username --name mediapipe mediapipe
```

# Host Machine: run mjpeg over http

UVC camera connect Host machine, with mjpeg over http server.

```
git clone https://github.com/meska/mjpeg_stream_webcam.git
cd mjpeg_stream_webcam
python mjpegsw.py --port 8001
```

SSH login to docker machine, with port foward.

```
ssh -R 8001:localhost:8001 localhost
```

# start vnc server

```
exec from .bash_profile

bin/start-vncserver.sh
```

# VNC Viewer

on macOS Finder

```
passwd: vncpasswd
```

<img src="images/vnc-login.png" width=400>

# OpenVINO, arm_plugin(openvino_contrib)


# Reference

- TBD
