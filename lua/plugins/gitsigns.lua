return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require "gitsigns"
      local wk = require "which-key"

      wk.add {
        {
          "<leader>gb",
          function()
            gitsigns.blame_line { full = true }
          end,
          buffer = bufnr,
          desc = "blame",
        },
        {
          "<leader>gn",
          function()
            if vim.wo.diff then
              vim.cmd.normal { "]c", bang = true }
            else
              gitsigns.nav_hunk "next"
            end
          end,
          buffer = bufnr,
          desc = "next hunk",
        },
        {
          "<leader>gp",
          function()
            if vim.wo.diff then
              vim.cmd.normal { "[c", bang = true }
            else
              gitsigns.nav_hunk "prev"
            end
          end,
          buffer = bufnr,
          desc = "prev hunk",
        },
        {
          "<leader>gh",
          gitsigns.stage_hunk,
          buffer = bufnr,
          desc = "stage hunk",
        },
        {
          "<leader>gr",
          gitsigns.reset_hunk,
          buffer = bufnr,
          desc = "reset hunk",
        },
        {
          "<leader>gH",
          gitsigns.stage_buffer,
          buffer = bufnr,
          desc = "stage buffer",
        },
        {
          "<leader>gR",
          gitsigns.reset_buffer,
          buffer = bufnr,
          desc = "reset buffer",
        },
        {
          "<leader>gd",
          gitsigns.diffthis,
          buffer = bufnr,
          desc = "diff file",
        },
      }
    end,
  },
}
