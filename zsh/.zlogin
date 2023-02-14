#!/bin/zsh
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VNTR -eq 1 ]]; then
	exec startx
fi
