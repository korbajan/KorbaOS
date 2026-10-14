# Shared helpers, sourced by the category scripts (not run directly).
#
# Supports two execution contexts:
#   root   – during arch-chroot / archinstall; pacman is called directly.
#            AUR (paru) is skipped: makepkg refuses to run as root.
#   user   – first-boot post-install; pacman goes through sudo, paru handles AUR.
#
# --needed is always passed so re-running a script (e.g. after arch-chroot AND
# post-boot) never reinstalls packages that are already present.

if [[ ${EUID:-0} -eq 0 ]]; then
  pac() { pacman -S --needed "$@"; }
  aur() {
    echo "info: skipping AUR package(s) [$*] – paru refuses to run as root; re-run as a normal user after first boot" >&2
  }
else
  pac() { sudo pacman -S --needed "$@"; }
  aur() {   # paru is installed by 01-chaotic-aur.sh
    command -v paru >/dev/null || { echo "error: paru not found; run 01-chaotic-aur.sh first" >&2; return 1; }
    paru -S --needed "$@"
  }
fi
