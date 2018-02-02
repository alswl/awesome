-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

require("archmenu")

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() return false, hotkeys_popup.show_help end},
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end},
   { "suspend", "systemctl suspend"},
   { "power off", "systemctl poweroff"}
}

mymainmenu = awful.menu({
    items = {
        { "awesome", myawesomemenu, beautiful.awesome_icon },
        --{"Application (&A)", debian.menu.Debian_menu.Debian}, -- ubuntu
        {"Application (&A)", xdgmenu}, -- arch
        {"&Nautilus", "nautilus --no-desktop", '/usr/share/icons/hicolor/32x32/apps/nautilus.png'},
        {"&Thunar", "thunar"},
        --{"&Rox", "rox"},
        --{"&Emelfm2", "emelfm2"},
        {"Keyboard", "matchbox-keyboard", '/usr/share/pixmaps/matchbox-keyboard.png'},
        { "open terminal", terminal }
    }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}
