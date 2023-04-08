---@meta _

---Wraps MAME's `image_device_format` class, which describes a media file format
---supported by a media image device.
---@class image_device_format
---@field name string (read-only) An abbreviated name used to identify the format. This often matches the primary filename extension used for the format.
---@field description string (read-only) The full display name of the format.
---@field extensions table (read-only) Yields a table of filename extensions used for the format.
---@field option_spec string (read-only) A string describing options available when creating a media image using this format. The string is not intended to be human-readable.  local image_device_format = {}
local image_device_format = {}
return image_device_format