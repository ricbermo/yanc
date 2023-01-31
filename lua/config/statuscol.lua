local statuscol = prequire("statuscol")
if not statuscol then return end

statuscol.setup({
  setopt = true,
  relculright = true,
  order = "SNsFs",
  foldfunc = "builtin",
})
