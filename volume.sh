#!/bin/sh

if [ "$(amixer sget Master | grep off)" ]; then
	echo Mute
else 
		echo $(amixer sget Master | awk -F "[][]" '/%/ { print $2 }' | head -n1)
fi

