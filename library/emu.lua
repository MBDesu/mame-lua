---@meta _

---The emulator interface `emu` provides access to core functionality. Many
---classes are also available as properties of the emulator interface.
---@class emu
emu = {}

---Return application name
---@return string
function emu.app_name() end

---Return application version
---@return string
function emu.app_version() end

---Return game full name
---@return string
function emu.gamename() end

---Return game ROM name
---@return string
function emu.romname() end

---Return softlist name
---@return string
function emu.softname() end

---Return emulation time
---@return number
function emu.time() end

---Return frontend process ID
---@return number
function emu.pid() end

---Creates an attotime value representing the specified number of seconds.
---@param seconds number
---@return attotime
function emu.attotime.from_double(seconds) end

---Creates an attotime value representing the specified number of periods of
---the specified frequency in Hertz.
---@param periods number
---@param frequency number
---@return attotime
function emu.attotime.from_ticks(periods, frequency) end

---Creates an attotime value representing the specified whole number of seconds.
---@param seconds number
---@return attotime
function emu.attotime.from_seconds(seconds) end

---Creates an attotime value representing the specified whole number of
---milliseconds.
---@param milliseconds number
---@return attotime
function emu.attotime.from_msec(milliseconds) end

---Creates an attotime value representing the specified whole number of
---microseconds.
---@param microseconds number
---@return attotime
function emu.attotime.from_usec(microseconds) end

---Creates an attotime value representing the specified whole number of
---nanoseconds.
---@param nanoseconds number
---@return attotime
function emu.attotime.from_nsec(nanoseconds) end

---Yields for the specified duration in terms of emulated time. The duration
---may be specified as an [`attotime`](attotime.lua) or a number in seconds. Any
---additional arguments are returned to the caller.
---
---All outstanding calls to `emu.wait` will return `false` immediately if a
---saved state is loaded or the emulation session ends. Calling this function
---from callbacks that are not run as coroutines will raise an error.
---@param duration number | attotime
---@return boolean `true` if the duration expired normally; `false` otherwise
function emu.wait(duration, ...) end

---Yields until the next video/UI update. Any arguments are returned to the
---caller. Calling this function from callbacks that are not run as coroutines
---will raise an error.
function emu.wait_next_update(...) end

---Yields until the next emulated frame completes. Any arguments are returned
---to the caller. Calling this function from callbacks that are not run as
---coroutines will raise an error.
function emu.wait_next_frame(...) end

---Add a callback to receive notifications when the emulated system is reset.
---Returns a [notifier subscription](notifier_subscription.lua).
---@param callback function
---@return notifier_subscription
function emu.add_machine_reset_notifier(callback) end

---Add a callback to receive notifications when the emulated system is stopped.
---Returns a [notifier subscription](notifier_subscription.lua).
---@param callback function
---@return notifier_subscription
function emu.add_machine_stop_notifier(callback) end

---Add a callback to receive notifications when the emulated system is paused.
---Returns a [notifier subscription](notifier_subscription.lua).
---@param callback function
---@return notifier_subscription
function emu.add_machine_pause_notifier(callback) end

---Add a callback to receive notifications when the emulated system is resumed
---after being paused. Returns a
---[notifier subscription](notifier_subscription.lua).
---@param callback function
---@return notifier_subscription
function emu.add_machine_resume_notifier(callback) end

---Add a callback to receive notifications when an emulated frame completes.
---Returns a [notifier subscription](notifier_subscription.lua).
---@param callback function
---@return notifier_subscription
function emu.add_machine_frame_notifier(callback) end

---Add a callback to receive notifications before the emulated system state is
---saved. Returns a [notifier subscription](notifier_subscription.lua).
---@param callback function
---@return notifier_subscription
function emu.add_machine_pre_save_notifier(callback) end

---Add a callback to receive notification after the emulated system is restored
---to a previously saved state. Returns a
---[notifier subscription](notifier_subscription.lua).
---@param callback function
---@return notifier_subscription
function emu.add_machine_post_load_notifier(callback) end

---Print an error message.
---@param message string
function emu.print_error(message) end

---Print an warning message.
---@param message string
function emu.print_warning(message) end

---Print an informational message.
---@param message string
function emu.print_info(message) end

---Print a verbose diagnostic message (disabled by default).
---@param message string
function emu.print_verbose(message) end

