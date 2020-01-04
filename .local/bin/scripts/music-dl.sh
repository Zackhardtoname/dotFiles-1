#!/usr/bin/env bash 

youtube-dl -i --extract-audio --audio-format mp3 -o "~/Music/YouTube/%(title)s.%(ext)s" $1
