#!/usr/bin/env bash 


while true; do
  NUMMO=`xrandr -q | grep -c " connected"`

  if [ $NUMMO -eq "2" ]
  then
     nitrogen --head=0 --set-zoom-fill --random ~/Backgrounds
     nitrogen --head=1 --set-zoom-fill --random ~/Backgrounds
  else
     nitrogen --set-zoom-fill --random ~/Backgrounds
  fi
   
  sleep 10m
  done
