local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.se,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.max,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.top,
}

-- Helper functions
local function client_menu_toggle_fn()
    local instance = nil

    return function()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(awful.button({}, 1, function(t)
    t:view_only()
end),
        awful.button({ modkey }, 1, function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end),
        awful.button({}, 3, awful.tag.viewtoggle),
        awful.button({ modkey }, 3, function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end),
        awful.button({}, 4, function(t)
            awful.tag.viewprev(t.screen)
        end),
        awful.button({}, 5, function(t)
            awful.tag.viewnext(t.screen)
        end))

local tasklist_buttons = gears.table.join(awful.button({}, 1, function(c)
    if c == client.focus then
        c.minimized = true
    else
        -- Without this, the following
        -- :isvisible() makes no sense
        c.minimized = false
        if not c:isvisible() and c.first_tag then
            c.first_tag:view_only()
        end
        -- This will also un-minimize
        -- the client, if needed
        client.focus = c
        c:raise()
    end
end),
        awful.button({}, 3, client_menu_toggle_fn()),
        awful.button({}, 4, function()
            awful.client.focus.byidx(1)
        end),
        awful.button({}, 5, function()
            awful.client.focus.byidx(-1)
        end))


-- Time to create each screen's bar.
awful.screen.connect_for_each_screen(function(s)

    if s == screen.primary then
        -- Set tags
        awful.tag({1,2,3,4,5}, s, awful.layout.layouts[1])
        
        -- Create a taglist widget
        tag_list = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

        -- Create a tasklist widget
        task_list = awful.widget.tasklist {
            screen   = s,
            filter   = awful.widget.tasklist.filter.currenttags,
            buttons  = tasklist_buttons,
            layout   = {
                spacing_widget = {
                    {
                        forced_width  = 5,
                        forced_height = 15,
                        thickness     = 1,
                        color         = '#777777',
                        widget        = wibox.widget.separator
                    },
                    valign = 'center',
                    halign = 'center',
                    widget = wibox.container.place,
                },
                spacing = 3,
                layout  = wibox.layout.fixed.horizontal
            },

            widget_template = {
                {
                    wibox.widget.base.make_widget(),
                    forced_height = 2,
                    id            = 'background_role',
                    widget        = wibox.container.background,
                },
                {
                    {
                        id     = 'clienticon',
                        widget = awful.widget.clienticon,
                    },
                    margins = 5,
                    widget  = wibox.container.margin
                },
                nil,
                create_callback = function(self, c, index, objects) --luacheck: no unused args
                    self:get_children_by_id('clienticon')[1].client = c
                end,
                layout = wibox.layout.align.vertical,
            },
        }

        -- Create the layout button
        layout_button = awful.widget.layoutbox(s)
        layout_button:buttons(gears.table.join(awful.button({}, 1, function() awful.layout.inc(1) end),
                awful.button({}, 3, function() awful.layout.inc(-1) end),
                awful.button({}, 4, function() awful.layout.inc(1) end),
                awful.button({}, 5, function() awful.layout.inc(-1) end)))

        -- Create the wibox
        bar = awful.wibar({ position = "top", screen = s, height = beautiful.bar_height})

        -- Add widgets to the wibox
        bar:setup {
            layout = wibox.layout.align.horizontal,
            {
                -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                tag_list,
            },
                task_list, -- Middle widget
            {
                -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),
                wibox.widget.textclock(),
                layout_button,
            }
        }
    else
        awful.tag({1}, s, awful.layout.layouts[2])
    end
end)
