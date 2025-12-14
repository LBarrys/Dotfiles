#!/bin/bash

FOLDER=~/Pictures/Screenshot
mkdir -p "$FOLDER"

grim -g "$(slurp)" "$FOLDER/area-$(date +%F_%H-%M-%S).png"

if command -v notify-send &> /dev/null; then
    notify-send "Screenshot Taken" "and saved in Pictures/Screenshot"
fi

