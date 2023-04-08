---@meta _

---Wraps MAME's `input_seq` class, representing a combination of host inputs
---that can be read or assigned to an emulated input. Input sequences can be
---manipulated using [input manager](input_manager.lua) methods. Use an
---[`input sequence poller`](input_sequence_poller.lua) to obtain an input
---sequence from the user. 
---@class input_seq
---@field empty boolean      (read-only) A Boolean indicating whether the input sequence is empty (contains no items, indicating an unassigned input).
---@field length number      (read-only) The number of items in the input sequence.
---@field is_valid boolean   (read-only) A Boolean indicating whether the input sequence is a valid. To be valid, it must contain at least one item, all items must be valid codes, all product groups must contain at least one item that is not negated, and items referring to absolute and relative axes must not be mixed within a product group.
---@field is_default boolean (read-only) A Boolean indicating whether the input sequence specifies that the default setting should be used.
local input_seq = {}

---Clears the input sequence, removing all items.
function input_seq:reset() end

---Sets the input sequence to a single item containing the metavalue specifying
---that the default setting should be used.
function input_seq:set_default() end

return input_seq