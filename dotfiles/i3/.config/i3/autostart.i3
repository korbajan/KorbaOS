################# autostart - execute applications at boot time

# USER APPLICATIONS TO START AT BOOT

# optimus-manager tray
#exec --no-startup-id optimus-manager-qt &

# nitrogen
exec_always --no-startup-id nitrogen --restore &

# ArcoLinux Welcome App
#exec --no-startup-id dex $HOME/.config/autostart/arcolinux-welcome-app.desktop

# Autotiling
exec_always --no-startup-id autotiling

# Authentication dialog
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Updater
exec --no-startup-id pamac-tray

# bluetooth
exec --no-startup-id blueberry-tray

# network
exec --no-startup-id nm-applet

# num lock activated
exec_always --no-startup-id numlockx on

# volume
# exec --no-startup-id pasystray
exec --no-startup-id volumeicon

################# system applications       

exec --no-startup-id xfce4-power-manager &
# ommitted next line to get super key to bring up the menu in xfce and avoid error then in i3
# IF xfsettingsd is activated you can not change themes
# exec --no-startup-id xfsettingsd &
exec --no-startup-id /usr/lib/xfce4/notifyd/xfce4-notifyd &

################# picom                  

# if you want transparency on non-focused windows, ...
exec_always --no-startup-id picom --config ~/.config/picom.conf

bindsym control+mod1+o exec --no-startup-id ~/.config/i3/scripts/picom-toggle.sh
