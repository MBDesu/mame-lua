---@meta _

---Wraps MAME's `layout_view_item class`, representing an item in a view. An
---item is drawn as a rectangular textured surface. The texture is supplied by
---an emulated screen or a layout element. Note that layout view item callbacks
---are not run as coroutines.
---@class layout_view_item
---@field id number (read-only) Get the optional item identifier. This is the value of the id attribute in the XML layout file if present, or nil.
---@field bounds_animated boolean (read-only) A Boolean indicating whether the item''s bounds depend on its animation state.
---@field color_animated boolean (read-only) A Boolean indicating whether the item's colour depends on its animation state.
---@field bounds render_bounds (read-only) The item's bounds for the current state. This is a render bounds object in render target coordinates.
---@field color render_color (read-only) The item's colour for the current state. The colour of the screen or element texture is multiplied by this colour. This is a render colour object.
---@field scroll_wrap_x boolean (read-only) A Boolean indicating whether the item wraps horizontally.
---@field scroll_wrap_y boolean (read-only) A Boolean indicating whether the item wraps vertically.
---@field scroll_size_x number (read/write) Get the item's horizontal scroll window size for the current state, or set the horizontal scroll window size to use in the absence of bindings. This is a floating-point value representing a proportion of the associated element's width.
---@field scroll_size_y number (read/write) Get the item's vertical scroll window size for the current state, or set the vertical scroll window size to use in the absence of bindings. This is a floating-point value representing a proportion of the associated element's height.
---@field scroll_pos_x number (read/write) Get the item's horizontal scroll position for the current state, or set the horizontal scroll position size to use in the absence of bindings. This is a floating-point value.
---@field scroll_pos_y number (read/write) Get the item's vertical scroll position for the current state, or set the vertical position size to use in the absence of bindings. This is a floating-point value.
---@field blend_mode -1|0|1|2|3 (read-only) Get the item's blend mode. This is an integer value, where 0 means no blending, 1 means alpha blending, 2 means RGB multiplication, 3 means additive blending, and -1 allows the items within a container to specify their own blending modes.
---@field orientation number (read-only) Get the item orientation flags. This is an integer bit mask, where bit 0 (0x01) is set to mirror horizontally, bit 1 (0x02) is set to mirror vertically, and bit 2 (0x04) is set to mirror along the top left-bottom right diagonal.
---@field element_state unknown (read-only) Get the current element state. This will call the element state callback function to handle bindings.
---@field animation_state unknown (read-only) Get the current animation state. This will call the animation state callback function to handle bindings.
local layout_view_item = {}

---Set a function to call to obtain the multiplier colour for the item. The
---function must accept no arguments and return a render colour object. Call
---with nil to restore the default colour callback (based on the item's
---animation state and color child elements in the XML layout file).
---
---Note that the function must not access the item's color property, as this
---will result in infinite recursion.
---@param cb fun(): render_color
function layout_view_item:set_color_callback(cb) end

---Set a function to call to obtain the size of the horizontal scroll window as
---a proportion of the associated element's width. The function must accept no
---arguments and return a floating-point value. Call with nil to restore the
---default horizontal scroll window size callback (based on the xscroll child
---element in the XML layout file).
---
---Note that the function must not access the item's scroll_size_x property, as
---this will result in infinite recursion.
---@param cb fun(): number
function layout_view_item:set_scroll_size_x_callback(cb) end

---Set a function to call to obtain the size of the vertical scroll window as a
---proportion of the associated element's height. The function must accept no
---arguments and return a floating-point value. Call with nil to restore the
---default vertical scroll window size callback (based on the yscroll child
---element in the XML layout file).
---
---Note that the function must not access the item's scroll_size_y property, as
---this will result in infinite recursion.
---@param cb fun(): number
function layout_view_item:set_scroll_size_y_callback(cb) end

---Set a function to call to obtain the horizontal scroll position. A value of
---zero places the horizontal scroll window at the left edge of the associated
---element. If the item does not wrap horizontally, a value of 1.0 places the
---horizontal scroll window at the right edge of the associated element; if the
---item wraps horizontally, a value of 1.0 corresponds to wrapping back to the
---left edge of the associated element. The function must accept no arguments
---and return a floating-point value. Call with nil to restore the default
---horizontal scroll position callback (based on bindings in the xscroll child
---element in the XML layout file).
---
---Note that the function must not access the item's scroll_pos_x property, as
---this will result in infinite recursion.
---@param cb fun(): number
function layout_view_item:set_scroll_pos_x_callback(cb) end

---Set a function to call to obtain the vertical scroll position. A value of
---zero places the vertical scroll window at the top edge of the associated
---element. If the item does not wrap vertically, a value of 1.0 places the
---vertical scroll window at the bottom edge of the associated element; if the
---item wraps vertically, a value of 1.0 corresponds to wrapping back to the
---left edge of the associated element. The function must accept no arguments
---and return a floating-point value. Call with nil to restore the default
---vertical scroll position callback (based on bindings in the yscroll child
---element in -the XML layout file).
---
---Note that the function must not access the item's scroll_pos_y property, as
---this will result in infinite recursion.
---@param cb fun(): number
function layout_view_item:set_scroll_pos_y_callback(cb) end

return layout_view_item