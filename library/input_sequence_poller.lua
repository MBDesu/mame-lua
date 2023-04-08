---@meta _

---Wraps MAME's `input_sequence_poller` poller class, which allows users to assign host input combinations to emulated inputs and other actions.
---@class input_sequence_poller
---@field sequence input_seq (read-only) The current input sequence. This is updated while polling. It is possible for the sequence to become invalid.
---@field valid boolean      (read-only) A Boolean indicating whether the current input sequence is valid.
---@field modified boolean   (read-only) A Boolean indicating whether the sequence was changed by any user input since starting polling.
local input_sequence_poller = {}

---Start polling. If a sequence is supplied, it is used as a starting sequence:
---for analog inputs, the user can cycle between the full range, and the
---positive and negative portions of an axis; for switch inputs, an “or” code is
---appended and the user can add an alternate host input combination.
---@param seq? input_seq
function input_sequence_poller:start(seq) end

---Polls for for user input and updates the sequence if appropriate. Returns a
---Boolean indicating whether sequence input is complete. If this method returns
---false, you should continue polling.
---@return boolean
function input_sequence_poller:poll() end

return input_sequence_poller