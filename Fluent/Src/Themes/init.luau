local Themes = {
	Names = {
		"Vynixu",
		"Dark",
		"Light",
		"Aqua",
		"Tomorrow Night Blue",
		"Abyss",
		"Amethyst",
		"Rose",
		"Yaru",
		"Ambiance",
		"Typewriter",
		"Kimbie Dark",
		"Solarized Dark",
		"Solarized Light",
		"DuoTone Dark Sea",
		"DuoTone Dark Sky",
		"DuoTone Dark Space",
		"DuoTone Dark Forest",
		"DuoTone Dark Earth",
		"Viow Flat",
		"Viow Light",
		"Viow Mars",
		"Viow Neon"
	}
}

-- Prompt to generate the themes, best used with cursor: "@Themes Create new luau Themes for every JSON file ill provide. The Theme name should be the Name from the JSON, always create a new File in the Themes Directory where the other luau files are and always add the name of the Theme in the init.luau list"

for _, Theme in next, Themes.Names do
	local ThemeData = require(script[Theme])

	ThemeData.Name = Theme

	Themes[ThemeData.Name] = ThemeData
end

return Themes
