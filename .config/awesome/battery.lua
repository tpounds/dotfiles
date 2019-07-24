local awful = require("awful")
local dpi   = require("beautiful.xresources").apply_dpi
local wibox = require("wibox")

battery_widget = wibox.widget {
   {
      id     = "icon",
      widget = wibox.widget.imagebox,
      image  = awful.util.getdir("config") .. "/icons2/battery.png"
   },
   {
      id     = "text",
      widget = wibox.widget.textbox,
      align  = "left",
      text   = "0%",
      forced_width = dpi(32)
   },
   layout = wibox.layout.fixed.horizontal,
}

awful.widget.watch("cat /sys/class/power_supply/BAT0/capacity", 5,
   function(widget, stdout, stderr, exitreason, exitcode)
      widget.text:set_text(string.format("%2d%%", stdout))

      awful.spawn.easy_async("cat /sys/class/power_supply/BAT0/status", function(stdout, stderr, exitreason, exitcode)
         if stdout:match("Discharging") then
            widget.icon.image = awful.util.getdir("config") .. "/icons2/battery.png"
         else
            widget.icon.image = awful.util.getdir("config") .. "/icons2/plug.png"
         end
      end)
   end,
   battery_widget
)

return battery_widget
