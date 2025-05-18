return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPost",
  dependencies = { "nvim-lua/plenary.nvim" },
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
          buffer = 1,
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
          buffer = 1,
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
          buffer = 1,
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
          buffer = 1,
          desc = "reset hunk",
        },
        {
          "<leader>mS",
          gitsigns.stage_buffer,
          buffer = 1,
          desc = "stage buffer",
        },
        {
          "<leader>mR",
          gitsigns.reset_buffer,
          buffer = 1,
          desc = "reset buffer",
        },
      }
    end,
  },
}
