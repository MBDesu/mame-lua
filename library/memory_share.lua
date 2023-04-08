---@meta _

---Wraps MAME's `memory_share` class, representing a named allocated memory
---zone.
---@class memory_share
---@field tag string (read-only) The absolute tag of the memory share.
---@field size number (read-only) The size of the memory share in bytes.
---@field length number (read-only) The length of the memory share in native width elements.
---@field endianness 'big'|'little' (read-only) The Endianness of the memory share (`"big"` or `"little"`).
---@field bitwidth number (read-only) The native element width of the memory share in bits.
---@field bytewidth number (read-only) The native element width of the memory share in bytes.
local memory_share = {}

---Reads a signed integer value of the size in bits from the specified offset in
---the memory share.
---@param offs number The memory address to read from
---@return number
function memory_share:read_i8(offs) end

---Reads a signed integer value of the size in bits from the specified offset in
---the memory share.
---@param offs number The memory address to read from
---@return number
function memory_share:read_i16(offs) end

---Reads a signed integer value of the size in bits from the specified offset in
---the memory share.
---@param offs number The memory address to read from
---@return number
function memory_share:read_i32(offs) end

---Reads a signed integer value of the size in bits from the specified offset in
---the memory share.
---@param offs number The memory address to read from
---@return number
function memory_share:read_i64(offs) end

---Reads an unsigned integer value of the size in bits from the specified offset
---in the memory share.
---@param offs number The memory address to read from
---@return number
function memory_share:read_u8(offs) end

---Reads an unsigned integer value of the size in bits from the specified offset
---in the memory share.
---@param offs number The memory address to read from
---@return number
function memory_share:read_u16(offs) end

---Reads an unsigned integer value of the size in bits from the specified offset
---in the memory share.
---@param offs number The memory address to read from
---@return number
function memory_share:read_u32(offs) end

---Reads an unsigned integer value of the size in bits from the specified offset
---in the memory share.
---@param offs number The memory address to read from
---@return number
function memory_share:read_u64(offs) end

---Writes a signed integer value of the size in bits to the specified offset in
---the memory share.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_share:write_i8(offs, val) end

---Writes a signed integer value of the size in bits to the specified offset in
---the memory share.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_share:write_i16(offs, val) end

---Writes a signed integer value of the size in bits to the specified offset in
---the memory share.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_share:write_i32(offs, val) end

---Writes a signed integer value of the size in bits to the specified offset in
---the memory share.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_share:write_i64(offs, val) end

---Writes an unsigned integer value of the size in bits to the specified offset
---in the memory share.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_share:write_u8(offs, val) end

---Writes an unsigned integer value of the size in bits to the specified offset
---in the memory share.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_share:write_u16(offs, val) end

---Writes an unsigned integer value of the size in bits to the specified offset
---in the memory share.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_share:write_u32(offs, val) end

---Writes an unsigned integer value of the size in bits to the specified offset
---in the memory share.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_share:write_u64(offs, val) end

return memory_share