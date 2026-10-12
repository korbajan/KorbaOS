#!/bin/bash
# Desktop: GNOME, Hyprland and friends, fonts.
# Run as a normal user (uses sudo).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

# gnome group members, minus the interactive group prompt
pac $(pacman -Sgq gnome) gnome-tweaks dconf-editor extension-manager
pac hyprland hypridle hyprlock hyprpaper hyprpicker hyprpolkitagent hyprshot waybar rofi wofi dunst grim cliphist wlsunset \
  nwg-displays nwg-look xdg-desktop-portal-gtk xdg-desktop-portal-hyprland xdg-desktop-portal-kde xdg-desktop-portal-wlr \
  qt5ct qt6ct qt5-wayland kvantum kvantum-qt5 imv thunar thunar-archive-plugin thunar-volman ristretto xarchiver
aur wlogout   # Chaotic AUR

# fonts
pac noto-fonts otf-font-awesome ttf-dejavu ttf-jetbrains-mono ttf-jetbrains-mono-nerd
