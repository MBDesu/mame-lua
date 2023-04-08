---@meta _

---Wraps MAME's `debug_breakpoint` class, representing a breakpoint for an
---emulated CPU device.
---@class debug_breakpoint
---@field index number (read-only) The breakpoint's index. The can be used to enable, disable or clear the breakpoint via the CPU debugger interface.
---@field enabled boolean (read/write) A Boolean indicating whether the breakpoint is currently enabled.
---@field address number (read-only) The breakpoint's address.
---@field condition string (read-only) A debugger expression evaluated each time the breakpoint is hit. The action will only be triggered if this expression evaluates to a non-zero value. An empty string if no condition was specified.
---@field action string (read-only) An action the debugger will run when the breakpoint is hit and the condition evaluates to a non-zero value. An empty string if no action was specified.
local debug_breakpoint = {}
return debug_breakpoint