#!/bin/bash -i
shopt -s expand_aliases extglob xpg_echo

vboxes=$( vboxmanage list vms | awk '{print $1}' | cut -d " " -f 1 )
vm=$(echo -e "${vboxes[@]}" | dmenu -l 30 -p 'RUN VM:')

if [[ ${vm} == "" ]]
then
  exit
fi
vboxmanage startvm ${vm} 

