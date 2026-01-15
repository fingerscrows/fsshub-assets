--!optimize 2
--!strict

-- Pre-define theme names
local ThemeNames = {
	"Vynixu",
	"Dark",
	"Light",
	"Aqua",
	"Amethyst",
	"Rose",
	"Cyber",
}

-- Internal cache untuk lazy-loaded themes
local ThemeCache: {[string]: {[string]: any}} = {}

local Themes = {
	Names = ThemeNames,
}

-- Lazy loading: theme hanya di-load saat dibutuhkan
function Themes:Get(Name: string): {[string]: any}?
	if not table.find(ThemeNames, Name) then
		return nil
	end
	
	if not ThemeCache[Name] then
		local ThemeData = require(script[Name])
		ThemeData.Name = Name
		ThemeCache[Name] = ThemeData
	end
	
	return ThemeCache[Name]
end

-- Preload specific theme (useful for default theme)
function Themes:Preload(Name: string)
	if table.find(ThemeNames, Name) then
		self:Get(Name)
	end
end

-- Metatable untuk backward compatibility (Themes["Dark"] still works)
setmetatable(Themes, {
	__index = function(self, key: string)
		if table.find(ThemeNames, key) then
			return self:Get(key)
		end
		return nil
	end
})

return Themes
