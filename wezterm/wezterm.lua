local wezterm = require('wezterm')

wezterm.on('toggle-tabbar', function(window, _)
  local overrides = window:get_config_overrides() or {}
  if overrides.enable_tab_bar == false then
    wezterm.log_info('tab bar shown')
    overrides.enable_tab_bar = true
  else
    wezterm.log_info('tab bar hidden')
    overrides.enable_tab_bar = false
  end
  window:set_config_overrides(overrides)
end)

local config = wezterm.config_builder()
config = {
  color_scheme = 'OneDark (base16)',
  font = wezterm.font('SFMono Nerd Font'),
  font_size = 14,
  warn_about_missing_glyphs = false,
  window_decorations = 'RESIZE',
  window_background_opacity = 0.8,
  macos_window_background_blur = 10,
  window_close_confirmation = 'NeverPrompt',
  window_padding = {
    left = 5,
    right = 5,
    top = 10,
    bottom = 5,
  },

  enable_tab_bar = false,
  use_fancy_tab_bar = false,
  colors = {
    tab_bar = {
      background = '#282c34',
      active_tab = {
        bg_color = '#282c34',
        fg_color = '#abb2bf',
        intensity = 'Bold',
        italic = true,
      },
      inactive_tab = {
        bg_color = '#282c34',
        fg_color = '#5c6370',
        italic = false,
      },
    },
  },
  keys = {
    { key = 'n', mods = 'CTRL', action = wezterm.action.ActivateTabRelative(1) },
    { key = 'b', mods = 'CTRL', action = wezterm.action.EmitEvent('toggle-tabbar') },
    { key = 't', mods = 'CTRL', action = wezterm.action.SpawnTab('CurrentPaneDomain') },
    { key = 'w', mods = 'CTRL', action = wezterm.action.CloseCurrentPane({ confirm = false }) },
    { key = '[', mods = 'CTRL', action = wezterm.action.ScrollByPage(-0.5) },
    { key = ']', mods = 'CTRL', action = wezterm.action.ScrollByPage(0.5) },
    { key = '1', mods = 'CTRL', action = wezterm.action.ActivateTab(0) },
    { key = '2', mods = 'CTRL', action = wezterm.action.ActivateTab(1) },
    { key = '3', mods = 'CTRL', action = wezterm.action.ActivateTab(2) },
    { key = '4', mods = 'CTRL', action = wezterm.action.ActivateTab(3) },
  },
}

return config
