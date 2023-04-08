---@meta _

---Wraps MAME's `mame_machine_manager` class, which holds the running machine, UI manager, and other global components.
---
---The MAME machine manager is available as a global variable in the Lua environment.
---@class mame_machine_manager
---@field machine running_machine       (read-only) The [running machine](running_machine.lua) for the current emulation session.
---@field ui ui_manager                 (read-only) The [UI manager](ui_manager.lua) for the current emulation session.
---@field options table                 (read-only) The emulation options for the current session.
---@field plugins table<string, plugin> (read-only) Gets information about the Lua plugins that are present, indexed by name. The index `get`, `at` and `index_of` methods have O(n) complexity.
manager = {}