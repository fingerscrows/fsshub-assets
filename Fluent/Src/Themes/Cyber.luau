local Theme = {
	Accent = Color3.fromRGB(0, 255, 255), -- Neon Cyan
	
	AcrylicMain = Color3.fromRGB(5, 5, 5),   -- Deep Black
	AcrylicBorder = Color3.fromRGB(0, 255, 255), -- Cyan Border
	AcrylicGradient = ColorSequence.new(Color3.fromRGB(5, 5, 5), Color3.fromRGB(10, 10, 10)),
	AcrylicNoise = 1, -- Digital noise effect

	TitleBarLine = Color3.fromRGB(0, 255, 255),
	Tab = Color3.fromRGB(150, 255, 255),

	Element = Color3.fromRGB(10, 10, 10),
	ElementBorder = Color3.fromRGB(0, 100, 100),
	InElementBorder = Color3.fromRGB(0, 255, 255),
	ElementTransparency = 0.9, -- Slight transparency for cyber feel

	ToggleSlider = Color3.fromRGB(0, 200, 200),
	ToggleToggled = Color3.fromRGB(0, 0, 0),

	SliderRail = Color3.fromRGB(0, 100, 100),

	DropdownFrame = Color3.fromRGB(20, 20, 20),
	DropdownHolder = Color3.fromRGB(10, 10, 10),
	DropdownBorder = Color3.fromRGB(0, 200, 200),
	DropdownOption = Color3.fromRGB(200, 255, 255),

	Keybind = Color3.fromRGB(200, 255, 255),

	Input = Color3.fromRGB(20, 20, 20),
	InputFocused = Color3.fromRGB(0, 0, 0),
	InputIndicator = Color3.fromRGB(0, 255, 255),

	Dialog = Color3.fromRGB(10, 10, 10),
	DialogHolder = Color3.fromRGB(5, 5, 5),
	DialogHolderLine = Color3.fromRGB(0, 100, 100),
	DialogButton = Color3.fromRGB(10, 10, 10),
	DialogButtonBorder = Color3.fromRGB(0, 255, 255),
	DialogBorder = Color3.fromRGB(0, 255, 255),
	DialogInput = Color3.fromRGB(15, 15, 15),
	DialogInputLine = Color3.fromRGB(0, 255, 255),

	Text = Color3.fromRGB(200, 255, 255), -- White-Cyan text
	SubText = Color3.fromRGB(100, 200, 200),
	Hover = Color3.fromRGB(0, 255, 255),
	HoverChange = 0.1
}

return Theme
