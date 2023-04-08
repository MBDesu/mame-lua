---@meta _

---Wraps MAME's `attotime` class, which represents a high-precision time
---interval. Attotime values support addition and subtraction with other attotime
---values, and multiplication and division by integers.
---@class attotime
---@field is_zero boolean    (read-only) A boolean indicating whether the value represents no elapsed time.
---@field is_never boolean   (read-only) A boolean indicating whether the value is greater than the maximum number of whole seconds that can be represented (treated as an unreachable time in the future or overflow).
---@field attoseconds number (read-only) The fraction seconds portion of the interval in attoseconds.
---@field seconds number     (read-only) The number of whole seconds in the interval.
---@field msec number        (read-only) The number of whole milliseconds in the fractional seconds portion of the interval.
---@field usec number        (read-only) The number of whole microseconds in the fractional seconds portion of the interval.
---@field nsec number        (read-only) The number of whole nanoseconds in the fractional seconds portion of the interval.
local attotime = {}

---Returns the time interval in seconds as a floating-point value
---@return number
function attotime:as_double() end

---Interprets the interval as a period and returns the corresponding frequency
---in Hertz as a floating-point value. Returns zero if `attotime.is_never` is
---`true`. The interval must not be zero.
---@return number
function attotime:as_hz() end

---Interprets the interval as a period and returns the corresponding frequency
---kilohertz as a floating-point value. Returns zero if `attotime.is_never` is
---`true`. The interval must not be zero.
---@return number
function attotime:as_khz() end

---Interprets the interval as a period and returns the corresponding frequency
---megahertz as a floating-point value. Returns zero if `attotime.is_never` is
---`true`. The interval must not be zero.
---@return number
function attotime:as_mhz() end

---Returns the interval as a whole number of periods at the specified frequency.
---The frequency is specified in Hertz.
function attotime:as_ticks(frequency) end

return attotime