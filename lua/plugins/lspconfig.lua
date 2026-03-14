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
<<<<<<< HEAD
||||||| parent of f55a647 (before ia)
      "biome",
=======
      -- "biome",
>>>>>>> f55a647 (before ia)
      "tailwindcss",
<<<<<<< HEAD
      "biome",
      "ts_ls",
      "astro",
||||||| parent of f55a647 (before ia)
      -- "astro",
=======
      -- "ts_ls",
      -- "astro",
>>>>>>> f55a647 (before ia)
    },
    automatic_installation = true,
  },
}
