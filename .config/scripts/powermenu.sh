#!/usr/bin/env bash

# Function to show confirmation dialog
confirm() {
    ans=$(echo -e "No\nYes" | rofi -dmenu -i -p "$1")
    if [[ $ans == "Yes" ]]; then
        return 0
    else
        return 1
    fi
}

# Define power options with icons
options="󰍃 Lock
󰤄 Sleep
󰑓 Reboot
⏻ Shutdown
󰿅 Logout"

# Show the power menu and get user selection
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -l 5)

# Handle the user selection
case $chosen in
    "󰍃 Lock")
        hyprlock
        ;;
    "󰤄 Sleep")
        confirm "Are you sure you want to sleep?" && systemctl suspend-then-hibernate
        ;;
    "󰑓 Reboot")
        confirm "Are you sure you want to reboot?" && systemctl reboot
        ;;
    "⏻ Shutdown")
        confirm "Are you sure you want to shutdown?" && systemctl poweroff
        ;;
    "󰿅 Logout")
        confirm "Are you sure you want to logout?" && hyprctl dispatch exit
        ;;
esac
