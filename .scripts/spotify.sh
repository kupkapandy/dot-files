#!/bin/bash

while true; do
  player_status=$(playerctl status 2>/dev/null)

  if [ -z "$(playerctl metadata album)" ]; then
    # No album metadata, so display basic artist and title
    if [ "$player_status" = "Playing" ]; then
      echo "$(playerctl metadata artist) - $(playerctl metadata title)"
    elif [ "$player_status" = "Paused" ]; then
      echo " $(playerctl metadata artist) - $(playerctl metadata title)"
    else
      echo ""
    fi
  else
    # Album metadata is present, add Spotify icon and color for playing
    if [ "$player_status" = "Playing" ]; then
      echo "<span color='#1db954'></span> $(playerctl metadata artist) - $(playerctl metadata title)"
    elif [ "$player_status" = "Paused" ]; then
      echo " $(playerctl metadata artist) - $(playerctl metadata title)"
    else
      echo ""
    fi
  fi

  sleep 1
done
