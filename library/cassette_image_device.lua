---@meta _

---Wraps MAME's `cassette_image_device` class, representing a compact cassette
---mechanism typically used by a home computer for program storage.
---@class cassette_image_device: device, device_image
---@field is_stopped boolean (read-only) A Boolean indicating whether the cassette is stopped (i.e. not recording and not playing).
---@field is_playing boolean (read-only) A Boolean indicating whether playback is enabled (i.e. the cassette will play if the motor is enabled).
---@field is_recording boolean (read-only) A Boolean indicating whether recording is enabled (i.e. the cassette will record if the motor is enabled).
---@field motor_state boolean (read/write) A Boolean indicating whether the cassette motor is enabled.
---@field speaker_state boolean (read/write) A Boolean indicating whether the cassette speaker is enabled.
---@field position number (read-only) The current position as a floating-point number in units of seconds relative to the start of the tape.
---@field length number (read-only) The length of the tape as a floating-point number in units of seconds, or zero (0) if no tape image is mounted.
local cassette_image_device = {}

---Disables playback.
function cassette_image_device:stop() end

---Enables playback. The cassette will play if the motor is enabled.
function cassette_image_device:play() end

---Sets forward play direction.
function cassette_image_device:forward() end

---Sets reverse play direction.
function cassette_image_device:reverse() end

---Jump to the specified position on the tape. The time is a floating-point
---number in units of seconds, relative to the point specified by the whence
---argument. The whence argument must be one of "set", "cur" or "end" to seek
---relative to the start of the tape, the current position, or the end of the
---tape, respectively.
---@param time number
---@param whence 'set'|'cur'|'end'
function cassette_image_device:seek(time, whence) end

return cassette_image_device