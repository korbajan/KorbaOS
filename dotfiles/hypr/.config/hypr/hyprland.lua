-- Hyprland Lua config — translated from hyprland.conf
-- https://wiki.hypr.land/Configuring/


------------------
---- MONITORS ----
------------------

hl.monitor({ output = "DP-1",  mode = "1920x1080", position = "0x0",    scale = 1 })
hl.monitor({ output = "eDP-1", mode = "1920x1080", position = "1920x0", scale = 1 })


----------------------
---- WORKSPACES  ----
----------------------

for i = 1, 6 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "DP-1" })
end
for i = 7, 9 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "eDP-1" })
end
hl.workspace_rule({ workspace = "10", monitor = "eDP-1" })


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "alacritty"
local fileManager = "thunar"
local menu        = 'rofi -font "JetBrainsMonoNLNerdFont Regular 13" -show drun -icon-theme "Nordzy-dark" -show-icons'
local browser     = "zen-browser"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd(os.getenv("HOME") .. "/.config/waybar/launch.sh")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("dunst")
    hl.exec_cmd("wlsunset -S 06:00 -s 19:30 -o eDP1")
    hl.exec_cmd("wlsunset -S 06:00 -s 19:30 -o DP1 -t 5000")
    hl.exec_cmd("wl-paste --watch cliphist store")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE",                     "24")
hl.env("HYPRCURSOR_SIZE",                  "24")
hl.env("GDK_BACKEND",                      "wayland,x11,*")
hl.env("SDL_VIDEODRIVER",                  "wayland")
hl.env("CLUTTER_BACKEND",                  "wayland")
hl.env("XDG_CURRENT_DESKTOP",              "Hyprland")
hl.env("XDG_SESSION_TYPE",                 "wayland")
hl.env("XDG_SESSION_DESKTOP",              "Hyprland")
hl.env("QT_QPA_PLATFORM",                  "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME",             "qt6ct")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    debug = {
        disable_logs = false,
    },

    general = {
        gaps_in  = 3,
        gaps_out = 6,

        border_size = 2,

        col = {
            active_border   = { colors = { "rgb(5e81ac)", "rgb(81a1c1)" }, angle = 45 },
            inactive_border = { colors = { "rgb(3b4252)", "rgb(2e3440)" }, angle = 45 },
        },

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding         = 10,
        rounding_power   = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.8,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
        force_split    = 2,
    },

    master = {
        new_status = "master",
    },

    misc = {
        disable_hyprland_logo    = true,
        force_default_wallpaper  = 0,
        disable_splash_rendering = true,
        focus_on_activate        = true,
    },

    input = {
        kb_layout  = "pl",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})


------------------
---- CURVES   ----
------------------

hl.curve("easeOutQuint",   { type = "bezier", points = { { 0.23, 1    }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear",         { type = "bezier", points = { { 0,    0    }, { 1,    1 } } })
hl.curve("almostLinear",   { type = "bezier", points = { { 0.5,  0.5  }, { 0.75, 1 } } })
hl.curve("quick",          { type = "bezier", points = { { 0.15, 0    }, { 0.1,  1 } } })


--------------------
---- ANIMATIONS ----
--------------------

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default"       })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint"  })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint"  })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint",  style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",        style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear"  })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear"  })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick"         })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint"  })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint",  style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",        style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear"  })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear"  })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear",  style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear",  style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear",  style = "fade" })


--------------
---- INPUT ---
--------------

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })

hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "ALT"

-- Apps
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + RETURN",         hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",              hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + CTRL + S",       hl.dsp.exec_cmd('bash steam -silent && notify-send "steam up and running"'))
hl.bind(mainMod .. " + C",              hl.dsp.exec_cmd("~/.local/bin/rofi-cinema.sh"))
hl.bind(mainMod .. " + W",              hl.dsp.exec_cmd(browser))

-- Screenshots
hl.bind("SHIFT + PRINT",       hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("PRINT",               hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- Window management
hl.bind(mainMod .. " + F",        hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + Q",        hl.dsp.window.close())
hl.bind(mainMod .. " + DELETE",   hl.dsp.exec_cmd("~/.config/wlogout/launch.sh"))
hl.bind(mainMod .. " + CTRL + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + CTRL + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + CTRL + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("hyprlock"))

-- Focus movement (vim + arrows)
hl.bind(mainMod .. " + H",     hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + L",     hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K",     hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + J",     hl.dsp.focus({ direction = "down"  }))
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down"  }))

-- Move windows (vim + arrows)
hl.bind(mainMod .. " + SHIFT + H",     hl.dsp.window.move({ direction = "left"  }))
hl.bind(mainMod .. " + SHIFT + L",     hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K",     hl.dsp.window.move({ direction = "up"    }))
hl.bind(mainMod .. " + SHIFT + J",     hl.dsp.window.move({ direction = "down"  }))
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left"  }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up"    }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down"  }))

-- Workspaces 1-9 and 10 (key 0)
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i,     hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + 0",             hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0",     hl.dsp.window.move({ workspace = 10 }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize submap (i3-style keyboard resize)
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", "reset", function()
    hl.bind("right",  hl.dsp.window.resize({ x =  10, y =   0 }), { repeating = true })
    hl.bind("left",   hl.dsp.window.resize({ x = -10, y =   0 }), { repeating = true })
    hl.bind("up",     hl.dsp.window.resize({ x =   0, y = -10 }), { repeating = true })
    hl.bind("down",   hl.dsp.window.resize({ x =   0, y =  10 }), { repeating = true })
    hl.bind("Return", hl.dsp.submap("reset"))
end)

-- Volume and brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Media control
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),        { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),    { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    name  = "opacity-for-browsers",
    match = { class = "^(zen|firefox)$" },
    opacity = "1.0 1.0",
})

hl.window_rule({
    name      = "workspace-for-zen",
    match     = { class = "^(zen)$" },
    workspace = "1",
})

hl.window_rule({
    name      = "workspace-for-firefox",
    match     = { class = "^(firefox)$" },
    workspace = "2",
})

hl.window_rule({
    name      = "workspace-for-terminal",
    match     = { class = "^(Alacritty)$" },
    workspace = "3",
})

hl.window_rule({
    name      = "workspace-for-reaper",
    match     = { class = "^(REAPER)$" },
    workspace = "5",
})

hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})
