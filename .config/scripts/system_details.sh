#!/usr/bin/env bash

# Function to get current volume
get_volume() {
    volume=$(pamixer --get-volume)
    muted=$(pamixer --get-mute)
    if [[ "$muted" == "true" ]]; then
        echo "󰝟 Volume: Muted"
    else
        echo "󰕾 Volume: $volume%"
    fi
}

# Function to get brightness
get_brightness() {
    if command -v brightnessctl &> /dev/null; then
        brightness=$(brightnessctl g)
        max_brightness=$(brightnessctl m)
        percent=$((brightness * 100 / max_brightness))
        echo "󰃞 Brightness: $percent%"
    else
        echo "󰃞 Brightness: N/A"
    fi
}

# Function to get battery status
get_battery() {
    if [ -d "/sys/class/power_supply/BAT0" ]; then
        capacity=$(cat /sys/class/power_supply/BAT0/capacity)
        status=$(cat /sys/class/power_supply/BAT0/status)
        if [ "$status" = "Charging" ]; then
            echo "󰂄 Battery: $capacity% (Charging)"
        else
            echo "󰁹 Battery: $capacity%"
        fi
    else
        echo "󱉝 No Battery"
    fi
}

# Function to get WiFi status
get_wifi() {
    if command -v nmcli &> /dev/null; then
        wifi_name=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
        if [ -n "$wifi_name" ]; then
            echo "󰖩 WiFi: $wifi_name"
        else
            echo "󰖪 WiFi: Disconnected"
        fi
    else
        echo "󰖪 WiFi: N/A"
    fi
}

# Function to adjust volume
adjust_volume() {
    local action=$1
    case $action in
        "Increase")
            pamixer -u # Unmute first if muted
            pamixer -i 5
            ;;
        "Decrease")
            pamixer -u # Unmute first if muted
            pamixer -d 5
            ;;
        "Toggle Mute")
            pamixer -t
            ;;
    esac
    volume_menu # Return to main menu after action
}

# Function to adjust brightness
adjust_brightness() {
    local action=$1
    case $action in
        "Increase")
            brightnessctl set +5%
            ;;
        "Decrease")
            brightnessctl set 5%-
            ;;
    esac
    brightness_menu # Return to main menu after action
}

# Function to show volume control menu
volume_menu() {
    local muted=$(pamixer --get-mute)
    local volume=$(pamixer --get-volume)
    local mute_option

    if [[ "$muted" == "true" ]]; then
        mute_option="Unmute"
    else
        mute_option="Mute"
    fi

    local options="Increase\nDecrease\n$mute_option\nBack"
    local chosen=$(echo -e "$options" | rofi -dmenu -i -p "Volume: $volume%")

    case $chosen in
        "Increase") adjust_volume "Increase" ;;
        "Decrease") adjust_volume "Decrease" ;;
        "Mute"|"Unmute") adjust_volume "Toggle Mute" ;;
        "Back"|"") show_menu ;;
    esac
}

# Function to show brightness control menu
brightness_menu() {
    local brightness=$(brightnessctl g)
    local max_brightness=$(brightnessctl m)
    local percent=$((brightness * 100 / max_brightness))

    local options="Increase\nDecrease\nBack"
    local chosen=$(echo -e "$options" | rofi -dmenu -i -p "Brightness: $percent%")

    case $chosen in
        "Increase") adjust_brightness "Increase" ;;
        "Decrease") adjust_brightness "Decrease" ;;
        "Back"|"") show_menu ;;
    esac
}

# Main menu function
show_menu() {
    # Get system information
    volume=$(get_volume)
    brightness=$(get_brightness)
    battery=$(get_battery)
    wifi=$(get_wifi)
    current_time=$(date '+%H:%M')
    current_date=$(date '+%Y-%m-%d')

    # Create menu with basic system info
    options="󰥔 Time: $current_time\n󰃭 Date: $current_date\n$volume\n$brightness\n$battery\n$wifi"

    # Show menu and get selection
    chosen=$(echo -e "$options" | rofi -dmenu -i -p "System Info")

    # Handle selection
    case $chosen in
        *"Volume"*) volume_menu ;;
        *"Brightness"*) brightness_menu ;;
        *) exit 0 ;;
    esac
}

# Check for required commands
for cmd in rofi pamixer brightnessctl nmcli; do
    if ! command -v "$cmd" &> /dev/null; then
        notify-send "Missing dependency" "Please install $cmd"
        exit 1
    fi
done

# Start the menu
show_menu
