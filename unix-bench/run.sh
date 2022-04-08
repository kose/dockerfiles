#!/bin/sh

##
## check arg
##
if test "$1" = "aarch64"; then
    ARCH=arm64
    HOSTNAME=`hostname | sed 's/.local//'`-aarch64
fi

if test "$1" = "x86_64"; then
    ARCH=amd64
    HOSTNAME=`hostname | sed 's/.local//'`-x86_64
fi

if test "$ARCH" = ""; then
    echo "Usage: $0 [aarch64 | x86_64]"
    exit 0
fi

##
## set param
##

OS=UnixBench
IMAGE=$1:$OS

USER=guest
PASSWORD=password

##
do_command() {
    echo "\033[35m$1\033[m"; $1
}

##
## rebuild 
##
IMAGE_ID=`docker image ls -q $IMAGE`

if test "$1" = "--rebuild" -a "$IMAGE_ID" != ""; then
    do_command "docker rmi --force $IMAGE_ID"
fi

##
## build, if no image.
##
IMAGE_ID=`docker image ls -q $IMAGE`

if test "$IMAGE_ID" = ""; then

    do_command "docker buildx build --platform linux/$ARCH -t $IMAGE --build-arg USER=$USER --build-arg PASSWORD=$PASSWORD ."
fi

##
## Run
##
IMAGE_ID=`docker image ls -q $IMAGE`

if test "$IMAGE_ID" != ""; then
    do_command "docker run -it -u $USER -h $HOSTNAME -v $HOME/docker:/home/$USER $IMAGE"
fi

## end
