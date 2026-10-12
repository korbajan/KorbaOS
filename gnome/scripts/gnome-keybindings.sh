#!/usr/bin/env bash
# Back up / restore user-customised GNOME keybindings via dconf.
# Only non-default values are dumped, so a backup is exactly "my changes".
#
# Usage: gnome-keybindings.sh backup|restore [dir]
#   dir defaults to ../keybindings next to this script.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIR="$(realpath -m "${2:-$SCRIPT_DIR/../keybindings}")"

# file name -> dconf path
declare -A PATHS=(
    [wm]=/org/gnome/desktop/wm/keybindings/
    [shell]=/org/gnome/shell/keybindings/
    [mutter]=/org/gnome/mutter/keybindings/
    [mutter-wayland]=/org/gnome/mutter/wayland/keybindings/
    [media-keys]=/org/gnome/settings-daemon/plugins/media-keys/
)

backup() {
    mkdir -p "$DIR"
    for name in "${!PATHS[@]}"; do
        local file="$DIR/$name.ini"
        dconf dump "${PATHS[$name]}" > "$file"
        if [[ -s $file ]]; then
            echo "saved   $name -> $file"
        else
            rm -f "$file"
            echo "skipped $name (no custom bindings)"
        fi
    done
}

restore() {
    [[ -d $DIR ]] || { echo "no backup dir: $DIR" >&2; exit 1; }
    for name in "${!PATHS[@]}"; do
        local file="$DIR/$name.ini"
        [[ -f $file ]] || continue
        dconf load "${PATHS[$name]}" < "$file"
        echo "loaded  $name <- $file"
    done
}

case "${1:-}" in
    backup) backup ;;
    restore) restore ;;
    *) echo "usage: $(basename "$0") backup|restore [dir]" >&2; exit 2 ;;
esac
