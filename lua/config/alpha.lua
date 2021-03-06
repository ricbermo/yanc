local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "AlphaButton"
  b.opts.hl_shortcut = "AlphaButtonShortcut"
  return b
end

local function footer()
  local plugins = #vim.tbl_keys(packer_plugins)
  local v = vim.version()
  local datetime = os.date " %d-%m-%Y   %H:%M:%S"
  return string.format(" %d   v%d.%d.%d  %s", plugins, v.major, v.minor, v.patch, datetime)
end

dashboard.section.buttons.val = {
  button("SPC n", "  File Browser"),
  button("SPC f o", "  Recently Opened Files"),
  button("SPC f f", "  Find File"),
  button("SPC f w", "  Find Word"),
  button("SPC f m", "  Bookmarks"),
  button("SPC p u", "  Update Plugins"),
  button("q", "  Quit", "<Cmd>qa<CR>"),
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = dashboard.section.header.opts.hl

dashboard.config.layout[1].val = 8

alpha.setup(dashboard.config)

-- hide tabline and statusline on startup screen
vim.cmd(string.format(
  [[
  augroup alpha_tabline
    au!
    au FileType alpha set showtabline=0 laststatus=0 noruler | au BufUnload <buffer> set showtabline=2 ruler laststatus=%d
  augroup END
  ]],
  vim.fn.has "nvim-0.7" == 1 and 3 or 2
))
