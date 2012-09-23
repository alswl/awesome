-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
    -- www / dev / im / dev / dev / dev / media / util / nautilus
    names = {"1:w", "2:d", "3:im", "4:d", "5:m", "6:d", "7", "8:u","9:n"},
    layouts = {
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.max,
        awful.layout.suit.floating,
        awful.layout.suit.floating,
        awful.layout.suit.floating,
        awful.layout.suit.floating,
        awful.layout.suit.floating,
        awful.layout.suit.floating
    }
}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    if s == 1 then
        tags[s] = awful.tag(tags.names, s, tags.layouts)
    else -- 第二屏幕，是竖起来的 -- FIXME
        tags[s] = awful.tag(tags.names, s, awful.layout.suit.tile.bottom)
    end
end
-- }}}
