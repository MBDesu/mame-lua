---@meta _

---Wraps MAME's 1debugger_manager` class, providing the main interface to
---control the debugger.
---@class debugger_manager
---@field consolelog unknown (read-only) The lines in the console log (output from debugger commands). This container only supports index and length operations.
---@field errorlog unknown (read-only) The lines in the error log (`logerror` output). This container only supports index and length operations.
---@field visible_cpu device_debug (read/write) The CPU device with debugger focus. Changes become visible in the debugger console after the next step. Setting to a device that is not a CPU has no effect.
---@field execution_state 'run'|'stop' (read/write) Either `"run"` if the emulated system is running, or `"stop"` if it is stopped in the debugger.
local debugger_manager = {}

---Execute a debugger console command. The argument is the command string. The
---output is sent to both the debugger console and the Lua console.
---@param str string
function debugger_manager:command(str) end

return debugger_manager