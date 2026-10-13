#!/bin/env bash
# Start/stop libvirt VMs (qemu:///system) from rofi.
export LIBVIRT_DEFAULT_URI=qemu:///system

show_vm_info()
{
  local vm=${1}
  alacritty --hold -e bash -c "virsh dominfo '${vm}'; virsh domifaddr '${vm}'; virsh domblklist '${vm}'"
}

vm=$(virsh list --all --name | sed '/^$/d' | rofi -dmenu -i -p 'Run VM:')
if [[ ${vm} == "" ]]
then
  exit
fi

if [[ $(virsh domstate "${vm}") == "running" ]]
then
  todo=$(echo -e "Info\nOpen\nShut Down\nPower Off\nReboot" | rofi -dmenu -i -p "${vm} is running")
else
  todo=$(echo -e "Info\nStart\nHeadless Start" | rofi -dmenu -i -p "${vm} is stopped")
fi

case ${todo} in
  "Shut Down")      virsh shutdown "${vm}" ;;
  "Power Off")      virsh destroy "${vm}" ;;
  "Reboot")         virsh reboot "${vm}" ;;
  "Headless Start") virsh start "${vm}" ;;
  "Start")          virsh start "${vm}" && virt-viewer --attach "${vm}" & ;;
  "Open")           virt-viewer --attach "${vm}" & ;;
  "Info")           show_vm_info "${vm}" ;;
esac
