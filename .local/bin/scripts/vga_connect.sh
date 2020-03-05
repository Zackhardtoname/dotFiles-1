#!/usr/bin/env bash

MONITOR_COUNT=$(xrandr | grep " connected " | wc -l)

notify-send "$MONITOR_COUNT"

# connect_command="xrandr --output DP2 --auto --above eDP1"
# disconnect_command="xrandr --auto"

if [ $MONITOR_COUNT -eq 2 ]; then
  notify-send "Two Monitors"
  # xrandr --output DP2 --auto --right-of eDP1
  # xrandr --output DP2 --above eDP1
  xrandr --auto
  xrandr --output DP2 --above eDP1 # --mode 1600x900
elif [ $MONITOR_COUNT -eq 1 ]; then
  notify-send "One Monitor"
  xrandr --auto
else 
  notify-send "Weird. Monitors: $MONITOR_COUNT"
fi

sleep .5

~/.config/polybar/launch.sh
pkill -9 -f wallpaper.sh
wallpaper.sh
