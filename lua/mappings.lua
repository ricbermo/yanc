local wk = require "which-key"
local utils = require "utils"

-- Better window navigation
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize window using <Shift+> arrow keys
vim.keymap.set("n", "<S-Up>", "<CMD>resize +2<CR>")
vim.keymap.set("n", "<S-Down>", "<CMD>resize -2<CR>")
vim.keymap.set("n", "<S-Left>", "<CMD>vertical resize -2<CR>")
vim.keymap.set("n", "<S-Right>", "<CMD>vertical resize +2<CR>")

-- Switch buffers with tab
vim.keymap.set("n", "<S-TAB>", "<CMD>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<TAB>", "<CMD>BufferLineCycleNext<CR>")

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<CMD>noh<CR><esc>")
vim.keymap.set("n", "gw", "*N")
vim.keymap.set("x", "gw", "*N")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- save in insert mode
vim.keymap.set("i", "<C-s>", "<CMD>:w<CR><esc>")
vim.keymap.set("n", "<C-s>", "<CMD>:w<CR><esc>")

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Open filetree
vim.keymap.set("n", "<C-n>", "<CMD>NvimTreeToggle<CR>")

-- Print and copy to clipboard the current file path
vim.keymap.set("n", "<C-g>", utils.copy_git_root_path, { noremap = true, silent = true })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", "<CMD>m .+1<CR>==")
vim.keymap.set("n", "<A-k>", "<CMD>m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Paste without losing register in visual mode
vim.keymap.set("x", "p", "P")

-- Quickfix navigation
vim.keymap.set("n", "]q", "<CMD>cnext<CR>")
vim.keymap.set("n", "[q", "<CMD>cprev<CR>")

-- Diagnostic navigation (without leader)
vim.keymap.set("n", "]d", function() vim.diagnostic.jump { count = 1 } end, { desc = "next diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.jump { count = -1 } end, { desc = "prev diagnostic" })

wk.add {
  { "<leader>b", group = "buffer" },
  { "<leader>bc", "<CMD>BufferLineCloseOthers<CR>", desc = "delete all buffers but current" },
  { "<leader>bd", "<CMD>bp|bd #<CR>", desc = "delete buffer" },
  { "<leader>bp", "<CMD>BufferLineTogglePin<CR>", desc = "pin buffer" },
  { "<leader>bl", "<CMD>BufferLineMoveNext<CR>", desc = "move buffer right" },
  { "<leader>bh", "<CMD>BufferLineMovePrev<CR>", desc = "move buffer left" },
  { "<leader>f", group = "file" },
  { "<leader>ff", "<CMD>FzfLua files<CR>", desc = "find file" },
  { "<leader>fn", "<CMD>enew<CR>", desc = "new file" },
  { "<leader>fr", "<CMD>FzfLua oldfiles<CR>", desc = "open recent file" },
  { "<leader>h", group = "help" },
  { "<leader>hc", "<CMD>FzfLua commands<CR>", desc = "commands" },
  { "<leader>hh", "<CMD>:checkhealth<CR>", desc = "check health" },
  { "<leader>hk", "<CMD>FzfLua keymaps<CR>", desc = "keymaps" },
  { "<leader>hp", "<CMD>Lazy<CR>", desc = "package manager" },
  { "<leader>hs", "<CMD>FzfLua highlights<CR>", desc = "search highlight groups" },
  { "<leader>ht", group = "theming" },
  { "<leader>htc", "<CMD>Catppuccin macchiato<CR>", desc = "catppuccin macchiato" },
  { "<leader>htf", "<CMD>Catppuccin frappe<CR>", desc = "catppuccin frappe" },
  { "<leader>htl", "<CMD>Catppuccin latte<CR>", desc = "catppuccin latte" },
  { "<leader>htm", "<CMD>Catppuccin mocha<CR>", desc = "catppuccin mocha" },
  { "<leader>g", group = "git" },
  { "<leader>gc", "<CMD>FzfLua git_commits<CR>", desc = "commits" },
  { "<leader>gs", "<CMD>FzfLua git_status<CR>", desc = "status" },
  { "<leader>n", group = "filetree" },
  { "<leader>nn", "<CMD>NvimTreeToggle<CR>", desc = "file explorer" },
  { "<leader>nr", "<CMD>NvimTreeFindFileToggle<CR>", desc = "reveal" },
  { "<leader>s", group = "search" },
  { "<leader>sb", "<CMD>FzfLua blines<CR>", desc = "buffer" },
  { "<leader>sg", "<CMD>FzfLua live_grep<CR>", desc = "grep" },
  { "<leader>sh", "<CMD>FzfLua command_history<CR>", desc = "command history" },
  { "<leader>sm", "<CMD>FzfLua marks<CR>", desc = "jump to mark" },
  { "<leader>ss", utils.lsp_document_symbols, desc = "goto symbol" },
  { "<leader>w", group = "window" },
  { "<leader>ws", "<C-W>s", desc = "split below" },
  { "<leader>wv", "<C-W>v", desc = "split right" },
  { "<leader>w=", "<C-W>=", desc = "balance" },
  { "<leader>wd", "<C-W>c", desc = "delete window" },
  { "<leader>ww", "<C-W>p", desc = "other window" },
  { "<leader>c", group = "code" },
}
