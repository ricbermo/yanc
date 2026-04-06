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
      "tailwindcss",
      "emmet_ls",
      "biome",
      "astro",
    },
    automatic_installation = true,
  },
}
