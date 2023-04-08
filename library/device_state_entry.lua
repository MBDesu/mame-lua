---@meta _

---Wraps MAME's `device_state_entry` class, which allows access to named
---registers exposed by a [device](device.lua). Supports conversion to string
---for display.
---@class device_state_entry
---@field value number (read/write) The numeric value of the state entry, as either an integer or floating-point number. Attempting to set the value of a read-only state entry raises an error.
---@field symbol string (read-only) The state entry's symbolic name.
---@field visible boolean (read-only) A Boolean indicating whether the state entry should be displayed in the debugger register view.
---@field writeable boolean (read-only) A Boolean indicating whether it is possible to modify the state entry's value.
---@field is_float boolean (read-only) A Boolean indicating whether the state entry's value is a floating-point number.
---@field datamask number (read-only) A bit mask of the valid bits of the value for integer state entries.
---@field datasize number (read-only) The size of the underlying value in bytes for integer state entries.
---@field max_length number (read-only) The maximum display string length for the state entry.
local device_state_entry = {}
return device_state_entry