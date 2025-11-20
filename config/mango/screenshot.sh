#!/bin/bash
FILE=~/Pictures/Screenshots/$(date +%Y%m%d%H%M%S).png
grim -g "$(slurp)" "$FILE"
wl-copy < "$FILE"