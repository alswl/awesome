local awful = require("awful")
local vicious = require("vicious")

module("memwidget")

function register()
    memwidget = awful.widget.graph()
    memwidget:set_width(32)
    --memwidget:set_vertical(true)
    memwidget:set_background_color("#494B4F")
    memwidget:set_border_color(nil)
    memwidget:set_color({
        type = "linear",
        from = { 0, 0 },
        to = { 10,0 },
        stops = { {0, "#AECF96"}, {0.5, "#88A175"}, 
        {1, "#FF5656"}}}
        )
        vicious.register(memwidget, vicious.widgets.mem, "$1", 13)
    return memwidget
end
