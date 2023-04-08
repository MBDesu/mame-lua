---@meta _

---Wraps MAME's `address_map` class, used to configure handlers for an address
---space.
---@class address_map
---@field spacenum number (read-only) The address space number of the address space the map is associated with.
---@field device device (read-only) The device that owns the address space the map is associated with.
---@field unmap_value number (read-only) The constant value to return from unmapped reads.
---@field global_mask number (read-only) Global mask to be applied to all addresses when accessing the space.
---@field entries table<address_map_entry> (read-only) The configured entries in the address map. Uses 1-based integer indices. The index operator and the at method have O(n) complexity.
local address_map = {}
return address_map