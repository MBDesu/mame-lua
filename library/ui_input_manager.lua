---@meta _

---Wraps MAME's `ui_input_manager` class, which is used for high-level input.
---@class ui_input_manager
---@field presses_enabled boolean (read/write) Whether the UI input manager will check for UI inputs frame updates.
local ui_input_manager = {}

---Clears pending events and UI input states. Should be called when leaving a
---modal state where input is handled directly (e.g. configuring an input
---combination).
function ui_input_manager:reset() end

---Returns host system mouse pointer X position, Y position, button state, and
---the render target it falls in. The position is in host pixels, where zero is
---at the top/left. The button state is a Boolean indicating whether the primary
---mouse button is pressed.
---
---If the mouse pointer is not over one of MAME's windows, this may return the
---position and render target from when the mouse pointer was most recently over
---one of MAME's windows. The render target may be nil if the mouse pointer is
---not over one of MAME's windows.
---@return number x, number y, boolean button, render_target|nil rt
function ui_input_manager:find_mouse() end

---Returns a Boolean indicating whether the specified UI input has been pressed.
---The input type is an enumerated value.
---@param type input_type_entry|number
---@return boolean
function ui_input_manager:pressed(type) end

---Returns a Boolean indicating whether the specified UI input has been pressed
---or auto-repeat has been triggered at the specified speed. The input type is
---an enumerated value; the speed is an interval in sixtieths of a second.
---@param type input_type_entry|number
---@param speed number
---@return boolean
function ui_input_manager:pressed_repeat(type, speed) end

return ui_input_manager