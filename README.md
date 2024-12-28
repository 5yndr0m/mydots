
```markdown
# mydots
Dotfile collection for later use.

## Firefox Chrome Files

1. **Before placing the folder, change these things in Firefox**:
   - Change the toolbar layout (remove the spaces).
   - Hide the bookmarks bar.

2. **Place the folder inside the `.mozilla/firefox/xxxxxxxx.default-release` folder**.

3. **Add the [PixelPage](https://github.com/Trzynastek/PixelPage2.0) extension**.

4. **Restart Firefox**.

5. **Using [simpleMenuWizard](https://github.com/stonecrusher/simpleMenuWizard) by [@stonecrusher](https://github.com/stonecrusher)**.

---

## Console Setup

### 1. Install Base Development Tools:
```bash
sudo pacman -S --needed base-devel git
```

### 2. Clone `yay` Repository:
```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
```

### 3. Install Common Utilities:
```bash
sudo pacman -S bat fastfetch thefuck fzf lazygit
```

### 4. Install TLRC (The Linux Repo Cleaner):
```bash
yay -S tlrc-bin cava
```

### 5. Install ZED:
```bash
curl -f https://zed.dev/install.sh | sh
```

### 6. Install Additional Utilities and Dependencies:
```bash
yay -S tela-circle-icon-theme vimix-cursors gtk-engine-murrine orchis-theme python-pywalfox libnotify ttf-firacoda ttf-firacode-nerd
hyprcursor-git hyprutils-git hyprlang-git hyprland-qtutils hyprsysteminfo-git hyprlock-git hypridle-git
hyprpicker-git network-manager-applet overskride blueberry-wayland nautilus-open-any-terminal nautilus-admin nautilus-image-converter
cliphist rofi-wayland waypaper hyprpaper-git hyprpolkitagent-git xdg-desktop-portal-hyprland-git hyprland-git
atuin tlrc-bin cava python-pywal16 hyprlang-git hyprutils-git grimblast tesseract ttf-material-symbols-variable-git
wlogout sharik-bin qt5ct qt6ct gtk-layer-shell gtk3 pango cairo gdk-pixbuf2 glib2 mongodb-bin
mongodb-compass swi-prolog gtk4 gtk4-layer-shell libadwaita brightnessctl
```

### 7. Enable Hyprland Plugins:
```bash
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprbars
hyprpm enable hyprexpo
```

### 8. Install Wayland and Related Utilities:
```bash
sudo pacman -S qt5-wayland qt6-wayland libnotify-bin grim slurp pipewire wireplumber dunst nwg-look
foot foot-terminfo fish pkgfile vlc cmake meson cpio pkg-config jq pavucontrol manjaro-asian-input-support-fcitx5 fcitx5-sayura
fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool fcitx5-lua fcitx5-material-color easyeffects waybar
android-tools cdrtools p7zip libblockdev-smart smartmontools languagetool jdk22-openjdk
```

---

## Additional Notes
- Ensure to install all dependencies correctly before starting the setup.
- Restart your system or session to apply some changes, especially for Wayland and related configurations.
```

You can copy and paste this entire content into a `.md` file, and it should display correctly with all the formatting when viewed in any Markdown editor or viewer.
