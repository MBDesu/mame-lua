---@meta _

---Wraps MAME's `device_t` class, which is a base of all device classes.
---@class device
---@field tag string                                  (read-only) The device's absolute tag in canonical form.
---@field basetag string                              (read-only) The last component of the device's tag (i.e. its tag relative to its immediate parent), or `"root"` for the root machine device.
---@field name string                                 (read-only) The full display name for the device's type.
---@field shortname string                            (read-only) The short name of the devices type (this is used, e.g. on the command line, when looking for resource like ROMs or artwork, and in various data files).
---@field owner device                                (read-only) The device's immediate parent in the device tree, or nil for the root machine device.
---@field configured boolean                          (read-only) A boolean indicating whether the device has completed configuration.
---@field started boolean                             (read-only) A boolean indicating whether the device has completed starting.
---@field debug device_debug                          (read-only) The [debugger interface](device_debug.lua) to the device if it is a CPU device, or nil if it is not a CPU device or the debugger is not enabled.
---@field state table<symbol, device_state_entry|nil> (read-only) The [state entries](device_state_entry.lua) for devices that expose the register state interface, indexed by symbol, or nil for other devices. The index operator and index_of methods have O(n) complexity; all other supported operations have O(1) complexity.
---@field spaces table<string, address_space>         (read-only) A table of the device's [address spaces](address_space.lua), indexed by name. Only valid for devices that implement the memory interface. Note that the names are specific to the device type and have no special significance.
local device = {}

---Converts a tag relative to the device to an absolute tag.
---@param tag string
---@return string
function device:subtag(tag) end

---Converts a tag relative to the device's parent device to an absolute tag.
---@param tag string
---@return string
function device:siblingtag(tag) end

---Gets a memory share by tag relative to the device, or nil if no such memory
---share exists.
---@param tag string
---@return memory_share
function device:memshare(tag) end

---Gets a memory bank by tag relative to the device, or nil if no such memory
---bank exists.
---@param tag string
---@return memory_bank
function device:membank(tag) end

---Gets a memory region by tag relative to the device, or nil if no such memory
---region exists.
---@param tag string
---@return memory_region
function device:memregion(tag) end

---Gets an I/O port by tag relative to the device, or nil if no such I/O port
---exists.
---@param tag string
---@return ioport_port
function device:ioport(tag) end

---Gets a device by tag relative to the device.
---@param tag string
---@return device
function device:subdevice(tag) end

---Gets a device by tag relative to the device’s parent.
---@param tag string
---@return device
function device:siblingdevice(tag) end

---Gets a parameter value by tag relative to the device, or an empty string if
---the parameter is not set.
---@param tag string
---@return string | number | boolean | ''
function device:parameter(tag) end

return device