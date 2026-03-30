return {
  "mason-org/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      "lua_ls",
      "jsonls",
      "eslint",
      -- "biome",
      "tailwindcss",
      -- "ts_ls",
      -- "astro",
    },
    automatic_installation = true,
  },
}
