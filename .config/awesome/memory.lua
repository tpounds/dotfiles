local awful = require("awful")
local dpi   = require("beautiful.xresources").apply_dpi
local wibox = require("wibox")

mem_widget = wibox.widget {
   {
      id     = "icon",
      widget = wibox.widget.imagebox,
      image  = awful.util.getdir("config") .. "/icons2/memory.png"
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

awful.widget.watch("free | grep Mem:", 1,
   function(widget, stdout, stderr, exitreason, exitcode)
      -- http://man7.org/linux/man-pages/man1/free.1.html
      local total, used, free, shared, buffcache, available
         = stdout:match("(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)")

      widget.text:set_text(
         string.format("%2.0f%%", (100 * used) / total))
   end,
   mem_widget
)

return mem_widget
