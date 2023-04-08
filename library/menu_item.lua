---@meta _

---@class menu_item
---@field text string The title of the menu item
---@field subtext string The label for the menu item's value
---@field flags 'off' | 'on' | 'l' | 'lr' | 'invert' | 'heading' | string Flags that change the nav label or title behavior. Can be combined.
local menu_item = {}