---@meta _

---Wraps MAME's `address_space` class, which represents an address space
---belonging to a device.
---@class address_space
---@field name string (read-only) The display name for the address space.
---@field shift number (read-only) The address granularity for the address space specified as the shift required to translate a byte address to a native address. Positive values shift towards the most significant bit (left) and negative values shift towards the least significant bit (right).
---@field index number (read-only) The zero-based space index. Some space indices have special meanings for the debugger.
---@field address_mask number (read-only) The address mask for the space.
---@field data_width number (read-only) The data width for the space in bits.
---@field endianness 'big'|'little' (read-only) The Endianness of the space (`"big"` or `"little"`).
---@field map address_map (read-only) The configured address map for the space or nil.
local address_space = {}
return address_space