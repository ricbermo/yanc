local installer = prequire("nvim-lsp-installer")

if not installer then
  return
end

installer.settings {
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}
