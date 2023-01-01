local wk = require("which-key")

vim.o.timeoutlen = 300

wk.setup({
  show_help = false,
  triggers = "auto",
  plugins = { spelling = true },
  key_labels = { ["<leader>"] = "SPC" },
})

-- Resize window using <ctrl> arrow keys
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

local leader = {
  g = {
    name = "+git",
    c = { "<CMD>Telescope git_commits<CR>", "commits" },
    b = { "<CMD>lua require('gitsigns').blame_line{full=false}<CR>", "blame" },
    s = { "<CMD>Telescope git_status<CR>", "status" },
    d = {
      name = "+diff",
      o = { "<CMD>DiffviewOpen<CR>", "open" },
      c = { "<CMD>DiffviewClose<CR>", "close" },
      f = { "<CMD>DiffviewFocusFiles<CR>", "focus" },
      h = { "<CMD>DiffviewFileHistory<CR>", "history" },
    },
  },
  c = {
    name = "+code",
  },
  l = {
    name = "+lsp",
    i = { "<CMD>Mason<CR>", "Manage Servers" },
    l = { "<CMD>MasonLog<CR>", "See logs" }
  },
  w = {
    name = "+window",
    ["w"] = { "<C-W>p", "other-window" },
    ["d"] = { "<C-W>c", "delete-window" },
    ["-"] = { "<C-W>s", "split-window-below" },
    ["|"] = { "<C-W>v", "split-window-right" },
    ["2"] = { "<C-W>v", "layout-double-columns" },
    ["h"] = { "<C-W>h", "window-left" },
    ["j"] = { "<C-W>j", "window-below" },
    ["l"] = { "<C-W>l", "window-right" },
    ["k"] = { "<C-W>k", "window-up" },
    ["H"] = { "<C-W>5<", "expand-window-left" },
    ["J"] = { ":resize +5", "expand-window-below" },
    ["L"] = { "<C-W>5>", "expand-window-right" },
    ["K"] = { ":resize -5", "expand-window-up" },
    ["="] = { "<C-W>=", "balance-window" },
    ["s"] = { "<C-W>s", "split-window-below" },
    ["v"] = { "<C-W>v", "split-window-right" },
  },
  h = {
    name = "+help",
    t = {
      name = "+theming",
      l = { "<CMD>Catppuccin latte<CR>", "Catppuccin Latte" },
      f = { "<CMD>Catppuccin frappe<CR>", "Catppuccin frappe" },
      m = { "<CMD>Catppuccin macchiato<CR>", "Catppuccin Macchiato" },
      c = { "<CMD>Catppuccin mocha<CR>", "Catppuccin Mocha" },
    },
    p = {
      name = "+package-management",
      i = { "<CMD>Lazy install<CR>", "Install Packages" },
      u = { "<CMD>Lazy update<CR>", "Update Packages" },
      c = { "<CMD>Lazy clear<CR>", "Clear Unused" },
      s = { "<CMD>Lazy sync<CR>", "Sync All" },
    },
    h = { "<CMD>:checkhealth<CR>", "Check Health" },
    c = { "<CMD>:Telescope commands<CR>", "Commands" },
    s = { "<CMD>:Telescope highlights<CR>", "Search Highlight Groups" },
  },
  s = {
    name = "+search",
    g = { "<CMD>Telescope live_grep<CR>", "Grep" },
    b = { "<CMD>Telescope current_buffer_fuzzy_find<CR>", "Buffer" },
    s = {
      function()
        require("telescope.builtin").lsp_document_symbols({
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        })
      end,
      "Goto Symbol",
    },
    h = { "<CMD>Telescope command_history<CR>", "Command History" },
    m = { "<CMD>Telescope marks<CR>", "Jump to Mark" },
    r = { "<CMD>lua require('spectre').open()<CR>", "Replace (Spectre)" },
  },
  f = {
    name = "+file",
    f = { "<CMD>Telescope find_files<CR>", "Find File" },
    r = { "<CMD>Telescope oldfiles<CR>", "Open Recent File" },
    n = { "<CMD>enew<CR>", "New File" },
  },
  n = {
    name = "+filetree",
    n = { "<CMD>Neotree toggle<CR>", "File Explorer" },
    r = { "<CMD>Neotree reveal<CR>", "Reveal" }
  },
  t = {
    name = "+testing",
    f = { "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Test File" },
    o = { "<CMD>lua require('neotest').output.open({enter = true})<CR>", "Open Output" },
    s = { "<CMD>lua require('neotest').summary.toggle()<CR>", "Toggle Summary" }
  },
  x = {
    name = "+errors",
    x = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "Trouble" },
    l = { "<CMD>TroubleToggle loclist<CR>", "Open Location List" },
    q = { "<CMD>TroubleToggle quickfix<CR>", "Open Quickfix List" },
  },
  b = {
    name = "+buffer",
    ["b"] = { "<CMD>:e #<CR>", "Switch to Other Buffer" },
    ["p"] = { "<CMD>:BufferLineCyclePrev<CR>", "Previous Buffer" },
    ["["] = { "<CMD>:BufferLineCyclePrev<CR>", "Previous Buffer" },
    ["n"] = { "<CMD>:BufferLineCycleNext<CR>", "Next Buffer" },
    ["]"] = { "<CMD>:BufferLineCycleNext<CR>", "Next Buffer" },
    ["x"] = { "<CMD>:bd<CR>", "Delete Buffer & Window" },
  },
}

wk.register(leader, { prefix = "<leader>" })
wk.register({ g = { name = "+goto" } })
