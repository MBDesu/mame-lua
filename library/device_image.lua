---@meta _

---Wraps MAME's `device_image_interface` class which is a mix-in implemented by
---devices that can load media image files.
---@class device_image
---@field is_readable boolean (read-only) A Boolean indicating whether the device supports reading.
---@field is_writeable boolean (read-only) A Boolean indicating whether the device supports writing.
---@field must_be_loaded boolean (read-only) A Boolean indicating whether the device requires a media image to be loaded in order to start.
---@field is_reset_on_load boolean (read-only) A Boolean indicating whether the device requires a hard reset to change media images (usually for cartridge slots that contain hardware in addition to memory chips).
---@field image_type_name string (read-only) A string for categorising the media device.
---@field instance_name string (read-only) The instance name of the device in the current configuration. This is used for setting the media image to load on the command line or in INI files. This is not stable, it may have a number appended that may change depending on slot configuration.
---@field brief_instance_name string (read-only) The brief instance name of the device in the current configuration. This is used for setting the media image to load on the command line or in INI files. This is not stable, it may have a number appended that may change depending on slot configuration.
---@field formatlist table<string, image_device_format> (read-only) The media image formats supported by the device, indexed by name. The index operator and index_of methods have O(n) complexity; all other supported operations have O(1) complexity.
---@field exists boolean (read-only) A Boolean indicating whether a media image file is mounted.
---@field readonly boolean (read-only) A Boolean indicating whether a media image file is mounted in read-only mode.
---@field filename string|nil (read-only) The full path to the mounted media image file, or nil if no media image is mounted.
---@field crc number (read-only) The 32-bit cyclic redundancy check of the content of the mounted image file if the mounted media image was not loaded from a software list, is mounted read-only and is not a CD-ROM, or zero (0) otherwise.
---@field loaded_through_softlist boolean (read-only) A Boolean indicating whether the mounted media image was loaded from a software list, or false if no media image is mounted.
---@field software_list_name string (read-only) The short name of the software list if the mounted media image was loaded from a software list.
---@field software_longname string (read-only) The full name of the software item if the mounted media image was loaded from a software list, or nil otherwise.
---@field software_publisher string (read-only) The publisher of the software item if the mounted media image was loaded from a software list, or nil otherwise.
---@field software_year string|nil (read-only) The release year of the software item if the mounted media image was loaded from a software list, or nil otherwise.
---@field software_parent string (read-only) The short name of the parent software item if the mounted media image was loaded from a software list, or nil otherwise.
---@field device device (read-only) The underlying device.
local device_image = {}

---Loads the specified file as a media image. Returns nil if no error or a
---string describing an error if an error occurred.
---@param filename string
function device_image:load(filename) end

---Loads a media image described in a software list. Returns nil if no error or
---a string describing an error if an error occurred.
---@param name string
function device_image:load_software(name) end

---Unloads the mounted image.
function device_image:unload() end

---Creates and mounts a media image file with the specified name. Returns nil if
---no error or a string describing an error if an error occurred.
---@param filename string
function device_image:create(filename) end

---Returns a “front panel display” string for the device, if supported. This can
---be used to show status information, like the current head position or motor
---state.
function device_image:display() end

return device_image