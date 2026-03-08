require("full-border"):setup()
require("folder-rules"):setup()
require("no-status"):setup()

if Header.redraw then
	Header.redraw = function()
		return {}
	end
else
	Header.render = function()
		return {}
	end
end

local old_layout = Tab.layout
Tab.layout = function(self, ...)
	self._area = ui.Rect({ x = self._area.x, y = self._area.y - 1, w = self._area.w, h = self._area.h + 1 })
	return old_layout(self, ...)
end
