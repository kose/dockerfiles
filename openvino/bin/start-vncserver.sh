#!/bin/sh

if test "$1" = "--restart"; then
    sudo rm -r /tmp/.X1*
    PID=`ps -x | grep [X]tightvnc | awk '{print $1}'`

    echo "PID: $PID"
    
    if test "$PID" != ""; then
	kill $PID
    fi
fi

## start vncserver
if test -x /usr/bin/tightvncserver; then

    ALIVE=false

    ps x | grep [X]tightvnc > /dev/null && ALIVE=true

    if test $ALIVE = true; then

	echo "Runnung: tightvncserver"
    else
	
	/usr/bin/vncserver :1 -geometry 1920x1080 -depth 24 &
    fi
fi

# end
