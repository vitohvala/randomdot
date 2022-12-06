#!/bin/sh
#amixer sget Master | awk -F "[][]" '/%/ { print $2 }' | head -n1
#
vol=$(amixer sget Master | awk -F "[][]" '/%/ { print $2 }' | head -n1)

if [ "$(amixer sget Master | grep off)" ]; then
	printf Mute
else 
	amixer sget Master | awk -F "[][]" '/%/ { print $2 }' | head -n1
fi

