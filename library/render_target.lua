---@meta _

---Wraps MAME's `render_target` class, which represents a video output channel.
---This could be a host window or screen, or a hidden target used for rendering
---screenshots.
---@class render_target
---@field index number             (read-only) The 1-based index of the render target. This has O(n) complexity.
---@field width number             (read-only) The width of the render target in output pixels. This is an integer.
---@field height number            (read-only) The height of the render target in output pixels. This is an integer.
---@field pixel_aspect number      (read-only) The width-to-height aspect ratio of the render target's pixels. This is a floating-point number.
---@field hidden boolean           (read-only) A Boolean indicating whether this is an internal render target that is not displayed to the user directly (e.g. the render target used to draw screenshots).
---@field is_ui_target boolean     (read-only) A Boolean indicating whether this is the render target used to display the user interface.
---@field max_update_rate number   (read/write) The maximum update rate for the render target in Hertz.
---@field orientation number       (read/write) The target orientation flags. This is an integer bit mask, where bit 0 (0x01) is set to mirror horizontally, bit 1 (0x02) is set to mirror vertically, and bit 2 (0x04) is set to mirror along the top left-bottom right diagonal.
---@field view_names table         The names of the available views for this render target. Uses 1-based integer indices. The find and index_of methods have O(n) complexity; all other supported operations have O(1) complexity.
---@field current_view layout_view (read-only) The currently selected view for the render target. This is a [layout view](layout_view.lua) object.
---@field view_index number        (read/write) The 1-based index of the selected view for this render target.
---@field visibility_mask number   (read-only) An integer bit mask indicating which item collections are currently visible for the current view.
---@field screen_overlay boolean   (read/write) A Boolean indicating whether screen overlays are enabled.
---@field zoom_to_screen boolean   (read/write) A Boolean indicating whether the render target is configured to scale so that the emulated screen(s) fill as much of the output window/screen as possible.
local render_target = {}
return render_target