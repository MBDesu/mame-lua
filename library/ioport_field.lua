---@meta _

---Wraps MAME's `ioport_field` class, representing a field within an I/O port.
---@class ioport_field
---@field device device               (read-only) The device that owns the port that the field belongs to.
---@field port ioport_port            (read-only) The I/O port that the field belongs to.
---@field live ioport_field_live      (read-only) The live state of the field.
---@field type number                 (read-only) The input type of the field. This is an enumerated value.
---@field name number                 (read-only) The display name for the field.
---@field default_name number         (read-only) The name for the field from the emulated system's configuration (cannot be overridden by scripts or plugins).
---@field player number               (read-only) Zero-based player number for the field.
---@field mask number                 (read-only) Bits in the I/O port corresponding to this field.
---@field defvalue number             (read-only) The field's default value.
---@field minvalue number             (read-only) The minimum allowed value for analog fields, or nil for digital fields.
---@field maxvalue number             (read-only) The maximum allowed value for analog fields, or nil for digital fields.
---@field sensitivity number          (read-only) The sensitivity or gain for analog fields, or nil for digital fields.
---@field way number                  (read-only) The number of directions allowed by the restrictor plate/gate for a digital joystick, or zero (`0`) for other inputs.
---@field type_class 'keyboard'|'controller'|'config'|'dipswitch'|'misc' (read-only) The type class for the input field - one of `"keyboard"`, `"controller"`, `"config"`, `"dipswitch"` or `"misc"`.
---@field is_analog boolean           (read-only) A Boolean indicating whether the field is an analog axis or positional control.
---@field is_digital_joystick boolean (read-only) A Boolean indicating whether the field corresponds to a digital joystick switch.
---@field enabled boolean             (read-only) A Boolean indicating whether the field is enabled.
---@field optional boolean            (read-only) A Boolean indicating whether the field is optional and not required to use the emulated system.
---@field cocktail boolean            (read-only) A Boolean indicating whether the field is only used when the system is configured for a cocktail table cabinet.
---@field toggle boolean              (read-only) A Boolean indicating whether the field corresponds to a hardware toggle switch or push-on, push-off button.
---@field rotated boolean             (read-only) A Boolean indicating whether the field corresponds to a control that is rotated relative its standard orientation.
---@field analog_reverse boolean      (read-only) A Boolean indicating whether the field corresponds to an analog control that increases in the opposite direction to the convention (e.g. larger values when a pedal is released or a joystick is moved to the left).
---@field analog_reset boolean        (read-only) A Boolean indicating whether the field corresponds to an incremental position input (e.g. a dial or trackball axis) that should be reset to zero for every video frame.
---@field analog_wraps boolean        (read-only) A Boolean indicating whether the field corresponds to an analog input that wraps from one end of its range to the other (e.g. an incremental position input like a dial or trackball axis).
---@field analog_invert boolean       (read-only) A Boolean indicating whether the field corresponds to an analog input that has its value ones-complemented.
---@field impulse boolean             (read-only) A Boolean indicating whether the field corresponds to a digital input that activates for a fixed amount of time.
---@field crosshair_scale number      (read-only) The scale factor for translating the field's range to crosshair position. A value of one (1) translates the field's full range to the full width or height the screen.
---@field crosshair_offset number     (read-only) The offset for translating the field's range to crosshair position.
---@field user_value number           (read/write) The value for DIP switch or configuration settings.
---@field settings table              (read-only) Gets a table of the currently enabled settings for a DIP switch or configuration field, indexed by value.
local ioport_field = {}

---Set the value of the I/O port field. For digital fields, the value is
---compared to zero to determine whether the field should be active; for analog
---fields, the value must be right-aligned and in the correct range.
---@param value number
function ioport_field:set_value(value) end

---Clear programmatically overridden value and restore the field's regular
---behaviour.
function ioport_field:clear_value() end

---Set the input sequence for the specified sequence type. This is used to
---configure per-machine input settings. The sequence type must be "standard",
---"increment" or "decrement".
---@param seqtype 'standard'|'increment'|'decrement'
---@param seq input_seq
function ioport_field:set_input_seq(seqtype, seq) end

---Get the configured input sequence for the specified sequence type. This gets
---per-machine input assignments. The sequence type must be "standard",
---"increment" or "decrement".
---@param seq_type 'standard'|'increment'|'decrement'
---@return input_seq
function ioport_field:input_seq(seq_type) end

---Set the default input sequence for the specified sequence type. This
---overrides the default input assignment for a specific input. The sequence
---type must be "standard", "increment" or "decrement".
---@param seq_type 'standard'|'increment'|'decrement'
---@param seq input_seq
function ioport_field:set_default_input_seq(seq_type, seq) end

---Gets the default input sequence for the specified sequence type. If the
---default assignment is not overridden, this gets the general input assignment.
---The sequence type must be "standard", "increment" or "decrement".
---@param seq_type 'standard'|'increment'|'decrement'
---@return input_seq
function ioport_field:default_input_seq(seq_type) end

---Gets a table of characters corresponding to the field for the specified shift
---state. The shift state is a bit mask of active shift keys.
---@param shift number
---@return table
function ioport_field:keyboard_codes(shift) end

return ioport_field