#!/bin/bash

FOLDER=~/Pictures/Screenshot
mkdir -p "$FOLDER"
# Get active window geometry
geometry=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')

# Take screenshot
grim -g "$geometry" $FOLDER/screenshot$(date +%Y%m%d_%H%M%S).png

if command -v notify-send &> /dev/null; then
    notify-send "Screenshot Taken" "and saved in Pictures/Screenshot"
fi
