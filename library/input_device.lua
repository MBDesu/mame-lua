---@meta _

---Wraps MAME's `input_device` class, representing a host input device.
---@class input_device
---@field name string (read-only) Display name for the device. This is not guaranteed to be unique.
---@field id string (read-only) Unique identifier string for the device. This may not be human-readable.
---@field devindex number (read-only) Device index within the device class. This is not necessarily the same as the index in the devices property of the device class - the devindex indices may not be contiguous.
---@field items table<number, input_device_item> (read-only) Gets a table of input items, indexed by item ID. The item ID is an enumerated value.
local input_device = {}
return input_device