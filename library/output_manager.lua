---@meta _

---Wraps MAME's `output_manager` class, providing access to system outputs that
---can be used for interactive artwork or consumed by external programs.
---@class output_manager
local output_manager = {}

---Sets the specified output value. The value must be an integer. The output
---will be created if it does not already exist.
---@param name string
---@param val number
function output_manager:set_value(name, val) end

---Appends the index (formatted as a decimal integer) to the prefix and sets the
---value of the corresponding output. The value must be an integer. The output
---will be created if it does not already exist.
---@param prefix string
---@param index number
---@param val number
function output_manager:set_indexed_value(prefix, index, val) end

---Returns the value of the specified output, or zero if it doesn't exist.
---@param name string
---@return number
function output_manager:get_value(name) end

---Appends the index (formatted as a decimal integer) to the prefix and returns
---the value of the corresponding output, or zero if it doesn't exist.
---@param prefix string
---@param index number
---@return string
function output_manager:get_indexed_value(prefix, index) end

---Gets the per-session unique integer ID for the specified output, or zero if
---it doesn't exist.
---@param name string
---@return number
function output_manager:name_to_id(name) end

---Gets the name for the output with the specified per-session unique ID, or nil
---if it doesn't exist. This method has O(n) complexity, so avoid calling it
---when performance is important.
---@param id any
---@return string
function output_manager:id_to_name(id) end

return output_manager