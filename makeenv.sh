#!/bin/sh

ENVFILE=.env

echo HOSTNAME=`hostname` > $ENVFILE
echo HOME=$HOME         >> $ENVFILE

# end
