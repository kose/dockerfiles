#!/bin/bash

cd `dirname $0`
CDIR=`pwd`

if test "$1" == ""; then
    echo "Usage: $0 model-name"
    exit 0
else
    MODEL=$1
fi

mkdir -p FP16 FP32

##
## download models
##

if test -f $CDIR/FP16/$MODEL.xml; then
    exit 0
fi

cd /tmp

omz_downloader --name $MODEL
omz_converter --name $MODEL

# for FP in FP16 FP32; do
for FP in FP16; do
	
    if test -f */$MODEL/$FP/$MODEL.xml; then
	mv */$MODEL/$FP/$MODEL.bin $CDIR/$FP/
	mv */$MODEL/$FP/$MODEL.xml $CDIR/$FP/
    else
	echo "No $MODEL.xml"
    fi
done

# end
