---@meta _

---Wraps MAME's `render_texture` class, representing a texture that can be drawn
---in a render container. Render textures must be freed before the emulation
---session ends.
---@class render_texture
---@field valid boolean (read-only) A Boolean indicating whether the texture is valid (false if the texture has been freed).
local render_texture = {}

---Frees the texture. The storage of the underlying bitmap will be released.
function render_texture:free() end

return render_texture