#!/bin/sh
numb=2
case $1 in
	"")
		pactl list sinks | grep '^[[:space:]]Volume:' | \
    		head -n $(( $SINK + $numb )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'
		;;
	*)
		sed -i "s/numb=$numb/numb=$1/" /home/$USER/.scripts/volume.sh && return 0
		;;
esac
