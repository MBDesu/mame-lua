---@meta _

---Wraps MAME's `ioport_port` class, representing an emulated I/O port.
---@class ioport_port
---@field device device                      (read-only) The device that owns the I/O port.
---@field tag string                         (read-only) The absolute tag of the I/O port
---@field active string                      (read-only) A mask indicating which bits of the I/O port correspond to active fields (i.e. not unused or unassigned bits).
---@field live ioport_field_live             (read-only) The live state of the I/O port.
---@field fields table<string, ioport_field> (read-only) Gets a table of [fields](ioport_field.lua) indexed by name.
local ioport_port = {}

---Read the current input value. Returns a 32-bit integer.
---@return number
function ioport_port:read() end

---Write to the I/O port output fields that are set in the specified mask. The
---value and mask must be 32-bit integers. Note that this does not set values
---for input fields.
---@param value number
---@param mask number
function ioport_port:write(value, mask) end

---Get the first [I/O port field](ioport_field.lua) corresponding to the bits that are set in the
---specified mask, or nil if there is no corresponding field.
---@param mask number
---@return ioport_field
function ioport_port:field(mask) end

return ioport_port