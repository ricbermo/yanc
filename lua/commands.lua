vim.api.nvim_create_autocmd("User", {
  pattern = "PackerCompileDone",
  callback = function()
    vim.cmd "CatppuccinCompile"
    vim.defer_fn(function()
      vim.cmd "colorscheme catppuccin"
    end, 0)
  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "plugins.lua", "catppuccin.lua" },
  callback = function()
    vim.cmd "PackerCompile"
  end
})

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    vim.cmd("Catppuccin " .. (vim.v.option_new == "light" and "latte" or "mocha"))
  end,
})
