---@meta _

---Wraps MAME's `address_space` class, which represents an address space
---belonging to a device.
---@class address_space
---@field name string (read-only) The display name for the address space.
---@field shift number (read-only) The address granularity for the address space specified as the shift required to translate a byte address to a native address. Positive values shift towards the most significant bit (left) and negative values shift towards the least significant bit (right).
---@field index number (read-only) The zero-based space index. Some space indices have special meanings for the debugger.
---@field address_mask number (read-only) The address mask for the space.
---@field data_width number (read-only) The data width for the space in bits.
---@field endianness 'big'|'little' (read-only) The Endianness of the space (`"big"` or `"little"`).
---@field map address_map (read-only) The configured address map for the space or nil.
local address_space = {}

---Reads a signed integer value of the size in bits from the specified address.
---@param addr number The address to read from
---@return number
function address_space:read_i8(addr) end

---Reads a signed integer value of the size in bits from the specified address.
---@param addr number The address to read from
---@return number
function address_space:read_i16(addr) end

---Reads a signed integer value of the size in bits from the specified address.
---@param addr number The address to read from
---@return number
function address_space:read_i32(addr) end

---Reads a signed integer value of the size in bits from the specified address.
---@param addr number The address to read from
---@return number
function address_space:read_i64(addr) end

---Reads an unsigned integer value of the size in bits from the specified
---address.
---@param addr number The address to read from
---@return number
function address_space:read_u8(addr) end

---Reads an unsigned integer value of the size in bits from the specified
---address.
---@param addr number The address to read from
---@return number
function address_space:read_u16(addr) end

---Reads an unsigned integer value of the size in bits from the specified
---address.
---@param addr number The address to read from
---@return number
function address_space:read_u32(addr) end

---Reads an unsigned integer value of the size in bits from the specified
---address.
---@param addr number The address to read from
---@return number
function address_space:read_u64(addr) end

---Writes a signed integer value of the size in bits to the specified address.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_i8(addr, val) end

---Writes a signed integer value of the size in bits to the specified address.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_i16(addr, val) end

---Writes a signed integer value of the size in bits to the specified address.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_i32(addr, val) end

---Writes a signed integer value of the size in bits to the specified address.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_i64(addr, val) end

---Writes an unsigned integer value of the size in bits to the specified
---address.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_u8(addr, val) end

---Writes an unsigned integer value of the size in bits to the specified
---address.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_u16(addr, val) end

---Writes an unsigned integer value of the size in bits to the specified
---address.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_u32(addr, val) end

---Writes an unsigned integer value of the size in bits to the specified
---address.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_u64(addr, val) end

---Reads a signed integer value of the size in bits from the specified virtual
---address. The address is translated with the debug read intent. Returns zero
---if address translation fails.
---@param addr number The address to read from
---@return number
function address_space:readv_i8(addr) end

---Reads a signed integer value of the size in bits from the specified virtual
---address. The address is translated with the debug read intent. Returns zero
---if address translation fails.
---@param addr number The address to read from
---@return number
function address_space:readv_i16(addr) end

---Reads a signed integer value of the size in bits from the specified virtual
---address. The address is translated with the debug read intent. Returns zero
---if address translation fails.
---@param addr number The address to read from
---@return number
function address_space:readv_i32(addr) end

---Reads a signed integer value of the size in bits from the specified virtual
---address. The address is translated with the debug read intent. Returns zero
---if address translation fails.
---@param addr number The address to read from
---@return number
function address_space:readv_i64(addr) end

---Reads an unsigned integer value of the size in bits from the specified
---virtual address. The address is translated with the debug read intent.
---Returns zero if address translation fails.
---@param addr number The address to read from
---@return number
function address_space:readv_u8(addr) end

---Reads an unsigned integer value of the size in bits from the specified
---virtual address. The address is translated with the debug read intent.
---Returns zero if address translation fails.
---@param addr number The address to read from
---@return number
function address_space:readv_u16(addr) end

---Reads an unsigned integer value of the size in bits from the specified
---virtual address. The address is translated with the debug read intent.
---Returns zero if address translation fails.
---@param addr number The address to read from
---@return number
function address_space:readv_u32(addr) end

