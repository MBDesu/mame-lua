---@meta _

---Wraps MAME's `symbol_entry` class, which represents an entry in a symbol
---table. Note that symbol entries must not be used after the symbol table they
---belong to is destroyed.
---@class symbol_entry
---@field name string (read-only) The name of the symbol entry.
---@field format string (read-only) The format string used to convert the symbol entry to text for display.
---@field is_function boolean (read-only) A Boolean indicating whether the symbol entry is a callable function.
---@field is_lval boolean (read-only) A Boolean indicating whether the symbol entry is an integer symbol that can be set (i.e. whether it can be used on the left-hand side of assignment expressions).
---@field value number (read/write) The integer value of the symbol entry. Attempting to set the value raises an error if the symbol entry is read-only. Attempting to get or set the value of a function symbol raises an error.
local symbol_entry = {}
return symbol_entry