#!/bin/bash

killall waybar
killall hyprpaper

hyprpaper &
hyprctl reload