---Print a debug message (only enabled for debug builds by default).
---@param message string
function emu.print_debug(message) end

---Look up a message with optional context in the current localised message
---catalog. Returns the message unchanged if no corresponding localised message
---is found.
---@param context? unknown
---@param message string
---@return string
function emu.lang_translate(context, message) end

---Substitute environment variables in a string. The syntax is dependent on the
---host operating system.
---@param string string
function emu.subst_env(string) end

---Creates an attotime value representing zero (i.e. no elapsed time).
---@return attotime
function emu.attotime() end

---Creates an attotime with the specified whole and fractional parts.
---@param seconds number
---@param attoseconds number
---@return attotime
function emu.attotime(seconds, attoseconds) end

---Creates a copy of an existing attotime value.
---@param attotime attotime
---@return attotime
function emu.attotime(attotime) end

---Gets the driver metadata for the system with the specified short name, or
---`nil` if no such system exists.
---@param name string
---@return driver_metadata | nil
function emu.driver_find(name) end

---Returns a device enumerator that will iterate over [devices](device.lua) in
---the sub-tree starting at the specified device. The specified device will be
---included. If the depth is provided, it must be an integer specifying the
---maximum number of levels to iterate below the specified device (i.e. 1 will
---limit iteration to the device and its immediate children).
---@param device device
---@param depth? number
---@return device_enumerator<device>
function emu.device_enumerator(device, depth) end

---Returns a device enumerator that will iterate over
---[palette devices](device_palette.lua) in the sub-tree starting at the
---specified device. The specified device will be included if it is a palette
---device. If the depth is provided, it must be an integer specifying the
---maximum number of levels to iterate below the specified device (i.e. 1 will
---limit iteration to the device and its immediate children).
---@param device device_palette
---@param depth? number
---@return device_enumerator<device_palette>
function emu.palette_enumerator(device, depth) end

---Returns a device enumerator that will iterate over
---[screen devices](screen_device.lua) in the sub-tree starting at the specified
---device. The specified device will be included if it is a screen device. If
---the depth is provided, it must be an integer specifying the maximum number of
---levels to iterate below the specified device (i.e. 1 will limit iteration to
---the device and its immediate children).
---@param device screen_device
---@param depth? number
---@return device_enumerator<screen_device>
function emu.screen_enumerator(device, depth) end

---Returns a device enumerator that will iterate over
---[cassette image devices](cassette_image_device.lua) in the sub-tree starting
---at the specified device. The specified device will be included if it is a
---cassette image device. If the depth is provided, it must be an integer
---specifying the maximum number of levels to iterate below the specified device
---(i.e. 1 will limit iteration to the device and its immediate children).
---@param device cassette_image_device
---@param depth? number
---@return device_enumerator<cassette_image_device>
function emu.cassette_enumerator(device, depth) end

---Returns a device enumerator that will iterate over
---[media image devices](device_image.lua) in the sub-tree starting at the
---specified device. The specified device will be included if it is a media
---image device. If the depth is provided, it must be an integer specifying the
---maximum number of levels to iterate below the specified device (i.e. 1 will
---limit iteration to the device and its immediate children).
---@param device device_image
---@param depth? number
---@return device_enumerator<device_image>
function emu.image_enumerator(device, depth) end

---Returns a device enumerator that will iterate over
---[slot devices](device_slot.lua) in the sub-tree starting at the specified
---device. The specified device will be included if it is a slot device. If the
---depth is provided, it must be an integer specifying the maximum number of
---levels to iterate below the specified device (i.e. 1 will limit iteration to
---the device and its immediate children).
---@param device device_slot
---@param depth? number
---@return device_enumerator<device_slot>
function emu.slot_enumerator(device, depth) end

---Creates an empty input sequence.
---@return input_seq
function emu.input_seq() end

---Creates a copy of an existing input sequence.
---@param seq input_seq
---@return input_seq
function emu.input_seq(seq) end

---Creates a render bounds object representing a unit square, with top left
---corner at (0, 0) and bottom right corner at (1, 1). Note that render target
---coordinates don’t necessarily have equal X and Y scales, so this may not
---represent a square in the final output.
---@return render_bounds
function emu.render_bounds() end

---Creates a render bounds object representing a rectangle with top left corner
---at (x0, y0) and bottom right corner at (x1, y1).
---
---The arguments must all be floating-point numbers.
---@param left number
---@param top number
---@param right number
---@param bottom number
---@return render_bounds
function emu.render_bounds(left, top, right, bottom) end

