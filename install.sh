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

DOT_FOLDERS=$(ls dotfiles)
for package in $(echo ${DOT_FOLDERS})
do
    printf "\n[+] Configuring :: $package\n"
    stow -v -t $TARGET -d dotfiles $package
done

printf "\n[*] Installing scripts\n"
stow -v -t $TARGET bin

reload="true"
