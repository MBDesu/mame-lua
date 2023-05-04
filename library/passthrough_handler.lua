---@meta _

---Tracks a pass-through handler installed in an address space. A memory
---pass-through handler receives notifications on accesses to a specified range
---of addresses, and can modify the data that is read or written if desired.
---Note that pass-through handler callbacks are not run as coroutines.
---@class passthrough_handler
---@field addrstart number (read-only) The inclusive start address of the address range monitored by the pass-through handler (i.e. the lowest address that the handler will be notified for).
---@field addrend number   (read-only) The inclusive end address of the address range monitored by the pass-through handler (i.e. the highest address that the handler will be notified for).
---@field name string      (read-only) The display name for the pass-through handler.
local passthrough_handler = {}

---Reinstalls the pass-through handler in the address space. May be necessary if
---the handler is removed due to other changes to handlers in the address space.
function passthrough_handler:reinstall() end

---Removes the pass-through handler from the address space. The associated
---callback will not be called in response to future memory accesses.
function passthrough_handler:remove() end