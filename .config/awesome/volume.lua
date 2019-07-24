local awful = require("awful")
local dpi   = require("beautiful.xresources").apply_dpi
local wibox = require("wibox")

volume_widget = wibox.widget {
   {
      id     = "icon",
      widget = wibox.widget.imagebox,
      image  = awful.util.getdir("config") .. "/icons2/volume.png"
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

volume_widget.up = function()
   awful.spawn.easy_async("amixer set Master 5%+", function(stdout, stderr, exitreason, exitcode)
       volume_widget.text:set_text(stdout:match("(%d+%%)"))
   end)
end

volume_widget.down = function()
   awful.spawn.easy_async("amixer set Master 5%-", function(stdout, stderr, exitreason, exitcode)
       volume_widget.text:set_text(stdout:match("(%d+%%)"))
   end)
end

volume_widget.mute = function()
   awful.spawn.easy_async("amixer set Master toggle", function(stdout, stderr, exitreason, exitcode)
      if stdout:match("off") then
         volume_widget.icon.image = awful.util.getdir("config") .. "/icons2/volume-mute.png"
      else
         volume_widget.icon.image = awful.util.getdir("config") .. "/icons2/volume.png"
      end
   end)
end

awful.widget.watch("amixer get Master", 5,
   function(widget, stdout, stderr, exitreason, exitcode)
      local percent, on_off = stdout:match("%[(%d+%%)%] %[%-?%d+%.%d%ddB%] %[(%w+)%]")
      widget.text.text = percent
      if on_off == "off" then
         widget.icon.image = awful.util.getdir("config") .. "/icons2/volume-mute.png"
      else
         widget.icon.image = awful.util.getdir("config") .. "/icons2/volume.png"
      end
   end,
   volume_widget
)

return volume_widget
