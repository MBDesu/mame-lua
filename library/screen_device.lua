---@meta _

---Wraps MAME's `screen_device` class, which represents an emulated video output.
---@class screen_device: device
---@field width number               (read-only) The width of the bitmap produced by the emulated screen in pixels.
---@field height number              (read-only) The height of the bitmap produced by the emulated screen in pixels.
---@field refresh number             (read-only) The screen's configured refresh rate in Hertz (this may not reflect the current value).
---@field refresh_attoseconds number (read-only) The screen's configured refresh interval in attoseconds (this may not reflect the current value).
---@field xoffset number             (read-only) The screen's default X position offset. This is a floating-point number where one (1) corresponds to the X size of the screen's container. This may be useful for restoring the default after adjusting the X offset via the screen's container.
---@field yoffset number             (read-only) The screen's default Y position offset. This is a floating-point number where one (1) corresponds to the Y size of the screen's container. This may be useful for restoring the default after adjusting the Y offset via the screen's container.
---@field xscale number              (read-only) The screen's default X scale factor, as a floating-point number. This may be useful for restoring the default after adjusting the X scale via the screen's container.
---@field yscale number              (read-only) The screen's default Y scale factor, as a floating-point number. This may be useful for restoring the default after adjusting the Y scale via the screen's container.
---@field pixel_period number        (read-only) The interval taken to draw a horizontal pixel, as a floating-point number in units of seconds.
---@field scan_period number         (read-only) The interval taken to draw a scan line (including the horizontal blanking interval), as a floating-point number in units of seconds.
---@field frame_period number        (read-only) The interval taken to draw a complete frame (including blanking intervals), as a floating-point number in units of seconds.
---@field frame_number number        (read-only) The current frame number for the screen. This increments monotonically each frame interval.
---@field container render_container (read-only) The [render container](render_container.lua) used to draw the screen.
---@field palette device_palette     (read-only) The [palette device](device_palette.lua) used to translate pixel values to colours, or nil if the screen uses a direct colour pixel format.
local screen_device = {}

---Returns the rotation angle in degrees (will be one of 0, 90, 180 or 270),
---whether the screen is flipped left-to-right, and whether the screen is
---flipped top-to-bottom. This is the final screen orientation after the screen
---orientation specified in the machine configuration and the rotation for the
---system driver are applied.
---@return 0|90|180|270
function screen_device:orientation() end

---Gets the time remaining until the raster reaches the specified position. If
---the horizontal component of the position is not specified, it defaults to
---zero (0, i.e. the beginning of the line). The result is a floating-point
---number in units of seconds.
---@param v number
---@param h? number
---@return number
function screen_device:time_until_pos(v, h) end

---Gets the time remaining until the start of the vertical blanking interval.
---The result is a floating-point number in units of seconds.
---@return number
function screen_device:time_until_vblank_start() end

---Gets the time remaining until the end of the vertical blanking interval. The
---result is a floating-point number in units of seconds.
---@return number
function screen_device:time_until_vblank_end() end

---Saves a screen snapshot in PNG format. If no filename is supplied, the
---configured snapshot path and name format will be used. If the supplied
---filename is not an absolute path, it is interpreted relative to the first
---configured snapshot path. The filename may contain conversion specifiers that
---will be replaced by the system name or an incrementing number.
---
---Returns a file error if opening the snapshot file failed, or nil otherwise.
---@param filename? string
function screen_device:snapshot(filename) end

---Gets the pixel at the specified location. Coordinates are in pixels, with the
---origin at the top left corner of the visible area, increasing to the right
---and down. Returns either a palette index or a colour in RGB format packed
---into a 32-bit integer. Returns zero (0) if the specified point is outside the
---visible area.
---@param x number
---@param y number
---@return number
function screen_device:pixel(x, y) end

---Returns all visible pixels, the visible area width and visible area height.
---
---Pixels are returned as 32-bit integers packed into a binary string in host
---Endian order. Pixels are organised in row-major order, from left to right
---then top to bottom. Pixels values are either palette indices or colours in
---RGB format packed into 32-bit integers.
function screen_device:pixels() end

---Draws an outlined rectangle with edges at the specified positions.
---
---Coordinates are floating-point numbers in units of emulated screen pixels,
---with the origin at (0, 0). Note that emulated screen pixels often aren't
---square. The coordinate system is rotated if the screen is rotated, which is
---usually the case for vertical-format screens. Before rotation, the origin is
---at the top left, and coordinates increase to the right and downwards.
---Coordinates are limited to the screen area.
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
function screen_device:draw_box(left, top, right, bottom, line, fill) end

---Draws a line from (x0, y0) to (x1, y1).
---
---Coordinates are floating-point numbers in units of emulated screen pixels,
---with the origin at (0, 0). Note that emulated screen pixels often aren't
---square. The coordinate system is rotated if the screen is rotated, which is
---usually the case for vertical-format screens. Before rotation, the origin is
---at the top left, and coordinates increase to the right and downwards.
---Coordinates are limited to the screen area.
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
function screen_device:draw_line(x0, y0, x1, y1, color) end

---Draws text at the specified position. If the screen is rotated the text will
---be rotated.
---
---If the first argument is a number, the text will be left-aligned at this X
---coordinate. If the first argument is a string, it must be "left", "center" or
---"right" to draw the text left-aligned at the left edge of the screen,
---horizontally centred on the screen, or right-aligned at the right edge of the
---screen, respectively. The second argument specifies the Y coordinate of the
---maximum ascent of the text.
---
---Coordinates are floating-point numbers in units of emulated screen pixels,
---with the origin at (0, 0). Note that emulated screen pixels often aren't
---square. The coordinate system is rotated if the screen is rotated, which is
---usually the case for vertical-format screens. Before rotation, the origin is
---at the top left, and coordinates increase to the right and downwards.
---Coordinates are limited to the screen area.
---
---The foreground and background colours are in alpha/red/green/blue (ARGB)
---format. Channel values are in the range 0 (transparent or off) to 255 (opaque
---or full intensity), inclusive. Colour channel values are not pre-multiplied
---by the alpha value. The channel values must be packed into the bytes of a
---32-bit unsigned integer, in the order alpha, red, green, blue from
---most-significant to least-significant byte. If the foreground colour is not
---provided, the UI text colour is used; if the background colour is not
---provided, it is fully -transparent.
---
---@param x_or_justify number|'left'|'center'|'right'
---@param y number
---@param text string
---@param foreground number
---@param background number
function screen_device:draw_text(x_or_justify, y, text, foreground, background) end

return screen_device