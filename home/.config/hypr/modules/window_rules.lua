hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({ match = { class = "steam" }, workspace = "9 silent" })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true })
hl.window_rule({ match = { class = "org.keepassxc.KeePassXC" }, workspace = "special:passmgr silent", no_screen_share = true })
hl.window_rule({ match = { class = "org.gajim.Gajim" }, no_screen_share = true })
hl.window_rule({ match = { class = "hyprland-share-picker" }, float = true })
hl.window_rule({ match = { float = true, fullscreen = false }, opacity = "0.9" })
hl.window_rule({
    match = { class = "^(Tor Browser)$" },
    float = true,
    size = { 1200, 800 },
    center = true,
    suppress_event = "fullscreen maximize",
    fullscreen = false,
})

hl.workspace_rule({ workspace = "s[true]", gaps_in = 50, gaps_out = 20 })

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})
