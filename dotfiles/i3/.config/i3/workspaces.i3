#### WORKSPACES ####

# orientation for new workspaces
default_orientation horizontal

# Workspace names
# to display names or symbols instead of plain workspace numbers you can use
# something like: set $ws1 1:mail
#                 set $ws2 2:

# set $ws1 1: Web (1)
# set $ws2 2: Dev (2)
# set $ws3 3: Terminals (3)
# set $ws4 4: Files (4)
# set $ws5 5: Movies (6)
# set $ws6 6: Graphics (6)
# set $ws7 7: Audio (7)
# set $ws8 8: Games (8)
# set $ws9 9: Music (9)
# set $ws10 10:  Tools (10)

# switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace 1; workspace 1
bindsym $mod+Shift+2 move container to workspace 2; workspace 2
bindsym $mod+Shift+3 move container to workspace 3; workspace 3
bindsym $mod+Shift+4 move container to workspace 4; workspace 4
bindsym $mod+Shift+5 move container to workspace 5; workspace 5
bindsym $mod+Shift+6 move container to workspace 6; workspace 6
bindsym $mod+Shift+7 move container to workspace 7; workspace 7
bindsym $mod+Shift+8 move container to workspace 8; workspace 8
bindsym $mod+Shift+9 move container to workspace 9; workspace 9
bindsym $mod+Shift+0 move container to workspace 10; workspace 10

