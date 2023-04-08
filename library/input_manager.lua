---@meta _

---Wraps MAME's `input_manager` class, which reads host input devices and checks
---whether configured inputs are active.
---@class input_manager
---@field device_classes table<string, input_class> (read-only) Gets a table of host input device classes indexed by name.
local input_manager = {}

---Gets the current value for the host input corresponding to the specified
---code. Returns a signed integer value, where zero is the neutral position.
---@param code number
---@return number
function input_manager:code_value(code) end

---Returns a Boolean indicating whether the host input corresponding to the
---specified code has a non-zero value (i.e. it is not in the neutral position).
---@param code number
---@return boolean
function input_manager:code_pressed(code) end

---Returns a Boolean indicating whether the host input corresponding to the
---specified code has moved away from the neutral position since the last time
---it was checked using this function. The input manager can track a limited
---number of inputs this way.
---@param code number
---@return boolean
function input_manager:code_pressed_once(code) end

---Get display name for an input code.
---@param code number
---@return string
function input_manager:code_name(code) end

---Get token string for an input code. This should be used when saving
---configuration.
---@param code number
---@return string
function input_manager:code_to_token(code) end

---Convert a token string to an input code. Returns the invalid input code if
---the token is not valid or belongs to an input device that is not present.
---@param token string
---@return number
function input_manager:code_from_token(token) end

---Returns a Boolean indicating whether the supplied input sequence is currently
---pressed.
---@param seq input_seq
---@return boolean
function input_manager:seq_pressed(seq) end

---Remove invalid elements from the supplied input sequence. Returns the new,
---cleaned input sequence.
---@param seq input_seq
---@return input_seq
function input_manager:seq_clean(seq) end

---Get display text for an input sequence.
---@param seq input_seq
---@return string
function input_manager:seq_name(seq) end

---Convert an input sequence to a token string. This should be used when saving
---configuration.
---@param seq input_seq
---@return string
function input_manager:seq_to_tokens(seq) end

---Convert a token string to an input sequence. This should be used when loading
---configuration.
---@param tokens string
---@return input_seq
function input_manager:seq_from_tokens(tokens) end

---Returns an input code poller for obtaining an analog host input code.
---@return input_code_poller
function input_manager:axis_code_poller() end

---Returns an input code poller for obtaining a host switch input code.
---@return input_code_poller
function input_manager:switch_code_poller() end

---Returns an input code poller for obtaining a host switch input code that only
---considers keyboard input devices.
---@return input_code_poller
function input_manager:keyboard_code_poller() end

---Returns an input sequence poller for obtaining an input sequence for
---configuring an analog input.
---@return input_sequence_poller
function input_manager:axis_sequence_poller() end

---Returns an input sequence poller for obtaining an input sequence for
---configuring a digital input.
---@return input_sequence_poller
function input_manager:axis_sequence_poller() end

return input_manager