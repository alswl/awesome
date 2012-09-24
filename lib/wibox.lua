-- {{{ Wibox
-- Text Clock
textclock1 = awful.widget.textclock({ align = "right" })
-- Memory Widget
memwidget1 = memwidget.register()
-- Cpu Widget
cpuwidget1 = cpuwidget.register()
-- Net Interface Speed
netwidget1 = netwidget.register(widget({ type = "textbox" }), "wlan0")
-- Volume Control
volume1 = volume.register()
-- Battery
batwidget1 = battery.register()

-- Main Wibox
mywibox = {}
mysystray = widget({ type = "systray" })
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytasklist = { }
mystatuslist = { }

-- Create a systray
--Create a wibox for each screen and add it
mytaglist.buttons = awful.util.table.join(
    awful.button({ }, 1, awful.tag.viewonly),
    awful.button({ modkey }, 1, awful.client.movetotag),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, awful.client.toggletag),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
)
mytasklist.buttons = awful.util.table.join(
    awful.button({}, 1,
        function (c)
            if c == client.focus then
                c.minimized = true
            else
                if not c:isvisible() then
                    awful.tag.viewonly(c:tags()[1])
                end
                -- This will also un-minimize
                -- the client, if needed
                client.focus = c
                c:raise()
            end
        end),
    awful.button({ }, 3,
        function ()
            if instance then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({ width=250 })
            end
        end),
    awful.button({ }, 4,
        function ()
            awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end),
    awful.button({ }, 5,
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end)
)

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({
        layout = awful.widget.layout.horizontal.leftright
    })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(
        awful.util.table.join(
            awful.button({ }, 1,
                function () awful.layout.inc(layouts, 1) end),
            awful.button({ }, 3,
                function () awful.layout.inc(layouts, -1) end),
            awful.button({ }, 4,
                function () awful.layout.inc(layouts, 1) end),
            awful.button({ }, 5,
                function () awful.layout.inc(layouts, -1) end)
        )
    )
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(
        s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(
        function(c)
            return awful.widget.tasklist.label.currenttags(c, s)
        end, mytasklist.buttons
    )
end

for s = 1, screen.count() do
    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            s == 1 and cpuwidget1 or nil,
            s == 1 and memwidget1 or nil,
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        textclock1,
        s == 1 and mysystray or nil,
        s == 1 and netwidget1 or nil,
        s == 1 and volume1 or nil,
        s == 1 and batwidget1 or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}
