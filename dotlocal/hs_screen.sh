#!/bin/bash

# Folder to save screenshots
FOLDER=~/Pictures/Screenshot
mkdir -p "$FOLDER"

# Take full screen screenshot
grim "$FOLDER/screen-$(date +%F_%H-%M-%S).png"

if command -v notify-send &> /dev/null; then
    notify-send "Screenshot Taken" "and saved in Pictures/Screenshot"
fi
