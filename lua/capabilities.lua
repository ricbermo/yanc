vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    },
  },
  root_markers = { ".git" },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      codeLens = { enable = true },
      completion = { callSnippet = "Replace" },
      hint = {
        enable = true,
        arrayIndex = "Disable",
      },
      doc = { privateName = { "^_" } },
    },
  },
})

vim.lsp.config("tailwindcss", {
  filetypes = {
    "html",
    "css",
    "javascriptreact",
    "typescriptreact",
    "astro",
    "svelte",
    "vue",
  },
  root_markers = {
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts",
  },
})

vim.lsp.config("emmet_ls", {
  filetypes = {
    "html",
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "astro",
  },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})
