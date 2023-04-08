---@meta _

---Wraps MAME's `memory_region` class, representing a memory region used to
---store read-only data like ROMs or the result of fixed decryptions.
---@class memory_region
---@field tag string (read-only) The absolute tag of the memory region.
---@field size number (read-only) The size of the memory region in bytes.
---@field length number (read-only) The length of the memory region in native width elements.
---@field endianness 'big'|'little' (read-only) The Endianness of the memory region (`"big"` or `"little"`).
---@field bitwidth number (read-only) The native element width of the memory region in bits.
---@field bytewidth number (read-only) The native element width of the memory region in bytes.
local memory_region = {}

---Reads a signed integer value of the size in bits from the specified offset in
---the memory region.
---@param offs number The memory address to read from
---@return number
function memory_region:read_i8(offs) end

---Reads a signed integer value of the size in bits from the specified offset in
---the memory region.
---@param offs number The memory address to read from
---@return number
function memory_region:read_i16(offs) end

---Reads a signed integer value of the size in bits from the specified offset in
---the memory region.
---@param offs number The memory address to read from
---@return number
function memory_region:read_i32(offs) end

---Reads a signed integer value of the size in bits from the specified offset in
---the memory region.
---@param offs number The memory address to read from
---@return number
function memory_region:read_i64(offs) end

---Reads an unsigned integer value of the size in bits from the specified offset
---in the memory region.
---@param offs number The memory address to read from
---@return number
function memory_region:read_u8(offs) end

---Reads an unsigned integer value of the size in bits from the specified offset
---in the memory region.
---@param offs number The memory address to read from
---@return number
function memory_region:read_u16(offs) end

---Reads an unsigned integer value of the size in bits from the specified offset
---in the memory region.
---@param offs number The memory address to read from
---@return number
function memory_region:read_u32(offs) end

---Reads an unsigned integer value of the size in bits from the specified offset
---in the memory region.
---@param offs number The memory address to read from
---@return number
function memory_region:read_u64(offs) end

---Writes a signed integer value of the size in bits to the specified offset in
---the memory region.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_region:write_i8(offs, val) end

---Writes a signed integer value of the size in bits to the specified offset in
---the memory region.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_region:write_i16(offs, val) end

---Writes a signed integer value of the size in bits to the specified offset in
---the memory region.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_region:write_i32(offs, val) end

---Writes a signed integer value of the size in bits to the specified offset in
---the memory region.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_region:write_i64(offs, val) end

---Writes an unsigned integer value of the size in bits to the specified offset
---in the memory region.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_region:write_u8(offs, val) end

---Writes an unsigned integer value of the size in bits to the specified offset
---in the memory region.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_region:write_u16(offs, val) end

---Writes an unsigned integer value of the size in bits to the specified offset
---in the memory region.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_region:write_u32(offs, val) end

---Writes an unsigned integer value of the size in bits to the specified offset
---in the memory region.
---@param offs number The memory address to write to
---@param val number The value to write
function memory_region:write_u64(offs, val) end

return memory_region