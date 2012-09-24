-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   --{ "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit },
   { "suspend", function () awful.util.spawn("sudo pm-suspend") end},
   { "power off", "dbus-send --system --print-reply --dest=org.freedesktop.ConsoleKit /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop"},
}

mymainmenu = awful.menu({
    items = {
        {"awesome", myawesomemenu, beautiful.awesome_icon},
        -- {"应用程序 (&A)", debian.menu.Debian_menu.Debian}, -- ubuntu
        -- {"应用程序 (&A)", xdgmenu}, -- arch
        {"&Nautilus", "nautilus --no-desktop", '/usr/share/icons/hicolor/32x32/apps/nautilus.png'},
        {"&Thunar", "thunar"},
        {"屏幕键盘", "matchbox-keyboard", '/usr/share/pixmaps/matchbox-keyboard.png'},
        {"open terminal", terminal }
    }
})

mylauncher = awful.widget.launcher({
    image = image(beautiful.awesome_icon),
    menu = mymainmenu })
-- }}}
