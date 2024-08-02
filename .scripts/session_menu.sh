#!/usr/bin/env bash

# Rofi dmenu mode, -i make search case-insensitive, -l is the number of line
rofi_command() {
  rofi -dmenu -i -config "~/.config/rofi/power.rasi"
}

shutdown="󰐥 | Shutdown"
reboot=" | Restart"
lock=" | Lock"
suspend="󰤄 | Suspend"
logout="󰍂 | Logout"

options="$shutdown\n$reboot\n$logout\n$suspend\n$lock"

chosen="$(echo -e "$options" | rofi_command)"
echo "$chosen"
case $chosen in
"$shutdown")
  sleep 1 && systemctl poweroff
  ;;
"$reboot")
  sleep 1 && systemctl reboot
  ;;
"$lock")
  # Install swaylock-effects for better configuration
  sleep 1 && hyprlock
  ;;
"$suspend")
  sleep 1 && mpc -q pause
  sleep 1 && amixer set Master mute
  sleep 1 && systemctl suspend
  ;;
"$logout")
  # For Hyprland, Use Command for your WM/DE
  if [[ "$DESKTOP_SESSION" == "hyprland" ]]; then
    sleep 1 && hyprctl dispatch exit

  elif [[ "$DESKTOP_SESSION" == "sway" ]]; then
    sleep 1 && swaymsg exit

  elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
    sleep 1 && i3-msg exit
  # if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
  # 	openbox --exit
  # elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
  # 	bspc quit
  # elif [[ "$DESKTOP_SESSION" == "xfce" ]]; then
  # 	killall xfce4-session
  fi
  ;;
esac
