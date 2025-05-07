return {
  "saghen/blink.cmp",
  version = "v1.2.0",
  event = "InsertEnter",
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
    },
    {
      "giuxtaposition/blink-cmp-copilot",
    },
  },
  opts = {
    keymap = {
      ["<CR>"] = { "accept", "fallback" },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
        treesitter_highlighting = true,
      },
      list = {
        selection = { preselect = false, auto_insert = true },
      },
    },
    signature = { enabled = true },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
        },
      },
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
    },
  },
  opts_extend = { "sources.default" },
}
