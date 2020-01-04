#!/usr/bin/env bash

mkdir -p images
gs -o images/page_%03d.png -sDEVICE=png16m -r500 $1.pdf
# gs -o images/page_%03d.png -sDEVICE=png16m -r500 coursework.pdf


# convert -density 300 -trim $1.pdf -quality 100 -flatten -sharpen 0x1.0 $1.jpg


