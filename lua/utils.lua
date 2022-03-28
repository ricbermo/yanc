_G.prequire = function(plugin, verbose)
  local present, plug = pcall(require, plugin)
  if present then
    return plug
  end
  local errmsg = string.format("Could not load %s", plugin)
  if verbose then
    errmsg = string.format("%s\nError:%s", plug)
  end
  print(errmsg)
end

local M = {}

function M.impatient()
	local impatient_ok, _ = pcall(require, "impatient")
	if impatient_ok then
		require("impatient").enable_profile()
	end
end

return M;
