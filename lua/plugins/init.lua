-- All packages
local plugins = {}

-- UI plugins
for _, plugin in ipairs(require("plugins.ui")) do
	table.insert(plugins, plugin)
end

return plugins
