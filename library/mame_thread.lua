---@meta _

---@class mame_thread
---@field result string The result of a terminated or yielding thread
---@field busy boolean `true` if busy, `false` if not
---@field yield boolean `true` if yielding, `false` if not
local mame_thread = {}

---Run Lua script, passed as a string, in a separate thread, in a new (other
---than modules) Lua context. Thread runs until `yield` and/or terminates on
---return.
---@param script string
function mame_thread:start(script) end

---Resume a yielding script and pass it `value`
---@param value any
function mame_thread:continue(value) end

return mame_thread