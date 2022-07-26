local mason = prequire('mason')
local autoinstaller = prequire('mason-tool-installer')

if not (mason or autoinstaller) then
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

autoinstaller.setup {
  ensure_installed = {
    'tsserver',
    'eslint',
    'jsonls'
  },
  auto_update = false,
  run_on_start = true
}