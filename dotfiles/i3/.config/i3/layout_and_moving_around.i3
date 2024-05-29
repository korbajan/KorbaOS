################# Layout       

# split in horizontal orientation
bindsym $mod+Ctrl+h split h

# split in vertical orientation
bindsym $mod+Ctrl+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

################# Popups  control
# Popups during fullscreen mode
popup_during_fullscreen smart

# change container layout (stacked, tabbed, toggle split)
# qwerty/azerty issue for letter z
bindsym $mod+s layout stacking
bindsym $mod+z layout tabbed
bindsym $mod+e layout toggle split

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
# bindsym $mod+d focus child

################# resize  

# Resizing by 1
# bindsym $mod+Mod1+Ctrl+Right resize shrink width 1 px or 1 ppt
# bindsym $mod+Mod1+Ctrl+Up resize grow height 1 px or 1 ppt
# bindsym $mod+Mod1+Ctrl+Down resize shrink height 1 px or 1 ppt
# bindsym $mod+Mod1+Ctrl+Left resize grow width 1 px or 1 ppt
bindsym $mod+Mod4+Ctrl+Right resize shrink width 1 px or 1 ppt
bindsym $mod+Mod4+Ctrl+Up resize grow height 1 px or 1 ppt
bindsym $mod+Mod4+Ctrl+Down resize shrink height 1 px or 1 ppt
bindsym $mod+Mod4+Ctrl+Left resize grow width 1 px or 1 ppt

# old resize keybindings
# resize window (you can also use the mouse for that)

# bindsym $mod+r mode "resize"

# mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
 #      bindsym $left       resize shrink width 10 px or 10 ppt
 #      bindsym $down       resize grow height 10 px or 10 ppt
 #      bindsym $up         resize shrink height 10 px or 10 ppt
 #      bindsym $right      resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
 #      bindsym Left        resize shrink width 10 px or 10 ppt
 #      bindsym Down        resize grow height 10 px or 10 ppt
 #      bindsym Up          resize shrink height 10 px or 10 ppt
 #      bindsym Right       resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
 #      bindsym Return mode "default"
 #      bindsym Escape mode "default"
# }

################# Moving around in i3              

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus
bindsym $mod+$left focus left
bindsym $mod+$down focus down
bindsym $mod+$up focus up
bindsym $mod+$right focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+$left move left
bindsym $mod+Shift+$down move down
bindsym $mod+Shift+$up move up
bindsym $mod+Shift+$right move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

################# moving around workspaces         

# next/previous workspace

# bindsym Mod1+Tab workspace next
# bindsym Mod1+Shift+Tab workspace prev
bindsym $mod+Ctrl+Tab workspace back_and_forth

# navigate workspaces next / previous
# bindsym Mod1+Ctrl+Right workspace next
# bindsym Mod1+Ctrl+Left workspace prev

# switch to workspace with urgent window automatically
for_window [urgent=latest] focus
