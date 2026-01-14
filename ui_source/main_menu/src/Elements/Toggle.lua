local TweenService = game:GetService("TweenService")
local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local New = Creator.New
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "Toggle"

function Element:New(Idx, Config)
	local Library = self.Library
	assert(Config.Title, "Toggle - Missing Title")

	local Toggle = {
		Value = Config.Default or false,
		KeybindValue = Config.Keybind or "None",
        KeybindMode = Config.KeybindMode or "Toggle",
        KeybindToggled = false,
		Callback = Config.Callback or function(Value) end,
        KeybindCallback = Config.KeybindCallback or function(Value) end,
		Type = "Toggle",
	}

    local Picking = false

	local ToggleFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, true)
	ToggleFrame.DescLabel.Size = UDim2.new(1, -150, 0, 14) -- Adjust for keybind space

	Toggle.SetTitle = ToggleFrame.SetTitle
	Toggle.SetDesc = ToggleFrame.SetDesc

	local ToggleCircle = New("ImageLabel", {
		AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.fromOffset(14, 14),
		Position = UDim2.new(0, 2, 0.5, 0),
		Image = "http://www.roblox.com/asset/?id=12266946128",
		ImageTransparency = 0.5,
		ThemeTag = {
			ImageColor3 = "ToggleSlider",
		},
	})

	local ToggleBorder = New("UIStroke", {
		Transparency = 0.5,
		ThemeTag = {
			Color = "ToggleSlider",
		},
	})

	local ToggleSlider = New("Frame", {
		Size = UDim2.fromOffset(36, 18),
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -10, 0.5, 0),
		Parent = ToggleFrame.Frame,
		BackgroundTransparency = 1,
		ThemeTag = {
			BackgroundColor3 = "Accent",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 9),
		}),
		ToggleBorder,
		ToggleCircle,
	})

    -- ========== KEYBIND UI ELEMENTS ==========
    
    local KeybindLabel = New("TextLabel", {
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
        Text = Toggle.KeybindValue,
        TextColor3 = Color3.fromRGB(240, 240, 240),
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Center,
        Size = UDim2.new(0, 0, 0, 14),
        Position = UDim2.new(0, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.X,
        ThemeTag = {
            TextColor3 = "Text",
        },
    })

    local KeybindButton = New("TextButton", {
        Size = UDim2.fromOffset(0, 24),
        Position = UDim2.new(1, -56, 0.5, 0), -- Left of toggle
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 0.9,
        Parent = ToggleFrame.Frame,
        AutomaticSize = Enum.AutomaticSize.X,
        ThemeTag = {
            BackgroundColor3 = "Keybind",
        },
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(0, 5),
        }),
        New("UIPadding", {
            PaddingLeft = UDim.new(0, 6),
            PaddingRight = UDim.new(0, 6),
        }),
        New("UIStroke", {
            Transparency = 0.5,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            ThemeTag = {
                Color = "InElementBorder",
            },
        }),
        KeybindLabel,
    })

    local ClearButton = New("TextButton", {
        Size = UDim2.fromOffset(20, 20),
        Position = UDim2.new(1, -100, 0.5, 0), -- Left of keybind box
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 0.9,
        Parent = ToggleFrame.Frame,
        Text = "✕",
        TextSize = 12,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        ThemeTag = {
            BackgroundColor3 = "Element",
            TextColor3 = "SubText",
        },
        Visible = false -- Only visible if keybind is set (handled in setKeybind)
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(0, 4),
        }),
    })

    -- ========== TOGGLE LOGIC ==========

	function Toggle:OnChanged(Func)
		Toggle.Changed = Func
		Func(Toggle.Value)
	end
    
    function Toggle:OnKeybindChanged(Func)
        Toggle.KeybindChanged = Func
        Func(Toggle.KeybindValue)
    end

	function Toggle:SetValue(Value)
		Value = not not Value
		Toggle.Value = Value

		Creator.OverrideTag(ToggleBorder, { Color = Toggle.Value and "Accent" or "ToggleSlider" })
		Creator.OverrideTag(ToggleCircle, { ImageColor3 = Toggle.Value and "ToggleToggled" or "ToggleSlider" })
		TweenService:Create(
			ToggleCircle,
			TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
			{ Position = UDim2.new(0, Toggle.Value and 19 or 2, 0.5, 0) }
		):Play()
		TweenService:Create(
			ToggleSlider,
			TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
			{ BackgroundTransparency = Toggle.Value and 0 or 1 }
		):Play()
		ToggleCircle.ImageTransparency = Toggle.Value and 0 or 0.5

		Library:SafeCallback(Toggle.Callback, Toggle.Value)
		Library:SafeCallback(Toggle.Changed, Toggle.Value)
	end

    function Toggle:SetKeybind(Key)
        Key = Key or "None"
        Toggle.KeybindValue = Key
        KeybindLabel.Text = Key
        ClearButton.Visible = (Key ~= "None")
        Library:SafeCallback(Toggle.KeybindChanged, Key)
    end

    function Toggle:ClearKeybind()
        Toggle:SetKeybind("None")
        Toggle.KeybindToggled = false
    end

	function Toggle:Destroy()
		ToggleFrame:Destroy()
		Library.Options[Idx] = nil
	end

    -- ========== INPUT HANDLING ==========

	Creator.AddSignal(ToggleFrame.Frame.MouseButton1Click, function()
		Toggle:SetValue(not Toggle.Value)
	end)
    
    Creator.AddSignal(ToggleSlider.InputBegan, function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
            Toggle:SetValue(not Toggle.Value)
        end
    end)

    -- Keybind Assignment
    Creator.AddSignal(KeybindButton.InputBegan, function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
            Picking = true
            KeybindLabel.Text = "..."
            local Event
            Event = game:GetService("UserInputService").InputBegan:Connect(function(KeyInput)
                local Key
                if KeyInput.UserInputType == Enum.UserInputType.Keyboard then
                    Key = KeyInput.KeyCode.Name
                elseif KeyInput.UserInputType == Enum.UserInputType.MouseButton1 then
                    Key = "MouseLeft"
                elseif KeyInput.UserInputType == Enum.UserInputType.MouseButton2 then
                    Key = "MouseRight"
                end
                
                if Key then
                    local EndedEvent
                    EndedEvent = game:GetService("UserInputService").InputEnded:Connect(function(EndInput)
                        if EndInput.KeyCode.Name == Key or (Key == "MouseLeft" and EndInput.UserInputType == Enum.UserInputType.MouseButton1) or (Key == "MouseRight" and EndInput.UserInputType == Enum.UserInputType.MouseButton2) then
                            Picking = false
                            Toggle:SetKeybind(Key)
                            Event:Disconnect()
                            EndedEvent:Disconnect()
                        end
                    end)
                end
            end)
        elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
            Toggle:ClearKeybind()
        end
    end)
    
    Creator.AddSignal(ClearButton.MouseButton1Click, function()
        Toggle:ClearKeybind()
    end)

    -- Global Key Listener
    Creator.AddSignal(game:GetService("UserInputService").InputBegan, function(Input)
        if Picking or game:GetService("UserInputService"):GetFocusedTextBox() then return end
        if Toggle.KeybindValue == "None" then return end
        
        local Key = Toggle.KeybindValue
        local Matched = false
        if Key == "MouseLeft" and Input.UserInputType == Enum.UserInputType.MouseButton1 then Matched = true
        elseif Key == "MouseRight" and Input.UserInputType == Enum.UserInputType.MouseButton2 then Matched = true
        elseif Input.UserInputType == Enum.UserInputType.Keyboard and Input.KeyCode.Name == Key then Matched = true end
        
        if Matched then
            Toggle:SetValue(not Toggle.Value)
        end 
    end)

	Toggle:SetValue(Toggle.Value)
    Toggle:SetKeybind(Toggle.KeybindValue)

	Library.Options[Idx] = Toggle
	return Toggle
end

return Element