---Reads an unsigned integer value of the size in bits from the specified
---virtual address. The address is translated with the debug read intent.
---Returns zero if address translation fails.
---@param addr number The address to read from
---@return number
function address_space:readv_u64(addr) end

---Writes a signed integer value of the size in bits to the specified virtual
---address. The address is translated with the debug write intent. Does not
---write if address translation fails.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:writev_i8(addr, val) end

---Writes a signed integer value of the size in bits to the specified virtual
---address. The address is translated with the debug write intent. Does not
---write if address translation fails.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:writev_i16(addr, val) end

---Writes a signed integer value of the size in bits to the specified virtual
---address. The address is translated with the debug write intent. Does not
---write if address translation fails.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:writev_i32(addr, val) end

---Writes a signed integer value of the size in bits to the specified virtual
---address. The address is translated with the debug write intent. Does not
---write if address translation fails.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:writev_i64(addr, val) end

---Writes an unsigned integer value of the size in bits to the specified virtual
---address. The address is translated with the debug write intent. Does not
---write if address translation fails.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:writev_u8(addr, val) end

---Writes an unsigned integer value of the size in bits to the specified virtual
---address. The address is translated with the debug write intent. Does not
---write if address translation fails.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:writev_u16(addr, val) end

---Writes an unsigned integer value of the size in bits to the specified virtual
---address. The address is translated with the debug write intent. Does not
---write if address translation fails.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:writev_u32(addr, val) end

---Writes an unsigned integer value of the size in bits to the specified virtual
---address. The address is translated with the debug write intent. Does not
---write if address translation fails.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:writev_u64(addr, val) end

---Reads a signed integer value of the size in bits from the specified address
---one byte at a time by obtaining a read pointer for each byte address. If a
---read pointer cannot be obtained for a byte address, the corresponding result
---byte will be zero.
---@param addr number The address to read from
---@return number
function address_space:read_direct_i8(addr) end

---Reads a signed integer value of the size in bits from the specified address
---one byte at a time by obtaining a read pointer for each byte address. If a
---read pointer cannot be obtained for a byte address, the corresponding result
---byte will be zero.
---@param addr number The address to read from
---@return number
function address_space:read_direct_i16(addr) end

---Reads a signed integer value of the size in bits from the specified address
---one byte at a time by obtaining a read pointer for each byte address. If a
---read pointer cannot be obtained for a byte address, the corresponding result
---byte will be zero.
---@param addr number The address to read from
---@return number
function address_space:read_direct_i32(addr) end

---Reads a signed integer value of the size in bits from the specified address
---one byte at a time by obtaining a read pointer for each byte address. If a
---read pointer cannot be obtained for a byte address, the corresponding result
---byte will be zero.
---@param addr number The address to read from
---@return number
function address_space:read_direct_i64(addr) end

---Reads an unsigned integer value of the size in bits from the specified
---address one byte at a time by obtaining a read pointer for each byte address.
---If a read pointer cannot be obtained for a byte address, the corresponding
---result byte will be zero.
---@param addr number The address to read from
---@return number
function address_space:read_direct_u8(addr) end

---Reads an unsigned integer value of the size in bits from the specified
---address one byte at a time by obtaining a read pointer for each byte address.
---If a read pointer cannot be obtained for a byte address, the corresponding
---result byte will be zero.
---@param addr number The address to read from
---@return number
function address_space:read_direct_u16(addr) end

---Reads an unsigned integer value of the size in bits from the specified
---address one byte at a time by obtaining a read pointer for each byte address.
---If a read pointer cannot be obtained for a byte address, the corresponding
---result byte will be zero.
---@param addr number The address to read from
---@return number
function address_space:read_direct_u32(addr) end

---Reads an unsigned integer value of the size in bits from the specified
---address one byte at a time by obtaining a read pointer for each byte address.
---If a read pointer cannot be obtained for a byte address, the corresponding
---result byte will be zero.
---@param addr number The address to read from
---@return number
function address_space:read_direct_u64(addr) end

