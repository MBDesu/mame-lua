---@meta _

---Wraps MAME's `input_class` class, representing a category of host input
---devices (e.g. keyboards or joysticks).
---@class input_class
---@field name string (read-only) The device class name.
---@field enabled boolean (read-only) A Boolean indicating whether the device class is enabled.
---@field multi boolean (read-only) A Boolean indicating whether the device class supports multiple devices, or inputs from all devices in the class are combined and treated as a single device.
---@field devices table<input_device> (read-only) Gets a table of host input devices in the class. Keys are one-based indices.
local input_class = {}
return input_class