---Creates a render colour object representing opaque white (all channels set to
---1). This is the identity value - ARGB multiplication by this value will not
---change a colour.
---@return render_color
function emu.render_color() end

---Creates a render colour object with the specified alpha, red, green and blue
---channel values.
---
---The arguments must all be floating-point numbers in the range from zero (0)
---to one (1), inclusive.
---@param a number
---@param r number
---@param g number
---@param b number
---@return render_color
function emu.render_color(a, r, g, b) end

---Creates a palette with the specified number of colours and
---brightness/contrast adjustment groups. The number of colour groups defaults
---to one if not specified. Colours are initialised to black, brightness
---adjustment is initialised to 0.0, contrast adjustment initialised to 1.0, and
---gamma adjustment is initialised to 1.0.
---@param colors number
---@param groups? number
---@return palette
function emu.palette(colors, groups) end

---Creates an 8-bit indexed bitmap. Each pixel is a zero-based, unsigned 8-bit
---index into a [palette](palette.lua).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop
---values set the amount of extra storage in pixels to reserve at the left/right
---of each row and top/bottom of each column, respectively. If an X slop value
---is specified, a Y slop value must be specified as well. If no X and Y slop
---values are specified, they are assumed to be zero (the storage will be sized
---to fit the bitmap content). If the width and/or height is less than or equal
---to zero, no storage will be allocated, irrespective of the X and Y slop
---values, and the width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param palette palette
---@return bitmap
function emu.bitmap_ind8(palette) end

---Creates an 8-bit indexed bitmap. Each pixel is a zero-based, unsigned 8-bit
---index into a [palette](palette.lua).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop
---values set the amount of extra storage in pixels to reserve at the left/right
---of each row and top/bottom of each column, respectively. If an X slop value
---is specified, a Y slop value must be specified as well. If no X and Y slop
---values are specified, they are assumed to be zero (the storage will be sized
---to fit the bitmap content). If the width and/or height is less than or equal
---to zero, no storage will be allocated, irrespective of the X and Y slop
---values, and the width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param palette palette
---@param width number
---@param height number
---@return bitmap
function emu.bitmap_ind8(palette, width, height) end

---Creates an 8-bit indexed bitmap. Each pixel is a zero-based, unsigned 8-bit
---index into a [palette](palette.lua).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop
---values set the amount of extra storage in pixels to reserve at the left/right
---of each row and top/bottom of each column, respectively. If an X slop value
---is specified, a Y slop value must be specified as well. If no X and Y slop
---values are specified, they are assumed to be zero (the storage will be sized
---to fit the bitmap content). If the width and/or height is less than or equal
---to zero, no storage will be allocated, irrespective of the X and Y slop
---values, and the width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param palette palette
---@param width number
---@param height number
---@param xslop number
---@param yslop number
---@return bitmap
function emu.bitmap_ind8(palette, width, height, xslop, yslop) end

---Creates a 16-bit indexed bitmap. Each pixel is a zero-based, unsigned 16-bit
---index into a [palette](palette.lua).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param palette palette
---@return bitmap
function emu.bitmap_ind16(palette) end

---Creates a 16-bit indexed bitmap. Each pixel is a zero-based, unsigned 16-bit
---index into a [palette](palette.lua).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param palette palette
---@param width number
---@param height number
---@return bitmap
function emu.bitmap_ind16(palette, width, height) end

---Creates a 16-bit indexed bitmap. Each pixel is a zero-based, unsigned 16-bit
---index into a [palette](palette.lua).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param palette palette
---@param width number
---@param height number
---@param xslop number
---@param yslop number
---@return bitmap
function emu.bitmap_ind16(palette, width, height, xslop, yslop) end

---Creates a 32-bit indexed bitmap. Each pixel is a zero-based, unsigned 32-bit
---index into a [palette](palette.lua).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param palette palette
---@return bitmap
function emu.bitmap_ind32(palette) end

---Creates a 32-bit indexed bitmap. Each pixel is a zero-based, unsigned 32-bit
---index into a [palette](palette.lua).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param palette palette
---@param width number
---@param height number
---@return bitmap
function emu.bitmap_ind32(palette, width, height) end

