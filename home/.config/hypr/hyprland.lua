-- ~/.config/hypr/hyprland.lua

-- Do NOT add package.path or require("hyprland")
-- The 'hl' global is already available

-- Load modules – they will use the global 'hl'
require("modules.environment")
require("modules.monitors")
require("modules.settings")
require("modules.permissions")
require("modules.autostart")

local hs = require("hyprsplit")   -- this is fine (external module)
require("modules.hyprsplit")
require("modules.keybinds")
require("modules.window_rules")
