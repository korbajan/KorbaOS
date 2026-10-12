#!/bin/bash
# Hyprland compositor and its own tools. Needs 10-wayland.sh for the bar, launchers and portals.
# Run as a normal user (uses sudo).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac hyprland hypridle hyprlock hyprpaper hyprpicker hyprpolkitagent hyprshot xdg-desktop-portal-hyprland
