return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        javascript = true,
        typescript = true,
      },
      copilot_node_command = vim.fn.expand "$HOME" .. "/.asdf/installs/nodejs/23.1.0/bin/node",
    }
  end,
}
