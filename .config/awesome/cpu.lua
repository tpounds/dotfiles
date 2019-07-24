local awful = require("awful")
local dpi   = require("beautiful.xresources").apply_dpi
local wibox = require("wibox")

cpu_widget = wibox.widget {
   {
      id     = "icon",
      widget = wibox.widget.imagebox,
      image  = awful.util.getdir("config") .. "/icons2/cpu2.png"
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

local idle_prev = 0
local used_prev = 0

awful.widget.watch("cat /proc/stat | grep '^cpu '", 1,
   function(widget, stdout, stderr, exitreason, exitcode)
      -- http://man7.org/linux/man-pages/man5/proc.5.html
      local user, nice, system, idle, iowait, irq, softirq, steal, guest, guest_nice
         = stdout:match("(%d+) (%d+) (%d+) (%d+) (%d+) (%d+) (%d+) (%d+) (%d+) (%d+)")

      local idle_now = idle + iowait
      local idle_diff = idle_now - idle_prev
      idle_prev = idle_now

      local used_now = user + nice + system + irq + softirq + steal
      local used_diff = used_now - used_prev
      used_prev = used_now

      widget.text:set_text(
         string.format("%2.0f%%", (100 * used_diff) / (idle_diff + used_diff)))
   end,
   cpu_widget
)

return cpu_widget
