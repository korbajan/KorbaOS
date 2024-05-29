#!/usr/bin/env sh

# https://github.com/jaagr/polybar/wiki

# Terminate already running polybars
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$($HOME/.bin/get_current_desktop)
# why $HOME/.bin is added to PATH by bashrc so it scripts from that location are not visible when i3 started
# if [[ -n ${XDG_CURRENT_DESKTOP} ]]; then 
#   desktop=$(echo $XDG_CURRENT_DESKTOP)  
# else
#   desktop=$(wmctrl -m | grep Name | awk '{print $2}')
# fi


case $desktop in

    i3|/usr/share/xsessions/i3)
    mainbar=korbabar-mainbar
    secondarybar=korbabar-secondarybar
    if type "xrandr" > /dev/null; then
      primary=$(xrandr --query | grep "primary" | cut -d" " -f1)
      if [[ -n $primary ]]; then 
        BAR=$mainbar MONITOR=$primary POLYBAR_TRAY_POSITION=right polybar --reload $mainbar -c ~/.config/polybar/config &> /dev/null &
      fi 
      for m in $(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1); do
        MONITOR=$m polybar --reload $secondarybar -c ~/.config/polybar/config &> /dev/null &
      done
      # for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      #   if [[ $(xrandr --query | grep "primary" | cut -d" " -f1) == $m ]]; then
      #     export POLYBAR_TRAY_POSITION=right
      #     barname=korbabar-mainbar
      #   else
      #     barname=korbabar-secondarybar
      #   fi
      #   MONITOR=$m polybar --reload $barname -c ~/.config/polybar/config &> /dev/null &
      # done
    else
      polybar --reload mainbar-i3 -c ~/.config/polybar/config &
    fi
    ;;

    openbox|/usr/share/xsessions/openbox)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        if [[ $(xrandr --query | grep "primary" | cut -d" " -f1) == $m ]]; then
          export POLYBAR_TRAY_POSITION=right
          barname=korbabar-ewmh-mainbar
        else
          barname=korbabar-ewmh-secondarybar
        fi
        MONITOR=$m polybar --reload $barname -c ~/.config/polybar/config &> /dev/null &
      done
    else
      polybar --reload mainbar-openbox -c ~/.config/polybar/config &
    fi
    ;;

    leftwm|/usr/share/xsessions/leftwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-leftwm -c ~/.config/polybar/config &
      done
    else
    polybar --reload mainbar-leftwm -c ~/.config/polybar/config &
    fi
    ;;

esac
