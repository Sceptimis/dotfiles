local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
modkey = "Mod4"

-- Set global keybinds
local keys = gears.table.join(
        -- Main
        awful.key({ modkey, "Shift" }, "r", awesome.restart, { description = "restart awesome", group = "main"}),
        awful.key({ modkey, }, "s", hotkeys_popup.show_help, { description = "show help", group = "main"}),
        awful.key({ }, "XF86AudioPlay", function() os.execute("playerctl play-pause") end, { description = "play-pause media", group = "main"}),
        awful.key({ }, "XF86AudioPrev", function() os.execute("playerctl previous") end, { description = "skip to previous media", group = "main"}),
        awful.key({ }, "XF86AudioNext", function() os.execute("playerctl next") end, { description = "skip to next media", group = "main"}),

        -- Applications
        awful.key({ modkey, }, "Return", function() awful.spawn(os.getenv("TERMINAL")) end, { description = "open the default terminal", group = "applications"}),
        awful.key({ modkey, }, "o", function() awful.spawn("nemo") end, { description = "File Manager", group = "applications"}),
        awful.key({ modkey, }, "`", function() awful.spawn("sharenix-section") end, { description = "Capture (Select)", group = "applications"}),
        awful.key({ modkey, "Shift" }, "`", function() awful.spawn("sharenix-window") end, { description = "Capture (Window)", group = "applications"}),
        awful.key({ modkey, }, "Tab", function() awful.spawn("/bin/fish -c \"rofi -show-icons -show drun\"") end, { description = "Application Launcher", group = "applications"}),
        awful.key({ modkey, "Shift" }, "Tab", function() awful.spawn("/bin/fish -c \"rofi -show-icons -show run\"") end, { description = "Shell Launcher", group = "applications"}),

        -- Tags
        awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view tag to the left", group = "tag"}),
        awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view tag to the right", group = "tag"}),
        awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "view previous tag", group = "tag"}),

        --awful.button({ modkey }, 4, awful.tag.viewprev),
        --awful.button({ modkey }, 5, awful.tag.viewnext),


        -- Client
        awful.key({ modkey, }, "f", function()
            if client.focus then
                client.focus.fullscreen = not client.focus.fullscreen
                client.focus:raise()
            end
        end, { description = "toggle fullscreen", group = "client" }),

        awful.key({ modkey }, "q", function()
            if client.focus then
                client.focus:kill()
            end
        end, { description = "kill client", group = "client" }),

        awful.key({ modkey }, "m", function()
            if client.focus then
                client.focus.floating = not client.focus.floating
                client.focus:raise()
            end
        end, { description = "set client floating", group = "client" })

)

-- Add Workspace Keybinds
for i = 1, 5 do
    keys = gears.table.join(keys,
    -- View tag only.
            awful.key({ modkey }, "#" .. i + 9,
                    function()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                            tag:view_only()
                        end
                    end, { description = "view tag #" .. i, group = "tag" }),

    -- Toggle tag display.
            awful.key({ modkey, "Control" }, "#" .. i + 9,
                    function()
                        local tag = focusedScreen.tags[i]
                        if tag then
                            awful.tag.viewtoggle(tag)
                        end
                    end, { description = "toggle tag #" .. i, group = "tag" }),

    -- Move client to tag.
            awful.key({ modkey, "Shift" }, "#" .. i + 9,
                    function()
                        if client.focus then
                            local tag = client.focus.screen.tags[i]
                            if tag then
                                client.focus:move_to_tag(tag)
                            end
                        end
                    end, { description = "move focused client to tag #" .. i, group = "tag" }),

    -- Toggle tag on focused client.
            awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                    function()
                        if client.focus then
                            local tag = client.focus.screen.tags[i]
                            if tag then
                                client.focus:toggle_tag(tag)
                            end
                        end
                    end, { description = "toggle focused client on tag #" .. i, group = "tag" }))
end

-- Set keybinds.
root.keys(keys)

-- Set Mouse Bindings
root.buttons(
        gears.table.join(
            awful.button({}, 4, awful.tag.viewprev),
            awful.button({}, 5, awful.tag.viewnext)
        )
)

-- Set client/window controls
root.clientbuttons = gears.table.join(
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)
