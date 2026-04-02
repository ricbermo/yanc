return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      javascriptreact = { "prettierd" },
      json = { "prettierd" },
      css = { "prettierd" },
      html = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
    },
    format_after_save = {
      lsp_fallback = true,
    },
  },
}
