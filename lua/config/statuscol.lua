local statuscol = prequire("statuscol")
if not statuscol then return end

local builtin = require("statuscol.builtin")

statuscol.setup({
  setopt = true,
  relculright = true,
  order = "SNsFs",
  foldfunc = "builtin",
  segments = {
    { text = { "%s" },                       click = "v:lua.ScSa" },
    { text = { builtin.lnumfunc },           click = "v:lua.ScLa", },
    { text = { " ", builtin.foldfunc, " " }, click = "v:lua.ScFa" },
  }
}
)