---Creates a 32-bit indexed bitmap. Each pixel is a zero-based, unsigned 32-bit
---index into a [palette](palette.lua).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param palette palette
---@param width number
---@param height number
---@param xslop number
---@param yslop number
---@return bitmap
function emu.bitmap_ind32(palette, width, height, xslop, yslop) end

---Creates a 64-bit indexed bitmap. Each pixel is a zero-based, unsigned 64-bit
---index into a [palette](palette.lua).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param palette palette
---@return bitmap
function emu.bitmap_ind64(palette) end

---Creates a 64-bit indexed bitmap. Each pixel is a zero-based, unsigned 64-bit
---index into a [palette](palette.lua).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param palette palette
---@param width number
---@param height number
---@return bitmap
function emu.bitmap_ind64(palette, width, height) end

---Creates a 64-bit indexed bitmap. Each pixel is a zero-based, unsigned 64-bit
---index into a [palette](palette.lua).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param palette palette
---@param width number
---@param height number
---@param xslop number
---@param yslop number
---@return bitmap
function emu.bitmap_ind64(palette, width, height, xslop, yslop) end

---Creates a Y'CbCr format bitmap with 4:2:2 chroma subsampling (horizontal
---pairs of pixels have individual luma values but share chroma values). Each
---pixel is a 16-bit integer value. The most significant byte of the pixel value
---is the unsigned 8-bit Y' (luma) component of the pixel colour. For each
---horizontal pair of pixels, the least significant byte of the first pixel (even
---zero-based X coordinate) value is the signed 8-bit Cb value for the pair of
---pixels, and the least significant byte of the second pixel (odd zero-based X
---coordinate) value is the signed 8-bit Cr value for the pair of pixels.
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@return bitmap
function emu.bitmap_yuy16() end

---Creates a Y'CbCr format bitmap with 4:2:2 chroma subsampling (horizontal
---pairs of pixels have individual luma values but share chroma values). Each
---pixel is a 16-bit integer value. The most significant byte of the pixel value
---is the unsigned 8-bit Y' (luma) component of the pixel colour. For each
---horizontal pair of pixels, the least significant byte of the first pixel (even
---zero-based X coordinate) value is the signed 8-bit Cb value for the pair of
---pixels, and the least significant byte of the second pixel (odd zero-based X
---coordinate) value is the signed 8-bit Cr value for the pair of pixels.
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param width number
---@param height number
---@return bitmap
function emu.bitmap_yuy16(width, height) end

---Creates a Y'CbCr format bitmap with 4:2:2 chroma subsampling (horizontal
---pairs of pixels have individual luma values but share chroma values). Each
---pixel is a 16-bit integer value. The most significant byte of the pixel value
---is the unsigned 8-bit Y' (luma) component of the pixel colour. For each
---horizontal pair of pixels, the least significant byte of the first pixel (even
---zero-based X coordinate) value is the signed 8-bit Cb value for the pair of
---pixels, and the least significant byte of the second pixel (odd zero-based X
---coordinate) value is the signed 8-bit Cr value for the pair of pixels.
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param width number
---@param height number
---@param xslop number
---@param yslop number
---@return bitmap
function emu.bitmap_yuy16(width, height, xslop, yslop) end

---Creates an RGB format bitmap with no alpha (transparency) channel. Each pixel
---is represented by a 32-bit integer value. The most significant byte of the
---pixel value is ignored. The remaining three bytes, from most significant to
---least significant, are the unsigned 8-bit unsigned red, green and blue channel
---values (larger values correspond to higher intensities).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@return bitmap
function emu.bitmap_rgb32() end

---Creates an RGB format bitmap with no alpha (transparency) channel. Each pixel
---is represented by a 32-bit integer value. The most significant byte of the
---pixel value is ignored. The remaining three bytes, from most significant to
---least significant, are the unsigned 8-bit unsigned red, green and blue channel
---values (larger values correspond to higher intensities).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param width number
---@param height number
---@return bitmap
function emu.bitmap_rgb32(width, height) end

---Creates an RGB format bitmap with no alpha (transparency) channel. Each pixel
---is represented by a 32-bit integer value. The most significant byte of the
---pixel value is ignored. The remaining three bytes, from most significant to
---least significant, are the unsigned 8-bit unsigned red, green and blue channel
---values (larger values correspond to higher intensities).
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param width number
---@param height number
---@param xslop number
---@param yslop number
---@return bitmap
function emu.bitmap_rgb32(width, height, xslop, yslop) end

