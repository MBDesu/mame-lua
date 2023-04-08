---@meta _

---Wraps MAME's `parameters_manager` class, which provides a simple key-value store for metadata from system ROM definitions.
---@class parameters_manager
local parameters_manager = {}

---Gets the value for the specified parameter if it is set, or an empty string
---if it is not set.
---@param tag string
---@return any
function parameters_manager:lookup(tag) end

---Sets the specified parameter if it is not set. Has no effect if the specified
---parameter is already set.
---@param tag string
---@param value any
function parameters_manager:add(tag, value) end

return parameters_manager