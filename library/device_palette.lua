---@meta _

---Wraps MAME's `device_palette_interface` class, which represents a device that
---translates pen values to colours.
---
---Colours are represented in alpha/red/green/blue (ARGB) format. Channel values
---range from 0 (transparent or off) to 255 (opaque or full intensity),
---inclusive. Colour channel values are not pre-multiplied by the alpha value.
---Channel values are packed into the bytes of 32-bit unsigned integers, in the
---order alpha, red, green, blue from most-significant to least-significant
---byte.
---@class device_palette
---@field palette palette            (read-only) The underlying [palette](palette.lua) managed by the device.
---@field entries number             (read-only) The number of colour entries in the palette.
---@field indirect_entries number    (read-only) The number of indirect pen entries in the palette.
---@field black_pen number           (read-only) The index of the fixed black pen entry.
---@field white_pen number           (read-only) The index of the fixed white pen.
---@field shadows_enabled boolean    (read-only) A Boolean indicating whether shadow colours are enabled.
---@field highlights_enabled boolean (read-only) A Boolean indicating whether highlight colours are enabled.
---@field device device              (read-only) The underlying [device](device.lua).
local device_palette = {}

---Gets the remapped pen number for the specified palette index.
---@param index number
---@return number
function device_palette:pen(index) end

---Gets the colour for the specified pen number.
function device_palette:pen_color(pen) end

---Gets the contrast value for the specified pen number. The contrast is a
---floating-point number.
---@param pen number
---@return number
function device_palette:pen_contrast(pen) end

---Gets the indirect pen index for the specified palette index.
---@param index number
---@return number
function device_palette:pen_indirect(index) end

---Gets the indirect pen colour for the specified palette index.
---@param index number
---@return number
function device_palette:indirect_color(index) end

---Sets the colour for the specified pen number. The colour may be specified as
---a single packed 32-bit value; or as individual red, green and blue channel
---values, in that order.
---@param pen number
---@param color number
function device_palette:set_pen_color(pen, color) end

---Sets the colour for the specified pen number. The colour may be specified as
---a single packed 32-bit value; or as individual red, green and blue channel
---values, in that order.
---@param pen number
---@param red number
---@param green number
---@param blue number
function device_palette:set_pen_color(pen, red, green, blue) end

---Sets the red channel value of the colour for the specified pen number. Other
---channel values are not affected.
---@param pen number
---@param level number
function device_palette:set_pen_red_level(pen, level) end

---Sets the green channel value of the colour for the specified pen number.
---Other channel values are not affected.
---@param pen number
---@param level number
function device_palette:set_pen_green_level(pen, level) end

---Sets the blue channel value of the colour for the specified pen number. Other
---channel values are not affected.
---@param pen number
---@param level number
function device_palette:set_pen_blue_level(pen, level) end

---Sets the contrast value for the specified pen number. The value must be a
---floating-point number.
---@param pen number
---@param factor number
function device_palette:set_pen_contrast(pen, factor) end

---Sets the indirect pen index for the specified pen number.
---@param pen number
---@param index number
function device_palette:set_pen_indirect(pen, index) end

---Sets the indirect pen colour for the specified palette index. The colour may
---be specified as a single packed 32-bit value; or as individual red, green and
---blue channel values, in that order.
---@param index number
---@param color number
function device_palette:set_indirect_color(index, color) end

---Sets the indirect pen colour for the specified palette index. The colour may
---be specified as a single packed 32-bit value; or as individual red, green and
---blue channel values, in that order.
---@param index number
---@param red number
---@param green number
---@param blue number
function device_palette:set_indirect_color(index, red, green, blue) end

---Sets the contrast value for the current shadow group. The value must be a
---floating-point number.
---@param factor number
function device_palette:set_shadow_factor(factor) end

---Sets the contrast value for the current highlight group. The value must be a
---floating-point number.
---@param factor number
function device_palette:set_highlight_factor(factor) end

---Sets the shadow mode. The value is the index of the desired shadow table.
---@param mode 0|1|2|3|4
function device_palette:set_shadow_mode(mode) end

return device_palette