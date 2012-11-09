-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   --{ "manual", terminal .. " -e man awesome" },
   --{ "edit config", editor_cmd .. " " .. awesome.conffile },
   --{ "restart", awesome.restart },
   --{ "quit", awesome.quit },
   --{ "suspend", "systemctl suspend"},
   --{ "power off", "systemctl poweroff"},
}

mymainmenu = awful.menu({
    items = {
        --{"awesome", myawesomemenu, beautiful.awesome_icon},
        --{"应用程序 (&A)", debian.menu.Debian_menu.Debian}, -- ubuntu
        --{"应用程序 (&A)", xdgmenu}, -- arch
        --{"&Nautilus", "nautilus --no-desktop", '/usr/share/icons/hicolor/32x32/apps/nautilus.png'},
        --{"&Thunar", "thunar"},
        --{"&Rox", "rox"},
        --{"&Emelfm2", "emelfm2"},
        --{"屏幕键盘", "matchbox-keyboard", '/usr/share/pixmaps/matchbox-keyboard.png'},
        --{"open terminal", terminal }
    }
})

mylauncher = awful.widget.launcher({
    image = image(beautiful.awesome_icon),
    menu = mymainmenu
})
-- }}}
