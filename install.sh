#!/bin/bash

finally() {
  if [[ ${reload} == "true" ]]
  then
    printf "\n[+] Reloading shell...\n"
    exec $SHELL -l
  fi
}

reload="false"
trap finally EXIT
TARGET=${HOME}

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# keep ~/Pictures/Wallpapers a real dir so stow links files, not the whole folder
mkdir -p "$TARGET/Pictures/Wallpapers"

DOT_FOLDERS=$(ls dotfiles)
for package in $(echo ${DOT_FOLDERS})
do
    printf "\n[+] Configuring :: $package\n"
    stow -v -t $TARGET -d dotfiles $package
done

printf "\n[*] Installing scripts\n"
stow -v -t $TARGET bin

# X11-era helpers (xrandr/dmenu): only where Xorg is installed
if command -v Xorg &> /dev/null
then
    printf "\n[*] Xorg found, installing X11 scripts\n"
    stow -v -t $TARGET bin-x11
fi

reload="true"
