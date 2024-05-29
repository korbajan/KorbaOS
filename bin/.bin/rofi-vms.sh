#!/bin/env bash
declare -a vboxes

get_vboxes ()
{
  vboxes=$( vboxmanage list vms | awk '{print $1}' | sed 's/^"\(.*\)"$/\1/' | cut -d " " -f 1 ) 
}

show_vm_info()
{
  local vm=${1}
  alacritty --hold -e bash -c "vboxmanage showvminfo ${vm} --machinereadable | grep -E \"^name|GuestOSType|ostype|memory|cpus|Forwarding|CfgFile|SATA-0-0\""
}

get_vboxes

vm=$(echo -e "${vboxes[@]}" | rofi -dmenu -i -p 'Run VM:')
if [[ ${vm} == "" ]]
then
  exit
fi
vm_state=$(vboxmanage showvminfo ${vm} | grep State | awk '{print $2}')

if [[ ${vm_state} == "running" ]]
then
  todo=$(echo -e "Info\nPower Off\nReboot" | rofi -dmenu -i -p "${vm} is running")
else
  todo=$(echo -e "Info\nStart\nHeadless Start" | rofi -dmenu -i -p "${vm} is running")
fi

if [[ ${todo} == "" ]]
then 
  exit
fi

if [[ ${todo} == "Power Off" ]]
then
  vboxmanage controlvm ${vm} poweroff
fi  

if [[ ${todo} == "Reboot" ]]
then
  vboxmanage controlvm ${vm} reboot
fi  

if [[ $todo == "Headless Start" ]]
then
  vboxmanage startvm ${vm} --type headless 
fi

if [[ $todo == "Start" ]]
then
  vboxmanage startvm ${vm} 
fi

if [[ $todo == "Info" ]]
then
  show_vm_info ${vm}
fi
