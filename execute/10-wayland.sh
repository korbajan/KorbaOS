#!/bin/bash
# Wayland basics shared by any compositor: bar, launchers, notifications, screenshots, portals, Qt/GTK theming.
# Run as a normal user (uses sudo).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac waybar rofi wofi dunst grim cliphist wlsunset nwg-displays nwg-look \
  xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
  qt5ct qt6ct qt5-wayland kvantum kvantum-qt5
aur wlogout   # Chaotic AUR
