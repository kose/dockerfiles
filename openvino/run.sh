#!/bin/sh

# ARCH=x86_64
ARCH=aarch64

OS=ubuntu21.10
IMAGE=$ARCH:$OS
HOSTNAME=docker
USER=your-user-name

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

    /bin/echo -n "password: "
    read PASSWORD

    if test "$ARCH" = "x86_64"; then
	do_command "docker build -t $IMAGE --build-arg USER=$USER --build-arg PASSWORD=$PASSWORD ."
    else
	do_command "docker buildx build --platform linux/arm64 -t $IMAGE --build-arg USER=$USER --build-arg PASSWORD=$PASSWORD ."
    fi
fi

##
## Run
##
IMAGE_ID=`docker image ls -q $IMAGE`

if test "$IMAGE_ID" != ""; then
    do_command "docker run -it -u $USER -h $HOSTNAME -v opt-intel:/opt/intel -v $HOME/docker:/home/$USER $IMAGE"
fi

## end
