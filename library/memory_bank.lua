---@meta _

---Wraps MAME's `memory_bank` class, representing a named memory zone
---indirection.
---@class memory_bank
---@field tag string (read-only) The absolute tag of the memory bank.
---@field entry number (read/write) The currently selected zero-based entry number.
local memory_bank = {}
return memory_bank