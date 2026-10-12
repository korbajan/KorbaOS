#!/bin/env bash

if [[ -n ${XDG_CURRENT_DESKTOP} ]]; then 
  desktop=$(echo $XDG_CURRENT_DESKTOP)  
else
  desktop=$(wmctrl -m | grep Name | awk '{print $2}')
fi

printf "${desktop}"