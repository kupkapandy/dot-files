#!/bin/bash

killall waybar

waybar &
hyprpaper
hyprctl reload
