---@meta _

---Wraps MAME's `debug_watchpoint` class, representing a watchpoint for an
---emulated CPU device.
---@class debug_watchpoint
---@field index number (read-only) The watchpoint's index. The can be used to enable, disable or clear the watchpoint via the CPU debugger interface.
---@field enabled boolean (read/write) A Boolean indicating whether the watchpoint is currently enabled.
---@field type 'r'|'w'|'rw' (read-only) Either "r", "w" or "rw" for a read, write or read/write watchpoint.
---@field address number (read-only) The starting address of the watchpoint's address range.
---@field length number (read-only) The length of the watchpoint's address range.
---@field condition string (read-only) A debugger expression evaluated each time the watchpoint is hit. The action will only be triggered if this expression evaluates to a non-zero value. An empty string if no condition was specified.
---@field action string (read-only) An action the debugger will run when the watchpoint is hit and the condition evaluates to a non-zero value. An empty string if no action was specified.
local debug_watchpoint = {}



return debug_watchpoint