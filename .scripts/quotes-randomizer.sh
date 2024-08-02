#!/bin/bash

# Define the directory containing the quotes wallpapers
directory=~/Quotes
directory1=~/Quotes.1

if [ -d "$directory" ]; then
    # Pick a random background from the directory
    random_background=$(find "$directory" -type f | shuf -n 1)
    random_background1=$(find "$directory1" -type f | shuf -n 1)

    # Ensure the variable is not empty
    if [ -n "$random_background" ]; then
        echo "Selected background: $random_background"
        echo "Selected background: $random_background1"

        # Unload all wallpapers, preload the selected one, and set it as wallpaper for the monitor
        hyprctl hyprpaper unload all
        hyprctl hyprpaper preload "$random_background"
        hyprctl hyprpaper preload "$random_background1"
        hyprctl hyprpaper wallpaper "DP-1,$random_background"
        hyprctl hyprpaper wallpaper "HDMI-A-1,$random_background1"
    else
        echo "No files found in the directory."
    fi
else
    echo "Directory $directory does not exist."
fi


