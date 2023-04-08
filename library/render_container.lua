---@meta _

---Wraps MAME's `render_container` class.
---@class render_container
---@field user_settings user_settings (read/write) The container's user settings. This can be used to control a number of image adjustments.
---@field orientation number          (read/write) The container orientation flags. This is an integer bit mask, where bit 0 (0x01) is set to mirror horizontally, bit 1 (0x02) is set to mirror vertically, and bit 2 (0x04) is set to mirror along the top left-bottom right diagonal.
---@field xscale number               (read/write) The container's X scale factor. This is a floating-point number.
---@field yscale number               (read/write) The container's Y scale factor. This is a floating-point number.
---@field xoffset number              (read/write) The container's X offset. This is a floating-point number where one (1) corresponds to the X size of the container.
---@field yoffset number              (read/write) The container's Y offset. This is a floating-point number where one (1) corresponds to the Y size of the container.
---@field is_empty boolean            (read-only) A Boolean indicating whether the container has no items.
local render_container = {}

---Wraps MAME's `render_container::user_settings` class, representing image adjustments applied to a render container.
---@class user_settings
---@field orientation number (read/write) The container orientation flags. This is an integer bit mask, where bit 0 (0x01) is set to mirror horizontally, bit 1 (0x02) is set to mirror vertically, and bit 2 (0x04) is set to mirror along the top left-bottom right diagonal.
---@field brightness number  (read/write) The brightness adjustment applied to the container. This is a floating-point number.
---@field contrast number    (read/write) The contrast adjustment applied to the container. This is a floating-point number.
---@field gamma number       (read/write) The gamma adjustment applied to the container. This is a floating-point number.
---@field xscale number      (read/write) The container's X scale factor. This is a floating-point number.
---@field yscale number      (read/write) The container's Y scale factor. This is a floating-point number.
---@field xoffset number     (read/write) The container's X offset. This is a floating-point number where one (1) represents the X size of the container.
---@field yoffset number     (read/write) The container's Y offset. This is a floating-point number where one (1) represents the Y size of the container.
local user_settings = {}

---Draws an outlined rectangle with edges at the specified positions.
---
---Coordinates are floating-point numbers in the range of 0 (zero) to 1 (one),
---with (0, 0) at the top left and (1, 1) at the bottom right of the window or
---the screen that shows the user interface. Note that the aspect ratio is
---usually not square. Coordinates are limited to the window or screen area.
---
---The fill and line colours are in alpha/red/green/blue (ARGB) format. Channel
---values are in the range 0 (transparent or off) to 255 (opaque or full
---intensity), inclusive. Colour channel values are not pre-multiplied by the
---alpha value. The channel values must be packed into the bytes of a 32-bit
---unsigned integer, in the order alpha, red, green, blue from most-significant
---to least-significant byte. If the line colour is not provided, the UI text
---colour is used; if the fill colour is not provided, the UI background colour
---is used.
---@param left number
---@param top number
---@param right number
---@param bottom number
---@param line? number
---@param fill? number
function render_container:draw_box(left, top, right, bottom, line, fill) end

---Draws a line from (x0, y0) to (x1, y1).
---
---Coordinates are floating-point numbers in the range of 0 (zero) to 1 (one),
---with (0, 0) at the top left and (1, 1) at the bottom right of the window or
---the screen that shows the user interface. Note that the aspect ratio is
---usually not square. Coordinates are limited to the window or screen area.
---
---The line colour is in alpha/red/green/blue (ARGB) format. Channel values are
---in the range 0 (transparent or off) to 255 (opaque or full intensity),
---inclusive. Colour channel values are not pre-multiplied by the alpha value.
---The channel values must be packed into the bytes of a 32-bit unsigned
---integer, in the order alpha, red, green, blue from most-significant to
---least-significant byte. If the line colour is not provided, the UI text
---colour is used.
---comment
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param color? number
function render_container:draw_line(x0, y0, x1, y1, color) end

---Draws a textured rectangle with top left corner at (x0, y0) and bottom right
---corner at (x1, y1). If a colour is specified, the ARGB channel values of the
---texture's pixels are multiplied by the corresponding values of the specified
---colour.
---
---Coordinates are floating-point numbers in the range of 0 (zero) to 1 (one),
---with (0, 0) at the top left and (1, 1) at the bottom right of the window or
---the screen that shows the user interface. Note that the aspect ratio is
---usually not square. If the rectangle extends beyond the container's bounds,
---it will be cropped.
---
---The colour is in alpha/red/green/blue (ARGB) format. Channel values are in
---the range 0 (transparent or off) to 255 (opaque or full intensity),
---inclusive. Colour channel values are not pre-multiplied by the alpha value.
---The channel values must be packed into the bytes of a 32-bit unsigned
---integer, in the order alpha, red, green, blue from most-significant to
---least-significant byte.
---@param texture render_texture
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param color? number
function render_container:draw_quad(texture, x0, y0, x1, y1, color) end

---Draws text at the specified position. If the screen is rotated the text will
---be rotated.
---
---If the first argument is a number, the text will be left-aligned at this X
---coordinate. If the first argument is a string, it must be "left", "center" or
---"right" to draw the text left-aligned at the left edge of the window or
---screen, horizontally centred in the window or screen, or right-aligned at the
---right edge of the window or screen, respectively. The second argument
---specifies the Y coordinate of the maximum ascent of the text.
---
---Coordinates are floating-point numbers in the range of 0 (zero) to 1 (one),
---with (0, 0) at the top left and (1, 1) at the bottom right of the window or
---the screen that shows the user interface. Note that the aspect ratio is
---usually not square. Coordinates are limited to the window or screen area.
---
---The foreground and background colours are in alpha/red/green/blue (ARGB)
---format. Channel values are in the range 0 (transparent or off) to 255 (opaque
---or full intensity), inclusive. Colour channel values are not pre-multiplied
---by the alpha value. The channel values must be packed into the bytes of a
---32-bit unsigned integer, in the order alpha, red, green, blue from
---most-significant to least-significant byte. If the foreground colour is not
---provided, the UI text colour is used; if the background colour is not
---provided, it is fully transparent.
---@param x_or_justify number|'left'|'center'|'right'
---@param y number
---@param text number
---@param foreground? number
---@param background? number
function render_container:draw_text(x_or_justify, y, text, foreground, background) end

return render_container