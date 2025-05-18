return {
  "mason-org/mason-lspconfig.nvim",
  event = "BufReadPost",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      "lua_ls",
      -- "ts_ls",
      "jsonls",
      "eslint",
      -- "tailwindcss",
      "astro",
    },
    automatic_installation = true,
  },
}
