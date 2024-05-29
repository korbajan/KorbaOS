################# audio settings                   

bindsym XF86AudioRaiseVolume exec --no-startup-id "amixer -D pulse sset Master '5%+'"
bindsym XF86AudioLowerVolume exec --no-startup-id "amixer -D pulse sset Master '5%-'"
bindsym XF86AudioMute exec --no-startup-id "amixer -D pulse set Master toggle"
# https://github.com/acrisci/playerctl/
bindsym XF86AudioPlay exec --no-startup-id playerctl play-pause
bindsym XF86AudioNext exec --no-startup-id playerctl next
bindsym XF86AudioPrev exec --no-startup-id playerctl previous
bindsym XF86AudioStop exec --no-startup-id playerctl stop
# bindsym XF86AudioPlay exec --no-startup-id "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"
# bindsym XF86AudioNext exec --no-startup-id "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"
# bindsym XF86AudioPrev exec --no-startup-id "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"
# bindsym XF86AudioStop exec --no-startup-id "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop"

################# xbacklight                       

bindsym XF86MonBrightnessUp exec --no-startup-id xbacklight -inc 20 # increase screen brightness
bindsym XF86MonBrightnessDown exec --no-startup-id xbacklight -dec 20 # decrease screen brightness