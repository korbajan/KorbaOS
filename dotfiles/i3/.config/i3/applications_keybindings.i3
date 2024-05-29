################# applications keyboard shortcuts  

# not workspace related

# ArcoLinux Welcome App
bindsym control+mod1+w exec --no-startup-id arcolinux-welcome-app

# ArcoLinux Tweak Tool
bindsym control+mod1+e exec --no-startup-id arcolinux-tweak-tool

# conky
bindsym $mod+c exec --no-startup-id conky-toggle
bindsym control+mod1+Next exec --no-startup-id conky-rotate -n
bindsym control+mod1+Prior exec --no-startup-id conky-rotate -p

# terminal
set $main_terminal alacritty
#set $main_terminal urxvt
bindsym $mod+Return exec --no-startup-id $main_terminal;focus
bindsym $mod+KP_Enter exec --no-startup-id $main_terminal;focus
bindsym control+mod1+t exec --no-startup-id $main_terminal; focus
bindsym control+mod1+Return exec --no-startup-id $main_terminal; focus
bindsym control+mod1+KP_Enter exec --no-startup-id $main_terminal; focus
bindsym F12 exec --no-startup-id xfce4-terminal --drop-down; focus

# System monitor
bindsym control+Shift+Escape exec --no-startup-id xfce4-taskmanager;focus

# settings
bindsym control+mod1+m exec --no-startup-id xfce4-settings-manager

# catfish
bindsym control+mod1+c exec --no-startup-id catfish;focus

# rofi theme selector
bindsym control+mod1+r exec --no-startup-id rofi-theme-selector

# pavucontrol
bindsym control+mod1+u exec --no-startup-id pavucontrol

# start xfce-appfinder
# arcolinux does not seem to work
bindsym control+mod1+a exec --no-startup-id xfce4-appfinder

# pamac-manager
bindsym control+mod1+p exec --no-startup-id pamac-manager

# xkill
bindsym --release $mod+Escape exec xkill

# update
# bindsym $mod+Ctrl+u exec --no-startup-id $main_terminal -T 'update' -e update;focus

# Function Keybinds
# Browser
bindsym $mod+F1 exec --no-startup-id exo-open --launch webbrowser;focus
# qwerty/azerty conflict with w
#bindsym $mod+w exec --no-startup-id exo-open --launch webbrowser;focus
bindsym $mod+w exec --no-startup-id firefox;focus
bindsym control+mod1+f exec --no-startup-id firefox;focus
bindsym control+mod1+g exec --no-startup-id chromium;focus

# Basic Draw Tool
# bindsym $mod+F3 exec --no-startup-id inkscape;focus

# Advanced Draw Tool
bindsym $mod+F4 exec --no-startup-id gimp;focus

# document comparison
bindsym $mod+F5 exec --no-startup-id meld;focus
bindsym control+mod1+i exec --no-startup-id nitrogen;focus

# video player
bindsym $mod+F6 exec --no-startup-id vlc;focus

# virtual machine
bindsym $mod+F7 exec --no-startup-id virtualbox;focus

# file management
bindsym $mod+F8 exec --no-startup-id thunar;focus
bindsym $mod+Shift+f exec --no-startup-id thunar;focus
bindsym control+mod1+b exec --no-startup-id thunar;focus

# mail application
# bindsym $mod+F9 exec --no-startup-id evolution;focus
# bindsym $mod+F9 exec --no-startup-id geary;focus
# bindsym control+mod1+e exec --no-startup-id geary;focus

# music
bindsym $mod+F10 exec --no-startup-id spotify;focus
bindsym control+mod1+s exec --no-startup-id spotify;focus

# VM windows

bindsym $mod+Shift+w exec --no-startup-id vboxmanage startvm vmware_win11 

################# screenshots                      

bindsym Print exec --no-startup-id scrot 'ArcoLinux-%Y-%m-%d-%s_screenshot_$wx$h.jpg' -e 'mv $f $$(xdg-user-dir PICTURES)'
bindsym Control+Print exec --no-startup-id xfce4-screenshooter
bindsym Control+Shift+Print exec --no-startup-id gnome-screenshot -i
# bindsym shift+Print exec --no-startup-id shutter
