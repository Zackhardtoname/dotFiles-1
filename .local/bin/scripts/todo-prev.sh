#!/bin/sh

current_ws=$(~/.local/bin/scripts/get_current_ws.sh)

if [ $current_ws == 20: ] 
	then i3-msg workspace 22:
else 
	i3-msg workspace prev
fi
