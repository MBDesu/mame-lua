---@meta _

---Wraps MAME's `device_debug` class, providing the debugger interface to an
---emulated CPU device.
---@class device_debug
local device_debug = {}

---Step by the specified number of instructions. If the instruction count is not
---provided, it defaults to a single instruction.
---@param cnt? number
function device_debug:step(cnt) end

---Run the emulated CPU.
function device_debug:go() end

---Set a breakpoint at the specified address, with an optional condition and
---action. If the action is not specified, it defaults to just breaking into the
---debugger. Returns the breakpoint number for the new breakpoint.
---
---If specified, the condition must be a debugger expression that will be
---evaluated each time the breakpoint is hit. Execution will only be stopped if
---the expression evaluates to a non-zero value. If the condition is not
---specified, it defaults to always active.
---@param addr number
---@param cond? string
---@param act? string
function device_debug:bpset(addr, cond, act) end

---Enable the specified breakpoint, or all breakpoints for the device if no
---breakpoint number is specified. Returns whether the specified number matched
---a breakpoint if a breakpoint number is specified, or nil if no breakpoint
---number is specified.
---@param bp? debug_breakpoint
---@return boolean|nil
function device_debug:bpenable(bp) end

---Disable the specified breakpoint, or all breakpoints for the device if no
---breakpoint number is specified. Returns whether the specified number matched
---a breakpoint if a breakpoint number is specified, or nil if no breakpoint
---number is specified.
---@param bp? debug_breakpoint
---@return boolean|nil
function device_debug:bpdisable(bp) end

---Clear the specified breakpoint, or all breakpoints for the device if no
---breakpoint number is specified. Returns whether the specified number matched
---a breakpoint if a breakpoint number is specified, or nil if no breakpoint
---number is specified.
---@param bp? debug_breakpoint
---@return boolean|nil
function device_debug:bpclear(bp) end

---Returns a table of breakpoints for the device. The keys are the breakpoint
---numbers, and the values are breakpoint objects.
---@return table<number, debug_breakpoint>
function device_debug:bplist() end

---Set a watchpoint over the specified address range, with an optional condition
---and action. The type must be "r", "w" or "rw" for a read, write or read/write
---breakpoint. If the action is not specified, it defaults to just breaking into
---the debugger. Returns the watchpoint number for the new watchpoint.
---
---If specified, the condition must be a debugger expression that will be
---evaluated each time the breakpoint is hit. Execution will only be stopped if
---the expression evaluates to a non-zero value. The variable 'wpaddr' is set to
---the address that actually triggered the watchpoint, the variable 'wpdata' is
---set to the data that is being read or written, and the variable 'wpsize' is
---set to the size of the data in bytes. If the condition is not specified, it
---defaults to always active.
---@param space address_space
---@param type 'r'|'w'|'rw'
---@param addr number
---@param len number
---@param cond? string
---@param act? string
function device_debug:wpset(space, type, addr, len, cond, act) end

---Enable the specified watchpoint, or all watchpoints for the device if no
---watchpoint number is specified. Returns whether the specified number matched
---a watchpoint if a watchpoint number is specified, or nil if no watchpoint
---number is specified.
---@param wp? debug_watchpoint
---@return boolean|nil
function device_debug:wpenable(wp) end

---Disable the specified watchpoint, or all watchpoints for the device if no
---watchpoint number is specified. Returns whether the specified number matched
---a watchpoint if a watchpoint number is specified, or nil if no watchpoint
---number is specified.
---@param wp? debug_watchpoint
---@return boolean|nil
function device_debug:wpdisable(wp) end

---Clear the specified watchpoint, or all watchpoints for the device if no
---watchpoint number is specified. Returns whether the specified number matched
---a watchpoint if a watchpoint number is specified, or nil if no watchpoint
---number is specified.
---@param wp? debug_watchpoint
---@return boolean|nil
function device_debug:wpclear(wp) end

---Returns a table of watchpoints for the specified address space of the device.
---The keys are the watchpoint numbers, and the values are watchpoint objects.
---@param space address_space
---@return table<number, debug_watchpoint>
function device_debug:wplist(space) end

return device_debug