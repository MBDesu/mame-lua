---@meta _

---Provides some metadata for an emulated system.
---@class driver_metadata
---@field name string (read-only) The short name of the system, as used on the command line, in configuration files, and when searching for resources.
---@field description string (read-only) The full display name for the system.
---@field year string (read-only) The release year for the system. May contain question marks if not known definitively.
---@field manufacturer string (read-only) The manufacturer, developer or distributor of the system.
---@field parent string (read-only) The short name of parent system for organisation purposes, or `"0"` if the system has no parent.
---@field compatible_with string (read-only) The short name of a system that this system is compatible with software for, or `nil` if the system is not listed as compatible with another system.
---@field source_file string (read-only) The source file where this system driver is defined. The path format depends on the toolchain the emulator was built with.
---@field rotation 'rot0'|'rot90'|'rot180'|'rot270' (read-only) A string indicating the rotation applied to all screens in the system after the screen orientation specified in the machine configuration is applied. Will be one of `"rot0"`, `"rot90"`, `"rot180"` or `"rot270"`.
---@field not_working boolean (read-only) A Boolean indicating whether the system is marked as not working.
---@field supports_save boolean (read-only) A Boolean indicating whether the system supports save states.
---@field no_cocktail boolean (read-only) A Boolean indicating whether screen flipping in cocktail mode is unsupported.
---@field is_bios_root boolean (read-only) A Boolean indicating whether this system represents a system that runs software from removable media without media present.
---@field requires_artwork boolean (read-only) A Boolean indicating whether the system requires external artwork to be usable.
---@field clickable_artwork boolean (read-only) A Boolean indicating whether the system requires clickable artwork features to be usable.
---@field unofficial boolean (read-only) A Boolean indicating whether this is an unofficial but common user modification to a system.
---@field no_sound_hw boolean (read-only) A Boolean indicating whether the system has no sound output hardware.
---@field mechanical boolean (read-only) A Boolean indicating whether the system depends on mechanical features that cannot be properly simulated.
---@field is_incomplete boolean (read-only) A Boolean indicating whether the system is a prototype with incomplete functionality.
local driver_metadata = {}
return driver_metadata