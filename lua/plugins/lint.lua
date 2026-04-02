return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require "lint"

    local biome_configs = { "biome.json", "biome.jsonc" }
    local eslint_configs = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", ".eslintrc.yml", "eslint.config.js", "eslint.config.mjs", "eslint.config.ts" }

    local function has_config(patterns)
      local root = vim.fn.getcwd()
      for _, name in ipairs(patterns) do
        if vim.uv.fs_stat(root .. "/" .. name) then
          return true
        end
      end
      return false
    end

    local function js_linters()
      if has_config(biome_configs) then
        return { "biomejs" }
      elseif has_config(eslint_configs) then
        return { "eslint_d" }
      end
      return {}
    end

    lint.linters_by_ft = {
      lua = { "luacheck" },
      markdown = { "markdownlint" },
    }

    local js_fts = { "javascript", "javascriptreact", "typescript", "typescriptreact" }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        local ft = vim.bo.filetype
        if vim.tbl_contains(js_fts, ft) then
          lint.try_lint(js_linters())
        else
          lint.try_lint()
        end
      end,
    })
  end,
}
