local nest = prequire("nest")
local wk = prequire("which-key")
if not nest and wk then return end

local utils = require("utils")

local leader = {
  prefix = "<leader>",
  { "l", "<cmd>luaf%<cr>" },
  { "n", "<cmd>Neotree toggle<cr>" },
  { "x", "<cmd>bd<cr>" },
  { "q", "<cmd>noh<cr>" },
  { "d", utils.toggle_diagnostics },
}

local packer = {
  name = "packer",
  prefix = "<leader>p",
  { "i", "<cmd>PackerInstall<cr>" },
  { "S", "<cmd>PackerSource<cr>" },
  { "s", "<cmd>PackerSync<cr>" },
  { "u", "<cmd>PackerUpdate<cr>" },
  { "c", "<cmd>PackerCompile<cr>" },
  { "p", "<cmd>PackerProfile<cr>" },
  { "t", "<cmd>PackerStatus<cr>" },
  { "d", "<cmd>PackerClean<cr>" },
  { "o", "<cmd>PackerConfig<cr>" },
  { "r", "<cmd>UpdateRemotePlugin<cr>" },
}

local telescope = {
  name = "telescope",
  prefix = "<leader>f",
  { "t", "<cmd>Telescope<cr>" },
  { "f", "<cmd>Telescope find_files<cr>" },
  { "o", "<cmd>Telescope oldfiles<cr>" },
  { "w", "<cmd>Telescope live_grep<cr>" },
  { "b", "<cmd>Telescope buffers<cr>" },
  { "m", "<cmd>Telescope marks<cr>" },
}

local catppuccin = {
  name = "Catppuccin",
  prefix = "<leader>w",
  { "l", "<cmd>Catppuccin latte<cr>" },
  { "f", "<cmd>Catppuccin frappe<cr>" },
  { "m", "<cmd>Catppuccin macchiato<cr>" },
  { "c", "<cmd>Catppuccin mocha<cr>" },
}

local neotree = {
  name = "neo-tree",
  prefix = "<leader>n",
  { "r", "<cmd>Neotree reveal<cr>" },
}

local testing = {
  name = "testing",
  prefix = "<leader>t",
  { "f", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>" },
  { "o", "<cmd>lua require('neotest').output.open({enter = true})<cr>" },
  { "s", "<cmd>lua require('neotest').summary.toggle()<cr>" },
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
  { "i", "<cmd>Mason<cr>" },
  { "l", "<cmd>MasonLog<cr>" },
}

local git = {
  name = "Git",
  prefix = "<leader>h",
  { "b", "<cmd>lua require('gitsigns').blame_line{full=false}<CR>" },
  { "d", "<cmd>DiffviewOpen<cr>" },
  { "t", "<cmd>DiffviewToggleFiles<cr>" },
  { "c", "<cmd>DiffviewClose<cr>" },
  { "f", "<cmd>DiffviewFocusFiles<cr>" },
  { "h", "<cmd>DiffviewFileHistory<cr>" },
}

utils.register_groups({
  packer,
  leader,
  telescope,
  neotree,
  testing,
  window_movement,
  lsp,
  git,
  catppuccin
})

nest.applyKeymaps({ "<TAB>", "<cmd>BufferLineCycleNext<cr>" })
nest.applyKeymaps({ "<S-TAB>", "<cmd>BufferLineCyclePrev<cr>" })
