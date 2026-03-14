return {
  "lewis6991/gitsigns.nvim",
<<<<<<< HEAD
  event = { "BufReadPre", "BufNewFile" },
||||||| parent of f55a647 (before ia)
  event = "BufReadPost",
  dependencies = { "nvim-lua/plenary.nvim" },
=======
  event = "BufReadPost",
>>>>>>> f55a647 (before ia)
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require "gitsigns"
      local wk = require "which-key"

      wk.add {
        {
          "<leader>mb",
          function()
            gitsigns.blame_line { full = true }
          end,
          desc = "blame",
        },
        {
          "<leader>mn",
          function()
            if vim.wo.diff then
              vim.cmd.normal { "]c", bang = true }
            else
              gitsigns.nav_hunk "next"
            end
          end,
          desc = "next git change",
        },
        {
          "<leader>mp",
          function()
            if vim.wo.diff then
              vim.cmd.normal { "[c", bang = true }
            else
              gitsigns.nav_hunk "prev"
            end
          end,
          desc = "prev git change",
        },
        {
          "<leader>ms",
          gitsigns.stage_hunk,
          buffer = 1,
          desc = "stage hunk",
        },
        {
          "<leader>mr",
          gitsigns.reset_hunk,
          desc = "reset hunk",
        },
        {
          "<leader>mS",
          gitsigns.stage_buffer,
          desc = "stage buffer",
        },
        {
          "<leader>mR",
          gitsigns.reset_buffer,
          desc = "reset buffer",
        },
      }
    end,
  },
}
