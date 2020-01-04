#!/bin/sh

current_ws=$(~/.local/bin/scripts/get_current_ws.sh)

if [ $current_ws == 22: ] 
	then i3-msg workspace 20:
else 
	i3-msg workspace next
fi
