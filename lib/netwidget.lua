local awful = require("awful")
local wibox = require("wibox")
local vicious = require("vicious")
local string = require("string")

module("netwidget")

function netwidget_text(netif)
    return '⬇️<span color="#5798d9">${' ..netif.. ' down_kb}</span> ⬆️<span color="#c2ba62">${' ..netif.. ' up_kb}</span> '
end

function register(netif)
    widget = wibox.widget.textbox()
    widget.forced_width = 80
    widget.align = "center"
    vicious.register(widget, vicious.widgets.net, netwidget_text(netif) , 2)
    return widget
end
