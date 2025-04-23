local wk = require "which-key"
local utils = require "utils"

vim.o.timeoutlen = 300

wk.setup {
  show_help = false,
  plugins = { spelling = true },
  replace = { ["<leader>"] = "SPC" },
}

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
vim.keymap.set("n", "<S-TAB>", "<CMD>bprevious<CR>")
vim.keymap.set("n", "<TAB>", "<CMD>bnext<CR>")

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

wk.add {
  { "<leader>b", group = "buffer" },
  { "<leader>bc", "<CMD>:%bd|e#|bd#<CR>", desc = "delete all buffers but current" },
  { "<leader>bx", "<CMD>:bd<CR>", desc = "delete current buffer & window" },
  { "<leader>f", group = "file" },
  { "<leader>ff", "<CMD>lua require('telescope').extensions.menufacture.find_files()<CR>", desc = "find file" },
  { "<leader>fn", "<CMD>enew<CR>", desc = "new file" },
  { "<leader>fr", "<CMD>Telescope oldfiles<CR>", desc = "open recent file" },
  { "<leader>h", group = "help" },
  { "<leader>hc", "<CMD>:Telescope commands<CR>", desc = "commands" },
  { "<leader>hh", "<CMD>:checkhealth<CR>", desc = "check health" },
  { "<leader>hp", group = "package-management" },
  { "<leader>hpc", "<CMD>Lazy clear<CR>", desc = "clear unused" },
  { "<leader>hpi", "<CMD>Lazy install<CR>", desc = "install packages" },
  { "<leader>hps", "<CMD>Lazy sync<CR>", desc = "sync all" },
  { "<leader>hpu", "<CMD>Lazy update<CR>", desc = "update packages" },
  { "<leader>hs", "<CMD>:Telescope highlights<CR>", desc = "search highlight groups" },
  { "<leader>ht", group = "theming" },
  { "<leader>htc", "<CMD>Catppuccin macchiato<CR>", desc = "catppuccin macchiato" },
  { "<leader>htf", "<CMD>Catppuccin frappe<CR>", desc = "catppuccin frappe" },
  { "<leader>htl", "<CMD>Catppuccin latte<CR>", desc = "catppuccin latte" },
  { "<leader>htm", "<CMD>Catppuccin mocha<CR>", desc = "catppuccin mocha" },
  { "<leader>l", group = "lsp" },
  { "<leader>li", "<CMD>Mason<CR>", desc = "manage servers" },
  { "<leader>ll", "<CMD>MasonLog<CR>", desc = "see logs" },
  { "<leader>m", group = "git" },
  { "<leader>mc", "<CMD>Telescope git_commits<CR>", desc = "commits" },
  { "<leader>ms", "<CMD>Telescope git_status<CR>", desc = "status" },
  { "<leader>n", group = "filetree" },
  { "<leader>nn", "<CMD>NvimTreeToggle<CR>", desc = "file explorer" },
  { "<leader>nr", "<CMD>NvimTreeFindFileToggle<CR>", desc = "reveal" },
  { "<leader>s", group = "search" },
  { "<leader>sb", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "buffer" },
  { "<leader>sg", "<CMD>lua require('telescope').extensions.menufacture.live_grep()<CR>", desc = "grep" },
  { "<leader>sh", "<CMD>Telescope command_history<CR>", desc = "command history" },
  { "<leader>sm", "<CMD>Telescope marks<CR>", desc = "Jump to Mark" },
  { "<leader>ss", utils.telescope_find, desc = "Goto Symbol" },
  { "<leader>t", group = "testing" },
  { "<leader>tf", "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "test file" },
  { "<leader>to", "<CMD>lua require('neotest').output.open({enter = true})<CR>", desc = "open output" },
  { "<leader>ts", "<CMD>lua require('neotest').summary.toggle()<CR>", desc = "toggle summary" },
  { "<leader>w", group = "window" },
  { "<leader>w-", "<C-W>s", desc = "split-window-below" },
  { "<leader>w2", "<C-W>v", desc = "layout-double-columns" },
  { "<leader>w=", "<C-W>=", desc = "balance-window" },
  { "<leader>wH", "<C-W>5<", desc = "expand-window-left" },
  { "<leader>wJ", ":resize +5", desc = "expand-window-below" },
  { "<leader>wK", ":resize -5", desc = "expand-window-up" },
  { "<leader>wL", "<C-W>5>", desc = "expand-window-right" },
  { "<leader>wd", "<C-W>c", desc = "delete-window" },
  { "<leader>wh", "<C-W>h", desc = "window-left" },
  { "<leader>wj", "<C-W>j", desc = "window-below" },
  { "<leader>wk", "<C-W>k", desc = "window-up" },
  { "<leader>wl", "<C-W>l", desc = "window-right" },
  { "<leader>ws", "<C-W>s", desc = "split-window-below" },
  { "<leader>wv", "<C-W>v", desc = "split-window-right" },
  { "<leader>ww", "<C-W>p", desc = "other-window" },
  { "<leader>w|", "<C-W>v", desc = "split-window-right" },
  { "<leader>c", group = "code" },
  { "<leader>j", group = "goto" },
  { "<leader>a", group = "copilot" },
}
