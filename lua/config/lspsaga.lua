local saga = prequire("lspsaga")
if not saga then return end

local signs = require("utils").signs

saga.setup({
  ui = {
    border = 'rounded',
    code_action = signs.LightBulb,
    diagnostic = signs.Hint,
    expand = signs.Expanded,
    collapse = signs.Collapsed,
    hover = signs.File,
  }
})
