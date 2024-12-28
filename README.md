# Mydots

A comprehensive dotfile collection for system configuration and customization.

## Table of Contents
1. [Firefox Configuration](#firefox-configuration)
2. [System Setup](#system-setup)
3. [Package Installation](#package-installation)
4. [Additional Configuration](#additional-configuration)

## Firefox Configuration

### Prerequisites
Before proceeding with the Firefox setup, complete these steps in order:

1. Configure Firefox UI:
   - Adjust the toolbar layout (remove spaces)
   - Hide the bookmarks bar

2. Installation Steps:
   - Place configuration folder in `.mozilla/firefox/xxxxxxxx.default-release`
   - Install [PixelPage](https://github.com/Trzynastek/PixelPage2.0) extension
   - Install [simpleMenuWizard](https://github.com/stonecrusher/simpleMenuWizard)
   - Restart Firefox

## System Setup

### Base Development Tools
```bash
# Install essential development packages
sudo pacman -S --needed base-devel git
```

### AUR Helper (yay) Installation
```bash
# Clone and install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
```

### Core Utilities
```bash
# Install fundamental utilities
sudo pacman -S bat fastfetch thefuck fzf lazygit
```

### System Maintenance
```bash
# Install system maintenance tools
yay -S tlrc-bin cava
```

### Development Environment
```bash
# Install Zed editor
curl -f https://zed.dev/install.sh | sh
```

## Package Installation

### Theme and Visual Components
```bash
yay -S tela-circle-icon-theme vimix-cursors gtk-engine-murrine orchis-theme \
    python-pywalfox libnotify ttf-firacoda ttf-firacode-nerd
```

### Hyprland and Related Packages
```bash
yay -S hyprcursor-git hyprutils-git hyprlang-git hyprland-qtutils \
    hyprsysteminfo-git hyprlock-git hypridle-git hyprpicker-git \
    hyprpaper-git hyprpolkitagent-git xdg-desktop-portal-hyprland-git \
    hyprland-git
```

### System Utilities
```bash
yay -S network-manager-applet overskride blueberry-wayland \
    nautilus-open-any-terminal nautilus-admin nautilus-image-converter \
    cliphist rofi-wayland waypaper atuin python-pywal16 grimblast \
    tesseract ttf-material-symbols-variable-git wlogout sharik-bin
```

### Development Tools and Dependencies
```bash
yay -S qt5ct qt6ct gtk-layer-shell gtk3 pango cairo gdk-pixbuf2 \
    glib2 mongodb-bin mongodb-compass swi-prolog gtk4 \
    gtk4-layer-shell libadwaita brightnessctl
```

### Wayland Environment
```bash
sudo pacman -S qt5-wayland qt6-wayland libnotify-bin grim slurp \
    pipewire wireplumber dunst nwg-look foot foot-terminfo fish \
    pkgfile vlc cmake meson cpio pkg-config jq pavucontrol
```

### Input Methods and Additional Software
```bash
sudo pacman -S manjaro-asian-input-support-fcitx5 fcitx5-sayura \
    fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool fcitx5-lua \
    fcitx5-material-color easyeffects waybar android-tools cdrtools \
    p7zip libblockdev-smart smartmontools languagetool jdk22-openjdk
```

### Hyprland Plugin Setup
```bash
# Enable Hyprland plugins
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprbars
hyprpm enable hyprexpo
```

## Additional Configuration

### Important Notes
- Install all dependencies before beginning the setup process
- System restart required after installing Wayland components
- Verify all installations before proceeding with configuration
- Keep system updated during the installation process

### Troubleshooting
If you encounter issues:
1. Check system logs for errors
2. Verify all dependencies are properly installed
3. Ensure correct version compatibility between packages
4. Review configuration files for syntax errors