---Creates an ARGB format bitmap. Each pixel is represented by a 32-bit integer
---value. The most significant byte of the pixel is the 8-bit unsigned alpha
---(transparency) channel value (smaller values are more transparent). The
---remaining three bytes, from most significant to least significant, are the
---unsigned 8-bit unsigned red, green and blue channel values (larger values
---correspond to higher intensities). Colour channel values are not
---pre-multiplied by the alpha channel value.
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@return bitmap
function emu.bitmap_argb32() end

---Creates an ARGB format bitmap. Each pixel is represented by a 32-bit integer
---value. The most significant byte of the pixel is the 8-bit unsigned alpha
---(transparency) channel value (smaller values are more transparent). The
---remaining three bytes, from most significant to least significant, are the
---unsigned 8-bit unsigned red, green and blue channel values (larger values
---correspond to higher intensities). Colour channel values are not
---pre-multiplied by the alpha channel value.
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param width number
---@param height number
---@return bitmap
function emu.bitmap_argb32(width, height) end

---Creates an ARGB format bitmap. Each pixel is represented by a 32-bit integer
---value. The most significant byte of the pixel is the 8-bit unsigned alpha
---(transparency) channel value (smaller values are more transparent). The
---remaining three bytes, from most significant to least significant, are the
---unsigned 8-bit unsigned red, green and blue channel values (larger values
---correspond to higher intensities). Colour channel values are not
---pre-multiplied by the alpha channel value.
---
---If no width and height are specified, they are assumed to be zero. If the
---width is specified, the height must also be specified. The X and Y slop values
---set the amount of extra storage in pixels to reserve at the left/right of each
---row and top/bottom of each column, respectively. If an X slop value is
---specified, a Y slop value must be specified as well. If no X and Y slop values
---are specified, they are assumed to be zero (the storage will be sized to fit
---the bitmap content). If the width and/or height is less than or equal to zero,
---no storage will be allocated, irrespective of the X and Y slop values, and the
---width and height of the bitmap will both be set to zero.
---
---The initial clipping rectangle is set to the entirety of the bitmap.
---@param width number
---@param height number
---@param xslop number
---@param yslop number
---@return bitmap
function emu.bitmap_argb32(width, height, xslop, yslop) end

---Creates an 8-bit indexed bitmap representing a view of a portion of an
---existing bitmap. The initial clipping rectangle is set to the bounds of the
---view. The source bitmap will be locked, preventing resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the 8-bit
---indexed format. Raises an error if coordinates are specified representing a
---rectangle not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@return bitmap
function emu.bitmap_ind8(source) end

---Creates an 8-bit indexed bitmap representing a view of a portion of an
---existing bitmap. The initial clipping rectangle is set to the bounds of the
---view. The source bitmap will be locked, preventing resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the 8-bit
---indexed format. Raises an error if coordinates are specified representing a
---rectangle not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@return bitmap
function emu.bitmap_ind8(source, x0, y0, x1, y1) end

---Creates a 16-bit indexed bitmap representing a view of a portion of an
---existing bitmap. The initial clipping rectangle is set to the bounds of the
---view. The source bitmap will be locked, preventing resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the 16-bit
---indexed format. Raises an error if coordinates are specified representing a
---rectangle not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@return bitmap
function emu.bitmap_ind16(source) end

---Creates a 16-bit indexed bitmap representing a view of a portion of an
---existing bitmap. The initial clipping rectangle is set to the bounds of the
---view. The source bitmap will be locked, preventing resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the 16-bit
---indexed format. Raises an error if coordinates are specified representing a
---rectangle not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@return bitmap
function emu.bitmap_ind16(source, x0, y0, x1, y1) end

---Creates a 32-bit indexed bitmap representing a view of a portion of an
---existing bitmap. The initial clipping rectangle is set to the bounds of the
---view. The source bitmap will be locked, preventing resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the 32-bit
---indexed format. Raises an error if coordinates are specified representing a
---rectangle not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@return bitmap
function emu.bitmap_ind32(source) end

---Creates a 32-bit indexed bitmap representing a view of a portion of an
---existing bitmap. The initial clipping rectangle is set to the bounds of the
---view. The source bitmap will be locked, preventing resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the 32-bit
---indexed format. Raises an error if coordinates are specified representing a
---rectangle not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@return bitmap
function emu.bitmap_ind32(source, x0, y0, x1, y1) end

