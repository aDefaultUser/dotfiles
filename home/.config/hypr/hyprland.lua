local terminal     = "foot"
local fileManager  = "pcmanfm-qt"
local menu         = "fuzzel"
local mainMod      = "SUPER"

local hs = require("hyprsplit")

hs.config({
    num_workspaces = 10,
    persistent_workspaces = true,
    force_monitor_priority = true,
})

hl.monitor({
    output = "DP-1",
    mode = "2560x1440@180",
    position = "2560x0",
})

hl.monitor({
    output = "DP-3",
    mode = "2560x1440@180",
    position = "0x0",
})

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("wbg /home/fcc/walls/wall.png")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("/usr/libexec/xdg-desktop-portal -r")
    hl.exec_cmd("/usr/libexec/xdg-desktop-portal-gtk -r")
    hl.exec_cmd("/usr/libexec/xdg-desktop-portal-hyprland")
    hl.exec_cmd("nohup gentoo-pipewire-launcher restart > /dev/null 2>&1")
    hl.exec_cmd("keepassxc")
end)

hl.env("XCURSOR_THEME",                   "Capitaine-Cursor")
hl.env("XCURSOR_SIZE",                    "24")
hl.env("XDG_CURRENT_DESKTOP",             "Hyprland")
hl.env("XDG_SESSION_TYPE",                "wayland")
hl.env("XDG_SESSION_DESKTOP",             "Hyprland")
hl.env("GTK_THEME",                       "Gruvbox-B-MB-Dark")
hl.env("QT_QPA_PLATFORMTHEME",            "hyprqt6engine")
hl.env("QT_STYLE_OVERRIDE",               "kvantum")
hl.env("QT_QPA_PLATFORM",                 "wayland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR",     "1")

hl.config({
    ecosystem = {
        enforce_permissions  = true,
        no_donation_nag      = true,
        no_update_news       = true,
    },
})

hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/grim",                             "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpicker",                       "screencopy", "allow")

hl.config({
    general = {
        gaps_in          = 2,
        gaps_out         = 2,
        border_size      = 1,
        no_focus_fallback = true,
        col = {
            active_border = "rgb(CC241D)",
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "master",
    },

    cursor = { enable_hyprcursor = false, no_hardware_cursors = true, },

    decoration = {
        rounding = 0,
        rounding_power = 0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = { enabled = false },
        blur = {
	enabled = true,
	ignore_opacity = false,
	size = 8,
	passes = 2,
	contrast = 2.0,
	brightness = 2.0,
	vibrancy_darkness = 1.0,
        },
},

    animations = { enabled = false },

    dwindle = { preserve_split = true },

    master = {
        new_status           = "slave",
        mfact                = 0.5,
        special_scale_factor = 0.5,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },

    render = {
        expand_undersized_textures = false,
        direct_scanout             = true,
        new_render_scheduling      = true,
        non_shader_cm              = true,
        cm_sdr_eotf                = 3,
    },

    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "ctrl:nocaps",
        kb_rules     = "",
        repeat_rate  = 35,
        repeat_delay = 200,
        follow_mouse = 1,
        sensitivity  = 0,
    },

    cursor = {
        inactive_timeout    = 30,
        no_hardware_cursors = true,
    },
})

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",       hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())
hl.bind(mainMod .. " + E",       hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",       hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F",       hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + D",       hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R",       hl.dsp.exec_cmd("pkill waybar; waybar"))
hl.bind(mainMod .. " + P",       hl.dsp.window.pseudo())

hl.bind(mainMod .. " + C", function()
    hl.dispatch(hl.dsp.exec_cmd("wpctl set-sink-mute @DEFAULT_SINK@ 1"))
    hl.dispatch(hl.dsp.exec_cmd("waylock"))
end)

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + H",     hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + K",     hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J",     hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + H",     hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L",     hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K",     hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J",     hl.dsp.window.move({ direction = "d" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,          hs.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,  hs.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(mainMod .. " + TAB",          hs.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + SHIFT + TAB",  hs.dsp.focus({ workspace = "r-1" }))

hl.bind(mainMod .. " + G",            hs.dsp.grab_rogue_windows())

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + N",         hl.dsp.workspace.toggle_special("passmgr"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic", silent = true }))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region --clipboard"))

hl.bind(mainMod .. " + comma", function()
    hl.dispatch(hl.dsp.window.move({ monitor = "DP-3", follow = false }))
end)

hl.bind(mainMod .. " + period", function()
    hl.dispatch(hl.dsp.window.move({ monitor = "DP-1", follow = false }))
end)

hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    match     = { class = "steam" },
    workspace = "9 silent",
})

hl.window_rule({
    match = { class = "xdg-desktop-portal-gtk" },
    float = true,
})

hl.window_rule({
    match           = { class = "org.keepassxc.KeePassXC" },
    workspace       = "special:passmgr silent",
    no_screen_share = true,
})

hl.window_rule({
    match           = { class = "org.gajim.Gajim" },
    no_screen_share = true,
})

hl.window_rule({
    match = { class = "hyprland-share-picker" },
    float = true,
})

hl.window_rule({
    match      = { float = true, fullscreen = false },
    opacity    = "0.9",
})

hl.window_rule({
    match          = { class = "^(Tor Browser)$" },
    float          = true,
    size           = { 1200, 800 },
    center         = true,
    suppress_event = "fullscreen maximize",
    fullscreen     = false,
})

hl.workspace_rule({
    workspace = "s[true]",
    gaps_in   = 50,
    gaps_out  = 20,
})

hl.window_rule({
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})