---@meta _

---Wraps MAME's `mame_ui_manager` class, which handles menus and other user interface functionality.
---@class ui_manager
---@field line_height number    (read-only) The configured UI text line height as a proportion of the height of the UI container.
---@field menu_active boolean   (read-only) A Boolean indicating whether an interactive UI element is currently active. Examples include menus and slider controls.
---@field ui_active boolean     (read/write) A Boolean indicating whether UI control inputs are currently enabled.
---@field single_step boolean   (read/write) A Boolean controlling whether the emulated system should be automatically paused when the next frame is drawn. This property is automatically reset when the automatic pause happens.
---@field show_fps boolean      (read/write) A Boolean controlling whether the current emulation speed and frame skipping settings should be displayed.
---@field show_profiler boolean (read/write) A Boolean controlling whether profiling statistics should be displayed.
---@field options unknown       (read-only) The UI options for the current session.
local ui_manager = {}

---Gets the width of a Unicode character as a proportion of the width of the UI
---container in the current font at the configured UI line height.
---@param ch string
---@return number
function ui_manager:get_char_width(ch) end

---Gets the width of a string as a proportion of the width of the UI container
---in the current font at the configured UI line height.
---@param str string
---@return number
function ui_manager:get_string_width(str) end

---On some platforms, this controls whether MAME should accept input focus in
---more situations than when its windows have UI focus.
---@param enable boolean
function ui_manager:set_aggressive_input_focus(enable) end

---Gets a description of the configured [input sequence](input_seq.lua) for the
---specified input type and player suitable for using in prompts. The input type
---is an enumerated value. The player number is a zero-based index. If the
---player number is not supplied, it is assumed to be zero.
---@param type number
---@param player? number
---@return input_seq
function ui_manager:get_general_input_setting(type, player) end

return ui_manager