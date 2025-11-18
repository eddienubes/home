local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

config.font = wezterm.font({
	family = "JetBrains Mono",
	weight = "Medium",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- disable ligatures
})
config.font_size = 16.0
config.line_height = 1.0
config.enable_kitty_graphics = true

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Macchiato"
	else
		return "Catppuccin Latte"
	end
end

config.color_scheme = "Vs Code Dark+ (Gogh)"
config.window_frame = {
	font = wezterm.font({ family = "Jetbrains Mono", weight = "Bold" }),
	font_size = 12.0,
	inactive_titlebar_bg = "#1E1E1E",
	active_titlebar_bg = "#1E1E1E",
	inactive_titlebar_fg = "#cccccc",
	active_titlebar_fg = "#ffffff",
	inactive_titlebar_border_bottom = "#2b2042",
	active_titlebar_border_bottom = "#2b2042",
	button_fg = "#000000",
	button_bg = "#2b2042",
	button_hover_fg = "#ffffff",
	button_hover_bg = "#3b3052",
}
config.tab_max_width = 16

-- Format tabs to have fixed width
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local title = tab.active_pane.title
  -- Truncate or pad the title to fixed width
  local fixed_width = 16
  if #title > fixed_width then
    title = title:sub(1, fixed_width - 1) .. '…'
  else
    title = title .. string.rep(' ', fixed_width - #title)
  end
  return {
    { Text = ' ' .. title .. ' ' },
  }
end)

config.colors = {
	tab_bar = {
		inactive_tab_edge = "#000000",
	},
}
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

config.window_padding = { left = "0cell", right = "0cell", top = "0cell", bottom = "0cell" }
config.default_cursor_style = "SteadyBlock"
config.window_decorations = "RESIZE | INTEGRATED_BUTTONS | MACOS_FORCE_ENABLE_SHADOW"
config.window_content_alignment = {
	horizontal = "Center",
	vertical = "Center",
}
config.window_background_opacity = 1
config.macos_window_background_blur = 20
config.enable_scroll_bar = false
config.initial_cols = 115
config.initial_rows = 30
config.max_fps = 120

-- Allow typing Polish and other accented characters with Option key
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- Key bindings for text editor-like navigation
config.keys = {
	-- Option + Left Arrow: Move cursor one word backward
	{
		key = "LeftArrow",
		mods = "OPT",
		action = action.SendKey({
			key = "b",
			mods = "ALT",
		}),
	},
	-- Option + Right Arrow: Move cursor one word forward
	{
		key = "RightArrow",
		mods = "OPT",
		action = action.SendKey({
			key = "f",
			mods = "ALT",
		}),
	},
	-- Cmd + Left Arrow: Move cursor to beginning of line
	{
		key = "LeftArrow",
		mods = "CMD",
		action = action.SendKey({
			key = "a",
			mods = "CTRL",
		}),
	},
	-- Cmd + Right Arrow: Move cursor to end of line
	{
		key = "RightArrow",
		mods = "CMD",
		action = action.SendKey({
			key = "e",
			mods = "CTRL",
		}),
	},
	-- Option + Delete: Delete word backward
	{
		key = "Backspace",
		mods = "OPT",
		action = action.SendKey({
			key = "w",
			mods = "CTRL",
		}),
	},
	-- Cmd + Delete: Delete to beginning of line
	{
		key = "Backspace",
		mods = "CMD",
		action = action.SendKey({
			key = "u",
			mods = "CTRL",
		}),
	},
	-- Disable Option + Enter so it passes through to apps like Claude Code
	{
		key = "Enter",
		mods = "OPT",
		action = action.DisableDefaultAssignment,
	},
}

return config
