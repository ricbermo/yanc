local wk = require "which-key"

return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPost",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      wk.add {
        { "<leader>mb", "<CMD>Gitsigns blame_line<CR>", buffer = 1, desc = "blame" },
        {
          "<leader>mn",
          function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
          end,
          buffer = 1,
          desc = "next git change",
        },
        {
          "<leader>mp",
          function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
          end,
          buffer = 1,
          desc = "prev git change",
        },
      }
    end,
  },
}
