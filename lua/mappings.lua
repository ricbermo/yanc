local nest = prequire("nest")
local wk = prequire("which-key")
if not nest and wk then return end

local utils = require("utils")

local leader = {
  prefix = "<leader>",
  { "x", "<cmd>bd<CR>" },
  { "q", "<cmd>noh<CR>" },
  { "ch", "<cmd>checkhealth<CR>" },
  { "d", utils.toggle_diagnostics },
}

local lazy = {
  name = "Lazy",
  prefix = "<leader>p",
  { "i", "<cmd>Lazy install<CR>" },
  { "u", "<cmd>Lazy update<CR>" },
  { "c", "<cmd>Lazy clear<CR>" },
  { "s", "<cmd>Lazy sync<CR>" },
}

local telescope = {
  name = "telescope",
  prefix = "<leader>f",
  { "t", "<cmd>Telescope<CR>" },
  { "f", "<cmd>Telescope find_files<CR>" },
  { "o", "<cmd>Telescope oldfiles<CR>" },
  { "w", "<cmd>Telescope live_grep<CR>" },
  { "b", "<cmd>Telescope buffers<CR>" },
  { "m", "<cmd>Telescope marks<CR>" },
}

local catppuccin = {
  name = "Catppuccin",
  prefix = "<leader>w",
  { "l", "<cmd>Catppuccin latte<CR>" },
  { "f", "<cmd>Catppuccin frappe<CR>" },
  { "m", "<cmd>Catppuccin macchiato<CR>" },
  { "c", "<cmd>Catppuccin mocha<CR>" },
}

local neotree = {
  name = "neo-tree",
  prefix = "<leader>n",
  { "n", "<cmd>Neotree toggle<CR>" },
  { "r", "<cmd>Neotree reveal<CR>" },
}

local testing = {
  name = "testing",
  prefix = "<leader>t",
  { "f", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>" },
  { "o", "<cmd>lua require('neotest').output.open({enter = true})<CR>" },
  { "s", "<cmd>lua require('neotest').summary.toggle()<CR>" },
}

local window_movement = {
  name = "window",
  prefix = "<C-",
  { "h>", "<C-W>h" },
  { "j>", "<C-W>j" },
  { "k>", "<C-W>k" },
  { "l>", "<C-W>l" },
}

local lsp = {
  name = "LSP Install",
  prefix = "<leader>l",
  { "i", "<cmd>Mason<CR>" },
  { "l", "<cmd>MasonLog<CR>" },
}

local git = {
  name = "Git",
  prefix = "<leader>h",
  { "b", "<cmd>lua require('gitsigns').blame_line{full=false}<CR>" },
  { "d", "<cmd>DiffviewOpen<CR>" },
  { "t", "<cmd>DiffviewToggleFiles<CR>" },
  { "c", "<cmd>DiffviewClose<CR>" },
  { "f", "<cmd>DiffviewFocusFiles<CR>" },
  { "h", "<cmd>DiffviewFileHistory<CR>" },
}

utils.register_groups({
  lazy,
  leader,
  telescope,
  neotree,
  testing,
  window_movement,
  lsp,
  git,
  catppuccin,
})

nest.applyKeymaps({ "<TAB>", "<cmd>BufferLineCycleNext<CR>" })
nest.applyKeymaps({ "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>" })
