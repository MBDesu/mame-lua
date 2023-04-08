---@meta _

---Wraps MAME's `map_handler_data` class, which provides configuration data to
---handlers in address maps.
---@class map_handler_data
---@field handlertype 'none'|'ram'|'rom'|'nop'|'unmap'|'delegate'|'port'|'bank'|'submap'|'unknown' (read-only) Handler type. Will be one of "none", "ram", "rom", "nop", "unmap", "delegate", "port", "bank", "submap", or "unknown". Note that multiple handler type values can yield "delegate" or "unknown".
---@field bits number (read-only) Data width for the handler in bits.
---@field name string|nil (read-only) Display name for the handler, or nil.
---@field tag string|nil (read-only) Tag for I/O ports and memory banks, or nil.
local map_handler_data = {}
return map_handler_data