---@meta _

---Wraps implementations of MAME's bitmap_t and bitmap_specific classes, which
---represent two-dimensional bitmaps stored in row-major order. Pixel
---coordinates are zero-based, increasing to the right and down. Several pixel
---formats are supported.
---@class bitmap
---@field palette palette  (read/write) The [palette](palette.lua) used to translate pixel values to colours. Only applicable for bitmaps that use indexed pixel formats.
---@field width number     (read-only) Width of the bitmap in pixels.
---@field height number    (read-only) Height of the bitmap in pixels.
---@field rowpixels number (read-only) Row stride of the bitmap's storage in pixels. That is, the difference in pixel offsets of the pixels at the same horizontal location in consecutive rows. May be greater than the width.
---@field rowbytes number  (read-only) Row stride of the bitmap's storage in bytes. That is, the difference in byte addresses of the pixels at the same horizontal location in consecutive rows.
---@field bpp number       (read-only) Size of the type used to represent pixels in the bitmap in bits (may be larger than the number of significant bits).
---@field valid boolean    (read-only) A Boolean indicating whether the bitmap has storage available (may be false for empty bitmaps).
---@field locked boolean   (read-only) A Boolean indicating whether the bitmap's storage is referenced by another bitmap or a texture.
local bitmap = {}

---Returns the left, top, right and bottom coordinates of the bitmap's clipping
---rectangle. Coordinates are in units of pixels; the bottom and right
---coordinates are inclusive.
---@return number left, number top, number right, number bottom
function bitmap:cliprect() end

---Sets the width and height to zero, and frees the pixel storage if the bitmap
---owns its own storage, or releases the source bitmap if the it represents a
---view of another bitmap.
---
---The bitmap must be owned by the Lua script. Raises an error if the bitmap's
---storage is referenced by another bitmap or a texture.
function bitmap:reset() end

---Reallocates storage for the bitmap, sets its width and height, and sets the
---clipping rectangle to the entirety of the bitmap. If the bitmap already owns
---allocated storage, it will always be freed and reallocated; if the bitmap
---represents a view of another bitmap, the source bitmap will be released. The
---storage will be filled with pixel value zero.
---
---The X and Y slop values set the amount of extra storage in pixels to reserve
---at the left/right of each row and top/bottom of each column, respectively. If
---an X slop value is specified, a Y slop value must be specified as well. If no
---X and Y slop values are specified, they are assumed to be zero (the storage
---will be sized to fit the bitmap content). If the width and/or height is less
---than or equal to zero, no storage will be allocated, irrespective of the X
---and Y slop values, and the width and height of the bitmap will both be set to
---zero.
---
---The bitmap must be owned by the Lua script. Raises an error if the bitmap's
---storage is referenced by another bitmap or a texture.
---@param width number
---@param height number
function bitmap:allocate(width, height) end

---Reallocates storage for the bitmap, sets its width and height, and sets the
---clipping rectangle to the entirety of the bitmap. If the bitmap already owns
---allocated storage, it will always be freed and reallocated; if the bitmap
---represents a view of another bitmap, the source bitmap will be released. The
---storage will be filled with pixel value zero.
---
---The X and Y slop values set the amount of extra storage in pixels to reserve
---at the left/right of each row and top/bottom of each column, respectively. If
---an X slop value is specified, a Y slop value must be specified as well. If no
---X and Y slop values are specified, they are assumed to be zero (the storage
---will be sized to fit the bitmap content). If the width and/or height is less
---than or equal to zero, no storage will be allocated, irrespective of the X
---and Y slop values, and the width and height of the bitmap will both be set to
---zero.
---
---The bitmap must be owned by the Lua script. Raises an error if the bitmap's
---storage is referenced by another bitmap or a texture.
---@param width number
---@param height number
---@param xslop number
---@param yslop number
function bitmap:allocate(width, height, xslop, yslop) end

