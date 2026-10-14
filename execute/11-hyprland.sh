#!/bin/bash
# Hyprland compositor and its own tools. Needs 10-wayland.sh for the bar, launchers and portals.
# Can be run as root (arch-chroot) or as a normal user (first boot, uses sudo).
# All packages are from official repos, so this script is fully usable as root.
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac hyprland hypridle hyprlock hyprpaper hyprpicker hyprpolkitagent hyprshot xdg-desktop-portal-hyprland
