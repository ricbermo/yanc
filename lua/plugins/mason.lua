local signs = require("utils").signs

return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
  },
  opts = {
    ui = {
      icons = {
        package_installed = signs.PassCheck,
        package_pending = signs.Running,
        package_uninstalled = signs.GitRemoved,
      },
    },
  },
}
