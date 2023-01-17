local saga = prequire("lspsaga")
if not saga then return end

local signs = require("utils").signs

saga.setup({
  ui = {
    border = 'rounded',
    code_action = signs.LightBulb
  }
})
