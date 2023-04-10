---@meta _

---Wraps MAME's `layout_view` class, representing a view that can be displayed
---in a render target. Views are created from XML layout files, which may be
---loaded from external artwork, internal to MAME, or automatically generated
---based on the screens in the emulated system. Note that layout view callbacks
---are not run as coroutines.
---@class layout_view
---@field items table<layout_view_item> (read-only) The screen and layout element items in the view. This container does not support iteration by key using pairs; only iteration by index using ipairs is supported. The key is the value of the id attribute if present. Only items with id attributes can be looked up by key. The index get method has O(1) complexity, and the at and index_of methods have O(n) complexity.
---@field name string                   (read-only) The display name for the view. This may be qualified to indicate the device that caused the layout file to be loaded when it isn't the root machine device.
---@field unqualified_name string       (read-only) The unqualified name of the view, exactly as it appears in the name attribute in the XML layout file.
---@field visible_screen_count number   (read-only) The number of screens items currently enabled in the view.
---@field effective_aspect number       (read-only) The effective width-to-height aspect ratio of the view in its current configuration.
---@field bounds render_bounds          (read-only) A render bounds object representing the effective bounds of the view in its current configuration. The coordinates are in view units, which are arbitrary but assumed to have square aspect ratio.
---@field has_art boolean               A Boolean indicating whether the view has any non-screen items, including items that are not visible because the user has hidden the item collection that they belong to.
local layout_view = {}

---Returns a Boolean indicating whether the screen is present in the view. This
---is true for screens that are present but not visible because the user has
---hidden the item collection they belong to.
---@param screen screen_device
---@return boolean
function layout_view:has_screen(screen) end

---Set a function to perform additional tasks before the view items are added to
---the render target in preparation for drawing a video frame. The function must
---accept no arguments. Call with nil to remove the callback.
---@param cb fun()
function layout_view:set_prepare_items_callback(cb) end

---Set a function to perform additional tasks after preloading visible view
---items. The function must accept no arguments. Call with nil to remove the
---callback.
---
---This function may be called when the user selects a view or makes an item
---collection visible. It may be called multiple times for a view, so avoid
---repeating expensive tasks.
---@param cb fun()
function layout_view:set_preload_callback(cb) end

---Set a function to perform additional tasks after the view's dimensions are
---recomputed. The function must accept no arguments. Call with nil to remove
---the callback.
---
---View coordinates are recomputed in various events, including the window being
---resized, entering or leaving full-screen mode, and changing the zoom to
---screen area setting.
---@param cb fun()
function layout_view:set_recomputed_callback(cb) end

return layout_view