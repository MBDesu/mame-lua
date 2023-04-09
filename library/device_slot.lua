---@meta _

---Wraps MAME's `device_slot_interface` class which is a mix-in implemented by devices that instantiate a user-specified child device.
---@class device_slot
---@field fixed boolean                  (read-only) A Boolean indicating whether this is a slot with a card specified in machine configuration that cannot be changed by the user.
---@field has_selectable_options boolean (read-only) A Boolean indicating whether the slot has any user-selectable options (as opposed to options that can only be selected programmatically, typically for fixed slots or to load media images).
---@field options table<slot_option>     (read-only) The slot options describing the child devices that can be instantiated by the slot, indexed by option value. The `at` and `index_of` methods have O(n) complexity; all other supported operations have O(1) complexity.
---@field device device                  (read-only) The underlying [device](device.lua).
local device_slot = {}

---Wraps MAME's `device_slot_interface::slot_option` class, which represents a
---child device that a slot device can be configured to instantiate.
---@class slot_option
---@field name string (read-only) The name of the slot option. This is the value used to select this option on the command line or in an INI file.
---@field device_fullname string (read-only) The full display name of the device type instantiated by this option.
---@field device_shortname string (read-only) The short name of the device type instantiated by this option.
---@field selectable boolean (read-only) A Boolean indicating whether the option may be selected by the user (options that are not user-selectable are typically used for fixed slots or to load media images).
---@field default_bios string (read-only) The default BIOS setting for the device instantiated using this option, or `nil` if the default BIOS specified in the device's ROM definitions will be used.
---@field clock number (read-only) The configured clock frequency for the device instantiated using this option. This is an unsigned 32-bit integer. If the eight most-significant bits are all set, it is a ratio of the parent device’s clock frequency, with the numerator in bits 12-23 and the denominator in bits 0-11. If the eight most-significant bits are not all set, it is a frequency in Hertz.
local slot_option = {}

return device_slot