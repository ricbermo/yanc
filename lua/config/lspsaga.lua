local saga = prequire("lspsaga")
if not saga then return end

local signs = require("utils").signs

saga.init_lsp_saga({
  border_style = 'rounded',
  code_action_icon = signs.LightBulb,
  symbol_in_winbar = {
    in_custom = true
  }
})
