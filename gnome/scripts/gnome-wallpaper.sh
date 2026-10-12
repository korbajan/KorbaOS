#!/usr/bin/env bash
# Point GNOME's wallpaper (light and dark) at the one shared with hyprpaper.
# Usage: gnome-wallpaper.sh [file]   default: ~/Pictures/Wallpapers/wall.png

set -euo pipefail

FILE="$(realpath -s "${1:-$HOME/Pictures/Wallpapers/wall.png}")"
[[ -f $FILE ]] || { echo "no such file: $FILE" >&2; exit 1; }

for key in picture-uri picture-uri-dark; do
    gsettings set org.gnome.desktop.background "$key" "file://$FILE"
done
