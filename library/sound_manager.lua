---@meta _

---Wraps MAME's `sound_manager` class, which manages the emulated sound stream
---graph and coordinates sound output.
---@class sound_manager
---@field muted boolean (read-only) A Boolean indicating whether sound output is muted for any reason.
---@field ui_mute boolean (read/write) A Boolean indicating whether sound output is muted at the request of the user.
---@field debugger_mute boolean (read/write) A Boolean indicating whether sound output is muted at the request of the debugger.
---@field system_mute boolean (read/write) A Boolean indicating whether sound output is muted at the request of the emulated system.
---@field attenuation number (read/write) The output volume attenuation in decibels. Should generally be a negative integer or zero.
---@field recording boolean (read-only) A Boolean indicating whether sound output is currently being recorded to a WAV file.
local sound_manager = {}

---Starts recording to a WAV file. Has no effect if currently recording. If the
---file name is not supplied, uses the configured WAV file name (from command
---line or INI file), or has no effect if no WAV file name is configured.
---Returns true if recording started, or false if recording is already in
---progress, opening the output file failed, or no file name was supplied or
---configured.
---@param filename? string
---@return boolean
function sound_manager:start_recording(filename) end

---Stops recording and closes the file if currently recording to a WAV file.
function sound_manager:stop_recording() end

---Returns the current contents of the output sample buffer as a binary string.
---Samples are 16-bit integers in host byte order. Samples for left and right
---stereo channels are interleaved.
---@return string
function sound_manager:get_samples() end

return sound_manager