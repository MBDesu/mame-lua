---@meta _

--Provides a description of an available Lua plugin.
---@class plugin
---@field name string             (read-only) The short name of the plugin, used in configuration and when accessing the plugin programmatically.
---@field description string      (read-only) The display name for the plugin.
---@field type 'plugin'|'library' (read-only) The plugin type. May be "plugin" for user-loadable plugins, or "library" for libraries providing common functionality to multiple plugins.
---@field directory string        (read-only) The path to the directory containing the plugin's files.
---@field start string            (read-only) A Boolean indicating whether the plugin enabled.
local plugin = {}
return plugin