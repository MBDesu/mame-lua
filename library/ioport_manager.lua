---@meta _

---Wraps MAME's `ioport_manager` class, which provides access to emulated I/O ports and handles input configuration.
---@class ioport_manager
---@field types table<number, input_type_entry> (read-only) Gets the supported input types. Keys are arbitrary indices. All supported operations have O(1) complexity.
---@field ports table<string, ioport_port>      Gets the emulated I/O ports in the system. Keys are absolute tags. The `at` and `index_of` methods have O(n) complexity; all other supported operations have O(1) complexity.
local ioport_manager = {}

---Returns the number of player controllers in the system.
---@return number
function ioport_manager:count_players() end

---Returns a boolean indicating whether the specified input is currently
---pressed. The input type may be an enumerated value or an
---[input type entry](input_type_entry.lua). If the input type is an enumerated
---value, the player number may be supplied as a zero-based index; if the player
---number is not supplied, it is assumed to be zero. If the input type is an
---input type entry, the player number may not be supplied separately.
---@param type input_type_entry | number
---@param player? number
---@return boolean
function ioport_manager:type_pressed(type, player) end

---Returns the display name for the specified input type and player number. The
---input type is an enumerated value. The player number is a zero-based index.
---If the player number is not supplied, it is assumed to be zero.
---@param type number
---@param player? number
---@return string
function ioport_manager:type_name(type, player) end

---Returns the input group for the specified input type and player number. The
---input type is an enumerated value. The player number is a zero-based index.
---Returns an integer giving the grouping for the input. If the player number is
---not supplied, it is assumed to be zero.
---
---This should be called with values obtained from I/O port fields to provide
---canonical grouping in an input configuration UI.
---@param type number
---@param player any
---@return number
function ioport_manager:type_group(type, player) end

---Get the configured [input sequence](input_seq.lua) for the specified input
---type, player number and sequence type. The input type may be an enumerated
---value or an [input type entry](input_type_entry.lua). If the input type is an
---enumerated value, the player number may be supplied as a zero-based index; if
---the player number is not supplied, it is assumed to be zero. If the input
---type is an input type entry, the player number may not be supplied
---separately. If the sequence type is supplied, it must be `"standard"`,
---`"increment"` or `"decrement"`; if it is not supplied, it is assumed to be
---`"standard"`.
---
---This provides access to general input configuration.
---@param type number | input_type_entry
---@param player? number
---@param seqtype? 'standard' | 'increment' | 'decrement'
function ioport_manager:type_seq(type, player, seqtype) end

---Set the configured [input sequence](input_seq.lua) for the specified input
---type, player number and sequence type. The input type may be an enumerated
---value or an [input type entry](input_type_entry.lua). If the input type is an
---enumerated value, the player number must be supplied as a zero-based index.
---If the input type is an input type entry, the player number may not be
---supplied separately. The sequence type must be `"standard"`, `"increment"` or
---`"decrement"`.
---
---This allows general input configuration to be set.
---@param type number | input_type_entry
---@param player? number
---@param seqtype 'standard' | 'increment' | 'decrement'
---@param seq input_seq
function ioport_manager:set_type_seq(type, player, seqtype, seq) end

---Returns the input type and player number for the specified input type token
---string.
---@param string string
---@return input_type_entry
function ioport_manager:token_to_input_type(string) end

---Returns the token string for the specified input type and player number. If
---the player number is not supplied, it assumed to be
---zero.
---@param type input_type_entry
---@param player? number
function ioport_manager:input_type_to_token(type, player) end

return ioport_manager