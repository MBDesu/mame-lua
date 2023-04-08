---@meta _

---Wraps MAME's `running_machine` class, which represents an emulation session.
---It provides access to the other core objects that implement an emulation
---session as well as the emulated device tree.
---@class running_machine
---@field time attotime                                      (read-only) The elapsed emulated time for the current session as an [`attotime`](attotime.lua).
---@field system driver_metadata                             (read-only) The [driver metadata](driver_metadata.lua) for the current system.
---@field parameters parameters_manager                      (read-only) The [parameters manager](parameters_manager.lua) for the current emulation session.
---@field video video_manager                                (read-only) The [video manager](video_manager.lua) for the current emulation session.
---@field sound sound_manager                                (read-only) The [sound manager](sound_manager.lua) for the current emulation session.
---@field output output_manager                              (read-only) The [output manager](output_manager.lua) for the current emulation session.
---@field memory memory_manager                              (read-only) The emulated [memory manager](memory_manager.lua) for the current emulation session.
---@field ioport ioport_manager                              (read-only) The [I/O port manager](ioport_manager.lua) for the current emulation session.
---@field input input_manager                                (read-only) The [input manager](input_manager.lua) for the current emulation session.
---@field natkeyboard natural_keyboard                       (read-only) Gets the [natural keyboard manager](natural_keyboard.lua), used for controlling keyboard and keypad input to the emulated system.
---@field uiinput ui_input_manager                           (read-only) The [UI input manager](ui_input_manager.lua) for the current emulation session.
---@field render render_manager                              (read-only) The [render manager](render_manager.lua) for the current emulation session.
---@field debugger debugger_manager                          (read-only) The [debugger manager](debugger_manager.lua) for the current emulation session, or nil if the debugger is not enabled.
---@field options unknown                                    (read-only) The user-specified options for the current emulation session.
---@field samplerate number                                  (read-only) The output audio sample rate in Hertz.
---@field paused boolean                                     (read-only) A boolean indicating whether emulation is not currently running, usually because the session has been paused or the emulated system has not completed starting.
---@field exit_pending boolean                               (read-only) A boolean indicating whether the emulation session is scheduled to exit.
---@field hard_reset_pending boolean                         (read-only) A boolean indicating whether a hard reset of the emulated system is pending.
---@field devices device_enumerator<device>                  (read-only) A [device enumerator](https://docs.mamedev.org/techspecs/luareference.html#luareference-dev-enum) that yields all [devices](device.lua) in the emulated system.
---@field palettes device_enumerator<device_palette>         (read-only) A [device enumerator](https://docs.mamedev.org/techspecs/luareference.html#luareference-dev-enum) that yields all [palette devices](device_palette.lua) in the emulated system.
---@field screens device_enumerator<screen_device>           (read-only) A [device enumerator](https://docs.mamedev.org/techspecs/luareference.html#luareference-dev-enum) that yields all [screen devices](screen_device.lua) in the emulated system.
---@field cassettes device_enumerator<cassette_image_device> (read-only) A [device enumerator](https://docs.mamedev.org/techspecs/luareference.html#luareference-dev-enum) that yields all [cassette image devices](cassette_image_device.lua) in the emulated system.
---@field images device_enumerator<device_image>             (read-only) A [device enumerator](https://docs.mamedev.org/techspecs/luareference.html#luareference-dev-enum) that yields all [media image devices](device_image.lua) in the emulated system.
---@field slots device_enumerator<device_slot>               (read-only) A [device enumerator](https://docs.mamedev.org/techspecs/luareference.html#luareference-dev-enum) that yields all [slot devices](device_slot.lua) in the emulated system.
local running_machine = {}

---Schedules an exit from the current emulation session. This will either return
---to the system selection menu or exit the application, depending on how it was
---started. This method returns immediately, before the scheduled exit takes
---place.
function running_machine:exit() end

---Schedules a hard reset. This is implemented by tearing down the emulation
---session and starting another emulation session for the same system. This
---method returns immediately, before the scheduled reset takes place.
function running_machine:hard_reset() end

---Schedules a soft reset. This is implemented by calling the reset method of
---the root device, which is propagated down the device tree. This method
---returns immediately, before the scheduled reset takes place.
function running_machine:soft_reset() end

---Schedules saving machine state to the specified file. If the file name is a
---relative path, it is considered to be relative to the first configured save
---state directory. This method returns immediately, before the machine state is
---saved. If this method is called when a save or load operation is already
---pending, the previously pending operation will be cancelled.
---@param filename string
function running_machine:save(filename) end

---Schedules loading machine state from the specified file. If the file name is
---a relative path, the configured save state directories will be searched. This
---method returns immediately, before the machine state is saved. If this method
---is called when a save or load operation is already pending, the previously
---pending operation will be cancelled.
---@param filename string
function running_machine:load(filename) end

---Displays a pop-up message to the user. If the message is not provided, the
---currently displayed pop-up message (if any) will be hidden.
---@param message? string
function running_machine:popmessage(message) end

---Writes the message to the machine error log. This may be displayed in a
---debugger window, written to a file, or written to the standard error output.
---@param msg string
function running_machine:logerror(msg) end

return running_machine