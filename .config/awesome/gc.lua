local gears = require("gears")

-- Hack to force continuous garbage collection.
--
-- https://github.com/awesomewm/awesome/issues/1489
-- https://github.com/awesomewm/awesome/issues/1490
-- https://github.com/awesomewm/awesome/issues/2288
-- https://github.com/awesomewm/awesome/issues/2858
gc = gears.timer {
   timeout   = 30,
   autostart = true,
   callback  = function()
      collectgarbage()
   end,
}

return gc
