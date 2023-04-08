---@meta _

---Wraps MAME's `render_bounds` class, which represents a rectangle using
---floating-point coordinates.
---@class render_bounds
---@field x0 number     (read/write) The leftmost coordinate in the rectangle (i.e. the X coordinate of the left edge or the top left corner).
---@field x1 number     (read/write) The rightmost coordinate in the rectangle (i.e. the X coordinate of the right edge or the bottom right corner).
---@field y0 number     (read/write) The topmost coordinate in the rectangle (i.e. the Y coordinate of the top edge or the top left corner).
---@field y1 number     (read/write) The bottommost coordinate in the rectangle (i.e. the Y coordinate of the bottom edge or the bottom right corner).
---@field width number  (read/write) The width of the rectangle. Setting this property changes the position of the rightmost edge.
---@field height number (read/write) The height of the rectangle. Setting this property changes the position of the bottommost edge.
---@field aspect number (read-only) The width-to-height aspect ratio of the rectangle. Note that this is often in render target coordinates which don’t necessarily have equal X and Y scales. A rectangle representing a square in the final output doesn’t necessarily have an aspect ratio of 1.
local render_bounds = {}

---Returns a Boolean indicating whether the specified point falls within the
---rectangle. The rectangle must be normalised for this to work (right greater
---than left and bottom greater than top).
---
---The arguments must both be floating-point numbers.
---@param x number
---@param y number
---@return boolean
function render_bounds:includes(x, y) end

---Set the rectangle's position and size in terms of the positions of the edges.
---
---The arguments must all be floating-point numbers.
---@param left number
---@param top number
---@param right number
---@param bottom number
function render_bounds:set_xy(left, top, right, bottom) end

---Set the rectangle's position and size in terms of the top top left corner
---position, and the width and height.
---
---The arguments must all be floating-point numbers.
---@param left number
---@param top number
---@param width number
---@param height number
function render_bounds:set_wh(left, top, width, height) end

return render_bounds