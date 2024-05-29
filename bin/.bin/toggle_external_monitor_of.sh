#!/bin/env bash

function ext_off {
  xrandr --output $1 --off
  xrandr --output eDP-1 --primary --auto
  xrandr --output $1 --off
  xrandr --output eDP-1 --primary --auto
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # main "$@"
  external_monitor=$(xrandr| grep " connected" | awk '{print $1}' | grep -v eDP-1)
  ext_off ${external_monitor}
  if [[ $1 == "on" ]] then
    xrandr --output ${external_monitor} --primary --auto --right-of eDP-1
  fi
fi
