---@meta _

---Wraps MAME's `natural_keyboard` class, which manages emulated keyboard and
---keypad inputs.
---@class natural_keyboard
---@field empty boolean (read-only) A Boolean indicating whether the natural keyboard manager's input buffer is empty.
---@field full boolean (read-only) A Boolean indicating whether the natural keyboard manager's input buffer is full.
---@field can_post boolean (read-only) A Boolean indicating whether the emulated system supports posting character data via the natural keyboard manager.
---@field is_posting boolean (read-only) A Boolean indicating whether posted character data is currently being delivered to the emulated system.
---@field in_use boolean (read/write) A Boolean indicating whether “natural keyboard” mode is enabled. When “natural keyboard” mode is enabled, the natural keyboard manager translates host character input to emulated system keystrokes.
---@field keyboards table<string, keyboard_input_device> Gets the keyboard/keypad input devices in the emulated system, indexed by absolute device tag. Index get has O(n) complexity; all other supported operations have O(1) complexity.
local natural_keyboard = {}

---Post literal text to the emulated machine. The machine must have keyboard
---inputs with character bindings, and the correct keyboard input device must be
---enabled.
function natural_keyboard:post(text) end

---Post text to the emulated machine. Brace-enclosed codes are interpreted in
---the text. The machine must have keyboard inputs with character bindings, and
---the correct keyboard input device must be enabled.
---
---The recognised codes are `{BACKSPACE}`, `{BS}`, `{BKSP}`, `{DEL}`,
---`{DELETE}`, `{END}`, `{ENTER}`, `{ESC}`, `{HOME}`, `{INS}`, `{INSERT}`,
---`{PGDN}`, `{PGUP}`, `{SPACE}`, `{TAB}`, `{F1}`, `{F2}`, `{F3}`, `{F4}`,
---`{F5}`, `{F6}`, `{F7}`, `{F8}`, `{F9}`, `{F10}`, `{F11}`, `{F12}`, and
---`{QUOTE}`.
function natural_keyboard:post_coded(text) end

---Post the contents of the host clipboard to the emulated machine. The machine
---must have keyboard inputs with character bindings, and the correct keyboard
---input device must be enabled.
function natural_keyboard:paste() end

---Returns a string with a human-readable description of the keyboard and keypad
---input devices in the system, whether they are enabled, and their character
---bindings.
function natural_keyboard:dump() end

return natural_keyboard