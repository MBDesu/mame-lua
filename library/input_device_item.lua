---@meta _

---Wraps MAME's `input_device_Item` class, representing a single host input (e.g. a key, button, or axis).
---@class input_device_item
---@field name number (read-only) The display name of the input item. Note that this is just the name of the item itself, and does not include the device name. The full display name for the item can be obtained by calling the code_name method on the input manager with the item’s code.
---@field code string (read-only) The input item's identification code. This is used by several input manager methods.
---@field token number (read-only) The input item's token string. Note that this is a token fragment for the item itself, and does not include the device portion. The full token for the item can be obtained by calling the code_to_token method on the input manager with the item’s code.
---@field current number (read-only) The item's current value. This is a signed integer where zero is the neutral position.
local input_device_item = {}
return input_device_item