local mason = prequire('mason')
local autoinstaller = prequire('mason-tool-installer')
local lspconfig = prequire('mason-lspconfig')

if not (mason or autoinstaller or lspconfig) then
  return
end

local signs = require("utils").signs

mason.setup {
  ui = {
    icons = {
      package_installed = signs.PassCheck,
      package_pending = signs.Running,
      package_uninstalled = signs.Error
    }
  }
}

local servers = {
  'sumneko_lua',
  'tsserver',
  'eslint',
  'jsonls'
}

lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = false,
}

autoinstaller.setup {
  ensure_installed = servers,
  auto_update = false,
  run_on_start = true,
  start_delay = 3000
}