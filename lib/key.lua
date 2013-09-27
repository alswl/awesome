-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,}, "Left", awful.tag.viewprev),
    awful.key({ modkey,}, "Right", awful.tag.viewnext),
    --awful.key({ modkey,}, "Escape", awful.tag.history.restore),

    awful.key({ modkey,}, "j", switch.client_switch_next),
    awful.key({ modkey,}, "k", switch.client_switch_prev),
    --awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, }, "Escape",
        function ()
            switch.tag_switch(tags, switch.get_last_tag()) -- TODO check diffent with Escape
        end),
    awful.key({ modkey,}, "Tab",
        function ()
            if screen.count() == 1 then return end
            switch.save_tag_status()
            awful.screen.focus_relative(-1)
            switch.restore_tag_status()
        end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto), -- TODO what?
    --awful.key({ modkey, }, "Tab",
        --function ()
            --awful.client.focus.history.previous()
            --if client.focus then
                --client.focus:raise()
            --end
        --end),

    -- Standard program
    awful.key({ modkey, }, "Return",
        function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "\\", awesome.restart),
    --awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey, }, "l",
        function () awful.tag.incmwfact( 0.05) end),
    awful.key({ modkey,           }, "h",
        function () awful.tag.incmwfact(-0.05)    end),
    --awful.key({ modkey, "Shift"   }, "h",
        --function () awful.tag.incnmaster( 1)      end),
    --awful.key({ modkey, "Shift"   }, "l",
        --function () awful.tag.incnmaster(-1)      end),
    --awful.key({ modkey, "Control" }, "h",
        --function () awful.tag.incncol( 1)         end),
    --awful.key({ modkey, "Control" }, "l",
        --function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space",
        function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space",
        function () awful.layout.inc(layouts, -1) end),

    --awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Lock screen
    awful.key({ modkey, "Shift" }, "l",
        function () awful.util.spawn("xscreensaver-command -lock") end),

    -- Prompt
    awful.key({ modkey }, "p",
        function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
        function ()
            awful.prompt.run({ prompt = "Run Lua code: " },
            mypromptbox[mouse.screen].widget,
            awful.util.eval, nil,
            awful.util.getdir("cache") .. "/history_eval")
        end),
    volume.get_keys(volume1)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey, }, "f",
        function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift" }, "c", function (c) c:kill() end),
    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle),
    awful.key({ modkey, "Control" }, "Return",
        function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey, }, "i",
        function (c)
            if screen.count() == 1 then
                return
            end
            switch.save_tag_status()
            local tag_idx = awful.tag.getidx(awful.tag.selected(client.focus.screen))
            local c_tag = c:tags()[1]
            local cs_index = client.focus and client.focus.screen or mouse.screen
            local target_screen_index = cs_index % screen:count() + 1
            awful.tag.viewonly(tags[target_screen_index][tag_idx]) -- prepare target tag/screen
            for i = 1, table.getn(c_tag:clients()) do
                awful.client.movetoscreen(c_tag:clients()[i], target_screen_index) -- default to screen + 1
                awful.client.movetotag(tags[cs_index % screen:count() + 1][tag_idx], c_tag:clients()[i])
            end
            awful.tag.viewonly(tags[client.focus.screen][tag_idx])
            switch.restore_tag_status()
        end),
    awful.key({ modkey, }, "o", function (c)
        if screen.count() == 1 then
            return
        end
        awful.client.movetoscreen(c)
    end),
    awful.key({ modkey, "Shift" }, "r", function (c) c:redraw() end),
    awful.key({ modkey, }, "t", function (c) c.ontop = not c.ontop end),
    awful.key({ modkey, }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey, }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end),

    -- Sound
    awful.key({ modkey, }, "-",
        function () awful.util.spawn("amixer -q -c 0 sset Master 5%-") end),
    awful.key({ modkey, }, "=",
        function () awful.util.spawn("amixer -q -c 0 sset Master 5%+") end),
    awful.key({ modkey, }, "BackSpace",
        function () awful.util.spawn("amixer -q -c 0 sset Master toggle") end),
    -- Screen Brightness
    awful.key({ modkey, }, "[",
        function () awful.util.spawn("xbacklight - 10") end),
    awful.key({ modkey, }, "]",
        function () awful.util.spawn("xbacklight + 10") end),
    awful.key({}, "XF86MonBrightnessUp",
        function () awful.util.spawn("xbacklight + 10") end),
    awful.key({}, "XF86MonBrightnessDown",
        function () awful.util.spawn("xbacklight - 10") end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    key = string.sub(tags['names'][i], 1, 1)
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, key,
            function ()
                switch.tag_switch(tags, i)
            end),
        awful.key({ modkey, "Control" }, key,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, key,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, key,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}
