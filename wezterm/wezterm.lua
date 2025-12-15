-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.initial_cols = 80
config.initial_rows = 20

config.font_size = 12
config.color_scheme = 'Catppuccin Macchiato'

-- window settings 
config.window_decorations = "RESIZE"

-- tab settings
config.use_fancy_tab_bar = false 
config.adjust_window_size_when_changing_font_size = false
config.colors = {
    tab_bar = {
        background = "#363a4f",
    }
}

-- hide tab bar
config.hide_tab_bar_if_only_one_tab = true

-- disable bell
config.audible_bell = "Disabled"

WINDOWS = "x86_64-pc-windows-msvc"
MACOS = "aarch64-apple-darwin"
LINUX = "x86_64-unknown-linux-gnu"

-- setting wsl to default
if wezterm.target_triple == WINDOWS then
    config.window_background_opacity = 0.75
    config.win32_system_backdrop = 'Acrylic'
    config.font = wezterm.font 'MartianMono NFM'
    config.default_domain = 'WSL:Ubuntu'
    config.default_cwd = '~' 
end

if wezterm.target_triple == MACOS then
    config.font_size = 20 
    config.window_background_opacity = 0.9
    config.macos_window_background_blur = 30
    config.font = wezterm.font 'SF Mono'
end

return config
