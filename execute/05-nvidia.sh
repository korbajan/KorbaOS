#!/bin/bash
# Installs the NVIDIA driver branch that supports the GPU actually present.
# The branch comes from NVIDIA's own supported-GPU list (current vs. legacy sections), not a guess.
# usage: ./05-nvidia.sh [--dry-run]   (--dry-run detects and prints the plan, installs nothing; otherwise asks for sudo)
set -euo pipefail

die() { echo "error: $*" >&2; exit 1; }

DRY=0; [[ ${1:-} == --dry-run ]] && DRY=1
do_install() { if ((DRY)); then echo "[dry-run] pacman -S --needed $*"; else pacman -S --needed "$@"; fi; }

# PCI ids (e.g. 1d10) of every NVIDIA display/3D controller
mapfile -t ids < <(lspci -Dn -d 10de: | awk '$2 ~ /^03(00|02):/ {split($3, a, ":"); print toupper(a[2])}')
((${#ids[@]})) || die "no NVIDIA GPU found"

# newest official driver version, whose supported-GPU page also lists the legacy branches
version=$(pacman -Si nvidia-utils | awk '/^Version/{print $3}' | sed 's/-.*//')
page=$(curl -fsSL --max-time 30 "https://download.nvidia.com/XFree86/Linux-x86_64/$version/README/supportedchips.html" |
  sed 's/<[^>]*>/ /g; s/&nbsp;/ /g' | tr -s ' ') || die "cannot fetch NVIDIA supported-GPU list for $version"

branch_of() {
  awk -v id="$1" '
    /Below are the legacy GPUs/ { branch = "legacy?" }
    /^ ?The [0-9]+\.[0-9x.]+/   { match($0, /[0-9]+\.[0-9x.]+/); branch = substr($0, RSTART, RLENGTH) }
    BEGIN { branch = "current" }
    toupper($0) ~ "^ ?" id " ?$" { print branch; exit }
  ' <<< "$page"
}

branch=""
for id in "${ids[@]}"; do
  b=$(branch_of "$id")
  [[ -n $b ]] || die "GPU 10de:$id is not in NVIDIA's supported list for $version"
  echo "GPU 10de:$id -> $b"
  [[ -z $branch || $branch == "$b" ]] || die "GPUs need different driver branches ($branch vs $b)"
  branch=$b
done

case $branch in
  current) pkgs=(nvidia-open-dkms nvidia-utils); lib32=lib32-nvidia-utils; others=(nvidia-580xx-utils) ;;
  580.xx)  pkgs=(nvidia-580xx-dkms nvidia-580xx-utils); lib32=lib32-nvidia-580xx-utils; others=(nvidia-utils) ;;
  *)       die "driver branch $branch is not handled; see https://wiki.archlinux.org/title/NVIDIA" ;;
esac

if [[ $branch == 580.xx ]] && ! grep -q '^\[chaotic-aur\]' /etc/pacman.conf; then
  die "nvidia-580xx comes from Chaotic AUR; run 01-chaotic-aur.sh first"
fi

installed=$(pacman -Qq)  # exact names: nvidia-580xx-utils also *provides* nvidia-utils
for p in "${others[@]}"; do
  grep -qx "$p" <<< "$installed" && die "$p (another driver branch) is installed; remove it before installing $branch"
done

# DKMS needs headers for each installed kernel
for k in linux linux-lts linux-zen linux-hardened; do
  grep -qx "$k" <<< "$installed" && pkgs+=("$k-headers")
done
grep -q '^\[multilib\]' /etc/pacman.conf && pkgs+=("$lib32")
# hybrid laptop: the other GPU renders the desktop, NVIDIA is for offload
lspci -Dn | awk '$2 ~ /^03(00|02):/ && $3 !~ /^10de:/ {f=1} END {exit !f}' && pkgs+=(nvidia-prime)

echo "branch: $branch"
((EUID == 0 || DRY)) || exec sudo "$0" "$@"
do_install "${pkgs[@]}"

# double check: the installed branch's own documentation must list this GPU
if ((! DRY)) && [[ $branch == 580.xx ]]; then
  for id in "${ids[@]}"; do
    grep -qi ">$id<" /usr/share/doc/nvidia/html/supportedchips.html || die "installed 580xx driver does not list 10de:$id"
  done
  echo "ok: installed driver lists the GPU"
fi
