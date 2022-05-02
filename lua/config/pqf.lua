local pqf = prequire("pqf")
if not pqf then return end

local signs = require("utils").signs

pqf.setup({
  signs = {
    error = signs.Error,
    warning = signs.Warn,
    info = signs.Info,
    hint = signs.Hint
  }
})
