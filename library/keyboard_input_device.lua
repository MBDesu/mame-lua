---@meta _

---Represents a keyboard or keypad input device managed by the
---[natural keyboard manager](natural_keyboard.lua).
---@class keyboard_input_device
---@field device string (read-only) The underlying device.
---@field tag string (read-only) The absolute tag of the underlying device.
---@field basetag string (read-only) The last component of the tag of the underlying device, or "root" for the root machine device.
---@field name string (read-only) The human-readable description of the underlying device type.
---@field shortname string (read-only) The identifier for the underlying device type.
---@field is_keypad boolean (read-only) A Boolean indicating whether the underlying device has keypad inputs but no keyboard inputs. This is used when determining which keyboard input devices should be enabled by default.
---@field enabled boolean (read/write) A Boolean indicating whether the device's keyboard and/or keypad inputs are enabled.
local keyboard_input_device = {}
return keyboard_input_device