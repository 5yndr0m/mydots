#!/bin/bash

# Check if the $wallpaper variable is provided
if [ -z "$1" ]; then
    echo "Error: Wallpaper path not provided."
    exit 1
fi

# Use the wallpaper path from the argument
wallpaper=$1

# Execute the commands
wal -i "$wallpaper" &&
pywalfox update &&
~/.config/waybar/scripts/launch.sh &&
python ~/.config/scripts/pywal2starship.py
