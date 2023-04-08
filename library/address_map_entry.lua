---@meta _

---Wraps MAME's `address_map_entry` class, representing an entry in a configured
---[address map](address_map.lua).
---@class address_map_entry
---@field address_start number (read-only) Start address of the entry's range.
---@field address_end number (read-only) End address of the entry's range (inclusive).
---@field address_mirror number (read-only) Address mirror bits.
---@field address_mask number (read-only) Address mask bits. Only valid for handlers.
---@field mask number (read-only) Lane mask, indicating which data lines on the bus are connected to the handler.
---@field cswidth number (read-only) The trigger width for a handler that isn't connected to all the data lines.
---@field read map_handler_data (read-only) Additional data for the read handler.
---@field write map_handler_data (read-only) Additional data for the write handler.
---@field share string|nil (read-only) Memory share tag for making RAM entries accessible or nil.
---@field region string|nil (read-only) Explicit memory region tag for ROM entries, or nil. For ROM entries, nil infers the region from the device tag.
---@field region_offset number (read-only) Starting offset in memory region for ROM entries.
local address_map_entry = {}
return address_map_entry