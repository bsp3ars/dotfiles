local wezterm = require "wezterm"
local act = wezterm.action
local mux = wezterm.mux

-- Start Window Maximized (https://wezterm.org/config/lua/gui-events/gui-startup.html)
wezterm.on(
    "gui-startup",
    function(cmd)
        local tab, pane, window = mux.spawn_window(cmd or {})
        window:gui_window():maximize()
    end
)

local scheme = wezterm.get_builtin_color_schemes()["Dracula+"]
scheme.scrollbar_thumb = "#f8f8f2"

-- Config
return {
    -- Cursor
    animation_fps = 120,
    cursor_blink_ease_in = "EaseOut",
    cursor_blink_ease_out = "EaseOut",
    cursor_blink_rate = 650,
    default_cursor_style = "BlinkingBlock",
  
    -- Keys
    keys = {
        -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior (https://wezterm.org/config/lua/keyassignment/SendKey.html)
        {
            key = "LeftArrow",
            mods = "OPT",
            action = act.SendKey {key = "b", mods = "ALT"}
        },
        {
            key = "RightArrow",
            mods = "OPT",
            action = act.SendKey {key = "f", mods = "ALT"}
        },
        {
            key = "K",
            mods = "CTRL|SHIFT",
            action = act.Multiple {
                act.ClearScrollback "ScrollbackAndViewport"
                --   act.SendKey { key = "L", mods = "CTRL" },
            }
        },
        {   key = "Backspace",
            mods = "CTRL",
            action = act.SendKey {key = "w", mods = "CTRL"}
        },
    },
    
    -- Launch Menu
    launch_menu = {
        {
            label = "laptop-4961 (local ssh)",
            args = {"ssh", "brandon@192.168.1.140"}
        }
    },
    
    -- Quality of Life
    automatically_reload_config = true,
    audible_bell = "Disabled",
    enable_scroll_bar = true,
    front_end = "WebGpu",
    max_fps = 120,
    scrollback_lines = 20000,
    webgpu_power_preference = "HighPerformance",
  
    -- Tab Bar
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = false,
    -- tab_max_width = 25,
    show_tab_index_in_tab_bar = false,
    switch_to_last_active_tab_when_closing_tab = true,
  
    -- Theme
    color_schemes = {
        ["Dracula+ Modified"] = scheme
    },
    color_scheme = "Dracula+ Modified",
    font = wezterm.font("JetBrains Mono", {weight = "Medium"}),
    window_background_opacity = 0.98,
  
    -- Window
    adjust_window_size_when_changing_font_size = false,
    inactive_pane_hsb = {
        saturation = 1,
        brightness = 1
    },
    visual_bell = {
        fade_in_function = "EaseIn",
        fade_in_duration_ms = 250,
        fade_out_function = "EaseOut",
        fade_out_duration_ms = 250,
        target = "CursorColor"
    },
    window_close_confirmation = "NeverPrompt",
    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10
    },
}
