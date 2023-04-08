---@meta _

---Wraps MAME's `symbol_table` class, providing named symbols that can be used
---in expressions. Note that symbol tables can be created and used even when the
---debugger is not enabled.
---@class symbol_table
---@field entries table<string, symbol_entry> The symbol entries in the symbol table, indexed by name. The at and index_of methods have O(n) complexity; all other supported operations have O(1) complexity.
---@field parent symbol_table|nil (read-only) The parent symbol table, or nil if the symbol table has no parent.
local symbol_table = {}

---Set a function to call when memory is modified via the symbol table. No
---arguments are passed to the function and any return values are ignored. Call
---with nil to remove the callback.
---@param cb fun()
function symbol_table:set_memory_modified_func(cb) end

---Adds a named integer symbol. The name must be a string. If a value is
---supplied, it must be an integer. If a value is supplied, a read-only symbol
---is added with the supplied value. If no value is supplied, a read/write
---symbol is created with and initial value of zero. If a symbol entry with the
---specified name already exists in the symbol table, it will be replaced.
---
---Returns the new symbol entry.
---@param name string
---@param value? number
---@return symbol_entry
function symbol_table:add(name, value) end

---Adds a named integer symbol using getter and optional setter callbacks. The
---name must be a string. The getter must be a function returning an integer for
---the symbol value. If supplied, the setter must be a function that accepts a
---single integer argument for the new value of the symbol. A format string for
---displaying the symbol value may optionally be supplied. If a symbol entry
---with the specified name already exists in the symbol table, it will be
---replaced.
---
---Returns the new symbol entry.
---@param name string
---@param getter fun(): integer
---@param setter? fun(value: integer)
---@param format? string
---@return symbol_entry
function symbol_table:add(name, getter, setter, format) end

---Adds a named function symbol. The name must be a string. The minimum and
---maximum numbers of parameters must be integers. If a symbol entry with the
---specified name already exists in the symbol table, it will be replaced.
---
---Returns the new symbol entry.
---@param name string
---@param minparams number
---@param maxparams number
---@param execute unknown
---@return symbol_entry
function symbol_table:add(name, minparams, maxparams, execute) end

---Returns the symbol entry with the specified name, or nil if there is no
---symbol with the specified name in the symbol table.
---@param name string
---@return symbol_entry|nil
function symbol_table:find(name) end

---Returns the symbol entry with the specified name, or nil if there is no
---symbol with the specified name in the symbol table or any of its parent
---symbol tables.
---@param name string
---@return symbol_entry|nil
function symbol_table:find_deep(name) end

---Returns the integer value of the symbol with the specified name, or zero if
---there is no symbol with the specified name in the symbol table or any of its
---parent symbol tables. Raises an error if the symbol with specified name is a
---function symbol.
---@param name string
---@return number
function symbol_table:value(name) end

---Sets the value of the symbol with the specified name. Raises an error if the
---symbol with the specified name is a read-only integer symbol or if it is a
---function symbol. Has no effect if there is no symbol with the specified name
---in the symbol table or any of its parent symbol tables.
---@param name string
---@param value number
function symbol_table:set_value(name, value) end

---Read a value from memory. Supply the name or tag of the address space or
---memory region to read from, or nil to use the address space or memory region
---implied by the space argument. See memory accesses in debugger expressions
---for access type specifications that can be used for the space argument. The
---access size is specified in bytes, and must be 1, 2, 4 or 8. The disable_se
---argument specifies whether memory access side effects should be disabled.
---@param name string
---@param space string
---@param offset number
---@param size 1|2|4|8
---@param disable_se boolean
---@return number
function symbol_table:memory_value(name, space, offset, size, disable_se) end

---Write a value to memory. Supply the name or tag of the address space or
---memory region to write to, or nil to use the address space or memory region
---implied by the space argument. See memory accesses in debugger expressions
---for access type specifications that can be used for the space argument. The
---access size is specified in bytes, and must be 1, 2, 4 or 8. The disable_se
---argument specifies whether memory access side effects should be disabled.
---@param name string
---@param space string
---@param offset number
---@param value number
---@param size 1|2|4|8
---@param disable_se boolean
function symbol_table:set_memory_value(name, space, offset, value, size, disable_se) end

---Read a value from an address space. The access size is specified in bytes,
---and must be 1, 2, 4, or 8. If the apply_translation argument is true, the
---address will be translated with debug read intention. Returns a value of the
---requested size with all bits set if address translation fails.
---@param space string
---@param address number
---@param size 1|2|4|8
---@param apply_translation boolean
---@return number
function symbol_table:read_memory(space, address, size, apply_translation) end

---Write a value to an address space. The access size is specified in bytes, and
---must be 1, 2, 4, or 8. If the apply_translation argument is true, the address
---will be translated with debug write intention. The symbol table's memory
---modified function will be called after the value is written. The value will
---not be written and the symbol table's memory modified function will not be
---called if address translation fails.
---@param space string
---@param address number
---@param data number
---@param size 1|2|4|8
---@param apply_translation boolean
function symbol_table:write_memory(space, address, data, size, apply_translation) end

return symbol_table