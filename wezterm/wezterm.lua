-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.initial_cols = 80
config.initial_rows = 20

config.font_size = 12
config.color_scheme = 'Catppuccin Macchiato'
config.font = wezterm.font 'MartianMono NFM'

-- window background
-- config.window_background_opacity = 0.6
-- config.win32_system_backdrop = 'Acrylic'


-- tabs
config.use_fancy_tab_bar = false 
config.adjust_window_size_when_changing_font_size = false

-- disable bell
config.audible_bell = "Disabled"


WINDOWS = "x86_64-pc-windows-msvc"
MACOS = "aarch64-apple-darwin"
LINUX = "x86_64-unknown-linux-gnu"

-- setting wsl to default
if wezterm.target_triple == WINDOWS then
    config.default_domain = 'WSL:Ubuntu'
    config.default_cwd = '~' 
    config.window_decorations = "TITLE | RESIZE"
else
    config.window_decorations = "RESIZE"
    -- Mouse binding
    config.mouse_bindings = {
        -- window dragging
        {
            event = { Down = { streak = 1, button = "Left" } },
            mods = "ALT",
            action = "StartWindowDrag",
            mouse_reporting = true,
        },
    }
end 


local act = wezterm.action
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {

    -- Tab related keybinds
    {
        key = 'n',
        mods = 'LEADER',
        action = act.SpawnTab 'CurrentPaneDomain'
    },
    {
        key = 'w',
        mods = 'LEADER',
        action = act.CloseCurrentTab { confirm = false }
    },
--     {
--         key = ':',
--         mods = 'ALT',
--         action = act.ActivateRelativeTab(-1)
--     },
--     {
--         key = '"',
--         mods = 'ALT',
--         action = act.ActivateRelativeTab(1)
--     },

    -- Pane related keybinds
    {
       key = '[',
       mods = 'LEADER',
       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
       key = ']',
       mods = 'LEADER',
       action = act.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        key = 'x',
        mods = 'LEADER',
        action = act.CloseCurrentPane { confirm = false }
    },

    {
        key = 'h',
        mods = 'LEADER',
        action = act.ActivatePaneDirection 'Left'
    },
    {
        key = 'l',
        mods = 'LEADER',
        action = act.ActivatePaneDirection 'Right'
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = act.ActivatePaneDirection 'Down'
    },
    {
        key = 'k',
        mods = 'LEADER',
        action = act.ActivatePaneDirection 'Up'
    },

    {
        key = 'f',
        mods = 'LEADER',
        action = act.TogglePaneZoomState
    }

--    for i = 1, 9 do
--        table.insert(config.keys, {
--            key = tostring(i),
--            mods = "LEADER",
--            action = action.ActivateTab(i - 1),
--        })
--    end
}




-- Finally, return the configuration to wezterm:
return config
