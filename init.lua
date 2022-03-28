-- source lua files
local utils = require("utils") -- functions I use frequently

utils.impatient()


require("plugins") -- plugin specs
require("options") -- vim options
require("mappings") -- nest mappings

-- source vimscript files
vim.cmd("source ~/.config/nvim/viml/commands.vim")
