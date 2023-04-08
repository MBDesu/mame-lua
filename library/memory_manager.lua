---@meta _

---Wraps MAME's `memory_manager` class, which allows the memory shares, banks
---and regions in a system to be enumerated.
---@class memory_manager
--- @field shares table<string, memory_share> The memory shares in the system, indexed by absolute tag. The at and index_of methods have O(n) complexity; all other supported operations have O(1) complexity.
--- @field banks table<string, memory_bank> The memory banks in the system, indexed by absolute tag. The at and index_of methods have O(n) complexity; all other supported operations have O(1) complexity.
--- @field regions table<string, memory_region> The memory regions in the system, indexed by absolute tag. The at and index_of methods have O(n) complexity; all other supported operations have O(1) complexity.
local memory_manager = {}
return memory_manager