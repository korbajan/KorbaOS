# Shared helpers, sourced by the category scripts (not run directly).
# Category scripts run as a normal user: pacman goes through sudo, paru refuses to run as root.
pac() { sudo pacman -S --needed "$@"; }
aur() {   # paru is installed by 01-chaotic-aur.sh
  command -v paru >/dev/null || { echo "error: paru not found; run 01-chaotic-aur.sh first" >&2; return 1; }
  paru -S --needed "$@"
}
