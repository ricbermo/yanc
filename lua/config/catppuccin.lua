local catppuccin = prequire("catppuccin")

if not catppuccin then
  return
end

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  transparent_background = false,
  term_colors = true,
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin",
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    coc_nvim = false,
    lsp_trouble = false,
    cmp = true,
    lsp_saga = true,
    gitgutter = false,
    gitsigns = true,
    leap = false,
    telescope = true,
    nvimtree = {
      enabled = false,
      show_root = true,
      transparent_panel = false,
    },
    neotree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    dap = {
      enabled = false,
      enable_ui = false,
    },
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = false,
    notify = false,
    telekasten = true,
    symbols_outline = true,
    mini = false,
    aerial = false,
    vimwiki = true,
    beacon = true,
    navic = false,
    overseer = false,
  },
  color_overrides = {},
  highlight_overrides = {},
})

vim.cmd [[colorscheme catppuccin]]
