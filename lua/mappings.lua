local nest = prequire("nest")
local wk = prequire("which-key")
if not nest and wk then return end

local register_groups = function(maps)
  for _, map in pairs(maps) do
    if map.name or map.prefix then
      wk.register({[map.prefix] = {name = map.name}})
    end

    nest.applyKeymaps(map)
  end
end

local leader = {
  prefix = "<leader>",
  {"l", "<cmd>luaf%<cr>"},
  {"b", vim.lsp.buf.formatting},
  {"n", "<cmd>NeoTreeFocusToggle<cr>"},
  {"x", "<cmd>bd<cr>"},
  {"q", "<cmd>noh<cr>"},
}

local packer = {
  name = "packer",
  prefix = "<leader>p",
  {"i", "<cmd>PackerInstall<cr>"},
  {"S", "<cmd>PackerSource<cr>"},
  {"s", "<cmd>PackerSync<cr>"},
  {"u", "<cmd>PackerUpdate<cr>"},
  {"c", "<cmd>PackerCompile<cr>"},
  {"p", "<cmd>PackerProfile<cr>"},
  {"t", "<cmd>PackerStatus<cr>"},
  {"d", "<cmd>PackerClean<cr>"},
  {"o", "<cmd>PackerConfig<cr>"}
}

local telescope = {
  name = "telescope",
  prefix = "<leader>f",
  {"t", "<cmd>Telescope<cr>"},
  {"f", "<cmd>Telescope find_files<cr>"},
  {"o", "<cmd>Telescope oldfiles<cr>"},
  {"w", "<cmd>Telescope live_grep<cr>"},
  {"b", "<cmd>Telescope buffers<cr>"},
  {"m", "<cmd>Telescope marks<cr>"},
}

local neotree = {
  name = "neo-tree",
  prefix = "<leader>n",
  {"r", "<cmd>NeoTreeReveal<cr>"},
  {"n", "<cmd>NeoTreeShow<cr>"}
}

local testing = {
  name = "testing",
  prefix = "<leader>t",
  {"f", "<cmd>TestFile<cr>"},
  {"u", "<cmd>Ultest<cr>"},
  {"s", "<cmd>UltestSummary<cr>"},
}

local window_movement = {
  name = "window",
  prefix = "<C-",
  {"h>", "<C-W>h"},
  {"j>", "<C-W>j"},
  {"k>", "<C-W>k"},
  {"l>", "<C-W>l"},
}

local lsp_installer = {
  name = "LSP Install",
  prefix = "<leader>l",
  {"i", "<cmd>LspInstallInfo<cr>"},
}

local git = {
  name = "Git",
  prefix = "<leader>h",
  {"b", "<cmd>lua require('gitsigns').blame_line{full=true}<CR>"},
  {"d", "<cmd>DiffviewOpen<cr>"},
  {"t", "<cmd>DiffviewToggleFiles<cr>"},
  {"c", "<cmd>DiffviewClose<cr>"},
  {"f", "<cmd>DiffviewFocusFiles<cr>"},
  {"r", "<cmd>DiffviewRefresh<cr>"},
}

register_groups({
  packer,
  leader,
  telescope,
  neotree,
  testing,
  window_movement,
  lsp_installer,
  git
})

nest.applyKeymaps({"<leader>m", "<cmd>split | terminal<cr>"})
nest.applyKeymaps({"<TAB>", "<cmd>BufferLineCycleNext<cr>"})
nest.applyKeymaps({"<S-TAB>", "<cmd>BufferLineCyclePrev<cr>"})
