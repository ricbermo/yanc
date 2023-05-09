local neotest = prequire "neotest"
if not neotest then
  return
end

local signs = require("utils").signs

neotest.setup {
  adapters = {
    require "neotest-jest" {
      jestCommand = "npm test --",
    },
  },
  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "╮",
    failed = signs.Error,
    final_child_indent = " ",
    final_child_prefix = "╰",
    non_collapsible = "─",
    passed = signs.PassCheck,
    running = signs.Running,
    skipped = signs.Forbidden,
    unknown = "",
  },
}
