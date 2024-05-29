#!/bin/env bash


function main {
    INTERNAL='LVDS|DP'
    EXTERNAL='HDMI|VGA'
    PREDEFINED_PRIMARY=''

    declare -a all_outputs
    readarray -t all_outputs < <(xrandr --query | egrep " connected|disconnected" | cut -d" " -f1)

    declare -a connected_monitors
    readarray -t connected_monitors < <(xrandr --query | grep " connected" | cut -d" " -f1)
    
    number_of_connected_monitors=${#connected_monitors[@]}
    
    if [[ ${number_of_connected_monitors} -eq 1 ]]; then
        cmd="xrandr --output ${connected_monitors[0]} --primary --auto"
        primary_monitor=${connected_monitors[0]}
        secondary_monitor=${connected_monitors[0]}
    else
        for monitor in "${connected_monitors[@]}"; do
            if [[ ${monitor} == "${PREDEFINED_PRIMARY}" ]]; then
                primary_monitor=${monitor}
            elif [[ $(echo ${monitor} | egrep "${EXTERNAL}") == ${monitor} ]]; then
                if [[ -n ${primary_monitor} ]]; then
                    secondary_monitor=${monitor}
                else
                    primary_monitor=${monitor}
                fi
            elif [[ $(echo ${monitor} | egrep "${INTERNAL}") == ${monitor} ]]; then
                secondary_monitor=${monitor}
            fi
        done
        cmd="xrandr --output $primary_monitor --primary --left-of $secondary_monitor --auto"  

        # xrandr --output $secondary_monitor --auto
        # xrandr --output $primary_monitor --primary --left-of $secondary_monitor
    fi

    # desktop=$(echo $DESKTOP_SESSION)
    desktop=$($HOME/.bin/get_current_desktop)
    case $desktop in
        i3|/usr/share/xsessions/i3)
	echo "
exec --no-startup-id $cmd   
workspace 1 output $primary_monitor
workspace 2 output $primary_monitor
workspace 3 output $primary_monitor
workspace 4 output $primary_monitor
workspace 5 output $primary_monitor
workspace 6 output $primary_monitor
workspace 7 output $primary_monitor
workspace 8 output $primary_monitor
workspace 9 output $secondary_monitor
workspace 10 output $secondary_monitor"  > $HOME/.config/i3/monitors.i3

        ;;

        openbox|/usr/share/xsessions/openbox)
        $cmd
    esac
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main "$@"
fi
