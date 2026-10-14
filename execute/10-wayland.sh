#!/bin/bash
# Wayland basics shared by any compositor: bar, launchers, notifications, screenshots, portals, Qt/GTK theming.
# Can be run as root (arch-chroot) or as a normal user (first boot, uses sudo).
# Root: installs official-repo packages only. User: also installs AUR package (wlogout).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac waybar rofi wofi dunst grim cliphist wlsunset nwg-displays nwg-look \
  xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
  qt5ct qt6ct qt5-wayland qt6-wayland kvantum kvantum-qt5
aur wlogout   # Chaotic AUR