---Creates a 64-bit indexed bitmap representing a view of a portion of an
---existing bitmap. The initial clipping rectangle is set to the bounds of the
---view. The source bitmap will be locked, preventing resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the 64-bit
---indexed format. Raises an error if coordinates are specified representing a
---rectangle not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@return bitmap
function emu.bitmap_ind64(source) end

---Creates a 64-bit indexed bitmap representing a view of a portion of an
---existing bitmap. The initial clipping rectangle is set to the bounds of the
---view. The source bitmap will be locked, preventing resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the 64-bit
---indexed format. Raises an error if coordinates are specified representing a
---rectangle not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@return bitmap
function emu.bitmap_ind64(source, x0, y0, x1, y1) end

---Creates a Y'CbCr format bitmap with 4:2:2 chroma subsampling representing a
---view of a portion of an existing bitmap. The initial clipping rectangle is set
---to the bounds of the view. The source bitmap will be locked, preventing
---resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the Y'CbCr
---format. Raises an error if coordinates are specified representing a rectangle
---not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@return bitmap
function emu.bitmap_yuy16(source) end

---Creates a Y'CbCr format bitmap with 4:2:2 chroma subsampling representing a
---view of a portion of an existing bitmap. The initial clipping rectangle is set
---to the bounds of the view. The source bitmap will be locked, preventing
---resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the Y'CbCr
---format. Raises an error if coordinates are specified representing a rectangle
---not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@return bitmap
function emu.bitmap_yuy16(source, x0, y0, x1, y1) end

---Creates an RGB format bitmap with 4:2:2 chroma subsampling representing a
---view of a portion of an existing bitmap. The initial clipping rectangle is set
---to the bounds of the view. The source bitmap will be locked, preventing
---resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the RGB
---format. Raises an error if coordinates are specified representing a rectangle
---not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@return bitmap
function emu.bitmap_rgb32(source) end

---Creates an RGB format bitmap with 4:2:2 chroma subsampling representing a
---view of a portion of an existing bitmap. The initial clipping rectangle is set
---to the bounds of the view. The source bitmap will be locked, preventing
---resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the RGB
---format. Raises an error if coordinates are specified representing a rectangle
---not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@return bitmap
function emu.bitmap_rgb32(source, x0, y0, x1, y1) end

---Creates an ARGB format bitmap with 4:2:2 chroma subsampling representing a
---view of a portion of an existing bitmap. The initial clipping rectangle is set
---to the bounds of the view. The source bitmap will be locked, preventing
---resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the ARGB
---format. Raises an error if coordinates are specified representing a rectangle
---not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@return bitmap
function emu.bitmap_argb32(source) end

---Creates an ARGB format bitmap with 4:2:2 chroma subsampling representing a
---view of a portion of an existing bitmap. The initial clipping rectangle is set
---to the bounds of the view. The source bitmap will be locked, preventing
---resizing and reallocation.
---
---If no coordinates are specified, the new bitmap will represent a view of the
---source bitmap's current clipping rectangle. If coordinates are specified, the
---new bitmap will represent a view of the rectangle with top left corner at (x0,
---y0) and bottom right corner at (x1, y1) in the source bitmap. Coordinates are
---in units of pixels. The bottom right coordinates are inclusive.
---
---The source bitmap must be owned by the Lua script and must use the ARGB
---format. Raises an error if coordinates are specified representing a rectangle
---not fully contained within the source bitmap's clipping rectangle.
---@param source bitmap
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@return bitmap
function emu.bitmap_argb32(source, x0, y0, x1, y1) end

---Creates an ARGB format bitmap from data in PNG, JPEG (JFIF/EXIF) or Microsoft
---DIB (BMP) format. Raises an error if the data invalid or not a supported
---format.
---@param data any
function emu.bitmap_argb32.load(data) end

---Creates a new symbol table in the context of the specified machine.
---@param machine any
---@return symbol_table
function emu.symbol_table(machine) end

---Creates a new symbol table with the specified parent symbol table. If a
---device is specified and it implements `device_memory_interface`, it will be
---used as the base for looking up address spaces and memory regions. Note that
---if a device that does not implement `device_memory_interface` is supplied, it
---will not be used (address spaces and memory regions will be looked up
---relative to the root device).
---@param parent symbol_table
---@param device? device
---@return symbol_table
function emu.symbol_table(parent, device) end

