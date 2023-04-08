---@meta _

---Wraps MAME's `render_color` class, which represents an ARGB (alpha, red,
---green, blue) format colour. Channels are floating-point values ranging from
---zero (0, transparent alpha or colour off) to one (1, opaque or full colour
---intensity). Colour channel values are not pre-multiplied by the alpha channel
---value.
---@class render_color
---@field a number (read/write) Alpha value, in the range of zero (0, transparent) to one (1, opaque).
---@field r number (read/write) Red channel value, in the range of zero (0, off) to one (1, full intensity).
---@field g number (read/write) Green channel value, in the range of zero (0, off) to one (1, full intensity).
---@field b number (read/write) Blue channel value, in the range of zero (0, off) to one (1, full intensity).
local render_color = {}

---Sets the colour object's alpha, red, green and blue channel values.
---
---The arguments must all be floating-point numbers in the range from zero (0)
---to one (1), inclusive.
---comment
---@param a number
---@param r number
---@param g number
---@param b number
function render_color:set(a, r, g, b) end

return render_color