---Changes the width and height, and sets the clipping rectangle to the entirety
---of the bitmap.
---
---The X and Y slop values set the amount of extra storage in pixels to reserve
---at the left/right of each row and top/bottom of each column, respectively. If
---an X slop value is specified, a Y slop value must be specified as well. If no
---X and Y slop values are specified, they are assumed to be zero (rows will be
---stored contiguously, and the top row will be placed at the beginning of the
---bitmap's storage).
---
---If the bitmap already owns allocated storage and it is large enough for the
---updated size, it will be used without being freed; if it is too small for the
---updated size, it will always be freed and reallocated. If the bitmap
---represents a view of another bitmap, the source bitmap will be released. If
---storage is allocated, it will be filled with pixel value zero (if existing
---storage is used, its contents will not be changed).
---
---Raises an error if the bitmap's storage is referenced by another bitmap or a
---texture.
---@param width number
---@param height number
function bitmap:resize(width, height) end

---Changes the width and height, and sets the clipping rectangle to the entirety
---of the bitmap.
---
---The X and Y slop values set the amount of extra storage in pixels to reserve
---at the left/right of each row and top/bottom of each column, respectively. If
---an X slop value is specified, a Y slop value must be specified as well. If no
---X and Y slop values are specified, they are assumed to be zero (rows will be
---stored contiguously, and the top row will be placed at the beginning of the
---bitmap's storage).
---
---If the bitmap already owns allocated storage and it is large enough for the
---updated size, it will be used without being freed; if it is too small for the
---updated size, it will always be freed and reallocated. If the bitmap
---represents a view of another bitmap, the source bitmap will be released. If
---storage is allocated, it will be filled with pixel value zero (if existing
---storage is used, its contents will not be changed).
---
---Raises an error if the bitmap's storage is referenced by another bitmap or a
---texture.
---@param width number
---@param height number
---@param xslop number
---@param yslop number
function bitmap:resize(width, height, xslop, yslop) end

---Makes the bitmap represent a view of a portion of another bitmap and sets the
---clipping rectangle to the bounds of the view.
---
---If no coordinates are specified, the target bitmap will represent a view of
---the source bitmap's current clipping rectangle. If coordinates are specified,
---the target bitmap will represent a view of the rectangle with top left corner
---at (x0, y0) and bottom right corner at (x1, y1) in the source bitmap.
---Coordinates are in units of pixels. The bottom right coordinates are
---inclusive.
---
---The source bitmap will be locked, preventing resizing and reallocation. If
---the target bitmap owns allocated storage, it will be freed; if it represents a
---view of another bitmap, the current source bitmap will be released.
---
---The source and target bitmaps must both be owned by the Lua script and must
---use the same pixel format. Raises an error if coordinates are specified
---representing a rectangle not fully contained within the source bitmap's
---clipping rectangle; if the bitmap's storage is referenced by another bitmap or
---a texture; or if the source and target are the same bitmap.
---@param source bitmap
function bitmap:wrap(source) end

---Makes the bitmap represent a view of a portion of another bitmap and sets the
---clipping rectangle to the bounds of the view.
---
---If no coordinates are specified, the target bitmap will represent a view of
---the source bitmap's current clipping rectangle. If coordinates are specified,
---the target bitmap will represent a view of the rectangle with top left corner
---at (x0, y0) and bottom right corner at (x1, y1) in the source bitmap.
---Coordinates are in units of pixels. The bottom right coordinates are
---inclusive.
---
---The source bitmap will be locked, preventing resizing and reallocation. If
---the target bitmap owns allocated storage, it will be freed; if it represents a
---view of another bitmap, the current source bitmap will be released.
---
---The source and target bitmaps must both be owned by the Lua script and must
---use the same pixel format. Raises an error if coordinates are specified
---representing a rectangle not fully contained within the source bitmap's
---clipping rectangle; if the bitmap's storage is referenced by another bitmap or
---a texture; or if the source and target are the same bitmap.
---@param source bitmap
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
function bitmap:wrap(source, x0, y0, x1, y1) end

---Returns the colour value of the pixel at the specified location. Coordinates
---are zero-based in units of pixels.
---@param x number
---@param y number
---@return number
function bitmap:pix(x, y) end

---Returns the pixels, width and height of the portion of the bitmap with top
---left corner at (x0, y0) and bottom right corner at (x1, y1). Coordinates are
---in units of pixels. The bottom right coordinates are inclusive. If
---coordinates are not specified, the bitmap's clipping rectangle is used.
---
---Pixels are returned packed into a binary string in host Endian order. Pixels
---are organised in row-major order, from left to right then top to bottom. The
---size and format of the pixel values depends on the format of the bitmap.
---Raises an error if coordinates are specified representing a rectangle not
---fully contained within the bitmap's clipping rectangle.
---@return string
function bitmap:pixels() end

---Returns the pixels, width and height of the portion of the bitmap with top
---left corner at (x0, y0) and bottom right corner at (x1, y1). Coordinates are
---in units of pixels. The bottom right coordinates are inclusive. If
---coordinates are not specified, the bitmap's clipping rectangle is used.
---
---Pixels are returned packed into a binary string in host Endian order. Pixels
---are organised in row-major order, from left to right then top to bottom. The
---size and format of the pixel values depends on the format of the bitmap.
---Raises an error if coordinates are specified representing a rectangle not
---fully contained within the bitmap's clipping rectangle.
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@return string
function bitmap:pixels(x0, y0, x1, y1) end

---Fills a portion of the bitmap with the specified colour value. If coordinates
---are not specified, the clipping rectangle is filled; if coordinates are
---specified, the intersection of the clipping rectangle and the rectangle with
---top left corner at (x0, y0) and bottom right corner at (x1, y1) is filled.
---Coordinates are in units of pixels. The bottom right coordinates are
---inclusive.
---@param color number
function bitmap:fill(color) end

---Fills a portion of the bitmap with the specified colour value. If coordinates
---are not specified, the clipping rectangle is filled; if coordinates are
---specified, the intersection of the clipping rectangle and the rectangle with
---top left corner at (x0, y0) and bottom right corner at (x1, y1) is filled.
---Coordinates are in units of pixels. The bottom right coordinates are
---inclusive.
---@param color number
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
function bitmap:fill(color, x0, y0, x1, y1) end

---Sets the colour value of the pixel at the specified location if it is within
---the clipping rectangle. Coordinates are zero-based in units of pixels.
function bitmap:plot(x, y, color) end

---Fills the intersection of the clipping rectangle and the rectangle with top
---left (x, y) and the specified height and width with the specified colour
---value. Coordinates and dimensions are in units of pixels.
---@param x number
---@param y number
---@param width number
---@param height number
---@param color number
function bitmap:plot_box(x, y, width, height, color) end

return bitmap