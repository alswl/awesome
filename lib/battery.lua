local _M = {}

_M._VERSION = '0.0.1'

local mt = { __index = _M }

local vicious = require("vicious")
local widget_module = require("wibox.widget")

function _M.register(self)
    local widget = widget_module.textbox()
    vicious.register(widget, vicious.widgets.bat, '🔋 $1$2%', 5, 'BAT0')
    return widget
end

return _M
