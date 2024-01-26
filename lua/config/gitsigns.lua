local wk = require "which-key"
local gitsigns = prequire "gitsigns"

gitsigns.setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local keymap = {
      buffer = bufnr,
      ["<leader>"] = {
        g = {
          name = "+git",
          b = { "<CMD>lua require('gitsigns').blame_line{full=false}<CR>", "blame" },
          n = {
            function()
              if vim.wo.diff then
                return "]c"
              end
              vim.schedule(function()
                gs.next_hunk()
              end)
            end,
            "next git change",
          },
          p = {
            function()
              if vim.wo.diff then
                return "[c"
              end
              vim.schedule(function()
                gs.prev_hunk()
              end)
            end,
            "prev git change",
          },
        },
      },
    }

    wk.register(keymap)
  end,
}
