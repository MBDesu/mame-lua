---@meta _

---Wraps MAME's `input_type_entry` class, representing an emulated input type or emulator UI input type. Input types are uniquely identified by the combination of their enumerated type value and player index.
---@class input_type_entry
---@field type number       (read-only) An enumerated value representing the type of input.
---@field group number      (read-only) An integer giving the grouping for the input type. Should be used to provide canonical grouping in an input configuration UI.
---@field player number     (read-only) The zero-based player number, or zero for non-player controls.
---@field token string      (read-only) The token string for the input type, used in configuration files.
---@field name number       (read-only) The display name for the input type.
---@field is_analog boolean (read-only) A Boolean indicating whether the input type is analog or digital. Inputs that only have on and off states are considered digital, while all other inputs are considered analog, even if they can only represent discrete values or positions.
local input_type_entry = {}
return input_type_entry