local dap = prequire "dap"
local dapui = prequire "dapui"
if not dap then
  return
end

require("dap-python").setup "~/.virtualenvs/debugpy/bin/python"

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
