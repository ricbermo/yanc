local luasnip = prequire "luasnip"
if not luasnip then
  return
end

luasnip.config.set_config {
  history = true,
}

require("luasnip/loaders/from_vscode").lazy_load()

luasnip.filetype_extend("ruby", { "rails" })
luasnip.filetype_extend("typescript", { "javascript" })
