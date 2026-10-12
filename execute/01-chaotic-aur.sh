#!/bin/bash
# Chaotic AUR: prebuilt AUR packages (https://aur.chaotic.cx)
# usage: ./01-chaotic-aur.sh [--check]   (--check only runs the read-only checks; otherwise asks for sudo)
set -euo pipefail

KEY_ID=3056513887B78AEB
KEY_FPR=EF925EA60F33D0CB85C44AD13056513887B78AEB
CDN=https://cdn-mirror.chaotic.cx/chaotic-aur
PACKAGES="paru"   # the rest of the Chaotic packages are installed by the category scripts

die() { echo "error: $*" >&2; exit 1; }

check_reachable() {
  for url in https://aur.chaotic.cx "$CDN/chaotic-keyring.pkg.tar.zst" "$CDN/chaotic-mirrorlist.pkg.tar.zst"; do
    curl -fsSIL --max-time 20 -o /dev/null "$url" || die "cannot reach $url"
  done
  echo "ok: aur.chaotic.cx and package CDN reachable"
}

key_fingerprint() {
  gpg --homedir /etc/pacman.d/gnupg --with-colons --fingerprint "$KEY_ID" 2>/dev/null | awk -F: '/^fpr/{print $10; exit}'
}

check_key() {
  [[ "$(key_fingerprint)" == "$KEY_FPR" ]] || die "key $KEY_ID is missing or its fingerprint is not $KEY_FPR"
  echo "ok: chaotic key fingerprint matches"
}

check_reachable
if [[ ${1:-} == --check ]]; then
  check_key
  exit
fi

[[ $EUID -eq 0 ]] || exec sudo "$0" "$@"

if [[ -z "$(key_fingerprint)" ]]; then
  pacman-key --recv-key "$KEY_ID" --keyserver keyserver.ubuntu.com
fi
check_key
pacman-key --lsign-key "$KEY_ID"

pacman -Q chaotic-keyring chaotic-mirrorlist &>/dev/null ||
  pacman -U --noconfirm "$CDN/chaotic-keyring.pkg.tar.zst" "$CDN/chaotic-mirrorlist.pkg.tar.zst"

grep -q '^\[chaotic-aur\]' /etc/pacman.conf ||
  printf '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n' >> /etc/pacman.conf

pacman -Syu
[[ -n "$(pacman -Sl chaotic-aur)" ]] || die "chaotic-aur repo is enabled but has no packages"
pacman -S --needed $PACKAGES
