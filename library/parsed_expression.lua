---@meta _

---Wraps MAME's `parsed_expression` class, which represents a tokenised debugger
---expression. Note that parsed expressions can be created and used even when
---the debugger is not enabled.
---@class parsed_expression
---@field is_empty boolean (read-only) A Boolean indicating whether the expression contains no tokens.
---@field original_string string (read-only) The original string that was parsed to create the expression.
---@field symbols symbol_table (read/write) The symbol table used for to look up symbols in the expression.
local parsed_expression = {}

---Set the default base for interpreting numeric literals. The base must be a
---positive integer.
---@param base number
function parsed_expression:set_default_base(base) end

---Parse a debugger expression string. Replaces the current contents of the
---expression if it is not empty. Raises an expression error if the string
---contains syntax errors or uses undefined symbols. The previous content of the
---expression is not preserved when attempting to parse an invalid expression
---string.
---@param string string
function parsed_expression:parse(string) end

---Evaluates the expression, returning an unsigned integer result. Raises an
---expression error if the expression cannot be evaluated (e.g. attempting to
---call a function with an invalid number of arguments).
---@return number
function parsed_expression:execute() end

return parsed_expression