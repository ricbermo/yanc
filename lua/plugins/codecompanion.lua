return {
  -- enabled = false,
  "olimorris/codecompanion.nvim",
  cmd = { "CodeCompanionChat", "CodeCompanionActions", "CodeCompanion" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "echasnovski/mini.diff", version = "*" },
  },
  opts = {
    strategies = {
      chat = {
        adapter = "anthropic",
      },
      inline = {
        adapter = "copilot",
      },
    },
    display = {
      diff = {
        enabled = true,
        close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
        layout = "vertical", -- vertical|horizontal split for default provider
        opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        provider = "mini_diff", -- default|mini_diff
      },
      action_palette = {
        width = 95,
        height = 10,
        prompt = "Prompt ", -- Prompt used for interactive LLM calls
        provider = "telescope", -- Can be "default", "telescope", or "mini_pick". If not specified, the plugin will autodetect installed providers.
        opts = {
          show_default_actions = true, -- Show the default actions in the action palette?
          show_default_prompt_library = true, -- Show the default prompt library in the action palette?
        },
      },
    },
  },
  init = function()
    require("mini.diff").setup()
    local wk = require "which-key"

    wk.add {
      { "<leader>ac", "<CMD>CodeCompanionChat<CR>", desc = "open chat" },
      { "<leader>at", "<CMD>CodeCompanionChat Toggle<CR>", desc = "toggle chat" },
      { "<leader>ap", "<CMD>CodeCompanionActions<CR>", desc = "open copilot palette" },
      { "<leader>as", "<CMD>CodeCompanion<CR>", desc = "open inline assistant" },
      { "<leader>aca", "<CMD>CodeCompanionChat Add<CR>", desc = "add selection to chat" },
    }
  end,
}
