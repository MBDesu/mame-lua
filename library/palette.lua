---@meta _

---Wraps MAME's `palette_t` class, which represents a table of colours that can be
---looked up by zero-based index. Palettes always contain additional special
---entries for black and white.
---
---Each colour has an associated contrast adjustment value. Each adjustment
---group has associated brightness and contrast adjustment values. The palette
---also has overall brightness, contrast and gamma adjustment values.
---
---Colours are represented in alpha/red/green/blue (ARGB) format. Channel values
---range from 0 (transparent or off) to 255 (opaque or full intensity),
---inclusive. Colour channel values are not pre-multiplied by the alpha value.
---Channel values are packed into the bytes of 32-bit unsigned integers, in the
---order alpha, red, green, blue from most-significant to least-significant
---byte.
---@class palette
---@field colors number      (read-only) The number of colour entries in each group of colours in the palette.
---@field groups number      (read-only) The number of groups of colours in the palette.
---@field max_index number   (read-only) The number of valid colour indices in the palette.
---@field black_entry number (read-only) The index of the special entry for the colour black.
---@field white_entry number (read-only) The index of the special entry for the colour white.
---@field brightness number  (write-only) The overall brightness adjustment for the palette. This is a floating-point number.
---@field contrast number    (write-only) The overall contrast adjustment for the palette. This is a floating-point number.
---@field gamma number       (write-only) The overall gamma adjustment for the palette. This is a floating-point number.
local palette = {}

---Gets the colour at the specified zero-based index.
---
---Index values range from zero to the number of colours in the palette minus
---one. Returns black if the index is greater than or equal to the number of
---colours in the palette.
---@param index number
---@return number
function palette:entry_color(index) end

---Gets the contrast adjustment for the colour at the specified zero-based
---index. This is a floating-point number.
---
---Index values range from zero to the number of colours in the palette minus
---one. Returns 1.0 if the index is greater than or equal to the number of
---colours in the palette.
---@param index number
---@return number
function palette:entry_contrast(index) end

---Gets a colour with brightness, contrast and gamma adjustments applied.
---
---If the group is specified, colour index values range from zero to the number
---of colours in the palette minus one, and group values range from zero to the
---number of adjustment groups in the palette minus one.
---
---If the group is not specified, index values range from zero to the number of
---colours multiplied by the number of adjustment groups plus one. Index values
---may be calculated by multiplying the zero-based group index by the number of
---colours in the palette, and adding the zero-based colour index. The last two
---index values correspond to the special entries for black and white,
---respectively.
---
---Returns black if the specified combination of index and adjustment group is
---invalid.
---@param index number
---@param group? number
---@return number
function palette:entry_adjusted_color(index, group) end

---Sets the colour at the specified zero-based index. The colour may be
---specified as a single packed 32-bit value; or as individual red, green and
---blue channel values, in that order.
---
---Index values range from zero to the number of colours in the palette minus
---one. Raises an error if the index value is invalid.
---@param index number
---@param color number
function palette:entry_set_color(index, color) end

---Sets the colour at the specified zero-based index. The colour may be
---specified as a single packed 32-bit value; or as individual red, green and
---blue channel values, in that order.
---
---Index values range from zero to the number of colours in the palette minus
---one. Raises an error if the index value is invalid.
---@param index number
---@param red number
---@param green number
---@param blue number
function palette:entry_set_color(index, red, green, blue) end

---Sets the red channel value of the colour at the specified zero-based index.
---Other channel values are not affected.
---
---Index values range from zero to the number of colours in the palette minus
---one. Raises an error if the index value is invalid.
---@param index number
---@param level number
function palette:entry_set_red_level(index, level) end

---Sets the green channel value of the colour at the specified zero-based index.
---Other channel values are not affected.
---
---Index values range from zero to the number of colours in the palette minus
---one. Raises an error if the index value is invalid.
---@param index number
---@param level number
function palette:entry_set_green_level(index, level) end

---Sets the blue channel value of the colour at the specified zero-based index.
---Other channel values are not affected.
---
---Index values range from zero to the number of colours in the palette minus
---one. Raises an error if the index value is invalid.
---@param index number
---@param level number
function palette:entry_set_blue_level(index, level) end

---Sets the contrast adjustment value for the colour at the specified zero-based
---index. This must be a floating-point number.
---
---Index values range from zero to the number of colours in the palette minus
---one. Raises an error if the index value is invalid.
---@param index number
---@param level number
function palette:entry_set_contrast(index, level) end

---Sets the brightness adjustment value for the adjustment group at the
---specified zero-based index. This must be a floating-point number.
---
---Group values range from zero to the number of adjustment groups in the
---palette minus one. Raises an error if the index value is invalid.
---@param group number
---@param brightness number
function palette:group_set_brightness(group, brightness) end

---Sets the contrast adjustment value for the adjustment group at the specified
---zero-based index. This must be a floating-point number.
---
---Group values range from zero to the number of adjustment groups in the
---palette minus one. Raises an error if the index value is invalid.
---@param group number
---@param contrast number
function palette:group_set_contrast(group, contrast) end

return palette