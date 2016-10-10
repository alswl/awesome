local awful = require("awful")

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
    -- www / dev / im / dev / dev / dev / media / util / nautilus
    names = {'`:T', "1:F", "2:C", "3:IM", "q:D", "w:D", "e:M", "a:U", "s:M"},
    layouts = {
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.floating,
        awful.layout.suit.floating,
        awful.layout.suit.floating
    }
}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    if s == 1 then
        tags[s] = awful.tag(tags.names, s, tags.layouts)
    else -- The second screen
        tags[s] = awful.tag(tags.names, s, awful.layout.suit.tile)
    end
end
-- }}}
