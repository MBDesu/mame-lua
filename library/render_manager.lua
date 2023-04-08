---@meta _

---Wraps MAME's `render_manager` class, responsible for managing render targets and textures.
---@class render_manager
---@field max_update_rate number        (read-only) The maximum update rate in Hertz. This is a floating-point number.
---@field ui_target render_target       (read-only) The [render target](render_target.lua) used to draw the user interface (including menus, sliders and pop-up messages). This is usually the first host window or screen.
---@field ui_container render_container (read-only) The [render container](render_container.lua) used for drawing the user interface.
---@field targets number                (read-only) The list of render targets, including output windows and screens, as well as hidden render targets used for things like rendering screenshots. Uses 1-based integer indices. The index operator and the at method have O(n) complexity.
local render_manager = {}

---Creates a [render texture](render_texture.lua) based on a
---[bitmap](bitmap.lua). The bitmap must be owned by the Lua script, and must
---use the Y'CbCr, RGB or ARGB pixel format. The bitmap's storage will be
---locked, preventing resizing and reallocation. Render textures must be freed
---before the emulation session ends.
---@param bitmap bitmap
---@return render_texture
function render_manager:texture_alloc(bitmap) end

return render_manager