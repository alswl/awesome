local awful = require("awful")
local vicious = require("vicious")
local widget_module = require("wibox.widget")

module("battery")

function register()
    widget = widget_module.textbox()
    vicious.register(widget, vicious.widgets.bat, '🔋 $1$2%', 5, 'BAT0')
    return widget
end
