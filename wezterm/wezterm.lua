local wezterm = require('wezterm')

local config = wezterm.config_builder()
config = {
  color_scheme = 'OneDark (base16)',
  font = wezterm.font('SFMono Nerd Font'),
  font_size = 14,
  enable_tab_bar = false,
  window_decorations = 'RESIZE',
  window_background_opacity = 0.8,
  window_close_confirmation = 'NeverPrompt',
  macos_window_background_blur = 10,
  window_padding = {
    left = 5,
    right = 5,
    top = 10,
    bottom = 5,
  },
}

return config
