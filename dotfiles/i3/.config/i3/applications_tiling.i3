# Open applications on specific workspaces (Assign Workspaces):
# use xprop |awk '/WM_CLASS/{print $4}' or xprop | grep -i 'class'

## Web browser: $ws1
assign [class="firefox"] 1
assign [class="Chromium"] 1
assign [class="Vivaldi-stable"] 1
assign [class="Opera"] 1
assign [class="Thunderbird"] 1
## Editors, IDEs: $ws2
assign [class="Atom"] 2
assign [class="code-oss|code|Code"] 2
assign [class="jetbrains-pycharm-ce"] 2
assign [class="jetbrains-goland"] 2
assign [class="Geany"] 2
## Terminals: $ws3
assign [class="URxvt"] 3
assign [class="Alacritty"] 3

## File managers $ws4:
assign [class="Org.gnome.Nautilus"] 4
assign [class="Thunar"] 4
assign [class="Nemo|Thunar|Caja|nautilus|Nautilus"]                                 → 4
### meld also on $ws4:
assign [class="org.gnome.meld|Meld"] 4
assign [class="VirtualBox Machine"] 4
assign [class="remote-viewer|Remote-viewer"] 4

# Movie, recordings players $ws5:
assign [class="Vlc|vlc"] → 5
assign [class="kdenlive|kdenlive"] 5
assign [class="postman|Postman"] 5

# Graphics editors $ws6:
assign [class="Gimp"] 6
assign [class="Inkscape"] → 10
assign [class="ristretto|Ristretto|shotwell|Shotwell|Xviewer|Nitrogen"]             → 10
assign [class="feh|gthumb|Gthumb|eog|Eog|Pinta|pixeluvo|Pixeluvo"]                  → 10

# google chrome $ws7:
assign [class="Google-chrome"] → 7

# Slack $ws8:
assign [title="Slack"] 8
#assign [title="Football Manager.*"] 8

# Music players $ws9:
assign [class="Spotify|spotify"] 9
for_window [class="Spotify"] move to workspace 9

# Tools 10:
assign [class="Pamac-manager"] 10
#assign [class="Steam"] 10
assign [class="steam"] 10
assign [class="Vmplayer|VirtualBox Manager"]						    → 10
assign [class="virt-manager|Virt-manager"]						    → 10
assign [class="vmware-view|Vmware-view"]						    → 10

################# give focus to applications    

for_window [class="Thunar"] focus
for_window [class="Spotify"] focus
for_window [class="Vlc|vlc"] focus
for_window [class="Pamac-manager"] focus
for_window [class="Urxvt"] focus
for_window [class="Alacritty|alacritty"] focus
assign [class="firefox"] focus
assign [class="Chromium"] focus

################# floating or tiled rules         

# floating enabled from some programs - find with xprop

for_window [class="Arcolinux-welcome-app.py"] floating enable
# for_window [class="Arcolinux-tweak-tool.py"] floating enable
for_window [class="Arcolinux-calamares-tool.py"] floating enable
for_window [class="Bleachbit"] floating disable
for_window [class="Blueberry.py"] floating enable
for_window [class="Brasero"] floating disable
for_window [class="Galculator"] floating enable
for_window [class="Gnome-disks"] floating disable
for_window [class="^Gnome-font-viewer$"] floating enable
for_window [class="^Gpick$"] floating enable
for_window [class="Hexchat"] floating disable
for_window [class="Imagewriter"] floating enable
for_window [class="Font-manager"] floating enable
# for_window [class="qt5ct|Lxappearance] floating enable
for_window [class="Nitrogen"] floating disable
for_window [class="Pavucontrol"] floating disable
for_window [class="Peek"] floating enable
for_window [class="^Skype$"] floating enable
for_window [class="^Spotify$"] floating disable
for_window [class="Steam$"] floating enable
for_window [class="steam$"] floating enable
# for_window [title="Football Manager.*"] floating enable
for_window [class="System-config-printer.py"] floating enable
for_window [class="Unetbootin.elf"] floating enable
for_window [class="Usb-creator-gtk"] floating enable
for_window [class="QjackCtl"] floating enable
for_window [class="^Vlc$"] floating disable
for_window [title="^VLSub.*"] floating enable
for_window [class="Wine"] floating disable
for_window [class="Xfburn"] floating disable
for_window [class="Xfce4-appfinder"] floating enable
for_window [class="Xfce4-settings-manager"] floating disable
for_window [class="Xfce4-taskmanager"] floating enable

# for_window [instance="gimp"] floating disable
for_window [instance="script-fu"] border normal
for_window [instance="variety"] floating disable

for_window [title="Copying"] floating enable
for_window [title="Deleting"] floating enable
for_window [title="Moving"] floating enable
for_window [title="^Terminator Preferences$"] floating enable

# for_window [window_role="^gimp-toolbox-color-dialog$"] floating enable
for_window [window_role="pop-up"] floating enable
for_window [window_role="^Preferences$"] floating enable
for_window [window_role="setup"] floating enable