---Writes a signed integer value of the size in bits to the specified address
---one byte at a time by obtaining a write pointer for each byte address. If a
---write pointer cannot be obtained for a byte address, the corresponding byte
---will not be written.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_direct_i8(addr, val) end

---Writes a signed integer value of the size in bits to the specified address
---one byte at a time by obtaining a write pointer for each byte address. If a
---write pointer cannot be obtained for a byte address, the corresponding byte
---will not be written.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_direct_i16(addr, val) end

---Writes a signed integer value of the size in bits to the specified address
---one byte at a time by obtaining a write pointer for each byte address. If a
---write pointer cannot be obtained for a byte address, the corresponding byte
---will not be written.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_direct_i32(addr, val) end

---Writes a signed integer value of the size in bits to the specified address
---one byte at a time by obtaining a write pointer for each byte address. If a
---write pointer cannot be obtained for a byte address, the corresponding byte
---will not be written.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_direct_i64(addr, val) end

---Writes an unsigned integer value of the size in bits to the specified address
---one byte at a time by obtaining a write pointer for each byte address. If a
---write pointer cannot be obtained for a byte address, the corresponding byte
---will not be written.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_direct_u8(addr, val) end

---Writes an unsigned integer value of the size in bits to the specified address
---one byte at a time by obtaining a write pointer for each byte address. If a
---write pointer cannot be obtained for a byte address, the corresponding byte
---will not be written.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_direct_u16(addr, val) end

---Writes an unsigned integer value of the size in bits to the specified address
---one byte at a time by obtaining a write pointer for each byte address. If a
---write pointer cannot be obtained for a byte address, the corresponding byte
---will not be written.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_direct_u32(addr, val) end

---Writes an unsigned integer value of the size in bits to the specified address
---one byte at a time by obtaining a write pointer for each byte address. If a
---write pointer cannot be obtained for a byte address, the corresponding byte
---will not be written.
---@param addr number The address to write to
---@param val number The value to write to `addr`
function address_space:write_direct_u64(addr, val) end

---Reads a range of addresses as a binary string. The end address must be
---greater than or equal to the start address. The width must be 8, 16, 30 or
---64. If the step is provided, it must be a positive number of elements.
---@param start_addr number
---@param end_addr number
---@param width 8|16|32|64
---@param step? unknown
---@return unknown
function address_space:read_range(start_addr, end_addr, width, step) end

---Add a callback to receive notifications for handler changes in address space.
---The callback function is passed a single string as an argument, either r if
---read handlers have potentially changed, w if write handlers have potentially
---changed, or rw if both read and write handlers have potentially changed.
---
---Returns a notifier subscription.
---comment
---@param start_addr number
---@param end_addr number
---@param name string
---@param callback fun(changed: 'r'|'w'|'rw')
---@return notifier_subscription
function address_space:install_read_tap(start_addr, end_addr, name, callback) end

---Installs a pass-through handler that will receive notifications on reads from
---the specified range of addresses in the address space. The start and end
---addresses are inclusive. The name must be a string, and the callback must be
---a function.
---
---The callback is passed three arguments for the access offset, the data read,
---and the memory access mask. The offset is the absolute offset into the
---address space. To modify the data being read, return the modified value from
---the callback function as an integer. If the callback does not return an
---integer, the data will not be modified.
---@param callback fun(offset: number, data: number, mask: number): number|any
function address_space:add_change_notifier(callback) end

---Installs a pass-through handler that will receive notifications on write to
---the specified range of addresses in the address space. The start and end
---addresses are inclusive. The name must be a string, and the callback must be
---a function.
---
---The callback is passed three arguments for the access offset, the data
---written, and the memory access mask. The offset is the absolute offset into
---the address space. To modify the data being written, return the modified
---value from the callback function as an integer. If the callback does not
---return an integer, the data will not be modified.
---@param start_addr number
---@param end_addr number
---@param name string
---@param callback fun(offset: number, data: number, mask: number): number|any
function address_space:install_write_tap(start_addr, end_addr, name, callback) end

return address_space