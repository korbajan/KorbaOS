################# menu's

# start dmenu
# bindsym $mod+d exec --no-startup-id ~/.bin/dmenu_run_history -i -h 30 -nb '#383c4a' -sb '#5294e2' -nf '#fea63c' -sf '#d3dae3' -fn 'SauceCodeProNF:regular:pixelsize=14'
# bindsym $mod+d exec --no-startup-id ~/.bin/dmenu_run_history -i -h 30 -nb '#3b4252' -sb '#88c0d0' -nf '#b48ead' -sf '#3b4252' -fn 'SauceCodeProNerdFont:regular:pixelsize=14'
bindsym $mod+d exec --no-startup-id ~/.bin/dmenu_run_history -i -h 30 -nb '#3b4252' -sb '#88c0d0' -nf '#b48ead' -sf '#3b4252' -fn 'JetBrainsMonoNLNerdFont:regular:pixelsize=14'

# start xfce4-appfinder
bindsym mod1+F2 exec --no-startup-id xfce4-appfinder --collapsed

# start xfce-appfinder
bindsym mod1+F3 exec --no-startup-id xfce4-appfinder

# start rofi full
#bindsym $mod+F11 exec --no-startup-id "rofi -font 'SauceCodeProNerdFont Regular 13' -theme-str 'window {width: 100%;height: 100%;}' -show drun"
bindsym $mod+F11 exec --no-startup-id "rofi -font 'JetBrainsMonoNLNerdFont Regular 13' -theme-str 'window {width: 100%;height: 100%;}' -show drun"

# start rofi small
# bindsym $mod+Shift+Return exec --no-startup-id rofi -theme Arc-Dark -font "SauceCodeProNF Regular 13" -show drun -icon-theme "Sardi Arc" -show-icons
#bindsym $mod+Shift+Return exec --no-startup-id rofi -font "SauceCodeProNerdFont Regular 13" -show drun -icon-theme "Sardi Arc" -show-icons
bindsym $mod+Shift+Return exec --no-startup-id rofi -font "JetBrainsMonoNLNerdFont Regular 13" -show drun -icon-theme "Sardi Arc" -show-icons

# rofi-windows
bindsym $mod+Shift+Tab exec --no-startup-id rofi -show window

#rofi-run
bindsym $mod+Shift+p exec --no-startup-id rofi -show run

#rofi-code:
bindsym $mod+Shift+c exec --no-startup-id rofi-code

#rofi-calc:
bindsym $mod+Shift+Insert exec --no-startup-id rofi -show calc -modi calc -no-show-match -no-sort

#rofi-vms:
bindsym $mod+Shift+v exec --no-startup-id ~/.bin/rofi-vms


################# how to exit, logoff, suspend, ...

# Backup exit
# Press ctrl+alt+x - check toolbar for next choices
bindsym control+mod1+Delete mode "$mode_system"

set $mode_system System (l) lock, (e) logout, (u) suspend, (h) hibernate, (r) reboot, (s) shutdown
mode "$mode_system" {
    bindsym l exec --no-startup-id ~/.config/i3/scripts/i3exit.sh lock, mode "default"
    bindsym e exec --no-startup-id ~/.config/i3/scripts/i3exit.sh logout, mode "default"
    bindsym u exec --no-startup-id ~/.config/i3/scripts/i3exit.sh suspend, mode "default"
    bindsym h exec --no-startup-id ~/.config/i3/scripts/i3exit.sh hibernate, mode "default"
    bindsym r exec --no-startup-id ~/.config/i3/scripts/i3exit.sh reboot, mode "default"
    bindsym s exec --no-startup-id ~/.config/i3/scripts/i3exit.sh shutdown, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

# ArcoLinux Logout
bindsym $mod+Shift+e exec --no-startup-id python3 $HOME/SystemSetup/arcolinux-logout/usr/share/arcologout/arcologout.py
bindsym $mod+Delete exec --no-startup-id python3 $HOME/SystemSetup/arcolinux-logout/usr/share/arcologout/arcologout.py
# arcolinux-logout
# bindsym control+mod1+k exec --no-startup-id python3 $HOME/SystemSetup/arcolinux-logout/usr/share/arcologout/arcologout.py
# bindsym control+mod1+l exec --no-startup-id python3 $HOME/SystemSetup/arcolinux-logout/usr/share/arcologout/arcologout.py

# Lock shortcut:
# bindsym $mod+Ctrl+l exec --no-startup-id ~/.config/i3/scripts/i3exit.sh lock
bindsym $mod+Ctrl+l exec --no-startup-id betterlockscreen --lock
