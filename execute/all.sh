#!/bin/bash
# Runs the numbered category scripts in order.
# usage: ./all.sh [-l] [name-or-prefix ...]
#   no arguments  run everything
#   -l            list the categories and exit
#   names         run only those, e.g. `./all.sh 00 01 dev` (still in numeric order)
# packettracer.sh is never run from here: it needs a file downloaded by hand.
#
# Dual-mode: works both as root (arch-chroot) and as a normal user (first boot).
#   Root skips AUR packages (paru refuses root); re-run as user after first boot
#   to pick up the AUR packages.
#   When running as root with 24-containers-virtualization.sh, set INSTALL_USER:
#     INSTALL_USER=alice bash all.sh
set -euo pipefail
cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

# Export so sub-scripts (e.g. 24-containers-virtualization.sh) inherit it.
export INSTALL_USER="${INSTALL_USER:-}"

scripts=([0-9][0-9]-*.sh)
if [[ ${1:-} == -l ]]; then printf '%s\n' "${scripts[@]}"; exit; fi

for s in "${scripts[@]}"; do
  if (($#)); then
    run=0
    for want in "$@"; do [[ $s == *"$want"* ]] && run=1; done
    ((run)) || continue
  fi
  printf '\n==> %s\n' "$s"
  ./"$s"
done
