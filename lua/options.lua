-- shortcuts
local g = vim.g -- global variables
local opt = vim.opt -- editor options

-- set leader key to Space
g.mapleader = " "

-- set system clipboard as default
opt.clipboard:append "unnamedplus"

-- enable current line highlighting
opt.cursorline = true

-- set maximum amount of completion items to 10
opt.pumheight = 10

-- complete even if there's only one item; do not autoselect item
opt.completeopt = "menu,menuone,noselect"

-- set minimal number of screeen lines above and below cursor
opt.scrolloff = 8

-- native smooth scrolling (replaces neoscroll.nvim)
opt.smoothscroll = true

-- make splits open to down and right
opt.splitbelow = true
opt.splitright = true

-- disable providers
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

local asdf_shims = vim.fn.expand "$HOME/.asdf/shims"
if vim.fn.isdirectory(asdf_shims) == 1 then
  vim.env.PATH = asdf_shims .. ":" .. vim.env.PATH
end

local asdf_python = asdf_shims .. "/python"
if vim.fn.executable(asdf_python) == 1 then
  g.python3_host_prog = asdf_python
end

-- number stuff
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- tab stuff
opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2

opt.shortmess:append "s"

-- enable terminal colors
opt.termguicolors = true

-- disable shada
opt.shadafile = "NONE"

-- disable swap
opt.swapfile = false
opt.backup = false

opt.cmdheight = 1
opt.hidden = true
opt.ignorecase = true

opt.mouse = "a"
opt.smartindent = true
opt.timeoutlen = 300
opt.ruler = false
opt.updatetime = 250

-- nice confirmation dialog
opt.confirm = true
vim.o.winborder = "rounded"


-- blankline support
opt.list = true
opt.listchars:append { lead = "⋅" }


-- override filetype
vim.filetype.add {
  extension = {
      podspec = "ruby",
  },
  filename = {
    ["Podfile"] = "ruby",
  },
  pattern = {
    [".*git/config"] = "gitconfig",
    [".*env.*"] = "sh",
  },
}

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,diff:/]]
