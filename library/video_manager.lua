---@meta _

---Wraps MAME's `video_manager` class, which is responsible for coordinating
---emulated video drawing, speed throttling, and reading host inputs.
---@class video_manager
---@field speed_factor number (read-only) Configured emulation speed adjustment in per mille (i.e. the ratio to normal speed multiplied by 1,000).
---@field throttled boolean (read/write) A Boolean indicating whether MAME should wait before video updates to avoid running faster than the target speed.
---@field throttle_rate number (read/write) The target emulation speed as a ratio of full speed adjusted by the speed factor (i.e. 1 is normal speed adjusted by the speed factor, larger numbers are faster, and smaller numbers are slower).
---@field frameskip number (read/write) The number of emulated video frames to skip drawing out of every twelve, or -1 to automatically adjust the number of frames to skip to maintain the target emulation speed.
---@field speed_percent number (read-only) The current emulated speed as a percentage of the full speed adjusted by the speed factor.
---@field effective_frameskip number (read-only) The number of emulated frames that are skipped out of every twelve.
---@field skip_this_frame boolean (read-only) A Boolean indicating whether the video manager will skip drawing emulated screens for the current frame.
---@field snap_native boolean (read-only) A Boolean indicating whether the video manager will take native emulated screen snapshots. In addition to the relevant configuration setting, the emulated system must have at least one emulated screen.
---@field is_recording boolean (read-only) A Boolean indicating whether any video recordings are currently in progress.
---@field snapshot_target render_target (read-only) The render target used to produce snapshots and video recordings.
local video_manager = {}

---Updates emulated screens, reads host inputs, and updates video output.
function video_manager:frame_update() end

---Saves snapshot files according to the current configuration. If MAME is
---configured to take native emulated screen snapshots, one snapshot will be
---saved for each emulated screen that is visible in a host window/screen with
---the current view configuration. If MAME is not configured to use take native
---emulated screen snapshots or if the system has no emulated screens, a single
---snapshot will be saved using the currently selected snapshot view.
function video_manager:snapshot() end

---Stops any video recordings currently in progress and starts recording either
---the visible emulated screens or the current snapshot view, depending on
---whether MAME is configured to take native emulated screen snapshots.
---
---If the file name is not supplied, the configured snapshot file name is used.
---If the file name is a relative path, it is interpreted relative to the first
---configured snapshot directory. If the format is supplied, it must be "avi" or
---"mng". If the format is not supplied, it defaults to AVI.
---comment
---@param filename? string
---@param format? 'avi'|'mng'
function video_manager:begin_recording(filename, format) end

---Stops any video recordings that are in progress.
function video_manager:end_recording() end

---Returns the width and height in pixels of snapshots created with the current
---snapshot target configuration and emulated screen state. This may be
---configured explicitly by the user, or calculated based on the selected
---snapshot view and the resolution of any visible emulated screens.
---@return number width, number height
function video_manager:snapshot_size() end

---Returns the pixels of a snapshot created using the current snapshot target
---configuration as 32-bit integers packed into a binary string in host Endian
---order. Pixels are organised in row-major order, from left to right then top
---to bottom. Pixel values are colours in RGB format packed into 32-bit
---integers.
function video_manager:snapshot_pixels() end

return video_manager