---Creates a new symbol table in the context of the specified device. If the
---device implements `device_memory_interface`, it will be used as the base for
---looking up address spaces and memory regions. Note that if a device that does
---not implement `device_memory_interface` is supplied, it will only be used to
---determine the machine context (address spaces and memory regions will be
---looked up relative to the root device).
---@param device device
---@return symbol_table
function emu.symbol_table(device) end

---Creates an empty expression that will use the supplied symbol table to look
---up symbols.
---@param symbols symbol_table
---@return parsed_expression
function emu.parsed_expression(symbols) end

---Creates an expression by parsing the supplied string, looking up symbols in
---the supplied symbol table. If the default base for interpreting integer
---literals is not supplied, 16 is used (hexadecimal). Raises an expression
---error if the string contains syntax errors or uses undefined symbols.
---@param symbols symbol_table
---@param string string
---@param default_base? number
---@return parsed_expression
function emu.parsed_expression(symbols, string, default_base) end

---Start given driver_name
function emu.start(driver_name) end

---pause emulation
function emu.pause() end

---unpause emulation
function emu.unpause() end

---advance one frame
function emu.step() end

---post keys to natural keyboard
function emu.keypost(keys) end

---register callback before reset
---@param callback function
function emu.register_prestart(callback) end

---register callback after reset
---@param callback function
---@deprecated Please use `emu.add_machine_reset_notifier`
function emu.register_start(callback) end

---register callback after stopping
---@param callback function
---@deprecated Please use `emu.add_machine_stop_notifier`
function emu.register_stop(callback) end

---register callback at pause
---@param callback function
---@deprecated Please use `emu.add_machine_pause_notifier`
function emu.register_pause(callback) end

---register callback at resume
---@param callback function
---@deprecated Please use `emu.add_machine_resume_notifier`
function emu.register_resume(callback) end

---register callback at end of frame
---@param callback function
---@deprecated Please use `emu.add_machine_frame_notifier`
function emu.register_frame(callback) end

---register callback after frame is drawn to screen (for overlays)
---@param callback function
function emu.register_frame_done(callback) end

---register callback after sound update has generated new samples
---@param callback function
function emu.register_sound_update(callback) end

---register periodic callback while program is running
---@param callback function
function emu.register_periodic(callback) end

---register callback to be used by MAME via lua_engine::call_plugin()
---@param callback function
---@param name string
function emu.register_callback(callback, name) end

---register callbacks for plugin menu
---@param event_callback fun(index: number, event: string): boolean Callback to invoke when a menu event happens. Should return `true` if `event` necessitated a call to `populate_callback`
---@param populate_callback fun(): table<menu_item>, number?, 'nokeys'|'lralways'|'lrrepeat'|'customnav'|'ignorepause'|'idle'|string? Callback to invoke when the menu needs (re)populated after an event. Should return the menu. String is optional configuration.
---@param name string The name of the menu
function emu.register_menu(event_callback, populate_callback, name) end

---register callback invoked to override mandatory file manager
---@param callback function
function emu.register_mandatory_file_manager_override(callback) end

---register callback to be run before settings are loaded
---@param callback function
function emu.register_before_load_settings(callback) end

---show menu by name and pause the machine
---@param menu_name string
function emu.show_menu(menu_name) end

---register callback after reset
---@param callback function
function emu.add_machine_reset_notifier(callback) end

---register callback after stopping
---@param callback function
function emu.add_machine_stop_notifier(callback) end

---register callback at pause
---@param callback function
function emu.add_machine_pause_notifier(callback) end

---register callback at resume
---@param callback function
function emu.add_machine_resume_notifier(callback) end

---register callback at end of frame
---@param callback function
function emu.add_machine_frame_notifier(callback) end

---register callback before save
---@param callback function
function emu.add_machine_pre_save_notifier(callback) end

---register callback after load
---@param callback function
function emu.add_machine_post_load_notifier(callback) end

---Spin up a new thread to run Lua code in
---@return mame_thread
function emu.thread() end

---Return the current running tick counter
---@return number
function emu.osd_ticks() end

---Return the frequency of OSD ticks per second
---@return number
function emu.osd_ticks_per_second() end