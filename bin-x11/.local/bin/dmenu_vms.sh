#!/bin/bash
# Start a libvirt VM (qemu:///system) from dmenu and open its display.
export LIBVIRT_DEFAULT_URI=qemu:///system

vm=$(virsh list --all --name | sed '/^$/d' | dmenu -l 30 -p 'RUN VM:')

if [[ ${vm} == "" ]]
then
  exit
fi
[[ $(virsh domstate "${vm}") == "running" ]] || virsh start "${vm}"
virt-viewer --attach "${vm}" &
