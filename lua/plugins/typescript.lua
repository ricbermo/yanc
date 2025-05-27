return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    settings = {
      expose_as_code_action = "all",
      complete_function_calls = true,
      include_completions_with_insert_text = true,
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "none",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = false,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayFunctionLikeReturnTypeHints = false,
        includeInlayEnumMemberValueHints = false,
        importModuleSpecifierPreference = "non-relative",
        includeCompletionsForModuleExports = true,
        quotePreference = "auto",
      },
      tsserver_format_options = {
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = false,
      },
    },
    on_attach = function()
      local wk = require "which-key"

      wk.add {
        { "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", desc = "organize imports" },
        { "<leader>cu", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "remove unused imports" },
      }
    end,
  },
  ft = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
}
