--[[
This is a simple example the Hello World! with LibNotify
--]]

notify = require("notify")

hello = notify.new("Hello World!", "from lua :)")
notify.set_urgency(hello, 1)
notify.show(hello)