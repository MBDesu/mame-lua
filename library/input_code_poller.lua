---@meta _

---Wraps MAME's `input_code_poller` class, used to poll for host inputs being activated.
---@class input_code_poller
local input_code_poller = {}

---Resets the polling logic. Active switch inputs are cleared and initial analog input positions are set.
function input_code_poller:reset() end

---Returns an input code corresponding to the first relevant host input that has been activated since the last time the method was called. Returns the invalid input code if no relevant input has been activated.
function input_code_poller:poll() end

return input_code_poller