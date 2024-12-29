#!/usr/bin/env bash

# Function to check pacman updates
check_pacman_updates() {
    pacman_updates=$(checkupdates 2>/dev/null | awk '{print "󰊠 " $1}')
}

# Function to check yay updates
check_yay_updates() {
    yay_updates=$(yay -Qum 2>/dev/null | awk '{print "󰚰 " $1}')
}

# Function to search and install packages
search_and_install() {
    local search_term="$1"
    # Search in both pacman and AUR
    local search_results=$(yay -Ss "$search_term" | sed 'N;s/\n//' | awk -F ' ' '{print $1}')

    if [ -n "$search_results" ]; then
        selected_pkg=$(echo "$search_results" | rofi -dmenu -i -p "Select package to install:")
        if [ -n "$selected_pkg" ]; then
            foot -e sh -c "yay -S $selected_pkg && echo 'Press any key to exit...' && read -n 1"
        fi
    else
        notify-send "No packages found" "No packages matching '$search_term' were found"
    fi
}

# Function to update selected packages
update_selected() {
    local selection="$1"
    case $selection in
        *"Update All"*)
            foot -e sh -c "yay -Syu && echo 'Press any key to exit...' && read -n 1"
            ;;
        "󰊠"*)
            package_name=$(echo "$selection" | cut -d ' ' -f2)
            foot -e sh -c "sudo pacman -S $package_name && echo 'Press any key to exit...' && read -n 1"
            ;;
        "󰚰"*)
            package_name=$(echo "$selection" | cut -d ' ' -f2)
            foot -e sh -c "yay -S $package_name && echo 'Press any key to exit...' && read -n 1"
            ;;
        *)
            # If input doesn't match any update option, treat it as a search term
            search_and_install "$selection"
            ;;
    esac
}

# Check for updates
notify-send "Checking for system updates..."
check_pacman_updates
check_yay_updates

# Prepare the menu content
menu_content=""
updates_available=false

if [ -n "$pacman_updates" ]; then
    menu_content+="$pacman_updates\n"
    updates_available=true
fi

if [ -n "$yay_updates" ]; then
    menu_content+="$yay_updates\n"
    updates_available=true
fi

# Add "Update All" option only if there are updates
if [ "$updates_available" = true ]; then
    menu_content="󱧕 Update All\n$menu_content"
else
    menu_content="No updates available\nEnter package name to search..."
fi

# Display updates in rofi
selected=$(echo -e "$menu_content" | rofi -dmenu -i -p "Updates / Search:")

# Exit if nothing selected
if [ -z "$selected" ]; then
    exit 0
fi

# If "No updates available" was selected, exit
if [ "$selected" = "No updates available" ]; then
    exit 0
fi

# Update or search based on selection
update_selected "$selected"
