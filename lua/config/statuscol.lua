local statuscol = prequire "statuscol"
if not statuscol then
  return
end

local builtin = require "statuscol.builtin"

statuscol.setup {
  setopt = true,
  segments = {
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    { text = { "%s" }, click = "v:lua.ScSa" },
    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
  },
}
