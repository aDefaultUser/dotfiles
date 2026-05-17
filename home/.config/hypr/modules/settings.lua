hl.config({
    ecosystem = {
        enforce_permissions = true,
        no_donation_nag = true,
        no_update_news = true,
    },
})

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 2,
        border_size = 1,
        no_focus_fallback = true,
        col = { active_border = "rgb(CC241D)" },
        resize_on_border = false,
        allow_tearing = false,
        layout = "master",
    },
    decoration = {
        rounding = 0,
        rounding_power = 0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = { enabled = false },
        blur = {
            enabled = true,
            ignore_opacity = false,
            size = 4,          -- lighter
            passes = 1,        -- lighter
            contrast = 1.2,    -- lighter
            brightness = 1.2,  -- lighter
            vibrancy_darkness = 1.0,
        },
    },
    animations = { enabled = false },
    dwindle = { preserve_split = true },
    master = {
        new_status = "slave",
        mfact = 0.5,
        special_scale_factor = 0.5,
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
    render = {
        expand_undersized_textures = false,
        direct_scanout = true,
        new_render_scheduling = true,
        non_shader_cm = true,
        cm_sdr_eotf = 3,
    },
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "ctrl:nocaps",
        kb_rules = "",
        repeat_rate = 35,
        repeat_delay = 200,
        follow_mouse = 1,
        sensitivity = 0,
    },
    cursor = {
        inactive_timeout = 30,
        no_hardware_cursors = true,
    },
})
