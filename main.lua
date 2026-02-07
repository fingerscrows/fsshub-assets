--[[
    Fluent Interface Suite
    This script is not intended to be modified.
    To view the source code, see the 'src' folder on GitHub!

    Author: dawid
    License: MIT
    GitHub: https://github.com/dawid-scripts/Fluent
--]]

local ImportGlobals

local ObjectTree = {
    {
        1,
        "ModuleScript",
        {
            "MainModule"
        },
        {
            {
                7,
                "Folder",
                {
                    "Addons"
                },
                {
                    {
                        8,
                        "ModuleScript",
                        {
                            "InterfaceManager"
                        }
                    },
                    {
                        10,
                        "ModuleScript",
                        {
                            "SaveManager"
                        }
                    },
                    {
                        9,
                        "ModuleScript",
                        {
                            "KeySystem"
                        }
                    }
                }
            },
            {
                51,
                "ModuleScript",
                {
                    "Icons"
                }
            },
            {
                26,
                "ModuleScript",
                {
                    "Docking"
                },
                {
                    {
                        31,
                        "ModuleScript",
                        {
                            "PersistenceService"
                        }
                    },
                    {
                        27,
                        "ModuleScript",
                        {
                            "AnimationController"
                        }
                    },
                    {
                        29,
                        "ModuleScript",
                        {
                            "DockingManager"
                        }
                    },
                    {
                        30,
                        "ModuleScript",
                        {
                            "InputHandler"
                        }
                    },
                    {
                        28,
                        "ModuleScript",
                        {
                            "DockState"
                        }
                    }
                }
            },
            {
                52,
                "Folder",
                {
                    "Packages"
                },
                {
                    {
                        53,
                        "ModuleScript",
                        {
                            "Flipper"
                        },
                        {
                            {
                                69,
                                "ModuleScript",
                                {
                                    "isMotor.spec"
                                }
                            },
                            {
                                59,
                                "ModuleScript",
                                {
                                    "Instant.spec"
                                }
                            },
                            {
                                61,
                                "ModuleScript",
                                {
                                    "Linear.spec"
                                }
                            },
                            {
                                54,
                                "ModuleScript",
                                {
                                    "BaseMotor"
                                }
                            },
                            {
                                64,
                                "ModuleScript",
                                {
                                    "SingleMotor"
                                }
                            },
                            {
                                55,
                                "ModuleScript",
                                {
                                    "BaseMotor.spec"
                                }
                            },
                            {
                                65,
                                "ModuleScript",
                                {
                                    "SingleMotor.spec"
                                }
                            },
                            {
                                67,
                                "ModuleScript",
                                {
                                    "Spring.spec"
                                }
                            },
                            {
                                66,
                                "ModuleScript",
                                {
                                    "Spring"
                                }
                            },
                            {
                                57,
                                "ModuleScript",
                                {
                                    "GroupMotor.spec"
                                }
                            },
                            {
                                68,
                                "ModuleScript",
                                {
                                    "isMotor"
                                }
                            },
                            {
                                60,
                                "ModuleScript",
                                {
                                    "Linear"
                                }
                            },
                            {
                                63,
                                "ModuleScript",
                                {
                                    "Signal.spec"
                                }
                            },
                            {
                                58,
                                "ModuleScript",
                                {
                                    "Instant"
                                }
                            },
                            {
                                62,
                                "ModuleScript",
                                {
                                    "Signal"
                                }
                            },
                            {
                                56,
                                "ModuleScript",
                                {
                                    "GroupMotor"
                                }
                            }
                        }
                    }
                }
            },
            {
                32,
                "ModuleScript",
                {
                    "Elements"
                },
                {
                    {
                        34,
                        "ModuleScript",
                        {
                            "Colorpicker"
                        }
                    },
                    {
                        38,
                        "ModuleScript",
                        {
                            "Keybind"
                        }
                    },
                    {
                        40,
                        "ModuleScript",
                        {
                            "Slider"
                        }
                    },
                    {
                        39,
                        "ModuleScript",
                        {
                            "Paragraph"
                        }
                    },
                    {
                        41,
                        "ModuleScript",
                        {
                            "Toggle"
                        }
                    },
                    {
                        35,
                        "ModuleScript",
                        {
                            "ComboBox"
                        }
                    },
                    {
                        36,
                        "ModuleScript",
                        {
                            "Dropdown"
                        }
                    },
                    {
                        37,
                        "ModuleScript",
                        {
                            "Input"
                        }
                    },
                    {
                        33,
                        "ModuleScript",
                        {
                            "Button"
                        }
                    }
                }
            },
            {
                2,
                "ModuleScript",
                {
                    "Acrylic"
                },
                {
                    {
                        6,
                        "ModuleScript",
                        {
                            "Utils"
                        }
                    },
                    {
                        3,
                        "ModuleScript",
                        {
                            "AcrylicBlur"
                        }
                    },
                    {
                        5,
                        "ModuleScript",
                        {
                            "CreateAcrylic"
                        }
                    },
                    {
                        4,
                        "ModuleScript",
                        {
                            "AcrylicPaint"
                        }
                    }
                }
            },
            {
                70,
                "ModuleScript",
                {
                    "Themes"
                },
                {
                    {
                        77,
                        "ModuleScript",
                        {
                            "Rose"
                        }
                    },
                    {
                        72,
                        "ModuleScript",
                        {
                            "Aqua"
                        }
                    },
                    {
                        71,
                        "ModuleScript",
                        {
                            "Amethyst"
                        }
                    },
                    {
                        74,
                        "ModuleScript",
                        {
                            "Darker"
                        }
                    },
                    {
                        76,
                        "ModuleScript",
                        {
                            "Light"
                        }
                    },
                    {
                        73,
                        "ModuleScript",
                        {
                            "Dark"
                        }
                    },
                    {
                        75,
                        "ModuleScript",
                        {
                            "FssVs"
                        }
                    }
                }
            },
            {
                42,
                "ModuleScript",
                {
                    "Gradients"
                },
                {
                    {
                        43,
                        "Folder",
                        {
                            "Adapters"
                        },
                        {
                            {
                                44,
                                "ModuleScript",
                                {
                                    "FluentAdapter"
                                }
                            }
                        }
                    },
                    {
                        45,
                        "Folder",
                        {
                            "Appliers"
                        },
                        {
                            {
                                47,
                                "ModuleScript",
                                {
                                    "UIApplier"
                                }
                            },
                            {
                                46,
                                "ModuleScript",
                                {
                                    "AnimatedApplier"
                                }
                            }
                        }
                    },
                    {
                        48,
                        "Folder",
                        {
                            "Core"
                        },
                        {
                            {
                                49,
                                "ModuleScript",
                                {
                                    "Interpolator"
                                }
                            },
                            {
                                50,
                                "ModuleScript",
                                {
                                    "Presets"
                                }
                            }
                        }
                    }
                }
            },
            {
                11,
                "Folder",
                {
                    "Components"
                },
                {
                    {
                        19,
                        "ModuleScript",
                        {
                            "Notification"
                        }
                    },
                    {
                        13,
                        "ModuleScript",
                        {
                            "Button"
                        }
                    },
                    {
                        16,
                        "ModuleScript",
                        {
                            "DockablePanel"
                        }
                    },
                    {
                        18,
                        "ModuleScript",
                        {
                            "Loader"
                        }
                    },
                    {
                        23,
                        "ModuleScript",
                        {
                            "TitleBar"
                        }
                    },
                    {
                        21,
                        "ModuleScript",
                        {
                            "Tab"
                        }
                    },
                    {
                        24,
                        "ModuleScript",
                        {
                            "Window"
                        }
                    },
                    {
                        22,
                        "ModuleScript",
                        {
                            "Textbox"
                        }
                    },
                    {
                        20,
                        "ModuleScript",
                        {
                            "Section"
                        }
                    },
                    {
                        12,
                        "ModuleScript",
                        {
                            "Assets"
                        }
                    },
                    {
                        14,
                        "ModuleScript",
                        {
                            "Dialog"
                        }
                    },
                    {
                        17,
                        "ModuleScript",
                        {
                            "Element"
                        }
                    },
                    {
                        15,
                        "ModuleScript",
                        {
                            "DockTitleBar"
                        }
                    }
                }
            },
            {
                25,
                "ModuleScript",
                {
                    "Creator"
                }
            }
        }
    }
}
local ClosureBindings = {
    function()local maui,script,require,getfenv,setfenv=ImportGlobals(1)local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local Root = script
local Creator = require(Root.Creator)
local ElementsTable = require(Root.Elements)
local Acrylic = require(Root.Acrylic)
local Components = Root.Components
local NotificationModule = require(Components.Notification)
local Loader = require(Components.Loader)
local SaveManager = require(Root.Addons.SaveManager)
local InterfaceManager = require(Root.Addons.InterfaceManager)

local New = Creator.New

local ProtectGui = protectgui or (syn and syn.protect_gui) or function() end
local GUI = New("ScreenGui", {
	Parent = RunService:IsStudio() and LocalPlayer.PlayerGui or game:GetService("CoreGui"),
})
ProtectGui(GUI)
NotificationModule:Init(GUI)

local Library = {
	Version = "1.3.0", -- Bumped for gradient support & font engine
    
    Loader = Loader,

	OpenFrames = {},
	Options = {},
	Themes = require(Root.Themes).Names,
    Theming = require(Root.Themes), -- Expose full themes table for editing

	Window = nil,
	WindowFrame = nil,
	Unloaded = false,

	Theme = "FssVs",
	DialogOpen = false,
	UseAcrylic = true,
	Acrylic = true,
	Transparency = true,
	MinimizeKeybind = nil,
	MinimizeKey = Enum.KeyCode.LeftControl,
	
	IsReady = false,
	NotifyQueue = {},

	GUI = GUI,
	
	-- Gradient system public API (v1.3.0)
	Gradients = require(Root.Gradients),
	Creator = Creator,
    
    -- Docking System (v1.4.0)
    Docking = require(Root.Docking),
    
    -- Addons
    SaveManager = SaveManager,
    InterfaceManager = InterfaceManager,
}

function Library:SafeCallback(Function, ...)
	if not Function then
		return
	end

	local Success, Event = pcall(Function, ...)
	if not Success then
		local _, i = Event:find(":%d+: ")

		if not i then
			return Library:Notify({
				Title = "Interface",
				Content = "Callback error",
				SubContent = Event,
				Duration = 5,
			})
		end

		return Library:Notify({
			Title = "Interface",
			Content = "Callback error",
			SubContent = Event:sub(i + 1),
			Duration = 5,
		})
	end
end

function Library:Round(Number, Factor)
	if Factor == 0 then
		return math.floor(Number)
	end
	Number = tostring(Number)
	return Number:find("%.") and tonumber(Number:sub(1, Number:find("%.") + Factor)) or Number
end

local Icons = require(Root.Icons).assets
function Library:GetIcon(Name)
	if Name ~= nil and Icons["lucide-" .. Name] then
		return Icons["lucide-" .. Name]
	end
	return nil
end

local Elements = {}
Elements.__index = Elements
Elements.__namecall = function(Table, Key, ...)
	return Elements[Key](...)
end

for _, ElementComponent in ipairs(ElementsTable) do
	Elements["Add" .. ElementComponent.__type] = function(self, Idx, Config)
		ElementComponent.Container = self.Container
		ElementComponent.Type = self.Type
		ElementComponent.ScrollFrame = self.ScrollFrame
		ElementComponent.Library = Library

		return ElementComponent:New(Idx, Config)
	end
end

Library.Elements = Elements

function Library:CreateWindow(Config)
	assert(Config.Title, "Toggle - Missing Title")

	Config.SubTitle = Config.SubTitle or ""
	Config.TabWidth = Config.TabWidth or 170
	Config.Size = Config.Size or UDim2.fromOffset(590, 470)
	Config.Acrylic = Config.Acrylic or true
	Config.Theme = Config.Theme or "Dark"
	Config.MinimizeKey = Config.MinimizeKey or Enum.KeyCode.LeftControl

	if Library.Window then
		print("You cannot create more than one window.")
		return
	end

	local Window = require(Components.Window)({
		Parent = GUI,
		Size = Config.Size,
		Title = Config.Title,
		SubTitle = Config.SubTitle,
		TabWidth = Config.TabWidth,
	})

	Library.MinimizeKey = Config.MinimizeKey

	Library.UseAcrylic = Config.Acrylic
	if Library.UseAcrylic then
		Acrylic.init()
	end

	Library.Window = Window
	Library:SetTheme(Config.Theme)

	return Window
end

function Library:SetTheme(Value)
	if Library.Window and table.find(Library.Themes, Value) then
		Library.Theme = Value
		Creator.UpdateTheme()
	end
end

--[[
    Create a universal panel component
    @param Config: Table with panel options
        - Title: string (optional) - Panel header title
        - Size: UDim2 (optional) - Initial size, default 300x200
        - Position: UDim2 (optional) - Initial position, default center
        - MinSize: Vector2 (optional) - Minimum resize bounds
        - MaxSize: Vector2 (optional) - Maximum resize bounds
        - Resizable: boolean (optional) - Enable resize handle, default true
        - Draggable: boolean (optional) - Enable drag from header, default true
        - Dockable: boolean (optional) - Enable edge docking, default true
        - Minimizable: boolean (optional) - Enable collapse button, default true
        - ShowCloseButton: boolean (optional) - Show close button, default true
        - UseAcrylic: boolean (optional) - Enable acrylic effect, inherits from Library
    @return Panel instance with methods:
        - SetTitle(text), Minimize(), Dock(edge), Undock(), SetVisible(bool), Destroy()
        - Properties: Content (Frame), IsDocked, IsMinimized, DockPosition
]]
function Library:CreatePanel(Config)
	return require(Components.DockablePanel)(Config, GUI)
end

function Library:SetFontSize(Value)
	Creator.UpdateFontSize(Value)
end

function Library:Destroy()
	if Library.Window then
		Library.Unloaded = true
		if Library.UseAcrylic then
			Library.Window.AcrylicPaint.Model:Destroy()
		end
		Creator.Disconnect()
		Library.GUI:Destroy()
	end

    -- Clean up Loader if it exists
    if Library.Loader and Library.Loader.Destroy then
        pcall(function() Library.Loader:Destroy() end)
    end

    -- Clean up Addons
    if Library.Addons then
        for name, addon in pairs(Library.Addons) do
            if addon and type(addon) == "table" and addon.Destroy then
                print("[Fluent] Destroying Addon:", name)
                pcall(function() addon:Destroy() end)
            end
        end
    end
end

function Library:ToggleAcrylic(Value)
	if Library.Window then
		if Library.UseAcrylic then
			Library.Acrylic = Value
			Library.Window.AcrylicPaint.Model.Transparency = Value and 0.98 or 1
			if Value then
				Acrylic.Enable()
			else
				Acrylic.Disable()
			end
		end
	end
end

function Library:ToggleTransparency(Value)
	if Library.Window then
		Library.Window.AcrylicPaint.Frame.Background.BackgroundTransparency = Value and 0.35 or 0
	end
end

function Library:Notify(Config)
	if not Library.IsReady then
		table.insert(Library.NotifyQueue, Config)
		return
	end

	return NotificationModule:New(Config)
end

if getgenv then
	getgenv().Fluent = Library
end

-- [ Addons Integration ]
-- CRITICAL: In bundled context, 'script' is a virtual ref where:
-- 1. Direct property access (script.Addons) THROWS if child doesn't exist
-- 2. Method access (script.FindFirstChild) works because methods are checked first
-- We wrap everything in pcall to be absolutely safe.
Library.Addons = {}

local function TryRequireAddon(addonName)
	local addon = nil
	
	-- Step 1: Safely get the Addons folder
	local addonsFolder = nil
	pcall(function()
		if script and script.FindFirstChild then
			addonsFolder = script:FindFirstChild("Addons")
		end
	end)
	
	if not addonsFolder then
		return nil
	end
	
	-- Step 2: Safely get the specific addon module
	pcall(function()
		if addonsFolder.FindFirstChild then
			addon = addonsFolder:FindFirstChild(addonName)
		end
	end)
	
	if not addon then
		return nil
	end
	
	-- Step 3: Safely require the addon
	local success, result = pcall(require, addon)
	if success then
		return result
	else
		warn("[Fluent] Error requiring addon " .. addonName .. ": " .. tostring(result))
		return nil
	end
end

Library.Addons.SaveManager = TryRequireAddon("SaveManager")
Library.Addons.InterfaceManager = TryRequireAddon("InterfaceManager")
Library.Addons.KeySystem = TryRequireAddon("KeySystem")

-- Debug logging
print("[Fluent] Addons loaded: SaveManager=" .. tostring(Library.Addons.SaveManager ~= nil) .. 
      ", InterfaceManager=" .. tostring(Library.Addons.InterfaceManager ~= nil) ..
      ", KeySystem=" .. tostring(Library.Addons.KeySystem ~= nil))

-- [ Configuration API ]
function Library:SetRootFolder(folderPath)
	if not folderPath then return end
	
	print("[Fluent] Initializing storage structure at:", folderPath)
	
	-- Global function check
	local makefolder = makefolder or function(...) end
	local isfolder = isfolder or function(...) return false end
	
	-- 1. Create Root Folder
	if not isfolder(folderPath) then
		print("[Fluent] Creating root folder...")
		pcall(makefolder, folderPath)
	end
	
	-- 2. Create Settings Folder (Standard Fluent Structure)
	local settingsPath = folderPath .. "/settings"
	if not isfolder(settingsPath) then
		print("[Fluent] Creating settings folder...")
		pcall(makefolder, settingsPath)
	end

	-- 3. Configure Addons
	
	-- SaveManager: Pass ROOT path. It appends /settings internally.
	if Library.Addons.SaveManager and Library.Addons.SaveManager.SetFolder then
		local success, err = pcall(function() Library.Addons.SaveManager:SetFolder(folderPath) end)
		if not success then warn("[Fluent] Failed to set SaveManager folder:", err) end
	end
	
	-- InterfaceManager: Pass ROOT path. It appends /settings internally.
	if Library.Addons.InterfaceManager and Library.Addons.InterfaceManager.SetFolder then
		local success, err = pcall(function() Library.Addons.InterfaceManager:SetFolder(folderPath) end)
		if not success then warn("[Fluent] Failed to set InterfaceManager folder:", err) end
	end
	
	-- KeySystem: Pass ROOT path. Keys stored in root.
	if Library.Addons.KeySystem and Library.Addons.KeySystem.Storage then
		Library.Addons.KeySystem.Storage.Folder = folderPath
	end
end

return Library
 end,
    function()local maui,script,require,getfenv,setfenv=ImportGlobals(2)local Acrylic = {
	AcrylicBlur = require(script.AcrylicBlur),
	CreateAcrylic = require(script.CreateAcrylic),
	AcrylicPaint = require(script.AcrylicPaint),
}

function Acrylic.init()
	local baseEffect = Instance.new("DepthOfFieldEffect")
	baseEffect.FarIntensity = 0
	baseEffect.InFocusRadius = 0.1
	baseEffect.NearIntensity = 1

	local depthOfFieldDefaults = {}

	function Acrylic.Enable()
		for _, effect in pairs(depthOfFieldDefaults) do
			effect.Enabled = false
		end
		baseEffect.Parent = game:GetService("Lighting")
	end

	function Acrylic.Disable()
		for _, effect in pairs(depthOfFieldDefaults) do
			effect.Enabled = effect.enabled
		end
		baseEffect.Parent = nil
	end

	local function registerDefaults()
		local function register(object)
			if object:IsA("DepthOfFieldEffect") then
				depthOfFieldDefaults[object] = { enabled = object.Enabled }
			end
		end

		for _, child in pairs(game:GetService("Lighting"):GetChildren()) do
			register(child)
		end

		if game:GetService("Workspace").CurrentCamera then
			for _, child in pairs(game:GetService("Workspace").CurrentCamera:GetChildren()) do
				register(child)
			end
		end
	end

	registerDefaults()
	Acrylic.Enable()
end

return Acrylic
 end,
    function()local maui,script,require,getfenv,setfenv=ImportGlobals(3)local Creator = require(script.Parent.Parent.Creator)
local createAcrylic = require(script.Parent.CreateAcrylic)
local viewportPointToWorld, getOffset = unpack(require(script.Parent.Utils))

local function createAcrylicBlur(distance)
	local cleanups = {}

	distance = distance or 0.001
	local positions = {
		topLeft = Vector2.new(),
		topRight = Vector2.new(),
		bottomRight = Vector2.new(),
	}
	local model = createAcrylic()
	model.Parent = workspace

	local function updatePositions(size, position)
		positions.topLeft = position
		positions.topRight = position + Vector2.new(size.X, 0)
		positions.bottomRight = position + size
	end

	local function render()
		local res = game:GetService("Workspace").CurrentCamera
		if res then
			res = res.CFrame
		end
		local cond = res
		if not cond then
			cond = CFrame.new()
		end

		local camera = cond
		local topLeft = positions.topLeft
		local topRight = positions.topRight
		local bottomRight = positions.bottomRight

		local topLeft3D = viewportPointToWorld(topLeft, distance)
		local topRight3D = viewportPointToWorld(topRight, distance)
		local bottomRight3D = viewportPointToWorld(bottomRight, distance)

		local width = (topRight3D - topLeft3D).Magnitude
		local height = (topRight3D - bottomRight3D).Magnitude

		model.CFrame =
			CFrame.fromMatrix((topLeft3D + bottomRight3D) / 2, camera.XVector, camera.YVector, camera.ZVector)
		model.Mesh.Scale = Vector3.new(width, height, 0)
	end

	local function onChange(rbx)
		local offset = getOffset()
		local size = rbx.AbsoluteSize - Vector2.new(offset, offset)
		local position = rbx.AbsolutePosition + Vector2.new(offset / 2, offset / 2)

		updatePositions(size, position)
		task.spawn(render)
	end

	local function renderOnChange()
		local camera = game:GetService("Workspace").CurrentCamera
		if not camera then
			return
		end

		table.insert(cleanups, camera:GetPropertyChangedSignal("CFrame"):Connect(render))
		table.insert(cleanups, camera:GetPropertyChangedSignal("ViewportSize"):Connect(render))
		table.insert(cleanups, camera:GetPropertyChangedSignal("FieldOfView"):Connect(render))
		task.spawn(render)
	end

	model.Destroying:Connect(function()
		for _, item in cleanups do
			pcall(function()
				item:Disconnect()
			end)
		end
	end)

	renderOnChange()

	return onChange, model
end

return function(distance)
	local Blur = {}
	local onChange, model = createAcrylicBlur(distance)

	local comp = Creator.New("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
	})

	Creator.AddSignal(comp:GetPropertyChangedSignal("AbsolutePosition"), function()
		onChange(comp)
	end)

	Creator.AddSignal(comp:GetPropertyChangedSignal("AbsoluteSize"), function()
		onChange(comp)
	end)

	Blur.AddParent = function(Parent)
		Creator.AddSignal(Parent:GetPropertyChangedSignal("Visible"), function()
			Blur.SetVisibility(Parent.Visible)
		end)
	end

	Blur.SetVisibility = function(Value)
		model.Transparency = Value and 0.98 or 1
	end

	Blur.Frame = comp
	Blur.Model = model

	return Blur
end
 end,
    function()local maui,script,require,getfenv,setfenv=ImportGlobals(4)local Creator = require(script.Parent.Parent.Creator)
local AcrylicBlur = require(script.Parent.AcrylicBlur)

local New = Creator.New

return function(props)
	local AcrylicPaint = {}

	AcrylicPaint.Frame = New("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 0.9,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0,
	}, {
		New("ImageLabel", {
			Image = "rbxassetid://8992230677",
			ScaleType = "Slice",
			SliceCenter = Rect.new(Vector2.new(99, 99), Vector2.new(99, 99)),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 120, 1, 116),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundTransparency = 1,
			ImageColor3 = Color3.fromRGB(0, 0, 0),
			ImageTransparency = 0.7,
		}),

		New("UICorner", {
			CornerRadius = UDim.new(0, 8),
		}),

		New("Frame", {
			BackgroundTransparency = 0.45,
			Size = UDim2.fromScale(1, 1),
			Name = "Background",
			ThemeTag = {
				BackgroundColor3 = "AcrylicMain",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
		}),

		New("Frame", {
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.4,
			Size = UDim2.fromScale(1, 1),
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),

			New("UIGradient", {
				Rotation = 90,
				ThemeTag = {
					Color = "AcrylicGradient",
				},
			}),
		}),

		New("ImageLabel", {
			Image = "rbxassetid://9968344105",
			ImageTransparency = 0.98,
			ScaleType = Enum.ScaleType.Tile,
			TileSize = UDim2.new(0, 128, 0, 128),
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
		}),

		New("ImageLabel", {
			Image = "rbxassetid://9968344227",
			ImageTransparency = 0.9,
			ScaleType = Enum.ScaleType.Tile,
			TileSize = UDim2.new(0, 128, 0, 128),
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ThemeTag = {
				ImageTransparency = "AcrylicNoise",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
		}),

		New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 2,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
			New("UIStroke", {
				Transparency = 0.5,
				Thickness = 1,
				ThemeTag = {
					Color = "AcrylicBorder",
				},
			}),
		}),
	})

	local Blur

	if require(script.Parent.Parent).UseAcrylic then
		Blur = AcrylicBlur()
		Blur.Frame.Parent = AcrylicPaint.Frame
		AcrylicPaint.Model = Blur.Model
		AcrylicPaint.AddParent = Blur.AddParent
		AcrylicPaint.SetVisibility = Blur.SetVisibility
	end

	return AcrylicPaint
end
 end,
    function()local maui,script,require,getfenv,setfenv=ImportGlobals(5)local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local function createAcrylic()
	local Part = Creator.New("Part", {
		Name = "Body",
		Color = Color3.new(0, 0, 0),
		Material = Enum.Material.Glass,
		Size = Vector3.new(1, 1, 0),
		Anchored = true,
		CanCollide = false,
		Locked = true,
		CastShadow = false,
		Transparency = 0.98,
	}, {
		Creator.New("SpecialMesh", {
			MeshType = Enum.MeshType.Brick,
			Offset = Vector3.new(0, 0, -0.000001),
		}),
	})

	return Part
end

return createAcrylic
 end,
    function()local maui,script,require,getfenv,setfenv=ImportGlobals(6)local function map(value, inMin, inMax, outMin, outMax)
	return (value - inMin) * (outMax - outMin) / (inMax - inMin) + outMin
end

local function viewportPointToWorld(location, distance)
	local unitRay = game:GetService("Workspace").CurrentCamera:ScreenPointToRay(location.X, location.Y)
	return unitRay.Origin + unitRay.Direction * distance
end

local function getOffset()
	local viewportSizeY = game:GetService("Workspace").CurrentCamera.ViewportSize.Y
	return map(viewportSizeY, 0, 2560, 8, 56)
end

return { viewportPointToWorld, getOffset }
 end,
    [8] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(8)local httpService = game:GetService("HttpService")

local InterfaceManager = {} do
	InterfaceManager.Folder = "FluentSettings"
    InterfaceManager.Settings = {
        Theme = "Dark",
        Acrylic = true,
        Transparency = true,
        MenuKeybind = "LeftControl",
        FontSize = 14,
    }

    function InterfaceManager:SetFolder(folder)
		self.Folder = folder;
		self:BuildFolderTree()
	end

    function InterfaceManager:SetLibrary(library)
		self.Library = library
	end

    function InterfaceManager:BuildFolderTree()
		local paths = {}

		local parts = self.Folder:split("/")
		for idx = 1, #parts do
			paths[#paths + 1] = table.concat(parts, "/", 1, idx)
		end

		table.insert(paths, self.Folder)
		table.insert(paths, self.Folder .. "/settings")

		for i = 1, #paths do
			local str = paths[i]
			if not isfolder(str) then
				makefolder(str)
			end
		end
	end

    function InterfaceManager:SaveSettings()
        writefile(self.Folder .. "/options.json", httpService:JSONEncode(InterfaceManager.Settings))
    end

    function InterfaceManager:LoadSettings()
        local path = self.Folder .. "/options.json"
        if isfile(path) then
            local data = readfile(path)
            local success, decoded = pcall(httpService.JSONDecode, httpService, data)

            if success then
                for i, v in next, decoded do
                    InterfaceManager.Settings[i] = v
                end
            end
        end
    end

    function InterfaceManager:BuildInterfaceSection(tab)
        assert(self.Library, "Must set InterfaceManager.Library")
		local Library = self.Library
        local Settings = InterfaceManager.Settings

        InterfaceManager:LoadSettings()

		local section = tab:AddSection("Interface")

		local InterfaceTheme = section:AddDropdown("InterfaceTheme", {
			Title = "Theme",
			Description = "Changes the interface theme.",
			Values = Library.Themes,
			Default = Settings.Theme,
			Callback = function(Value)
				Library:SetTheme(Value)
                Settings.Theme = Value
                InterfaceManager:SaveSettings()
			end
		})

        InterfaceTheme:SetValue(Settings.Theme)
	
		if Library.UseAcrylic then
			section:AddToggle("AcrylicToggle", {
				Title = "Acrylic",
				Description = "The blurred background requires graphic quality 8+",
				Default = Settings.Acrylic,
				Callback = function(Value)
					Library:ToggleAcrylic(Value)
                    Settings.Acrylic = Value
                    InterfaceManager:SaveSettings()
				end
			})
		end
	
		section:AddToggle("TransparentToggle", {
			Title = "Transparency",
			Description = "Makes the interface transparent.",
			Default = Settings.Transparency,
			Callback = function(Value)
				Library:ToggleTransparency(Value)
				Settings.Transparency = Value
                InterfaceManager:SaveSettings()
			end
		})

		local FontSize = section:AddSlider("FontSize", {
			Title = "Font Size",
			Description = "Adjusts the global font size of the interface.",
			Default = Settings.FontSize,
			Min = 8,
			Max = 24,
			Rounding = 1,
			Callback = function(Value)
				Library:SetFontSize(Value)
				Settings.FontSize = Value
				InterfaceManager:SaveSettings()
			end
		})
		FontSize:SetValue(Settings.FontSize)
	
		local MenuKeybind = section:AddKeybind("MenuKeybind", { Title = "Minimize Bind", Default = Settings.MenuKeybind })
		MenuKeybind:OnChanged(function()
			Settings.MenuKeybind = MenuKeybind.Value
            InterfaceManager:SaveSettings()
		end)
		Library.MinimizeKeybind = MenuKeybind
    end
end

return InterfaceManager end,
    [9] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(9)local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")
local Players = game:GetService("Players")

-- [ FLUENT INTEGRATION ]
local Root = script.Parent.Parent
local Creator = require(Root.Creator)
local WindowModule = require(Root.Components.Window)
local Assets = require(Root.Components.Assets)

local New = Creator.New

-- [ CONSTANTS ]
local FILE_EXT = ".cfg"

local KeySystem = {}

-- [ PROPERTIES ]
KeySystem.Appearance = {
    Title = "KEY SYSTEM",
    Subtitle = "Enter your key to continue",
}

KeySystem.Links = {
    GetKey = "",
    Discord = ""
}

KeySystem.Storage = {
    Folder = nil,
    FileName = "SavedKey_FSSHUB",
    Remember = true,
    AutoLoad = true
}

KeySystem.Options = {
    Keyless = nil,
    Blur = true,
    Draggable = true
}

KeySystem.Changelog = {}

KeySystem.Callbacks = {
    OnVerify = nil,
    OnSuccess = nil,
    OnFail = nil,
    OnClose = nil
}

-- [ INTERNAL STATE ]
local State = {
    Window = nil,
    BlurEffect = nil,
    ParticleContainer = nil,
    ParticleRunning = false,
    Connections = {},
    Elements = {}
}

-- [ UTILITIES ]
local function RandomString(len)
    local s = ""
    for i = 1, len do s = s .. string.char(math.random(65, 90)) end
    return s
end

local function NeonStroke(parent, colorProp, thickness, transparency)
    local stroke = New("UIStroke", {
        Thickness = thickness or 1,
        Transparency = transparency or 0.6,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = parent,
        ThemeTag = {
            Color = colorProp or "Accent"
        }
    })
    return stroke
end

local function GlitchText(label, originalText)
    task.spawn(function()
        for i = 1, 10 do
            if not label or not label.Parent then break end
            label.Text = RandomString(#originalText)
            task.wait(0.05)
        end
        if label and label.Parent then
            label.Text = originalText
        end
    end)
end

-- [ PARTICLE EFFECT OVERLAY ]
local function StartParticleEffect(parent)
    local particleContainer = New("Frame", {
        Name = "ParticleOverlay",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent = parent,
        ZIndex = 1
    })
    
    State.ParticleContainer = particleContainer
    State.ParticleRunning = true
    
    task.spawn(function()
        while State.ParticleRunning and particleContainer and particleContainer.Parent do
            if math.random() > 0.7 then -- Reduced spawn rate for performance
                local particle = New("Frame", {
                    Size = UDim2.new(0, math.random(2,3), 0, math.random(2,3)),
                    Position = UDim2.new(math.random(), 0, math.random(), 0),
                    BackgroundColor3 = Color3.new(1,1,1),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0.5,
                    Parent = particleContainer,
                    ZIndex = 1,
                    ThemeTag = {
                        BackgroundColor3 = "Accent"
                    }
                })
                New("UICorner", { CornerRadius = UDim.new(1,0), Parent = particle })
                
                local duration = math.random(4, 6)
                local endPos = particle.Position + UDim2.new(math.random() * 0.1 - 0.05, 0, math.random() * 0.1 - 0.05, 0)
                
                TweenService:Create(particle, TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    { Position = endPos, BackgroundTransparency = 1 }):Play()
                Debris:AddItem(particle, duration)
            end
            task.wait(0.15) -- Slower loop for better performance
        end
    end)
    
    return particleContainer
end


-- [ STORAGE METHODS ]
function KeySystem:GetSavedKey()
    if not self.Storage.Remember then return nil end
    local path = self.Storage.FileName .. FILE_EXT
    if self.Storage.Folder then
        path = self.Storage.Folder .. "/" .. path
    end

    if isfile and isfile(path) then
        local success, key = pcall(readfile, path)
        if success and key and key ~= "" then
            return key:gsub("%s+", "")
        end
    end
    return nil
end

function KeySystem:SaveKey(key)
    if not self.Storage.Remember then return end
    local path = self.Storage.FileName .. FILE_EXT
    if self.Storage.Folder then
        if not isfolder(self.Storage.Folder) then makefolder(self.Storage.Folder) end
        path = self.Storage.Folder .. "/" .. path
    end

    if writefile then
        pcall(writefile, path, key)
    end
end

function KeySystem:ClearSavedKey()
    local path = self.Storage.FileName .. FILE_EXT
    if self.Storage.Folder then
        path = self.Storage.Folder .. "/" .. path
    end
    if isfile and isfile(path) then
        delfile(path)
        return true
    end
    return false
end

-- [ NOTIFICATION SYSTEM ]
function KeySystem:Notify(title, message, duration, iconType)
    print(string.format("[KeySystem] %s: %s", title, message))
    self:ShowStatus(message, iconType)
end

function KeySystem:ShowStatus(msg, type)
    if not State.Window then return end
    local container = State.Window.ContentArea

    local existing = container:FindFirstChild("StatusFrame")
    if existing then existing:Destroy() end

    local fixedColor = nil
    if type == "error" then fixedColor = Color3.fromRGB(255, 80, 100) end
    if type == "success" then fixedColor = Color3.fromRGB(80, 255, 140) end
    
    local statusFrame = New("Frame", {
        Name = "StatusFrame",
        Size = UDim2.new(0, 0, 0, 26),
        Position = UDim2.new(0.5, 0, 1, -15),
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.new(0,0,0), 
        BackgroundTransparency = 0.3,
        Parent = container,
        ZIndex = 10,
        ThemeTag = {
            BackgroundColor3 = "DialogHolder"
        }
    })

    New("UICorner", { CornerRadius = UDim.new(0, 6), Parent = statusFrame })
    
    local s
    if fixedColor then
        s = New("UIStroke", {
            Color = fixedColor,
            Thickness = 1,
            Transparency = 0.6,
            Parent = statusFrame
        })
    else
        s = NeonStroke(statusFrame, "Accent", 1)
    end

    local label = New("TextLabel", {
        Text = string.upper(msg),
        TextColor3 = fixedColor or Color3.new(1,1,1),
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        TextTransparency = 1,
        Parent = statusFrame,
        ZIndex = 11
    })
    
    if not fixedColor then
         Creator.AddThemeObject(label, { TextColor3 = "Text" })
    end

    TweenService:Create(statusFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        { Size = UDim2.new(0.85, 0, 0, 26) }):Play()

    task.delay(0.2, function()
        TweenService:Create(label, TweenInfo.new(0.2), { TextTransparency = 0 }):Play()
    end)

    task.delay(3, function()
        if statusFrame.Parent then
            TweenService:Create(label, TweenInfo.new(0.2), { TextTransparency = 1 }):Play()
            local tweenOut = TweenService:Create(statusFrame,
                TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                { Size = UDim2.new(0, 0, 0, 26) })
            tweenOut:Play()
            tweenOut.Completed:Wait()
            statusFrame:Destroy()
        end
    end)
end

-- [ UI CONSTRUCTION ]
function KeySystem:ConstructUI()
    local Library = require(Root)
    
    -- Prevent duplicate windows
    if Library.Window then
        warn("[KeySystem] A window already exists. Cannot create KeySystem window.")
        return
    end
    
    -- Create ScreenGui
    local gui = New("ScreenGui", {
        Name = "KeySystemUI",
        IgnoreGuiInset = true,
        DisplayOrder = 10000,
        Parent = gethui and gethui() or game:GetService("CoreGui")
    })
    
    -- Blur
    if self.Options.Blur then
        local blur = Instance.new("BlurEffect")
        blur.Size = 0
        blur.Parent = game:GetService("Lighting")
        TweenService:Create(blur, TweenInfo.new(0.5), { Size = 15 }):Play()
        State.BlurEffect = blur
    end
    
    -- Create the Window using Fluent's component
    local Window = WindowModule({
        Parent = gui,
        Size = UDim2.fromOffset(400, 280),
        Title = self.Appearance.Title,
        SubTitle = self.Appearance.Subtitle,
        TabWidth = 0, -- No tabs
    })
    
    State.Window = Window
    Library.Window = Window -- Allow TitleBar to access Library.Window

    -- Hide/disable unnecessary elements
    Window.TabHolder.Visible = false
    Window.TabDisplay.Visible = false
    Window.ContainerHolder.Visible = false
    
    -- Override TitleBar buttons
    Window.TitleBar.MaxButton.Frame.Visible = false
    Window.TitleBar.MinButton.Frame.Visible = false
    Window.TitleBar.CloseButton.SetCallback(function()
        if self.Callbacks.OnClose then self.Callbacks.OnClose() end
        self:Close()
    end)
    
    -- Make Window visible (since KeySystem doesn't call SelectTab)
    Window.Root.Visible = true

    -- Content Area (Main body below title bar)
    local contentArea = New("Frame", {
        Name = "ContentArea",
        Size = UDim2.new(1, 0, 1, -42), -- Full size minus TitleBar height
        Position = UDim2.new(0, 0, 0, 42),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent = Window.Root,
        ZIndex = 2
    })
    Window.ContentArea = contentArea
    
    
    -- Start Particle Effect Overlay
    StartParticleEffect(contentArea)
    
    local els = {}
    
    -- Logo Image (above greeting)
    local logo = New("ImageLabel", {
        Image = Assets.KeySystemLogo,
        Size = UDim2.new(0, 50, 0, 50),
        Position = UDim2.new(0.5, 0, 0, 10),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundTransparency = 1,
        ImageTransparency = 1,
        Parent = contentArea,
        ZIndex = 5,
        ScaleType = Enum.ScaleType.Fit,
    })
    New("UICorner", { CornerRadius = UDim.new(0, 8), Parent = logo })
    els.Logo = logo
    
    -- Greeting (below logo)
    local userName = Players.LocalPlayer and Players.LocalPlayer.Name or "User"
    local greeting = New("TextLabel", {
        Text = "Welcome, @" .. userName,
        Font = Enum.Font.GothamMedium,
        TextSize = 14,
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0, 65),
        BackgroundTransparency = 1,
        TextTransparency = 1,
        Parent = contentArea,
        ZIndex = 5,
        ThemeTag = {
            TextColor3 = "Text"
        }
    })
    els.Greeting = greeting

    -- Input Frame (Y: 95)
    local inputSection = New("Frame", {
        Size = UDim2.new(0.85, 0, 0, 42),
        Position = UDim2.new(0.5, 0, 0, 95),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundTransparency = 0.5,
        Parent = contentArea,
        ZIndex = 20,
        ThemeTag = {
            BackgroundColor3 = "DialogHolder"
        }
    })
    New("UICorner", { CornerRadius = UDim.new(0, 6), Parent = inputSection })
    NeonStroke(inputSection, "SubText", 1)
    
    local keyIcon = New("ImageLabel", {
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0, 12, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://10723416652",
        Parent = inputSection,
        ZIndex = 22,
        ThemeTag = {
            ImageColor3 = "Accent"
        }
    })

    local textContainer = New("Frame", {
        Name = "TextClip",
        Size = UDim2.new(1, -50, 1, 0),
        Position = UDim2.new(0, 42, 0, 0),
        BackgroundTransparency = 1,
        Parent = inputSection,
        ClipsDescendants = true,
        ZIndex = 21
    })
    
    local keyInput = New("TextBox", {
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1,
        Font = Enum.Font.Code,
        Text = "",
        PlaceholderText = "Enter Key Here..",
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        PlaceholderColor3 = Color3.fromRGB(200,200,200),
        Parent = textContainer,
        ZIndex = 25,
        ClearTextOnFocus = true,
    })
    els.InputSection = inputSection
    els.KeyInput = keyInput
    els.KeyIcon = keyIcon
    
    -- Buttons (Y: 110)
    local function createBtn(text, pos, primary, callback)
        local btn = New("TextButton", {
            Text = text,
            Size = UDim2.new(0.35, 0, 0, 36),
            Position = pos,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundTransparency = 0.3,
            Font = Enum.Font.GothamBold,
            TextSize = 13,
            Parent = contentArea,
            ZIndex = 10,
            ThemeTag = {
                BackgroundColor3 = "DialogHolder",
                TextColor3 = primary and "Accent" or "SubText"
            }
        })
        New("UICorner", { CornerRadius = UDim.new(0, 6), Parent = btn })
        local s = NeonStroke(btn, primary and "Accent" or "SubText", 1)
        
        btn.MouseEnter:Connect(function()
            TweenService:Create(s, TweenInfo.new(0.2), {Transparency = 0}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(s, TweenInfo.new(0.2), {Transparency = 0.5}):Play()
        end)
        btn.MouseButton1Click:Connect(callback)
        return btn
    end
    
    local btnY = 155
    
    local btnGet = createBtn("Get Key", UDim2.new(0.28, 0, 0, btnY), false, function()
        if setclipboard then
            setclipboard(self.Links.GetKey)
            self:ShowStatus("LINK_COPIED", "success")
        else
            self:ShowStatus("LINK: " .. self.Links.GetKey, "info")
        end
    end)
    els.BtnGet = btnGet
    
    local btnDiscord = createBtn("Discord", UDim2.new(0.72, 0, 0, btnY), false, function() 
        if self.Links.Discord ~= "" then
             if setclipboard then setclipboard(self.Links.Discord) self:ShowStatus("DISCORD COPIED", "success") end
        else
             self:ShowStatus("NO DISCORD LINK", "error")
        end
    end)
    els.BtnDiscord = btnDiscord
    
    -- Auto Verify logic
    local verifyDebounce = nil
    keyInput:GetPropertyChangedSignal("Text"):Connect(function()
        local input = keyInput.Text:gsub("%s+", "")
        if verifyDebounce then task.cancel(verifyDebounce) end
        if input == "" then return end
        verifyDebounce = task.delay(0.8, function()
            self:ProcessKey(input)
        end)
    end)
    
    State.Elements = els
end

function KeySystem:AnimateEntry(isAutoLogin)
     local w = State.Window
     if not w then return end
     
     local els = State.Elements
     for _, v in pairs(els) do
         if v:IsA("GuiObject") then v.Visible = false end
     end
     
     task.spawn(function()
         task.wait(0.3)
         
         local function Show(o)
             if not o then return end
             o.Visible = true
             if o.BackgroundTransparency < 1 then 
                 local target = o.BackgroundTransparency
                 o.BackgroundTransparency = 1
                 TweenService:Create(o, TweenInfo.new(0.3), { BackgroundTransparency = target }):Play()
             end
             if o:IsA("TextLabel") or o:IsA("TextBox") or o:IsA("TextButton") then
                 TweenService:Create(o, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
             end
             if o:IsA("ImageLabel") then
                 TweenService:Create(o, TweenInfo.new(0.3), { ImageTransparency = 0 }):Play()
             end
         end
         
         if isAutoLogin then
             self:ShowStatus("AUTO LOGIN", "success")
             task.delay(1.2, function() self:CompleteAuth() end)
         else
             Show(els.Logo)
             Show(els.Greeting)
             Show(els.InputSection)
             Show(els.KeyInput)
             Show(els.KeyIcon)
             Show(els.BtnGet)
             Show(els.BtnDiscord)
         end
     end)
end

function KeySystem:ProcessKey(key)
    if not self.Callbacks.OnVerify then
        self:Notify("Error", "No Verify Callback", 3, "error")
        return
    end

    self:ShowStatus("VERIFYING...", "info")

    local success, result = pcall(self.Callbacks.OnVerify, key)

    if not success then
        self:ShowStatus("SCRIPT ERROR", "error")
        if self.Callbacks.OnFail then self.Callbacks.OnFail("Script Error") end
        return
    end

    local isValid = false
    local errorMsg = "Invalid Key"

    if type(result) == "boolean" then
        isValid = result
    elseif type(result) == "table" then
        isValid = result.valid
        errorMsg = result.message or "Invalid Key"
    end

    if isValid then
        getgenv().SCRIPT_KEY = key
        if self.Storage.Remember then self:SaveKey(key) end
        self:ShowStatus("KEY ACCEPTED", "success")
        task.wait(1)
        self:CompleteAuth()
    else
        self:FailAuth(errorMsg)
    end
end

function KeySystem:FailAuth(msg)
    self:ShowStatus(msg or "INVALID KEY", "error")
    local w = State.Window
    if w and w.Root then
        local base = w.Root.Position
        for i=1,5 do
            w.Root.Position = base + UDim2.new(0, math.random(-5,5), 0, math.random(-5,5))
            task.wait(0.05)
        end
        w.Root.Position = base
    end
end

function KeySystem:CompleteAuth()
    self:ShowStatus("AUTHENTICATED", "success")
    task.wait(1)
    self:Close()
    if self.Callbacks.OnSuccess then
        pcall(self.Callbacks.OnSuccess)
    end
end

function KeySystem:Launch()
    getgenv().ArqelLoaded = true
    getgenv().ArqelClosed = false
    getgenv().SCRIPT_KEY = nil

    local savedKey = nil
    if self.Storage.AutoLoad then savedKey = self:GetSavedKey() end

    if self.Options.Keyless then
         getgenv().SCRIPT_KEY = "KEYLESS"
         self:ConstructUI()
         self:ShowStatus("KEYLESS MODE", "success")
         task.wait(1)
         self:CompleteAuth()
         return
    end

    self:ConstructUI()
    
    if savedKey then
        self:AnimateEntry(true)
        task.delay(1, function()
             self:ProcessKey(savedKey)
        end)
    else
        self:AnimateEntry(false)
    end
end

function KeySystem:ValidateSavedKey(config)
    if not config or not config.Identifier then return { success = false } end
    
    local Junkie = getgenv().Junkie 
    if not Junkie then
        local s, r = pcall(function() return loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))() end)
        if s then Junkie = r end
    end
    
    if not Junkie then return { success = false } end 
    getgenv().Junkie = Junkie

    Junkie.service = config.Service
    Junkie.identifier = config.Identifier
    Junkie.provider = config.Provider or "Junkie"
    getgenv().Junkie = Junkie

    -- Setup Folder for reading key
    if config.Cache and config.Cache.Folder then
        self.Storage.Folder = config.Cache.Folder
    end
    
    local savedKey = self:GetSavedKey()
    if not savedKey then return { success = false } end

    local res = Junkie.check_key(savedKey)
    if res then
        local isValid = (res.valid or res.message == "KEY_VALID" or res.message == "KEYLESS")
        if isValid then
             return { success = true, key = savedKey }
        end
    end
    
    return { success = false }
end

function KeySystem:LaunchJunkie(config)
    if not config or not config.Identifier then return end
    
    local Junkie = getgenv().Junkie 
    if not Junkie then
        local s, r = pcall(function() return loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))() end)
        if s then Junkie = r end
    end
    
    if not Junkie then return end 

    Junkie.service = config.Service
    Junkie.identifier = config.Identifier
    Junkie.provider = config.Provider or "Junkie"

    if config.Cache and config.Cache.Folder then
        self.Storage.Folder = config.Cache.Folder
        if makefolder and not isfolder(self.Storage.Folder) then makefolder(self.Storage.Folder) end
    end

    if self.Options.Keyless == nil then self.Options.Keyless = Junkie.keyless end

    self.Links.GetKey = Junkie.get_key_link()

    self.Callbacks.OnVerify = function(key)
        local res = Junkie.check_key(key)
        if res then
             return { valid = (res.valid or res.message == "KEY_VALID" or res.message == "KEYLESS"), message = res.message }
        end
        return false
    end

    self:Launch()
end

function KeySystem:Close()
    getgenv().ArqelLoaded = false
    local Library = require(Root)
    local w = State.Window
    local blur = State.BlurEffect
    
    -- Stop particle effect FIRST (before destroying window)
    State.ParticleRunning = false
    if State.ParticleContainer then
        State.ParticleContainer:Destroy()
        State.ParticleContainer = nil
    end
    
    if w then
        if w.Root then
             -- Enable clipping so everything (including Dialog) gets cut off
             w.Root.ClipsDescendants = true
             
             -- TV Turn Off Animation
             -- Step 1: Collapse Height (Vertical squish to thin line)
             local currentPos = w.Root.Position
             local tweenHeight = TweenService:Create(w.Root, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                 Size = UDim2.new(0, 400, 0, 3), -- Height to 3px
                 Position = currentPos + UDim2.new(0, 0, 0, 140) -- Center the line
             })
             tweenHeight:Play()
             tweenHeight.Completed:Wait()
             
             -- Step 2: Collapse Width (Horizontal zip to nothing)
             local tweenWidth = TweenService:Create(w.Root, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                 Size = UDim2.new(0, 0, 0, 0), -- Width AND Height to 0
                 BackgroundTransparency = 1 
             })
             tweenWidth:Play()
             tweenWidth.Completed:Wait()
        end
        
        -- Destroy the window and its parent GUI
        if w.Root and w.Root.Parent then
            w.Root.Parent:Destroy()
        end
        
        -- CRITICAL: Clear the Library.Window reference so main app can create its own
        Library.Window = nil
    end
    if blur then
        TweenService:Create(blur, TweenInfo.new(0.4), {Size=0}):Play()
        task.wait(0.4)
        blur:Destroy()
    end
    
    State.Window = nil
    State.BlurEffect = nil
end

function KeySystem:Destroy() 
    self:Close() 
end

return KeySystem
 end,
    [10] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(10)local httpService = game:GetService("HttpService")

local SaveManager = {} do
	SaveManager.Folder = "FluentSettings"
	SaveManager.Ignore = {}
	SaveManager.Parser = {
		Toggle = {
			Save = function(idx, object) 
				return { type = "Toggle", idx = idx, value = object.Value, key = object.KeybindValue } 
			end,
			Load = function(idx, data)
				if SaveManager.Options[idx] then 
					SaveManager.Options[idx]:SetValue(data.value)
                    if data.key then
                        SaveManager.Options[idx]:SetKeybind(data.key)
                    end
				end
			end,
		},
		Slider = {
			Save = function(idx, object)
				return { type = "Slider", idx = idx, value = tostring(object.Value) }
			end,
			Load = function(idx, data)
				if SaveManager.Options[idx] then 
					SaveManager.Options[idx]:SetValue(data.value)
				end
			end,
		},
		Dropdown = {
			Save = function(idx, object)
				return { type = "Dropdown", idx = idx, value = object.Value, mutli = object.Multi }
			end,
			Load = function(idx, data)
				if SaveManager.Options[idx] then 
					SaveManager.Options[idx]:SetValue(data.value)
				end
			end,
		},
		Colorpicker = {
			Save = function(idx, object)
				return { type = "Colorpicker", idx = idx, value = object.Value:ToHex(), transparency = object.Transparency }
			end,
			Load = function(idx, data)
				if SaveManager.Options[idx] then 
					SaveManager.Options[idx]:SetValueRGB(Color3.fromHex(data.value), data.transparency)
				end
			end,
		},
		Keybind = {
			Save = function(idx, object)
				return { type = "Keybind", idx = idx, mode = object.Mode, key = object.Value }
			end,
			Load = function(idx, data)
				if SaveManager.Options[idx] then 
					SaveManager.Options[idx]:SetValue(data.key, data.mode)
				end
			end,
		},

		Input = {
			Save = function(idx, object)
				return { type = "Input", idx = idx, text = object.Value }
			end,
			Load = function(idx, data)
				if SaveManager.Options[idx] and type(data.text) == "string" then
					SaveManager.Options[idx]:SetValue(data.text)
				end
			end,
		},
		ComboBox = {
			Save = function(idx, object)
				return { type = "ComboBox", idx = idx, value = object.Value }
			end,
			Load = function(idx, data)
				if SaveManager.Options[idx] and type(data.value) == "string" then
					SaveManager.Options[idx]:SetValue(data.value)
				end
			end,
		},
	}

	function SaveManager:SetIgnoreIndexes(list)
		for _, key in next, list do
			self.Ignore[key] = true
		end
	end

	function SaveManager:SetFolder(folder)
		self.Folder = folder;
		self:BuildFolderTree()
	end

	function SaveManager:Save(name)
		if (not name) then
			return false, "no config file is selected"
		end

		local fullPath = self.Folder .. "/settings/" .. name .. ".json"

		local data = {
			objects = {}
		}

		for idx, option in next, SaveManager.Options do
			if not self.Parser[option.Type] then continue end
			if self.Ignore[idx] then continue end

			table.insert(data.objects, self.Parser[option.Type].Save(idx, option))
		end	

		local success, encoded = pcall(httpService.JSONEncode, httpService, data)
		if not success then
			return false, "failed to encode data"
		end

		writefile(fullPath, encoded)
		return true
	end

	function SaveManager:Load(name)
		if (not name) then
			return false, "no config file is selected"
		end
		
		local file = self.Folder .. "/settings/" .. name .. ".json"
		if not isfile(file) then return false, "invalid file" end

		local success, decoded = pcall(httpService.JSONDecode, httpService, readfile(file))
		if not success then return false, "decode error" end

		for _, option in next, decoded.objects do
			if self.Parser[option.type] then
				task.spawn(function() self.Parser[option.type].Load(option.idx, option) end) -- task.spawn() so the config loading wont get stuck.
			end
		end

		return true
	end

	function SaveManager:IgnoreThemeSettings()
		self:SetIgnoreIndexes({ 
			"InterfaceTheme", "AcrylicToggle", "TransparentToggle", "MenuKeybind"
		})
	end

	function SaveManager:BuildFolderTree()
		local paths = {
			self.Folder,
			self.Folder .. "/settings"
		}

		for i = 1, #paths do
			local str = paths[i]
			if not isfolder(str) then
				makefolder(str)
			end
		end
	end

	function SaveManager:RefreshConfigList()
		local list = listfiles(self.Folder .. "/settings")

		local out = {}
		for i = 1, #list do
			local file = list[i]
			if file:sub(-5) == ".json" then
				local pos = file:find(".json", 1, true)
				local start = pos

				local char = file:sub(pos, pos)
				while char ~= "/" and char ~= "\\" and char ~= "" do
					pos = pos - 1
					char = file:sub(pos, pos)
				end

				if char == "/" or char == "\\" then
					local name = file:sub(pos + 1, start - 1)
					if name ~= "options" then
						table.insert(out, name)
					end
				end
			end
		end
		
		return out
	end

	function SaveManager:SetLibrary(library)
		self.Library = library
        self.Options = library.Options
	end

	function SaveManager:LoadAutoloadConfig()
		if isfile(self.Folder .. "/settings/autoload.txt") then
			local name = readfile(self.Folder .. "/settings/autoload.txt")

			local success, err = self:Load(name)
			if not success then
				return self.Library:Notify({
					Title = "Interface",
					Content = "Config loader",
					SubContent = "Failed to load autoload config: " .. err,
					Duration = 7
				})
			end

			self.Library:Notify({
				Title = "Interface",
				Content = "Config loader",
				SubContent = string.format("Auto loaded config %q", name),
				Duration = 7
			})
		end
	end

	function SaveManager:BuildConfigSection(tab)
		assert(self.Library, "Must set SaveManager.Library")

		local section = tab:AddSection("Configuration")

		local ConfigSelector = section:AddComboBox("SaveManager_ConfigSelector", { 
			Title = "Configuration", 
			Values = self:RefreshConfigList(), 
			AllowNull = true,
			Placeholder = "Type name or select..."
		})

		section:AddButton({
            Title = "Create config",
            Callback = function()
                local name = SaveManager.Options.SaveManager_ConfigSelector.Value

                if name:gsub(" ", "") == "" then 
                    return self.Library:Notify({
						Title = "Interface",
						Content = "Config loader",
						SubContent = "Invalid config name (empty)",
						Duration = 7
					})
                end

                local success, err = self:Save(name)
                if not success then
                    return self.Library:Notify({
						Title = "Interface",
						Content = "Config loader",
						SubContent = "Failed to save config: " .. err,
						Duration = 7
					})
                end

				self.Library:Notify({
					Title = "Interface",
					Content = "Config loader",
					SubContent = string.format("Created config %q", name),
					Duration = 7
				})

                SaveManager.Options.SaveManager_ConfigSelector:SetValues(self:RefreshConfigList())
                SaveManager.Options.SaveManager_ConfigSelector:SetValue(nil)
            end
        })

        section:AddButton({Title = "Load config", Callback = function()
			local name = SaveManager.Options.SaveManager_ConfigSelector.Value

			local success, err = self:Load(name)
			if not success then
				return self.Library:Notify({
					Title = "Interface",
					Content = "Config loader",
					SubContent = "Failed to load config: " .. err,
					Duration = 7
				})
			end

			self.Library:Notify({
				Title = "Interface",
				Content = "Config loader",
				SubContent = string.format("Loaded config %q", name),
				Duration = 7
			})
		end})

		section:AddButton({Title = "Overwrite config", Callback = function()
			local name = SaveManager.Options.SaveManager_ConfigSelector.Value

			local success, err = self:Save(name)
			if not success then
				return self.Library:Notify({
					Title = "Interface",
					Content = "Config loader",
					SubContent = "Failed to overwrite config: " .. err,
					Duration = 7
				})
			end

			self.Library:Notify({
				Title = "Interface",
				Content = "Config loader",
				SubContent = string.format("Overwrote config %q", name),
				Duration = 7
			})
		end})

		section:AddButton({Title = "Refresh list", Callback = function()
			SaveManager.Options.SaveManager_ConfigSelector:SetValues(self:RefreshConfigList())
			SaveManager.Options.SaveManager_ConfigSelector:SetValue(nil)
		end})

		local AutoloadButton
		AutoloadButton = section:AddButton({Title = "Set as autoload", Description = "Current autoload config: none", Callback = function()
			local name = SaveManager.Options.SaveManager_ConfigSelector.Value
			writefile(self.Folder .. "/settings/autoload.txt", name)
			AutoloadButton:SetDesc("Current autoload config: " .. name)
			self.Library:Notify({
				Title = "Interface",
				Content = "Config loader",
				SubContent = string.format("Set %q to auto load", name),
				Duration = 7
			})
		end})

		if isfile(self.Folder .. "/settings/autoload.txt") then
			local name = readfile(self.Folder .. "/settings/autoload.txt")
			AutoloadButton:SetDesc("Current autoload config: " .. name)
		end

		SaveManager:SetIgnoreIndexes({ "SaveManager_ConfigSelector" })
	end

	-- SaveManager:BuildFolderTree() -- [REMOVED] Auto-init creates default folder prematurely. Use SetFolder.
end

return SaveManager end,
    [12] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(12)return {
	Close = "rbxassetid://9886659671",
	Min = "rbxassetid://9886659276",
	Max = "rbxassetid://9886659406",
	Restore = "rbxassetid://9886659001",
	KeySystemLogo = "rbxthumb://type=Asset&id=120860566854298&w=420&h=420",
    FssHubLogoMain = "rbxassetid://80237615447661",
    Discord = "rbxassetid://98090254544686",
    Crown = "rbxassetid://95312489657403",
    FLogo = "rbxassetid://78001617722443",
	FsshubLogoThin ="rbxassetid://82558938002629",
	-- Panel icons (Lucide) - Matched from Icons.lua
	PanelClose = "rbxassetid://10747384394", -- lucide-x
	PanelArrowUp = "rbxassetid://10709791523", -- lucide-chevron-up
	PanelArrowDown = "rbxassetid://10709790948", -- lucide-chevron-down
	PanelArrowLeft = "rbxassetid://10709791281", -- lucide-chevron-left
	PanelArrowRight = "rbxassetid://10709791437", -- lucide-chevron-right
	PanelCollapse = "rbxassetid://10709791523", -- lucide-chevron-up
	PanelExpand = "rbxassetid://10709790948", -- lucide-chevron-down
	PanelDock = "rbxassetid://10709782342", -- lucide-box-select
	PanelPin = "rbxassetid://10734922324", -- lucide-pin
	PanelPinned = "rbxassetid://10734922324", -- lucide-pin (used with color change)
	PanelResize = "rbxassetid://9886659276", -- Resize handle (Keep original or find 'move' icon)
}
 end,
    [13] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(13)local Root = script.Parent.Parent
local Flipper = require(Root.Packages.Flipper)
local Creator = require(Root.Creator)
local New = Creator.New

local Spring = Flipper.Spring.new

return function(Theme, Parent, DialogCheck)
	DialogCheck = DialogCheck or false
	local Button = {}

	Button.Title = New("TextLabel", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
		TextColor3 = Color3.fromRGB(200, 200, 200),
		TextSize = 14,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	Button.HoverFrame = New("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ThemeTag = {
			BackgroundColor3 = "Hover",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 4),
		}),
	})

	Button.Frame = New("TextButton", {
		Size = UDim2.new(0, 0, 0, 32),
		Parent = Parent,
		ThemeTag = {
			BackgroundColor3 = "DialogButton",
			Gradient = "DialogButtonGradient",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 4),
		}),
		New("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Transparency = 0.65,
			ThemeTag = {
				Color = "DialogButtonBorder",
			},
		}),
		Button.HoverFrame,
		Button.Title,
	})

	local Motor, SetTransparency = Creator.SpringMotor(1, Button.HoverFrame, "BackgroundTransparency", DialogCheck)
	Creator.AddSignal(Button.Frame.MouseEnter, function()
		SetTransparency(0.97)
	end)
	Creator.AddSignal(Button.Frame.MouseLeave, function()
		SetTransparency(1)
	end)
	Creator.AddSignal(Button.Frame.MouseButton1Down, function()
		SetTransparency(1)
	end)
	Creator.AddSignal(Button.Frame.MouseButton1Up, function()
		SetTransparency(0.97)
	end)

	return Button
end
 end,
    [14] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(14)local UserInputService = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Camera = game:GetService("Workspace").CurrentCamera

local Root = script.Parent.Parent
local Flipper = require(Root.Packages.Flipper)
local Creator = require(Root.Creator)

local Spring = Flipper.Spring.new
local Instant = Flipper.Instant.new
local New = Creator.New

local Dialog = {
	Window = nil,
}

function Dialog:Init(Window)
	Dialog.Window = Window
	return Dialog
end

function Dialog:Create()
	local NewDialog = {
		Buttons = 0,
	}

	NewDialog.TintFrame = New("TextButton", {
		Text = "",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		ZIndex = 100,
		Parent = Dialog.Window.Root,
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 8),
		}),
	})

	local TintMotor, TintTransparency = Creator.SpringMotor(1, NewDialog.TintFrame, "BackgroundTransparency", true)

	NewDialog.ButtonHolder = New("Frame", {
		Size = UDim2.new(1, -40, 1, -40),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		BackgroundTransparency = 1,
	}, {
		New("UIListLayout", {
			Padding = UDim.new(0, 10),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
		}),
	})

	NewDialog.ButtonHolderFrame = New("Frame", {
		Size = UDim2.new(1, 0, 0, 70),
		Position = UDim2.new(0, 0, 1, -70),
		ThemeTag = {
			BackgroundColor3 = "DialogHolder",
		},
	}, {
		New("Frame", {
			Size = UDim2.new(1, 0, 0, 1),
			ThemeTag = {
				BackgroundColor3 = "DialogHolderLine",
			},
		}),
		NewDialog.ButtonHolder,
	})

	NewDialog.Title = New("TextLabel", {
		FontFace = Font.new(
			"rbxasset://fonts/families/GothamSSm.json",
			Enum.FontWeight.SemiBold,
			Enum.FontStyle.Normal
		),
		Text = "Dialog",
		TextColor3 = Color3.fromRGB(240, 240, 240),
		TextSize = 22,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Size = UDim2.new(1, 0, 0, 22),
		Position = UDim2.fromOffset(20, 25),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	NewDialog.Scale = New("UIScale", {
		Scale = 1,
	})

	local ScaleMotor, Scale = Creator.SpringMotor(1.1, NewDialog.Scale, "Scale")

	NewDialog.Root = New("CanvasGroup", {
		Size = UDim2.fromOffset(300, 165),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		GroupTransparency = 1,
		Parent = NewDialog.TintFrame,
		ThemeTag = {
			BackgroundColor3 = "Dialog",
			Gradient = "DialogGradient",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 8),
		}),
		New("UIStroke", {
			Transparency = 0.5,
			ThemeTag = {
				Color = "DialogBorder",
			},
		}),
		NewDialog.Scale,
		NewDialog.Title,
		NewDialog.ButtonHolderFrame,
	})

	local RootMotor, RootTransparency = Creator.SpringMotor(1, NewDialog.Root, "GroupTransparency")

	function NewDialog:Open()
		require(Root).DialogOpen = true
		NewDialog.Scale.Scale = 1.1
		TintTransparency(0.75)
		RootTransparency(0)
		Scale(1)
	end

	function NewDialog:Close()
		require(Root).DialogOpen = false
		TintTransparency(1)
		RootTransparency(1)
		Scale(1.1)
		NewDialog.Root.UIStroke:Destroy()
		task.wait(0.15)
		NewDialog.TintFrame:Destroy()
	end

	function NewDialog:Button(Title, Callback)
		NewDialog.Buttons = NewDialog.Buttons + 1
		Title = Title or "Button"
		Callback = Callback or function() end

		local Button = require(Root.Components.Button)("", NewDialog.ButtonHolder, true)
		Button.Title.Text = Title

		for _, Btn in next, NewDialog.ButtonHolder:GetChildren() do
			if Btn:IsA("TextButton") then
				Btn.Size =
					UDim2.new(1 / NewDialog.Buttons, -(((NewDialog.Buttons - 1) * 10) / NewDialog.Buttons), 0, 32)
			end
		end

		Creator.AddSignal(Button.Frame.MouseButton1Click, function()
			require(Root):SafeCallback(Callback)
			pcall(function()
				NewDialog:Close()
			end)
		end)

		return Button
	end

	return NewDialog
end

return Dialog
 end,
    [15] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(15)--[[
    PanelTitleBar.lua - Modular title bar manager for Universal Panel system
    
    Features:
    - Dynamic orientation (Horizontal/Vertical) based on dock position
    - Consistent button layout with UIListLayout
    - Edge-aware positioning (Top, Bottom, Left, Right)
    - Theme-aware styling
    
    Usage:
        local TitleBar = require(Components.PanelTitleBar)
        local bar = TitleBar.new({
            Title = "Panel",
            Parent = Panel.Root,
            Height = 36,
            OnClose = function() end,
            OnMinimize = function() end,
            OnPin = function() end,
            ShowPin = true,
        })
        bar:SetDockEdge("Right")
        bar:SetTitle("New Title")
]]

local Root = script.Parent.Parent
local Creator = require(Root.Creator)
local Assets = require(script.Parent.Assets)

local New = Creator.New

-- Constants
local DEFAULT_HEIGHT = 36
local BUTTON_SIZE = 28
local BUTTON_SPACING = 4
local TITLE_PADDING = 12

local PanelTitleBar = {}
PanelTitleBar.__index = PanelTitleBar

--[[
    Create a new PanelTitleBar instance
    @param Config: {
        Title: string - Title text
        Height: number - Bar height (default 36)
        Parent: Instance - Parent frame
        OnClose: function - Close button callback
        OnMinimize: function - Minimize button callback
        ShowClose: boolean - Show close button (default true)
        ShowMinimize: boolean - Show minimize button (default true)
    }
]]
function PanelTitleBar.new(Config)
    local self = setmetatable({}, PanelTitleBar)
    
    -- Config defaults
    self.Title = Config.Title or "Panel"
    self.Height = Config.Height or DEFAULT_HEIGHT
    self.Parent = Config.Parent
    self.OnClose = Config.OnClose or function() end
    self.OnMinimize = Config.OnMinimize or function() end
    self.OnPin = Config.OnPin or function() end
    self.ShowClose = Config.ShowClose ~= false
    self.ShowMinimize = Config.ShowMinimize ~= false
    self.ShowPin = Config.ShowPin == true -- Default false
    
    -- State
    self.Orientation = "Horizontal" -- "Horizontal" or "Vertical"
    self.DockEdge = nil -- nil, "Top", "Bottom", "Left", "Right"
    self._buttons = {}
    
    -- Build UI
    self:_buildFrame()
    self:_buildTitle()
    self:_buildButtonContainer()
    
    -- Add default buttons
    if self.ShowPin then
        self:_addButton("Pin", Assets.PanelPin, self.OnPin)
    end
    if self.ShowMinimize then
        self:_addButton("Minimize", Assets.PanelCollapse, self.OnMinimize)
    end
    if self.ShowClose then
        self:_addButton("Close", Assets.PanelClose, self.OnClose)
    end
    
    -- Initial layout
    self:_updateLayout()
    
    return self
end

-- Build main frame
function PanelTitleBar:_buildFrame()
    self.Frame = New("Frame", {
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, self.Height),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 0,
        ClipsDescendants = true,
        Parent = self.Parent,
        ThemeTag = {
            BackgroundColor3 = "PanelHeader",
        },
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(0, 8),
        }),
        -- Bottom corners fix (cover rounded bottom corners in horizontal mode)
        New("Frame", {
            Name = "CornerFix",
            Size = UDim2.new(1, 0, 0, 10),
            Position = UDim2.new(0, 0, 1, -10),
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            ThemeTag = { BackgroundColor3 = "PanelHeader" },
        }),
        -- Border separator
        New("Frame", {
            Name = "Border",
            Size = UDim2.new(1, 0, 0, 1),
            Position = UDim2.new(0, 0, 1, 0),
            BackgroundTransparency = 0.5,
            ThemeTag = { BackgroundColor3 = "PanelHeaderBorder" },
        }),
    })
end

-- Build title label
function PanelTitleBar:_buildTitle()
    self.TitleLabel = New("TextLabel", {
        Name = "TitleLabel",
        Text = self.Title,
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.fromOffset(TITLE_PADDING, 0),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold),
        TextSize = 13,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = self.Frame,
        ThemeTag = {
            TextColor3 = "Text",
        },
    })
end

-- Build button container
function PanelTitleBar:_buildButtonContainer()
    self.ButtonContainer = New("Frame", {
        Name = "ButtonContainer",
        Size = UDim2.new(0, 0, 1, 0), -- Will be auto-sized
        Position = UDim2.new(1, -4, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.X,
        Parent = self.Frame,
    }, {
        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, BUTTON_SPACING),
        }),
    })
    
    -- Dynamically update title width when buttons change
    self.ButtonContainer:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        self:_updateTitleWidth()
    end)
end

-- Create a header button
function PanelTitleBar:_addButton(name, icon, callback)
    -- Create button FIRST, then pass to SpringMotor
    local button = New("TextButton", {
        Name = name,
        Size = UDim2.new(0, BUTTON_SIZE, 0, BUTTON_SIZE),
        BackgroundTransparency = 1,
        Text = "",
        LayoutOrder = #self._buttons + 1,
        Parent = self.ButtonContainer,
        ThemeTag = {
            BackgroundColor3 = "Hover",
        },
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(0, 6),
        }),
        New("ImageLabel", {
            Name = "Icon",
            Image = icon,
            Size = UDim2.fromOffset(14, 14),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            ThemeTag = {
                ImageColor3 = "Text",
            },
        }),
    })
    
    -- Now pass the created button to SpringMotor (NOT nil)
    local Motor, SetTransparency = Creator.SpringMotor(1, button, "BackgroundTransparency", true)
    
    -- Hover effects
    Creator.AddSignal(button.MouseEnter, function()
        SetTransparency(Creator.GetThemeProperty("ElementTransparency") - Creator.GetThemeProperty("HoverChange"))
    end)
    Creator.AddSignal(button.MouseLeave, function()
        SetTransparency(1)
    end)
    Creator.AddSignal(button.MouseButton1Click, callback)
    
    self._buttons[name] = {
        Button = button,
        Motor = Motor,
        SetTransparency = SetTransparency,
    }
    
    return button
end

-- Update layout based on orientation and dock edge
function PanelTitleBar:_updateLayout()
    local isVertical = self.Orientation == "Vertical"
    local cornerFix = self.Frame:FindFirstChild("CornerFix")
    local border = self.Frame:FindFirstChild("Border")
    local listLayout = self.ButtonContainer:FindFirstChildOfClass("UIListLayout")
    
    if isVertical then
        -- Vertical mode (Left/Right docking)
        -- TitleBar is on the INSIDE of the panel, not at the screen edge
        self.Frame.Size = UDim2.new(0, self.Height, 1, 0)
        
        if self.DockEdge == "Right" then
            -- Right dock: titlebar on LEFT side of panel (inside)
            self.Frame.Position = UDim2.new(0, 0, 0, 0)
            -- Corner fix on right side (toward content)
            cornerFix.Size = UDim2.new(0, 10, 1, 0)
            cornerFix.Position = UDim2.new(1, -10, 0, 0)
            -- Border on right
            border.Size = UDim2.new(0, 1, 1, 0)
            border.Position = UDim2.new(1, 0, 0, 0)
            -- Title rotated -90° for right-to-left reading
            self.TitleLabel.Rotation = -90
        else -- Left
            -- Left dock: titlebar on RIGHT side of panel (inside)
            self.Frame.Position = UDim2.new(1, -self.Height, 0, 0)
            -- Corner fix on left side (toward content)
            cornerFix.Size = UDim2.new(0, 10, 1, 0)
            cornerFix.Position = UDim2.new(0, 0, 0, 0)
            -- Border on left
            border.Size = UDim2.new(0, 1, 1, 0)
            border.Position = UDim2.new(0, 0, 0, 0)
            -- Title rotated 90° for left-to-right reading
            self.TitleLabel.Rotation = 90
        end
        
        -- Title centered in vertical bar
        self.TitleLabel.Size = UDim2.new(0, 200, 0, self.Height) -- Width as height, fixed for rotation
        self.TitleLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        self.TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        self.TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
        self.TitleLabel.TextYAlignment = Enum.TextYAlignment.Center
        self.TitleLabel.TextTruncate = Enum.TextTruncate.AtEnd
        
        -- Buttons at TOP, vertical stack
        self.ButtonContainer.Size = UDim2.new(1, 0, 0, 0)
        self.ButtonContainer.Position = UDim2.new(0.5, 0, 0, 4)
        self.ButtonContainer.AnchorPoint = Vector2.new(0.5, 0)
        self.ButtonContainer.AutomaticSize = Enum.AutomaticSize.Y
        listLayout.FillDirection = Enum.FillDirection.Vertical
        listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        listLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    else
        -- Horizontal mode (Normal, Top, Bottom docking)
        self.Frame.Size = UDim2.new(1, 0, 0, self.Height)
        
        -- Position based on dock edge
        if self.DockEdge == "Bottom" then
            self.Frame.Position = UDim2.new(0, 0, 1, -self.Height)
            -- Corner fix on top
            cornerFix.Size = UDim2.new(1, 0, 0, 10)
            cornerFix.Position = UDim2.new(0, 0, 0, 0)
            -- Border on top
            border.Size = UDim2.new(1, 0, 0, 1)
            border.Position = UDim2.new(0, 0, 0, 0)
        else -- Top or Normal
            self.Frame.Position = UDim2.new(0, 0, 0, 0)
            -- Corner fix on bottom
            cornerFix.Size = UDim2.new(1, 0, 0, 10)
            cornerFix.Position = UDim2.new(0, 0, 1, -10)
            -- Border on bottom
            border.Size = UDim2.new(1, 0, 0, 1)
            border.Position = UDim2.new(0, 0, 1, 0)
        end
        
        -- Title left-aligned, no rotation
        self.TitleLabel.Size = UDim2.new(1, -80, 1, 0)
        self.TitleLabel.Position = UDim2.fromOffset(TITLE_PADDING, 0)
        self.TitleLabel.AnchorPoint = Vector2.new(0, 0)
        self.TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        self.TitleLabel.TextYAlignment = Enum.TextYAlignment.Center
        self.TitleLabel.Rotation = 0
        
        -- Buttons on right, horizontal stack
        self.ButtonContainer.Size = UDim2.new(0, 0, 1, 0)
        self.ButtonContainer.Position = UDim2.new(1, -4, 0.5, 0)
        self.ButtonContainer.AnchorPoint = Vector2.new(1, 0.5)
        self.ButtonContainer.AutomaticSize = Enum.AutomaticSize.X
        listLayout.FillDirection = Enum.FillDirection.Horizontal
        listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
        listLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    end
        listLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        
        -- Initial title update
        self:_updateTitleWidth()
    end
end

-- Update title width based on button container size (Horizontal mode only)
function PanelTitleBar:_updateTitleWidth()
    if self.Orientation == "Vertical" then return end
    
    local buttonWidth = self.ButtonContainer.AbsoluteSize.X
    local padding = TITLE_PADDING + 4 -- Extra breathing room
    
    self.TitleLabel.Size = UDim2.new(1, -buttonWidth - padding, 1, 0)
end

--[[
    Get the minimum width required to display buttons and a sliver of title
    @return number
]]
function PanelTitleBar:GetMinimumWidth()
    local buttonWidth = self.ButtonContainer.AbsoluteSize.X
    local iconWidth = 30 -- Approximate width for icon/padding
    return buttonWidth + iconWidth + TITLE_PADDING
end

-- Public API

--[[
    Set the title bar orientation
    @param orientation: "Horizontal" or "Vertical"
]]
function PanelTitleBar:SetOrientation(orientation)
    if orientation ~= "Horizontal" and orientation ~= "Vertical" then return end
    self.Orientation = orientation
    self:_updateLayout()
end

--[[
    Set the dock edge (automatically determines orientation)
    @param edge: nil, "Top", "Bottom", "Left", "Right"
]]
function PanelTitleBar:SetDockEdge(edge)
    self.DockEdge = edge
    
    -- Determine orientation from edge
    if edge == "Left" or edge == "Right" then
        self.Orientation = "Vertical"
    else
        self.Orientation = "Horizontal"
    end
    
    self:_updateLayout()
end

--[[
    Set the title text
    @param text: string
]]
function PanelTitleBar:SetTitle(text)
    self.Title = text
    self.TitleLabel.Text = text
end

--[[
    Update the minimize button icon (for expand/collapse state)
    @param icon: string - Asset URL
]]
function PanelTitleBar:SetMinimizeIcon(icon)
    if self._buttons.Minimize and self._buttons.Minimize.Button then
        local iconLabel = self._buttons.Minimize.Button:FindFirstChild("Icon")
        if iconLabel and icon then
            iconLabel.Image = icon
        end
    end
end

--[[
    Update the pin button state
    @param isPinned: boolean
]]
function PanelTitleBar:SetPinState(isPinned)
    if self._buttons.Pin and self._buttons.Pin.Button then
        local iconLabel = self._buttons.Pin.Button:FindFirstChild("Icon")
        if iconLabel then
            if isPinned then
                iconLabel.Image = Assets.PanelPinned
                -- Use Accent color to indicate pinned state
                iconLabel.ImageColor3 = Creator.GetThemeProperty("Accent")
            else
                iconLabel.Image = Assets.PanelPin
                iconLabel.ImageColor3 = Creator.GetThemeProperty("Text")
            end
        end
    end
end

--[[
    Get the main frame
    @return Frame
]]
function PanelTitleBar:GetFrame()
    return self.Frame
end

--[[
    Get title bar height
    @return number
]]
function PanelTitleBar:GetHeight()
    return self.Height
end

--[[
    Check if orientation is vertical
    @return boolean
]]
function PanelTitleBar:IsVertical()
    return self.Orientation == "Vertical"
end

--[[
    Destroy the title bar
]]
function PanelTitleBar:Destroy()
    self.Frame:Destroy()
end

return PanelTitleBar
 end,
    [16] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(16)--[[
    UniversalPanel.lua - A reusable, draggable, resizable, dockable panel component
    
    Features:
    - Draggable via header bar
    - Resizable via corner handle
    - Dockable to screen edges (Top, Bottom, Left, Right)
    - Minimizable with collapse/expand animation
    - Theme-aware styling with Acrylic support
    - Can act as a toast notification container
]]

local UserInputService = game:GetService("UserInputService")
local Camera = game:GetService("Workspace").CurrentCamera

local Root = script.Parent.Parent
local Flipper = require(Root.Packages.Flipper)
local Creator = require(Root.Creator)
local Acrylic = require(Root.Acrylic)
local Assets = require(script.Parent.Assets)
local PanelTitleBar = require(script.Parent.DockTitleBar)

-- Docking system modules
local Docking = require(Root.Docking)
local DockingManager = Docking.GetManager()
local AnimationController = Docking.GetAnimation()

local Spring = Flipper.Spring.new
local Instant = Flipper.Instant.new
local New = Creator.New

-- Constants
local DOCK_THRESHOLD = 30 -- Pixels from edge to trigger dock
local SNAP_THRESHOLD = 50 -- Pixels from edge to trigger magnetic snap (no resize)
local HEADER_HEIGHT = 36
local DOCK_TAB_SIZE = 40 -- Visible tab size when docked and minimized
local MIN_SIZE_DEFAULT = Vector2.new(150, 100)
local MAX_SIZE_DEFAULT = Vector2.new(800, 600)

return function(Config, GUI)
	local Library = require(Root)

	-- Config defaults
	Config = Config or {}
	Config.Title = Config.Title or "Panel"
	Config.Size = Config.Size or UDim2.fromOffset(300, 200)
	Config.Position = Config.Position or UDim2.fromScale(0.5, 0.5)
	Config.MinSize = Config.MinSize or MIN_SIZE_DEFAULT
	Config.MaxSize = Config.MaxSize or MAX_SIZE_DEFAULT
	Config.Resizable = Config.Resizable ~= false -- Default true
	Config.Draggable = Config.Draggable ~= false -- Default true
	Config.Dockable = Config.Dockable ~= false -- Default true (uses magnetic snap threshold)
	Config.Minimizable = Config.Minimizable ~= false -- Default true
	Config.Pinnable = Config.Pinnable ~= false -- Default true
	Config.ShowCloseButton = Config.ShowCloseButton ~= false -- Default true
	Config.UseAcrylic = Config.UseAcrylic ~= nil and Config.UseAcrylic or Library.UseAcrylic
	Config.ToastContainer = Config.ToastContainer or false -- Enable panel as toast container

	-- Panel state
	local Panel = {
		IsDocked = false,
		IsMinimized = false,
		IsPinned = false,
		DockPosition = nil, -- "Top", "Bottom", "Left", "Right"
		Visible = true,
		_savedSize = nil,
		_savedPosition = nil,
		_toasts = {}, -- Active toasts if ToastContainer enabled
	}

	-- Internal state
	local Dragging, DragInput, MousePos, StartPos = false, nil, nil, nil
	local Resizing, ResizePos, StartSize = false, nil, nil
	local DockPending = nil

	-- Motors for smooth animations
	local SizeMotor = Flipper.GroupMotor.new({
		X = Config.Size.X.Offset,
		Y = Config.Size.Y.Offset,
	})

	local PosMotor = Flipper.GroupMotor.new({
		X = Config.Position.X.Scale * Camera.ViewportSize.X + Config.Position.X.Offset,
		Y = Config.Position.Y.Scale * Camera.ViewportSize.Y + Config.Position.Y.Offset,
	})

	local MinimizeMotor = Flipper.SingleMotor.new(1) -- 1 = expanded, 0 = minimized height ratio

	-- Create Acrylic if enabled
	if Config.UseAcrylic then
		Panel.AcrylicPaint = Acrylic.AcrylicPaint()
	end

	-- Dock indicator is now handled by Docking.InputHandler
    -- We register the preview frame during initialization if needed, 
    -- but usually DockingManager handles it.

	-- Title bar component (handles header, buttons, orientation)
	-- Note: Parent will be set after Panel.Root is created

	-- Content container
	Panel.Content = New("Frame", {
		Size = UDim2.new(1, -16, 1, -HEADER_HEIGHT - 16),
		Position = UDim2.fromOffset(8, HEADER_HEIGHT + 8),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
	})

	-- Resize handle (bottom-right corner)
	Panel.ResizeHandle = New("Frame", {
		Size = UDim2.fromOffset(20, 20),
		Position = UDim2.new(1, -20, 1, -20),
		BackgroundTransparency = 1,
		Visible = Config.Resizable,
	}, {
		New("ImageLabel", {
			Image = Assets.PanelResize,
			Size = UDim2.fromOffset(12, 12),
			Position = UDim2.fromOffset(6, 6),
			BackgroundTransparency = 1,
			ImageTransparency = 0.5,
			ThemeTag = { ImageColor3 = "Text" },
		}),
	})

	-- Main frame
	Panel.Root = New("Frame", {
		Size = Config.Size,
		Position = Config.Position,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 0,
		Parent = GUI,
		Active = true,
		ThemeTag = {
			BackgroundColor3 = "PanelMain",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 8),
		}),
		New("UIStroke", {
			Thickness = 1,
			Transparency = 0.5,
			ThemeTag = { Color = "PanelBorder" },
		}),
		Panel.Content,
		Panel.ResizeHandle,
	})

	-- Insert Acrylic if enabled
	if Panel.AcrylicPaint then
		Panel.AcrylicPaint.Frame.Parent = Panel.Root
		Panel.AcrylicPaint.Frame.ZIndex = -1
		Panel.AcrylicPaint.AddParent(Panel.Root)
	end
    
    -- Ensure input handler has a preview frame
    Docking.Input:CreatePreviewFrame(GUI)

	-- Create TitleBar (after Root exists to set Parent)
	Panel.TitleBar = PanelTitleBar.new({
		Title = Config.Title,
		Height = HEADER_HEIGHT,
		Parent = Panel.Root,
		OnClose = function()
			Panel:SetVisible(false)
		end,
		OnMinimize = function()
			Panel:Minimize()
		end,
		OnPin = function()
			Panel:TogglePin()
		end,
		ShowClose = Config.ShowCloseButton,
		ShowMinimize = Config.Minimizable,
		ShowPin = Config.Pinnable,
	})
	Panel.Header = Panel.TitleBar:GetFrame()

	-- Motor updates
	SizeMotor:onStep(function(values)
		Panel.Root.Size = UDim2.fromOffset(values.X, values.Y)
	end)

	PosMotor:onStep(function(values)
		Panel.Root.Position = UDim2.fromOffset(values.X, values.Y)
	end)

	MinimizeMotor:onStep(function(value)
		local currentSizeValues = SizeMotor:getValue()
		local currentPosValues = PosMotor:getValue()
		local viewport = Camera.ViewportSize
		
		-- Safety: fallback values if motors not ready
		local currentX = (currentSizeValues and currentSizeValues.X) or Config.Size.X.Offset
		local currentY = (currentSizeValues and currentSizeValues.Y) or Config.Size.Y.Offset
		local currentPosX = (currentPosValues and currentPosValues.X) or viewport.X / 2
		local currentPosY = (currentPosValues and currentPosValues.Y) or viewport.Y / 2
		
		if Panel.IsDocked and Panel.DockPosition then
			-- DOCKED: Collapse to header bar while staying at edge
			local dockEdge = Panel.DockPosition
			local fullWidth = Panel._dockedSize and Panel._dockedSize.X or currentX
			local fullHeight = Panel._dockedSize and Panel._dockedSize.Y or currentY
			
			if dockEdge == "Right" then
				-- Right dock: collapse width to header, keep height
				local collapsedWidth = HEADER_HEIGHT
				local targetWidth = collapsedWidth + (fullWidth - collapsedWidth) * value
				local targetPosX = viewport.X - targetWidth / 2 -- No offset
				SizeMotor:setGoal({ X = Instant(targetWidth), Y = Instant(fullHeight) })
				PosMotor:setGoal({ X = Instant(targetPosX), Y = Instant(currentPosY) })
				
			elseif dockEdge == "Left" then
				-- Left dock: collapse width to header, keep height
				local collapsedWidth = HEADER_HEIGHT
				local targetWidth = collapsedWidth + (fullWidth - collapsedWidth) * value
				local targetPosX = targetWidth / 2 -- No offset
				SizeMotor:setGoal({ X = Instant(targetWidth), Y = Instant(fullHeight) })
				PosMotor:setGoal({ X = Instant(targetPosX), Y = Instant(currentPosY) })
				
			elseif dockEdge == "Top" then
				-- Top dock: collapse height to header, keep width
				local collapsedHeight = HEADER_HEIGHT
				local targetHeight = collapsedHeight + (fullHeight - collapsedHeight) * value
				local targetPosY = targetHeight / 2 -- No offset
				SizeMotor:setGoal({ X = Instant(fullWidth), Y = Instant(targetHeight) })
				PosMotor:setGoal({ X = Instant(currentPosX), Y = Instant(targetPosY) })
				
			elseif dockEdge == "Bottom" then
				-- Bottom dock: collapse height to header, keep width
				local collapsedHeight = HEADER_HEIGHT
				local targetHeight = collapsedHeight + (fullHeight - collapsedHeight) * value
				local targetPosY = viewport.Y - targetHeight / 2 -- No offset
				SizeMotor:setGoal({ X = Instant(fullWidth), Y = Instant(targetHeight) })
				PosMotor:setGoal({ X = Instant(currentPosX), Y = Instant(targetPosY) })
			end
			
			-- Content visibility based on expand progress
			Panel.Content.Visible = value > 0.3
			Panel.ResizeHandle.Visible = false -- Never show resize when docked
		else
			-- UNDOCKED: Traditional height collapse to header only
			local fullHeight = Panel._savedSize and Panel._savedSize.Y or Config.Size.Y.Offset
			local targetHeight = HEADER_HEIGHT + (fullHeight - HEADER_HEIGHT) * value
			
			SizeMotor:setGoal({
				X = Instant(currentX),
				Y = Instant(targetHeight),
			})
			
			-- Content visibility
			Panel.Content.Visible = value > 0.3
			Panel.ResizeHandle.Visible = value > 0.3 and Config.Resizable
		end
	end)
	
    -- Helpers
    local function UpdateDockIndicator(zone)
        -- Legacy stub: InputHandler handles this now
    end

	-- Dragging logic
	if Config.Draggable then
		Creator.AddSignal(Panel.Header.InputBegan, function(Input)
			if (Input.UserInputType == Enum.UserInputType.MouseButton1 
				or Input.UserInputType == Enum.UserInputType.Touch) and not Panel.IsPinned then
				
				-- Undock if docked
				if Panel.IsDocked then
					Panel:Undock()
				end
				
				Dragging = true
				MousePos = Input.Position
				StartPos = Panel.Root.Position

				-- InputHandler manages preview state
				if Config.Dockable then
                    Docking.Input:StartDrag(Panel, Input)
				end

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
                        
						-- Finalize drag
                        local zone = nil
						if Config.Dockable then
                            zone = Docking.Input:EndDrag(Input.Position)
						end
                        
                        -- Apply dock
						if zone then
							Panel:Dock(zone)
						end
					end
				end)
			end
		end)

		Creator.AddSignal(Panel.Header.InputChanged, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement
				or Input.UserInputType == Enum.UserInputType.Touch then
				DragInput = Input
			end
		end)

		Creator.AddSignal(UserInputService.InputChanged, function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				local newX = StartPos.X.Offset + Delta.X
				local newY = StartPos.Y.Offset + Delta.Y

				-- Clamp to viewport
				local viewport = Camera.ViewportSize
				local panelSize = Panel.Root.AbsoluteSize
				newX = math.clamp(newX, panelSize.X / 2, viewport.X - panelSize.X / 2)
				newY = math.clamp(newY, panelSize.Y / 2, viewport.Y - panelSize.Y / 2)

				PosMotor:setGoal({
					X = Instant(newX),
					Y = Instant(newY),
				})

				-- InputHandler updates preview
				if Config.Dockable then
                    Docking.Input:UpdateDrag(Input.Position, Delta)
				end
			end
		end)
	end

	-- Resizing logic
	if Config.Resizable then
		Creator.AddSignal(Panel.ResizeHandle.InputBegan, function(Input)
			if (Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch) and not Panel.IsPinned then
				Resizing = true
				ResizePos = Input.Position
				StartSize = Panel.Root.AbsoluteSize
			end
		end)

		Creator.AddSignal(UserInputService.InputChanged, function(Input)
			if (Input.UserInputType == Enum.UserInputType.MouseMovement 
				or Input.UserInputType == Enum.UserInputType.Touch) and Resizing then
				
				local Delta = Input.Position - ResizePos
                
                -- Enforce minimum width based on TitleBar content
                local dynamicMinWidth = math.max(Config.MinSize.X, Panel.TitleBar:GetMinimumWidth())
                
				local newWidth = math.clamp(StartSize.X + Delta.X, dynamicMinWidth, Config.MaxSize.X)
				local newHeight = math.clamp(StartSize.Y + Delta.Y, Config.MinSize.Y, Config.MaxSize.Y)

				SizeMotor:setGoal({
					X = Instant(newWidth),
					Y = Instant(newHeight),
				})
			end
		end)

		Creator.AddSignal(UserInputService.InputEnded, function(Input)
			if Resizing then
				Resizing = false
				Panel._savedSize = Vector2.new(SizeMotor:getValue().X, SizeMotor:getValue().Y)
			end
		end)
	end

	-- Public API
	
	function Panel:SetTitle(text)
		Panel.TitleBar:SetTitle(text)
	end

	function Panel:TogglePin()
		Panel.IsPinned = not Panel.IsPinned
		
		-- Use new state-based method for better visual feedback
		Panel.TitleBar:SetPinState(Panel.IsPinned)
	end

	-- Helper to update minimize icon based on state
	function Panel:UpdateMinimizeIcon()
		local icon
		if Panel.IsDocked and Panel.DockPosition then
			local pos = Panel.DockPosition
			if Panel.IsMinimized then
				-- When minimized, show "Expand" icon
				if pos == "Left" then icon = Assets.PanelArrowRight
				elseif pos == "Right" then icon = Assets.PanelArrowLeft
				elseif pos == "Top" then icon = Assets.PanelArrowDown
				elseif pos == "Bottom" then icon = Assets.PanelArrowUp
				end
			else
				-- When expanded, show "Collapse" icon
				if pos == "Left" then icon = Assets.PanelArrowLeft
				elseif pos == "Right" then icon = Assets.PanelArrowRight
				elseif pos == "Top" then icon = Assets.PanelArrowUp
				elseif pos == "Bottom" then icon = Assets.PanelArrowDown
				end
			end
		else
			-- Undocked
			if Panel.IsMinimized then
				icon = Assets.PanelExpand
			else
				icon = Assets.PanelCollapse
			end
		end
		Panel.TitleBar:SetMinimizeIcon(icon)
	end

	function Panel:Minimize()
		Panel.IsMinimized = not Panel.IsMinimized
		
		if Panel.IsMinimized then
			Panel._savedSize = Vector2.new(SizeMotor:getValue().X, SizeMotor:getValue().Y)
			MinimizeMotor:setGoal(Spring(0, { frequency = 6 }))
		else
			MinimizeMotor:setGoal(Spring(1, { frequency = 6 }))
		end
		
		Panel:UpdateMinimizeIcon()
	end

    -- Internal API called by DockingManager to enforce state
    -- This is the callback that ensures UI stays in sync with manager logic
    function Panel:ApplyDockState(isDocked, edge)
        if isDocked then
            Panel.IsDocked = true
            Panel.DockPosition = edge
            
            -- Save current state if this is the first dock
            if not Panel._dockedSize then
                Panel._savedPosition = Vector2.new(PosMotor:getValue().X, PosMotor:getValue().Y)
                Panel._savedSize = Vector2.new(SizeMotor:getValue().X, SizeMotor:getValue().Y)
                Panel._dockedSize = Panel._savedSize
            end

            -- Update UI
            Panel.TitleBar:SetDockEdge(edge)
            Panel:UpdateMinimizeIcon()
            Panel.ResizeHandle.Visible = false
            
        else
            -- Undocking
            Panel.IsDocked = false
            Panel.DockPosition = nil
            
            -- If minimized, expand
            if Panel.IsMinimized then
                Panel.IsMinimized = false
                MinimizeMotor:setGoal(Spring(1, { frequency = 6 }))
            end
            
            -- Reset UI
            Panel.TitleBar:SetDockEdge(nil)
            Panel:UpdateMinimizeIcon()
            Panel.Content.Size = UDim2.new(1, -16, 1, -HEADER_HEIGHT - 16)
            Panel.Content.Position = UDim2.fromOffset(8, HEADER_HEIGHT + 8)
            Panel.ResizeHandle.Visible = Config.Resizable
            
            -- Restore Position/Size
            if Panel._savedPosition then
                PosMotor:setGoal({
                    X = Spring(Panel._savedPosition.X, { frequency = 6 }),
                    Y = Spring(Panel._savedPosition.Y, { frequency = 6 }),
                })
            end
            if Panel._savedSize then
                SizeMotor:setGoal({
                    X = Spring(Panel._savedSize.X, { frequency = 6 }),
                    Y = Spring(Panel._savedSize.Y, { frequency = 6 }),
                })
            end
            
            Panel._dockedSize = nil
        end
    end

	function Panel:Dock(edge)
		if not Config.Dockable or Panel.IsDocked then return end
		
        -- Register (idempotent)
		DockingManager:RegisterPanel(Panel, { Id = Config.Title })

        -- Delegate to Manager
        -- Manager will call Panel:ApplyDockState(true, edge)
        DockingManager:Dock(Panel, edge, { Position = PosMotor })
	end

	function Panel:Undock()
		if not Panel.IsDocked then return end
        
        -- Delegate to Manager
        -- Manager will call Panel:ApplyDockState(false, nil)
        DockingManager:Undock(Panel)
	end

	function Panel:SetVisible(visible)
		Panel.Visible = visible
		Panel.Root.Visible = visible
	end

	-- Toast container support: Panel-scoped notifications
	if Config.ToastContainer then
		Panel.ToastHolder = New("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			Parent = Panel.Content,
			ClipsDescendants = true,
		}, {
			New("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 8),
			}),
		})

		--[[
			Create a toast notification within this panel
			@param Config: { Title, Content, Duration }
		]]
		function Panel:Notify(NotifyConfig)
			NotifyConfig = NotifyConfig or {}
			NotifyConfig.Title = NotifyConfig.Title or "Notification"
			NotifyConfig.Content = NotifyConfig.Content or ""
			NotifyConfig.Duration = NotifyConfig.Duration or 3

			local Toast = {}

			Toast.Frame = New("Frame", {
				Size = UDim2.new(1, -16, 0, 50),
				BackgroundTransparency = 0,
				Parent = Panel.ToastHolder,
				ThemeTag = { BackgroundColor3 = "PanelHeader" },
			}, {
				New("UICorner", { CornerRadius = UDim.new(0, 6) }),
				New("UIStroke", {
					Transparency = 0.6,
					ThemeTag = { Color = "PanelHeaderBorder" },
				}),
				New("TextLabel", {
					Text = NotifyConfig.Title,
					Size = UDim2.new(1, -16, 0, 16),
					Position = UDim2.fromOffset(8, 6),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold),
					TextSize = 12,
					ThemeTag = { TextColor3 = "Text" },
				}),
				New("TextLabel", {
					Text = NotifyConfig.Content,
					Size = UDim2.new(1, -16, 0, 16),
					Position = UDim2.fromOffset(8, 26),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
					TextSize = 11,
					ThemeTag = { TextColor3 = "SubText" },
				}),
			})

			table.insert(Panel._toasts, Toast)

			-- Auto-dismiss
			task.delay(NotifyConfig.Duration, function()
				if Toast.Frame and Toast.Frame.Parent then
					Toast.Frame:Destroy()
					for i, t in ipairs(Panel._toasts) do
						if t == Toast then
							table.remove(Panel._toasts, i)
							break
						end
					end
				end
			end)

			return Toast
		end
	end

	function Panel:Destroy()
		if Panel.AcrylicPaint and Panel.AcrylicPaint.Model then
			Panel.AcrylicPaint.Model:Destroy()
		end
		Panel.Root:Destroy()
	end

	-- Initialize position with anchor point adjustment
	local initialX = Config.Position.X.Scale * Camera.ViewportSize.X + Config.Position.X.Offset
	local initialY = Config.Position.Y.Scale * Camera.ViewportSize.Y + Config.Position.Y.Offset
	PosMotor:setGoal({
		X = Instant(initialX),
		Y = Instant(initialY),
	})
	
	-- Initialize icon state (must be after function definitions)
	Panel:UpdateMinimizeIcon()

	return Panel
end
 end,
    [17] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(17)local Root = script.Parent.Parent
local Flipper = require(Root.Packages.Flipper)
local Creator = require(Root.Creator)
local New = Creator.New

local Spring = Flipper.Spring.new

return function(Title, Desc, Parent, Hover)
	local Element = {}

	Element.TitleLabel = New("TextLabel", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		Text = Title,
		TextColor3 = Color3.fromRGB(240, 240, 240),
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Size = UDim2.new(1, 0, 0, 14),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	Element.DescLabel = New("TextLabel", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
		Text = Desc,
		TextColor3 = Color3.fromRGB(200, 200, 200),
		TextSize = 12,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 14),
		ThemeTag = {
			TextColor3 = "SubText",
		},
	})

	Element.LabelHolder = New("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(10, 0),
		Size = UDim2.new(1, -28, 0, 0),
	}, {
		New("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),
		New("UIPadding", {
			PaddingBottom = UDim.new(0, 13),
			PaddingTop = UDim.new(0, 13),
		}),
		Element.TitleLabel,
		Element.DescLabel,
	})

	Element.Border = New("UIStroke", {
		Transparency = 0.5,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Color = Color3.fromRGB(0, 0, 0),
		ThemeTag = {
			Color = "ElementBorder",
		},
	})

	Element.Frame = New("TextButton", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 0.89,
		BackgroundColor3 = Color3.fromRGB(130, 130, 130),
		Parent = Parent,
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = "",
		LayoutOrder = 7,
		ThemeTag = {
			BackgroundColor3 = "Element",
			BackgroundTransparency = "ElementTransparency",
            Gradient = "ElementGradient",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 4),
		}),
		Element.Border,
		Element.LabelHolder,
	})

	function Element:SetTitle(Set)
		Element.TitleLabel.Text = Set
	end

	function Element:SetDesc(Set)
		if Set == nil then
			Set = ""
		end
		if Set == "" then
			Element.DescLabel.Visible = false
		else
			Element.DescLabel.Visible = true
		end
		Element.DescLabel.Text = Set
	end

	function Element:Destroy()
		Element.Frame:Destroy()
	end

	Element:SetTitle(Title)
	Element:SetDesc(Desc)

	if Hover then
		local Themes = Root.Themes
		local Motor, SetTransparency = Creator.SpringMotor(
			Creator.GetThemeProperty("ElementTransparency"),
			Element.Frame,
			"BackgroundTransparency",
			false,
			true
		)

		Creator.AddSignal(Element.Frame.MouseEnter, function()
			SetTransparency(Creator.GetThemeProperty("ElementTransparency") - Creator.GetThemeProperty("HoverChange"))
		end)
		Creator.AddSignal(Element.Frame.MouseLeave, function()
			SetTransparency(Creator.GetThemeProperty("ElementTransparency"))
		end)
		Creator.AddSignal(Element.Frame.MouseButton1Down, function()
			SetTransparency(Creator.GetThemeProperty("ElementTransparency") + Creator.GetThemeProperty("HoverChange"))
		end)
		Creator.AddSignal(Element.Frame.MouseButton1Up, function()
			SetTransparency(Creator.GetThemeProperty("ElementTransparency") - Creator.GetThemeProperty("HoverChange"))
		end)
	end

	return Element
end
 end,
    [18] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(18)--[[
    Fluent Loader Component
    A customizable loading screen with progress bar, logs, and signals.
    
    API:
    - Loader:Start(Config) - Start the loader with configuration
    - Loader:Log(message, type) - Add a log message ("INFO", "SUCCESS", "ERROR")
    - Loader:SetProgress(progress) - Set progress bar (0-1)
    - Loader:SetTitle(text) - Update title text
    - Loader:SetSubtitle(text) - Update subtitle text
    - Loader:Destroy() - Close the loader (fires OnDestroy)
    - Loader:Await() - Wait until loader is destroyed
    - Loader.OnDestroy - Signal that fires when loader closes
]]

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- [ SIMPLE SIGNAL IMPLEMENTATION ] --
local function CreateSignal()
    local signal = {
        _connections = {},
        _waiting = {}
    }
    
    function signal:Connect(callback)
        local connection = { Callback = callback, Connected = true }
        table.insert(self._connections, connection)
        
        return {
            Disconnect = function()
                connection.Connected = false
                for i, conn in ipairs(self._connections) do
                    if conn == connection then
                        table.remove(self._connections, i)
                        break
                    end
                end
            end
        }
    end
    
    function signal:Fire(...)
        for _, conn in ipairs(self._connections) do
            if conn.Connected then
                task.spawn(conn.Callback, ...)
            end
        end
        -- Resume waiting threads
        for _, thread in ipairs(self._waiting) do
            task.spawn(thread)
        end
        self._waiting = {}
    end
    
    function signal:Wait()
        local thread = coroutine.running()
        table.insert(self._waiting, thread)
        coroutine.yield()
    end
    
    return signal
end

-- [ DEFAULT CONFIG ] --
local DefaultConfig = {
    Title = "Fluent",
    Subtitle = "Loader",
    Logo = "rbxthumb://type=Asset&id=120860566854298&w=420&h=420",
    Colors = {
        Background = Color3.fromRGB(8, 8, 18), -- AcrylicMain
        MainStroke = Color3.fromRGB(60, 50, 90), -- AcrylicBorder
        Accent = Color3.fromHex("#ffd900"), -- FssVs Golden Accent
        Secondary = Color3.fromRGB(200, 0, 255), -- Cosmic Purple (Gradient Tail)
        TerminalBg = Color3.fromRGB(15, 10, 40), -- Deep Void
        Success = Color3.fromRGB(80, 255, 140),
        Error = Color3.fromRGB(255, 80, 100),
        TextLight = Color3.fromRGB(255, 255, 255),
        TextDim = Color3.fromRGB(190, 185, 220)
    }
}

-- [ HELPER FUNCTIONS ] --
local function NeonStroke(parent, color, thickness, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = thickness or 1
    stroke.Color = color
    stroke.Transparency = transparency or 0.2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = parent
    return stroke
end

local function GlitchText(label, text, color, finalColor)
    task.spawn(function()
        local originalText = text
        for i = 1, 12 do
            if not label or not label.Parent then break end
            local randomStr = ""
            for j = 1, #originalText do
                if math.random() > 0.5 then
                    randomStr = randomStr .. string.char(math.random(65, 90))
                else
                    randomStr = randomStr .. string.sub(originalText, j, j)
                end
            end
            label.Text = randomStr
            label.TextColor3 = (i % 3 == 0) and Color3.new(1, 1, 1) or color
            task.wait(0.03)
        end
        if label and label.Parent then
            label.Text = originalText
            label.TextColor3 = finalColor or color
        end
    end)
end

-- [ LOADER CLASS ] --
local Loader = {}
Loader.__index = Loader

-- Instance state
Loader.Gui = nil
Loader.Blur = nil
Loader.Config = nil
Loader.LogOrder = 0

-- UI References
Loader._titleLabel = nil
Loader._subtitleLabel = nil
Loader._termFrame = nil
Loader._barFill = nil

-- Signals
Loader.OnDestroy = CreateSignal()

function Loader:Start(UserConfig)
    UserConfig = UserConfig or {}
    
    -- Merge configs
    local Config = setmetatable({}, {__index = DefaultConfig})
    for k, v in pairs(UserConfig) do
        if k == "Colors" and type(v) == "table" then
            Config.Colors = setmetatable(v, {__index = DefaultConfig.Colors})
        else
            Config[k] = v
        end
    end
    
    self.Config = Config
    self.LogOrder = 0
    
    -- Create new OnDestroy signal for this instance
    self.OnDestroy = CreateSignal()

    -- Cleanup existing
    if self.Gui then self:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name = "Fluent_Loader"
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 10005
    if gethui then gui.Parent = gethui() else gui.Parent = CoreGui end
    self.Gui = gui

    -- 1. Backdrop Blur & Dim
    local backdrop = Instance.new("Frame")
    backdrop.Size = UDim2.new(1, 0, 1, 0)
    backdrop.BackgroundColor3 = Color3.new(0, 0, 0)
    backdrop.BackgroundTransparency = 0.6
    backdrop.Parent = gui
    
    local blur = Instance.new("BlurEffect")
    blur.Size = 15
    blur.Parent = game:GetService("Lighting")
    self.Blur = blur

    -- 2. Main HUD Container
    local container = Instance.new("Frame")
    container.Name = "HUD_Container"
    container.Size = UDim2.new(0, 420, 0, 260)
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundColor3 = Config.Colors.Background
    container.BackgroundTransparency = 0.2
    container.BorderSizePixel = 0
    container.ClipsDescendants = true
    container.Parent = gui
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(1, 0) -- Circle/Pill shape for Meteor Head
    uiCorner.Parent = container
    
    -- Meteor Gradient: Left (Head) Opaque -> Right (Tail) Transparent
    -- PLUS Color Gradient: Accent (Head) -> Secondary (Tail)
    local containerGradient = Instance.new("UIGradient")
    containerGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),      -- Head: Solid
        NumberSequenceKeypoint.new(0.4, 0.1),  -- Body: Mostly Solid
        NumberSequenceKeypoint.new(1, 1)       -- Tail: Transparent
    })
    containerGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Config.Colors.Accent),
        ColorSequenceKeypoint.new(1, Config.Colors.Secondary)
    })
    containerGradient.Rotation = 0 -- Horizontal Left->Right
    containerGradient.Parent = container
    
    -- Inner glow layer for enhanced blur/glass effect
    local glowLayer = Instance.new("Frame")
    glowLayer.Name = "GlowLayer"
    glowLayer.Size = UDim2.new(1, 0, 1, 0)
    glowLayer.BackgroundColor3 = Config.Colors.Accent
    glowLayer.BackgroundTransparency = 0.95
    glowLayer.BorderSizePixel = 0
    glowLayer.ZIndex = 0
    glowLayer.Parent = container
    Instance.new("UICorner", glowLayer).CornerRadius = UDim.new(1, 0)
    
    -- Gradient for glow layer (Legacy glow)
    local glowGradient = Instance.new("UIGradient")
    glowGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(0.5, 0.8),
        NumberSequenceKeypoint.new(1, 1)
    })
    glowGradient.Parent = glowLayer

    -- 3. Rotating Core (Logo with animated hexagons)
    local coreFrame = Instance.new("Frame")
    coreFrame.Name = "CoreFrame"
    coreFrame.Size = UDim2.new(0, 120, 0, 120)
    coreFrame.Position = UDim2.new(0.15, 0, 0.45, 0)
    coreFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    coreFrame.BackgroundTransparency = 1
    coreFrame.Parent = container

    local hex1 = Instance.new("Frame")
    hex1.Size = UDim2.new(0.7, 0, 0.7, 0)
    hex1.Position = UDim2.new(0.5, 0, 0.5, 0)
    hex1.AnchorPoint = Vector2.new(0.5, 0.5)
    hex1.BackgroundTransparency = 1
    hex1.Parent = coreFrame
    NeonStroke(hex1, Config.Colors.Accent, 2)
    -- Hexagon Gradient
    local hexGrad = Instance.new("UIGradient")
    hexGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Config.Colors.Accent),
        ColorSequenceKeypoint.new(1, Config.Colors.Secondary)
    })
    hexGrad.Rotation = 45
    hexGrad.Parent = hex1
    hex1.Rotation = 45

    local hex2 = Instance.new("Frame")
    hex2.Size = UDim2.new(1, 0, 1, 0)
    hex2.Position = UDim2.new(0.5, 0, 0.5, 0)
    hex2.AnchorPoint = Vector2.new(0.5, 0.5)
    hex2.BackgroundTransparency = 1
    hex2.Parent = coreFrame
    NeonStroke(hex2, Config.Colors.Secondary, 1)
    -- Hexagon 2 Gradient
    local hexGrad2 = Instance.new("UIGradient")
    hexGrad2.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Config.Colors.Secondary),
        ColorSequenceKeypoint.new(1, Config.Colors.Accent)
    })
    hexGrad2.Rotation = -45
    hexGrad2.Parent = hex2

    local coreImage = Instance.new("ImageLabel")
    coreImage.Name = "ReactorCore"
    coreImage.Image = Config.Logo
    coreImage.Size = UDim2.new(0.8, 0, 0.8, 0)
    coreImage.Position = UDim2.new(0.5, 0, 0.5, 0)
    coreImage.AnchorPoint = Vector2.new(0.5, 0.5)
    coreImage.BackgroundTransparency = 1
    coreImage.ScaleType = Enum.ScaleType.Fit
    coreImage.Parent = coreFrame

    task.spawn(function()
        while gui.Parent do
            TweenService:Create(hex1, TweenInfo.new(4, Enum.EasingStyle.Linear), {Rotation = hex1.Rotation + 180}):Play()
            TweenService:Create(hex2, TweenInfo.new(6, Enum.EasingStyle.Linear), {Rotation = hex2.Rotation - 180}):Play()
            task.wait(4)
        end
    end)

    -- 4. Title & Header (replaced with Image Logo)
    local title = Instance.new("ImageLabel")
    title.Name = "TitleImage"
    title.Image = "rbxassetid://80237615447661" -- Replaces "FSSHUB" text
    title.Position = UDim2.new(0.35, 0, 0.02, 0) -- Moved up to prevent overlap
    title.Size = UDim2.new(0, 280, 0, 50) -- Fixed width to align left with text
    title.BackgroundTransparency = 1
    title.ScaleType = Enum.ScaleType.Fit
    title.ImageColor3 = Color3.new(1, 1, 1) -- Original colors (White)
    title.Parent = container

    self._titleLabel = title
    
    local sub = Instance.new("TextLabel")
    sub.Name = "Subtitle"
    sub.Text = Config.Subtitle
    sub.Font = Enum.Font.Code
    sub.TextSize = 14
    sub.TextColor3 = Config.Colors.TextDim
    sub.Position = UDim2.new(0.35, 0, 0.25, 0) -- Moved down for spacing
    sub.Size = UDim2.new(0.60, 0, 0, 20)
    sub.TextXAlignment = Enum.TextXAlignment.Left
    sub.BackgroundTransparency = 1
    sub.Parent = container
    self._subtitleLabel = sub

    -- 5. Terminal / Log Area (adjusted position)
    local termFrame = Instance.new("Frame")
    termFrame.Name = "Terminal"
    termFrame.Size = UDim2.new(0.60, 0, 0.42, 0)
    termFrame.Position = UDim2.new(0.35, 0, 0.40, 0)
    termFrame.BackgroundColor3 = Config.Colors.TerminalBg
    termFrame.BorderSizePixel = 0
    termFrame.ClipsDescendants = true
    termFrame.Parent = container
    
    local uiCornerTerm = Instance.new("UICorner")
    uiCornerTerm.CornerRadius = UDim.new(0, 6)
    uiCornerTerm.Parent = termFrame
    
    local termGradient = Instance.new("UIGradient")
    termGradient.Rotation = 90
    termGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 200, 200)),
        ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
    })
    termGradient.Parent = termFrame
    
    -- Padding for text inside terminal
    local termPadding = Instance.new("UIPadding")
    termPadding.PaddingLeft = UDim.new(0, 10)
    termPadding.PaddingRight = UDim.new(0, 5)
    termPadding.PaddingTop = UDim.new(0, 10)
    termPadding.PaddingBottom = UDim.new(0, 10)
    termPadding.Parent = termFrame

    local logListLayout = Instance.new("UIListLayout")
    logListLayout.Parent = termFrame
    logListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    logListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    logListLayout.Padding = UDim.new(0, 2)
    
    self._termFrame = termFrame

    -- 6. Progress Bar (fixed at bottom of container)
    local barBg = Instance.new("Frame")
    barBg.Name = "ProgressBarBg"
    barBg.Size = UDim2.new(1, -20, 0, 6)
    barBg.Position = UDim2.new(0.5, 0, 1, -25)
    barBg.AnchorPoint = Vector2.new(0.5, 0)
    barBg.BackgroundColor3 = Config.Colors.Secondary
    barBg.BackgroundTransparency = 0.5
    barBg.BorderSizePixel = 0
    barBg.Parent = container
    
    -- Round corners for progress bar
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)
    
    local barFill = Instance.new("Frame")
    barFill.Name = "ProgressBarFill"
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.Position = UDim2.new(0, 0, 0, 0)
    barFill.BackgroundColor3 = Config.Colors.Accent
    barFill.BorderSizePixel = 0
    barFill.Parent = barBg
    self._barFill = barFill
    
    -- Round corners for fill
    Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)
    
    -- Glow effect on progress bar
    local barGlow = Instance.new("UIGradient")
    barGlow.Rotation = 0
    barGlow.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(1, 0.3)
    })
    barGlow.Parent = barFill

    -- 7. Scan Line Effect
    local scanLine = Instance.new("Frame")
    scanLine.Size = UDim2.new(1, 0, 0, 60)
    scanLine.Position = UDim2.new(0, 0, -0.5, 0)
    scanLine.BackgroundColor3 = Config.Colors.Accent
    scanLine.BorderSizePixel = 0
    scanLine.BackgroundTransparency = 0.95
    scanLine.Parent = container
    
    local scanGrad = Instance.new("UIGradient")
    scanGrad.Rotation = 90
    scanGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Config.Colors.Background),
        ColorSequenceKeypoint.new(0.5, Config.Colors.Accent),
        ColorSequenceKeypoint.new(1, Config.Colors.Background)
    })
    scanGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0.6),
        NumberSequenceKeypoint.new(1, 1)
    })
    scanGrad.Parent = scanLine
    
    task.spawn(function()
        while gui.Parent do
            scanLine.Position = UDim2.new(0, 0, -0.2, 0)
            TweenService:Create(scanLine, TweenInfo.new(2.5, Enum.EasingStyle.Linear), {Position = UDim2.new(0, 0, 1.2, 0)}):Play()
            task.wait(3.5)
        end
    end)
    
    -- Intro GLITCH (Removed for Image Title)
    -- GlitchText(title, Config.Title, Config.Colors.Accent)
    
    return self
end

function Loader:SetTitle(text)
    if self._titleLabel and self._titleLabel:IsA("TextLabel") then
        self._titleLabel.Text = text
    end
end

function Loader:SetSubtitle(text)
    if self._subtitleLabel then
        self._subtitleLabel.Text = text
    end
end

function Loader:Log(msg, logType)
    if not self._termFrame then return end
    
    local Colors = self.Config and self.Config.Colors or DefaultConfig.Colors

    -- Cleanup old logs
    local logs = {}
    for _, child in ipairs(self._termFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            table.insert(logs, child)
        end
    end
    
    while #logs > 4 do
        local oldestLog = table.remove(logs, 1)
        if oldestLog then oldestLog:Destroy() end
    end
    
    self.LogOrder = self.LogOrder + 1
    
    local lbl = Instance.new("TextLabel")
    lbl.Name = "Log_" .. self.LogOrder
    lbl.LayoutOrder = self.LogOrder
    lbl.Size = UDim2.new(1, -10, 0, 16)
    lbl.Position = UDim2.new(0, 5, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Font = Enum.Font.Code
    lbl.TextSize = 12
    lbl.TextColor3 = (logType == "SUCCESS" and Colors.Success)
                  or (logType == "ERROR" and Colors.Error)
                  or Colors.TextDim
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Text = " > " .. string.upper(msg)
    lbl.ClipsDescendants = true
    lbl.TextTruncate = Enum.TextTruncate.AtEnd
    lbl.Parent = self._termFrame
    
    lbl.TextTransparency = 1
    TweenService:Create(lbl, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
end

function Loader:SetProgress(progress)
    if self._barFill then
        TweenService:Create(self._barFill, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {Size = UDim2.new(progress, 0, 1, 0)}):Play()
    end
end

function Loader:Await()
    if self.Gui then
        self.OnDestroy:Wait()
    end
end

function Loader:Destroy()
    if self.Gui then
        local gui = self.Gui
        local container = gui:FindFirstChild("HUD_Container")
        local blur = self.Blur
        
        if container then
            TweenService:Create(container, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), 
                {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
            
            for _, c in ipairs(container:GetDescendants()) do
                if c:IsA("TextLabel") then TweenService:Create(c, TweenInfo.new(0.2), {TextTransparency = 1}):Play() end
                if c:IsA("ImageLabel") then TweenService:Create(c, TweenInfo.new(0.2), {ImageTransparency = 1}):Play() end
            end
        end
        
        if blur then
            TweenService:Create(blur, TweenInfo.new(0.5), {Size = 0}):Play()
        end
        
        task.wait(0.5)
        gui:Destroy()
        if blur then blur:Destroy() end
        
        -- Reset state
        self.Gui = nil
        self.Blur = nil
        self._termFrame = nil
        self._barFill = nil
        self._titleLabel = nil
        self._subtitleLabel = nil
        
        -- Fire signal
        self.OnDestroy:Fire()
    end
end

return Loader
 end,
    [19] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(19)local Root = script.Parent.Parent
local Flipper = require(Root.Packages.Flipper)
local Creator = require(Root.Creator)
local Acrylic = require(Root.Acrylic)

local Spring = Flipper.Spring.new
local Instant = Flipper.Instant.new
local New = Creator.New

local Notification = {}

function Notification:Init(GUI)
	Notification.Holder = New("Frame", {
		Position = UDim2.new(1, -30, 1, -30),
		Size = UDim2.new(0, 310, 1, -30),
		AnchorPoint = Vector2.new(1, 1),
		BackgroundTransparency = 1,
		Parent = GUI,
	}, {
		New("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, 20),
		}),
	})
end

function Notification:New(Config)
	Config.Title = Config.Title or "Title"
	Config.Content = Config.Content or "Content"
	Config.SubContent = Config.SubContent or ""
	Config.Duration = Config.Duration or nil
	Config.Buttons = Config.Buttons or {}
	local NewNotification = {
		Closed = false,
	}

	NewNotification.AcrylicPaint = Acrylic.AcrylicPaint()

	NewNotification.Title = New("TextLabel", {
		Position = UDim2.new(0, 14, 0, 17),
		Text = Config.Title,
		RichText = true,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextTransparency = 0,
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
		TextSize = 13,
		TextXAlignment = "Left",
		TextYAlignment = "Center",
		Size = UDim2.new(1, -12, 0, 12),
		TextWrapped = true,
		BackgroundTransparency = 1,
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	NewNotification.ContentLabel = New("TextLabel", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
		Text = Config.Content,
		TextColor3 = Color3.fromRGB(240, 240, 240),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 14),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		TextWrapped = true,
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	NewNotification.SubContentLabel = New("TextLabel", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
		Text = Config.SubContent,
		TextColor3 = Color3.fromRGB(240, 240, 240),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 14),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		TextWrapped = true,
		ThemeTag = {
			TextColor3 = "SubText",
		},
	})

	NewNotification.LabelHolder = New("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(14, 40),
		Size = UDim2.new(1, -28, 0, 0),
	}, {
		New("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 3),
		}),
		NewNotification.ContentLabel,
		NewNotification.SubContentLabel,
	})

	NewNotification.CloseButton = New("TextButton", {
		Text = "",
		Position = UDim2.new(1, -14, 0, 13),
		Size = UDim2.fromOffset(20, 20),
		AnchorPoint = Vector2.new(1, 0),
		BackgroundTransparency = 1,
	}, {
		New("ImageLabel", {
			Image = require(script.Parent.Assets).Close,
			Size = UDim2.fromOffset(16, 16),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			ThemeTag = {
				ImageColor3 = "Text",
			},
		}),
	})

	NewNotification.Root = New("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.fromScale(1, 0),
		Visible = false,
	}, {
		NewNotification.AcrylicPaint.Frame,
		NewNotification.Title,
		NewNotification.CloseButton,
		NewNotification.LabelHolder,
	})

	if Config.Content == "" then
		NewNotification.ContentLabel.Visible = false
	end

	if Config.SubContent == "" then
		NewNotification.SubContentLabel.Visible = false
	end

	NewNotification.Holder = New("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 200),
		Parent = Notification.Holder,
	}, {
		NewNotification.Root,
	})

	local RootMotor = Flipper.GroupMotor.new({
		Scale = 1,
		Offset = 60,
	})

	RootMotor:onStep(function(Values)
		NewNotification.Root.Position = UDim2.new(Values.Scale, Values.Offset, 0, 0)
	end)

	Creator.AddSignal(NewNotification.CloseButton.MouseButton1Click, function()
		NewNotification:Close()
	end)

	function NewNotification:Open()
		local ContentSize = NewNotification.LabelHolder.AbsoluteSize.Y
		NewNotification.Holder.Size = UDim2.new(1, 0, 0, 58 + ContentSize)
		
		NewNotification.Root.Visible = true

		RootMotor:setGoal({
			Scale = Spring(0, { frequency = 5 }),
			Offset = Spring(0, { frequency = 5 }),
		})
	end

	function NewNotification:Close()
		if not NewNotification.Closed then
			NewNotification.Closed = true
			task.spawn(function()
				RootMotor:setGoal({
					Scale = Spring(1, { frequency = 5 }),
					Offset = Spring(60, { frequency = 5 }),
				})
				task.wait(0.4)
				if require(Root).UseAcrylic then
					NewNotification.AcrylicPaint.Model:Destroy()
				end
				NewNotification.Holder:Destroy()
			end)
		end
	end

	NewNotification:Open()
	if Config.Duration then
		task.delay(Config.Duration, function()
			NewNotification:Close()
		end)
	end
	return NewNotification
end

return Notification
 end,
    [20] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(20)local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local New = Creator.New

return function(Title, Parent)
	local Section = {}

	Section.Layout = New("UIListLayout", {
		Padding = UDim.new(0, 5),
	})

	Section.Container = New("Frame", {
		Size = UDim2.new(1, 0, 0, 26),
		Position = UDim2.fromOffset(0, 24),
		BackgroundTransparency = 1,
	}, {
		Section.Layout,
	})

	Section.Root = New("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 26),
		LayoutOrder = 7,
		Parent = Parent,
	}, {
		New("TextLabel", {
			RichText = true,
			Text = Title,
			TextTransparency = 0,
			FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
			TextSize = 18,
			TextXAlignment = "Left",
			TextYAlignment = "Center",
			Size = UDim2.new(1, -16, 0, 18),
			Position = UDim2.fromOffset(0, 2),
			ThemeTag = {
				TextColor3 = "Text",
			},
		}),
		Section.Container,
	})

	Creator.AddSignal(Section.Layout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
		Section.Container.Size = UDim2.new(1, 0, 0, Section.Layout.AbsoluteContentSize.Y)
		Section.Root.Size = UDim2.new(1, 0, 0, Section.Layout.AbsoluteContentSize.Y + 25)
	end)
	return Section
end
 end,
    [21] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(21)local Root = script.Parent.Parent
local Flipper = require(Root.Packages.Flipper)
local Creator = require(Root.Creator)

local New = Creator.New
local Spring = Flipper.Spring.new
local Instant = Flipper.Instant.new
local Components = Root.Components

local TabModule = {
	Window = nil,
	Tabs = {},
	Containers = {},
	SelectedTab = 0,
	TabCount = 0,
}

function TabModule:Init(Window)
	TabModule.Window = Window
	return TabModule
end

function TabModule:GetCurrentTabPos()
	local TabHolderPos = TabModule.Window.TabHolder.AbsolutePosition.Y
	local TabPos = TabModule.Tabs[TabModule.SelectedTab].Frame.AbsolutePosition.Y

	return TabPos - TabHolderPos
end

function TabModule:New(Title, Icon, Parent)
	local Library = require(Root)
	local Window = TabModule.Window
	local Elements = Library.Elements

	TabModule.TabCount = TabModule.TabCount + 1
	local TabIndex = TabModule.TabCount

	local Tab = {
		Selected = false,
		Name = Title,
		Type = "Tab",
	}

	if Library:GetIcon(Icon) then
		Icon = Library:GetIcon(Icon)
	end

	if Icon == "" or nil then
		Icon = nil
	end

	Tab.Frame = New("TextButton", {
		Size = UDim2.new(1, 0, 0, 34),
		BackgroundTransparency = 1,
		Parent = Parent,
		ThemeTag = {
			BackgroundColor3 = "Tab",
			Gradient = "TabGradient",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 6),
		}),
		New("TextLabel", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = Icon and UDim2.new(0, 30, 0.5, 0) or UDim2.new(0, 12, 0.5, 0),
			Text = Title,
			RichText = true,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextTransparency = 0,
			FontFace = Font.new(
				"rbxasset://fonts/families/GothamSSm.json",
				Enum.FontWeight.Regular,
				Enum.FontStyle.Normal
			),
			TextSize = 12,
			TextXAlignment = "Left",
			TextYAlignment = "Center",
			TextTruncate = Enum.TextTruncate.AtEnd,
			Size = UDim2.new(1, -12, 1, 0),
			BackgroundTransparency = 1,
			ThemeTag = {
				TextColor3 = "Text",
			},
		}),
		New("ImageLabel", {
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.fromOffset(16, 16),
			Position = UDim2.new(0, 8, 0.5, 0),
			BackgroundTransparency = 1,
			Image = Icon and Icon or nil,
			ThemeTag = {
				ImageColor3 = "Text",
			},
		}),
	})

	local ContainerLayout = New("UIListLayout", {
		Padding = UDim.new(0, 5),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	Tab.ContainerFrame = New("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Parent = Window.ContainerHolder,
		Visible = false,
		BottomImage = "rbxassetid://6889812791",
		MidImage = "rbxassetid://6889812721",
		TopImage = "rbxassetid://6276641225",
		ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
		ScrollBarImageTransparency = 0.7,
		ScrollBarThickness = 4,
		BorderSizePixel = 0,
		CanvasSize = UDim2.fromScale(0, 0),
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ThemeTag = {
			ScrollBarImageColor3 = "Scrollbar",
		},
	}, {
		ContainerLayout,
		New("UIPadding", {
			PaddingRight = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 1),
			PaddingTop = UDim.new(0, 1),
			PaddingBottom = UDim.new(0, 1),
		}),
	})

	-- Scroll bar hover effect
	Creator.AddSignal(Tab.ContainerFrame.MouseEnter, function()
		local hoverColor = Creator.GetThemeProperty("ScrollbarHover")
		if hoverColor then
			Tab.ContainerFrame.ScrollBarImageColor3 = hoverColor
			Tab.ContainerFrame.ScrollBarImageTransparency = 0.3
		end
	end)
	Creator.AddSignal(Tab.ContainerFrame.MouseLeave, function()
		local baseColor = Creator.GetThemeProperty("Scrollbar")
		if baseColor then
			Tab.ContainerFrame.ScrollBarImageColor3 = baseColor
			Tab.ContainerFrame.ScrollBarImageTransparency = 0.7
		end
	end)

	Creator.AddSignal(ContainerLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
		Tab.ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y + 2)
	end)

	Tab.Motor, Tab.SetTransparency = Creator.SpringMotor(1, Tab.Frame, "BackgroundTransparency")

	Creator.AddSignal(Tab.Frame.MouseEnter, function()
		Tab.SetTransparency(Tab.Selected and 0.85 or 0.89)
	end)
	Creator.AddSignal(Tab.Frame.MouseLeave, function()
		Tab.SetTransparency(Tab.Selected and 0.89 or 1)
	end)
	Creator.AddSignal(Tab.Frame.MouseButton1Down, function()
		Tab.SetTransparency(0.92)
	end)
	Creator.AddSignal(Tab.Frame.MouseButton1Up, function()
		Tab.SetTransparency(Tab.Selected and 0.85 or 0.89)
	end)
	Creator.AddSignal(Tab.Frame.MouseButton1Click, function()
		TabModule:SelectTab(TabIndex)
	end)

	TabModule.Containers[TabIndex] = Tab.ContainerFrame
	TabModule.Tabs[TabIndex] = Tab

	Tab.Container = Tab.ContainerFrame
	Tab.ScrollFrame = Tab.Container

	function Tab:AddSection(SectionTitle)
		local Section = { Type = "Section" }

		local SectionFrame = require(Components.Section)(SectionTitle, Tab.Container)
		Section.Container = SectionFrame.Container
		Section.ScrollFrame = Tab.Container

		setmetatable(Section, Elements)
		return Section
	end

	setmetatable(Tab, Elements)
	return Tab
end

function TabModule:SelectTab(Tab)
	local Window = TabModule.Window

	TabModule.SelectedTab = Tab

	for _, TabObject in next, TabModule.Tabs do
		TabObject.SetTransparency(1)
		TabObject.Selected = false
	end
	TabModule.Tabs[Tab].SetTransparency(0.89)
	TabModule.Tabs[Tab].Selected = true

	Window.TabDisplay.Text = TabModule.Tabs[Tab].Name
	Window.SelectorPosMotor:setGoal(Spring(TabModule:GetCurrentTabPos(), { frequency = 6 }))

	task.spawn(function()
		Window.ContainerPosMotor:setGoal(Spring(110, { frequency = 10 }))
		Window.ContainerBackMotor:setGoal(Spring(1, { frequency = 10 }))
		task.wait(0.15)
		for _, Container in next, TabModule.Containers do
			Container.Visible = false
		end
		TabModule.Containers[Tab].Visible = true
		Window.ContainerPosMotor:setGoal(Spring(94, { frequency = 5 }))
		Window.ContainerBackMotor:setGoal(Spring(0, { frequency = 8 }))
	end)
end

return TabModule
 end,
    [22] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(22)local TextService = game:GetService("TextService")
local Root = script.Parent.Parent
local Flipper = require(Root.Packages.Flipper)
local Creator = require(Root.Creator)
local New = Creator.New

return function(Parent, Acrylic)
	Acrylic = Acrylic or false
	local Textbox = {}

	Textbox.Input = New("TextBox", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
		TextColor3 = Color3.fromRGB(200, 200, 200),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromOffset(10, 0),
		ThemeTag = {
			TextColor3 = "Text",
			PlaceholderColor3 = "SubText",
		},
	})

	Textbox.Container = New("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Position = UDim2.new(0, 6, 0, 0),
		Size = UDim2.new(1, -12, 1, 0),
	}, {
		Textbox.Input,
	})

	Textbox.Indicator = New("Frame", {
		Size = UDim2.new(1, -4, 0, 1),
		Position = UDim2.new(0, 2, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		BackgroundTransparency = Acrylic and 0.5 or 0,
		ThemeTag = {
			BackgroundColor3 = Acrylic and "InputIndicator" or "DialogInputLine",
			Gradient = Acrylic and "InputIndicatorGradient" or "DialogInputLineGradient",
		},
	})

	Textbox.Frame = New("Frame", {
		Size = UDim2.new(0, 0, 0, 30),
		BackgroundTransparency = Acrylic and 0.9 or 0,
		Parent = Parent,
		ThemeTag = {
			BackgroundColor3 = Acrylic and "Input" or "DialogInput",
			Gradient = Acrylic and "InputGradient" or "DialogInputGradient",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 4),
		}),
		New("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Transparency = Acrylic and 0.5 or 0.65,
			ThemeTag = {
				Color = Acrylic and "InElementBorder" or "DialogButtonBorder",
			},
		}),
		Textbox.Indicator,
		Textbox.Container,
		Textbox.Container,
	})

	local Motor, SetTransparency = Creator.SpringMotor(
		Creator.GetThemeProperty("ElementTransparency"),
		Textbox.Frame,
		"BackgroundTransparency",
		false,
		true
	)

	Creator.AddSignal(Textbox.Input.MouseEnter, function()
		SetTransparency(Creator.GetThemeProperty("ElementTransparency") - Creator.GetThemeProperty("HoverChange"))
	end)
	Creator.AddSignal(Textbox.Input.MouseLeave, function()
		SetTransparency(Creator.GetThemeProperty("ElementTransparency"))
	end)
	Creator.AddSignal(Textbox.Input.Focused, function()
		SetTransparency(Creator.GetThemeProperty("ElementTransparency") - Creator.GetThemeProperty("HoverChange"))
	end)
	Creator.AddSignal(Textbox.Input.FocusLost, function()
		SetTransparency(Creator.GetThemeProperty("ElementTransparency"))
	end)

	local function Update()
		local PADDING = 2
		local Reveal = Textbox.Container.AbsoluteSize.X

		if not Textbox.Input:IsFocused() or Textbox.Input.TextBounds.X <= Reveal - 2 * PADDING then
			Textbox.Input.Position = UDim2.new(0, PADDING, 0, 0)
		else
			local Cursor = Textbox.Input.CursorPosition
			if Cursor ~= -1 then
				local subtext = string.sub(Textbox.Input.Text, 1, Cursor - 1)
				local width = TextService:GetTextSize(
					subtext,
					Textbox.Input.TextSize,
					Textbox.Input.Font,
					Vector2.new(math.huge, math.huge)
				).X

				local CurrentCursorPos = Textbox.Input.Position.X.Offset + width
				if CurrentCursorPos < PADDING then
					Textbox.Input.Position = UDim2.fromOffset(PADDING - width, 0)
				elseif CurrentCursorPos > Reveal - PADDING - 1 then
					Textbox.Input.Position = UDim2.fromOffset(Reveal - width - PADDING - 1, 0)
				end
			end
		end
	end

	task.spawn(Update)

	Creator.AddSignal(Textbox.Input:GetPropertyChangedSignal("Text"), Update)
	Creator.AddSignal(Textbox.Input:GetPropertyChangedSignal("CursorPosition"), Update)

	Creator.AddSignal(Textbox.Input.Focused, function()
		Update()
		Textbox.Indicator.Size = UDim2.new(1, -2, 0, 2)
		Textbox.Indicator.Position = UDim2.new(0, 1, 1, 0)
		Textbox.Indicator.BackgroundTransparency = 0
		Creator.OverrideTag(Textbox.Frame, { BackgroundColor3 = Acrylic and "InputFocused" or "DialogHolder", Gradient = Acrylic and "InputFocusedGradient" or "DialogHolderGradient" })
		Creator.OverrideTag(Textbox.Indicator, { BackgroundColor3 = "Accent" })
	end)

	Creator.AddSignal(Textbox.Input.FocusLost, function()
		Update()
		Textbox.Indicator.Size = UDim2.new(1, -4, 0, 1)
		Textbox.Indicator.Position = UDim2.new(0, 2, 1, 0)
		Textbox.Indicator.BackgroundTransparency = 0.5
		Creator.OverrideTag(Textbox.Frame, { BackgroundColor3 = Acrylic and "Input" or "DialogInput", Gradient = Acrylic and "InputGradient" or "DialogInputGradient" })
		Creator.OverrideTag(Textbox.Indicator, { BackgroundColor3 = Acrylic and "InputIndicator" or "DialogInputLine", Gradient = Acrylic and "InputIndicatorGradient" or "DialogInputLineGradient" })
	end)

	return Textbox
end
 end,
    [23] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(23)local Root = script.Parent.Parent
local Assets = require(script.Parent.Assets)
local Creator = require(Root.Creator)
local Flipper = require(Root.Packages.Flipper)

local New = Creator.New
local AddSignal = Creator.AddSignal

return function(Config)
	local TitleBar = {}

	local Library = require(Root)

	local function BarButton(Icon, Pos, Parent, Callback)
		local Button = {
			Callback = Callback or function() end,
		}

		Button.Frame = New("TextButton", {
			Size = UDim2.new(0, 34, 1, -8),
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			Parent = Parent,
			Position = Pos,
			Text = "",
			ThemeTag = {
				BackgroundColor3 = "Text",
			},
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 7),
			}),
			New("ImageLabel", {
				Image = Icon,
				Size = UDim2.fromOffset(16, 16),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Name = "Icon",
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}),
		})

		local TweenService = game:GetService("TweenService")
		local Motor, SetTransparency = Creator.SpringMotor(1, Button.Frame, "BackgroundTransparency")

		AddSignal(Button.Frame.MouseEnter, function()
			TweenService:Create(Button.Frame, TweenInfo.new(0.2), { BackgroundColor3 = Creator.GetThemeProperty("Hover") }):Play()
			SetTransparency(Creator.GetThemeProperty("ElementTransparency") - Creator.GetThemeProperty("HoverChange"))
		end)
		AddSignal(Button.Frame.MouseLeave, function()
			SetTransparency(1)
		end)
		AddSignal(Button.Frame.MouseButton1Down, function()
			TweenService:Create(Button.Frame, TweenInfo.new(0.2), { BackgroundColor3 = Creator.GetThemeProperty("Accent") }):Play()
			SetTransparency(Creator.GetThemeProperty("ElementTransparency"))
		end)
		AddSignal(Button.Frame.MouseButton1Up, function()
			TweenService:Create(Button.Frame, TweenInfo.new(0.2), { BackgroundColor3 = Creator.GetThemeProperty("Hover") }):Play()
			SetTransparency(Creator.GetThemeProperty("ElementTransparency") - Creator.GetThemeProperty("HoverChange"))
		end)
		AddSignal(Button.Frame.MouseButton1Click, Button.Callback)

		Button.SetCallback = function(Func)
			Button.Callback = Func
		end

		return Button
	end

	TitleBar.Frame = New("Frame", {
		Size = UDim2.new(1, 0, 0, 42),
		BackgroundTransparency = 1,
		Parent = Config.Parent,
	}, {
		New("Frame", {
			Size = UDim2.new(1, -16, 1, 0),
			Position = UDim2.new(0, 16, 0, 0),
			BackgroundTransparency = 1,
		}, {
			New("UIListLayout", {
				Padding = UDim.new(0, 5),
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			}),
			New("ImageLabel", {
				Image = Assets.FsshubLogoThin,
				Size = UDim2.fromOffset(90, 90),
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				ScaleType = Enum.ScaleType.Fit,
			}),
			New("TextLabel", {
				Text = "|",
				FontFace = Font.new(
					"rbxasset://fonts/families/GothamSSm.json",
					Enum.FontWeight.Regular,
					Enum.FontStyle.Normal
				),
				TextSize = 14,
				Size = UDim2.fromScale(0, 1),
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				ThemeTag = {
					TextColor3 = "Text",
				},
			}),
			New("TextLabel", {
				RichText = true,
				Text = Config.Title,
				LayoutOrder = 2,
				FontFace = Font.new(
					"rbxasset://fonts/families/GothamSSm.json",
					Enum.FontWeight.Regular,
					Enum.FontStyle.Normal
				),
				TextSize = 12,
				TextXAlignment = "Left",
				TextYAlignment = "Center",
				TextTruncate = Enum.TextTruncate.AtEnd,
				Size = UDim2.fromScale(0, 1),
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundTransparency = 1,
				ThemeTag = {
					TextColor3 = "Text",
				},
			}),
			New("TextLabel", {
				RichText = true,
				Text = Config.SubTitle,
				LayoutOrder = 3,
				TextTransparency = 0.4,
				FontFace = Font.new(
					"rbxasset://fonts/families/GothamSSm.json",
					Enum.FontWeight.Regular,
					Enum.FontStyle.Normal
				),
				TextSize = 12,
				TextXAlignment = "Left",
				TextYAlignment = "Center",
				TextTruncate = Enum.TextTruncate.AtEnd,
				Size = UDim2.fromScale(0, 1),
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundTransparency = 1,
				ThemeTag = {
					TextColor3 = "Text",
				},
			}),
		}),
		New("Frame", {
			BackgroundTransparency = 0.5,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			ThemeTag = {
				BackgroundColor3 = "TitleBarLine",
				Gradient = "TitleBarLineGradient",
			},
		}),
	})

	TitleBar.CloseButton = BarButton(Assets.Close, UDim2.new(1, -4, 0, 4), TitleBar.Frame, function()
		Library.Window:Dialog({
			Title = "Close",
			Content = "Are you sure you want to unload the interface?",
			Buttons = {
				{
					Title = "Yes",
					Callback = function()
						Library:Destroy()
					end,
				},
				{
					Title = "No",
				},
			},
		})
	end)
	TitleBar.MaxButton = BarButton(Assets.Max, UDim2.new(1, -40, 0, 4), TitleBar.Frame, function()
		Config.Window.Maximize(not Config.Window.Maximized)
	end)
	TitleBar.MinButton = BarButton(Assets.Min, UDim2.new(1, -80, 0, 4), TitleBar.Frame, function()
		Library.Window:Minimize()
	end)

	return TitleBar
end
 end,
    [24] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(24)-- i will rewrite this someday
local UserInputService = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Camera = game:GetService("Workspace").CurrentCamera

local Root = script.Parent.Parent
local Flipper = require(Root.Packages.Flipper)
local Creator = require(Root.Creator)
local Acrylic = require(Root.Acrylic)
local Assets = require(script.Parent.Assets)
local Components = script.Parent

local Spring = Flipper.Spring.new
local Instant = Flipper.Instant.new
local New = Creator.New

return function(Config)
	local Library = require(Root)

	local Window = {
		Minimized = false,
		Maximized = false,
		Size = Config.Size,
		CurrentPos = 0,
		Position = UDim2.fromOffset(
			Camera.ViewportSize.X / 2 - Config.Size.X.Offset / 2,
			Camera.ViewportSize.Y / 2 - Config.Size.Y.Offset / 2
		),
	}

	local Dragging, DragInput, MousePos, StartPos = false
	local Resizing, ResizePos = false
	local MinimizeNotif = false

	Window.AcrylicPaint = Acrylic.AcrylicPaint()

	local Selector = New("Frame", {
		Size = UDim2.fromOffset(4, 0),
		BackgroundColor3 = Color3.fromRGB(76, 194, 255),
		Position = UDim2.fromOffset(0, 17),
		AnchorPoint = Vector2.new(0, 0.5),
		ThemeTag = {
			BackgroundColor3 = "Accent",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 2),
		}),
	})

	local ResizeStartFrame = New("Frame", {
		Size = UDim2.fromOffset(20, 20),
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -20, 1, -20),
	})

	Window.TabHolder = New("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ScrollBarImageTransparency = 1,
		ScrollBarThickness = 0,
		BorderSizePixel = 0,
		CanvasSize = UDim2.fromScale(0, 0),
		ScrollingDirection = Enum.ScrollingDirection.Y,
	}, {
		New("UIListLayout", {
			Padding = UDim.new(0, 4),
		}),
	})

	local TabFrame = New("Frame", {
		Size = UDim2.new(0, Config.TabWidth, 1, -66),
		Position = UDim2.new(0, 12, 0, 54),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
	}, {
		Window.TabHolder,
		Selector,
	})

	Window.TabDisplay = New("TextLabel", {
		RichText = true,
		Text = "Tab",
		TextTransparency = 0,
		FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
		TextSize = 28,
		TextXAlignment = "Left",
		TextYAlignment = "Center",
		Size = UDim2.new(1, -16, 0, 28),
		Position = UDim2.fromOffset(Config.TabWidth + 26, 56),
		BackgroundTransparency = 1,
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	Window.ContainerHolder = New("CanvasGroup", {
		Size = UDim2.new(1, -Config.TabWidth - 32, 1, -102),
		Position = UDim2.fromOffset(Config.TabWidth + 26, 90),
		BackgroundTransparency = 1,
	})

	Window.Root = New("Frame", {
		BackgroundTransparency = 1,
		Size = Window.Size,
		Position = Window.Position,
		Parent = Config.Parent,
		Active = true,
		Visible = false,
	}, {
		Window.AcrylicPaint.Frame,
		Window.TabDisplay,
		Window.ContainerHolder,
		TabFrame,
		ResizeStartFrame,
	})

	Window.TitleBar = require(script.Parent.TitleBar)({
		Title = Config.Title,
		SubTitle = Config.SubTitle,
		Parent = Window.Root,
		Window = Window,
	})

	if Library.UseAcrylic then
		Window.AcrylicPaint.AddParent(Window.Root)
	end

	local SizeMotor = Flipper.GroupMotor.new({
		X = Window.Size.X.Offset,
		Y = Window.Size.Y.Offset,
	})

	local PosMotor = Flipper.GroupMotor.new({
		X = Window.Position.X.Offset,
		Y = Window.Position.Y.Offset,
	})

	Window.SelectorPosMotor = Flipper.SingleMotor.new(17)
	Window.SelectorSizeMotor = Flipper.SingleMotor.new(0)
	Window.ContainerBackMotor = Flipper.SingleMotor.new(0)
	Window.ContainerPosMotor = Flipper.SingleMotor.new(94)

	SizeMotor:onStep(function(values)
		Window.Root.Size = UDim2.new(0, values.X, 0, values.Y)
	end)

	PosMotor:onStep(function(values)
		Window.Root.Position = UDim2.new(0, values.X, 0, values.Y)
	end)

	local LastValue = 0
	local LastTime = 0
	Window.SelectorPosMotor:onStep(function(Value)
		Selector.Position = UDim2.new(0, 0, 0, Value + 17)
		local Now = tick()
		local DeltaTime = Now - LastTime

		if LastValue ~= nil then
			Window.SelectorSizeMotor:setGoal(Spring((math.abs(Value - LastValue) / (DeltaTime * 60)) + 16))
			LastValue = Value
		end
		LastTime = Now
	end)

	Window.SelectorSizeMotor:onStep(function(Value)
		Selector.Size = UDim2.new(0, 4, 0, Value)
	end)

	Window.ContainerBackMotor:onStep(function(Value)
		Window.ContainerHolder.GroupTransparency = Value
	end)

	Window.ContainerPosMotor:onStep(function(Value)
		Window.ContainerHolder.Position = UDim2.fromOffset(Config.TabWidth + 26, Value)
	end)

	local OldSizeX
	local OldSizeY
	Window.Maximize = function(Value, NoPos, Instant)
		Window.Maximized = Value
		Window.TitleBar.MaxButton.Frame.Icon.Image = Value and Assets.Restore or Assets.Max

		if Value then
			OldSizeX = Window.Size.X.Offset
			OldSizeY = Window.Size.Y.Offset
		end
		local SizeX = Value and Camera.ViewportSize.X or OldSizeX
		local SizeY = Value and Camera.ViewportSize.Y or OldSizeY
		SizeMotor:setGoal({
			X = Flipper[Instant and "Instant" or "Spring"].new(SizeX, { frequency = 6 }),
			Y = Flipper[Instant and "Instant" or "Spring"].new(SizeY, { frequency = 6 }),
		})
		Window.Size = UDim2.fromOffset(SizeX, SizeY)

		if not NoPos then
			PosMotor:setGoal({
				X = Spring(Value and 0 or Window.Position.X.Offset, { frequency = 6 }),
				Y = Spring(Value and 0 or Window.Position.Y.Offset, { frequency = 6 }),
			})
		end
	end

	Creator.AddSignal(Window.TitleBar.Frame.InputBegan, function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			Dragging = true
			MousePos = Input.Position
			StartPos = Window.Root.Position

			if Window.Maximized then
				StartPos = UDim2.fromOffset(
					Mouse.X - (Mouse.X * ((OldSizeX - 100) / Window.Root.AbsoluteSize.X)),
					Mouse.Y - (Mouse.Y * (OldSizeY / Window.Root.AbsoluteSize.Y))
				)
			end

			Input.Changed:Connect(function()
				if Input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)

	Creator.AddSignal(Window.TitleBar.Frame.InputChanged, function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseMovement
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			DragInput = Input
		end
	end)

	Creator.AddSignal(ResizeStartFrame.InputBegan, function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			Resizing = true
			ResizePos = Input.Position
		end
	end)

	Creator.AddSignal(UserInputService.InputChanged, function(Input)
		if Input == DragInput and Dragging then
			local Delta = Input.Position - MousePos
			Window.Position = UDim2.fromOffset(StartPos.X.Offset + Delta.X, StartPos.Y.Offset + Delta.Y)
			PosMotor:setGoal({
				X = Instant(Window.Position.X.Offset),
				Y = Instant(Window.Position.Y.Offset),
			})

			if Window.Maximized then
				Window.Maximize(false, true, true)
			end
		end

		if
			(Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch)
			and Resizing
		then
			local Delta = Input.Position - ResizePos
			local StartSize = Window.Size

			local TargetSize = Vector3.new(StartSize.X.Offset, StartSize.Y.Offset, 0) + Vector3.new(1, 1, 0) * Delta
			local TargetSizeClamped =
				Vector2.new(math.clamp(TargetSize.X, 470, 2048), math.clamp(TargetSize.Y, 380, 2048))

			SizeMotor:setGoal({
				X = Flipper.Instant.new(TargetSizeClamped.X),
				Y = Flipper.Instant.new(TargetSizeClamped.Y),
			})
		end
	end)

	Creator.AddSignal(UserInputService.InputEnded, function(Input)
		if Resizing == true or Input.UserInputType == Enum.UserInputType.Touch then
			Resizing = false
			Window.Size = UDim2.fromOffset(SizeMotor:getValue().X, SizeMotor:getValue().Y)
		end
	end)

	Creator.AddSignal(Window.TabHolder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
		Window.TabHolder.CanvasSize = UDim2.new(0, 0, 0, Window.TabHolder.UIListLayout.AbsoluteContentSize.Y)
	end)

	Creator.AddSignal(UserInputService.InputBegan, function(Input)
		if
			type(Library.MinimizeKeybind) == "table"
			and Library.MinimizeKeybind.Type == "Keybind"
			and not UserInputService:GetFocusedTextBox()
		then
			if Input.KeyCode.Name == Library.MinimizeKeybind.Value then
				Window:Minimize()
			end
		elseif Input.KeyCode == Library.MinimizeKey and not UserInputService:GetFocusedTextBox() then
			Window:Minimize()
		end
	end)

	function Window:Minimize()
		Window.Minimized = not Window.Minimized
		Window.Root.Visible = not Window.Minimized
		if not MinimizeNotif then
			MinimizeNotif = true
			local Key = Library.MinimizeKeybind and Library.MinimizeKeybind.Value or Library.MinimizeKey.Name
			Library:Notify({
				Title = "Interface",
				Content = "Press " .. Key .. " to toggle the inteface.",
				Duration = 6
			})
		end
	end

	function Window:Destroy()
		if Library.UseAcrylic then
			Window.AcrylicPaint.Model:Destroy()
		end
		Window.Root:Destroy()
	end

	local DialogModule = require(Components.Dialog):Init(Window)
	function Window:Dialog(Config)
		local Dialog = DialogModule:Create()
		Dialog.Title.Text = Config.Title

		local Content = New("TextLabel", {
			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			Text = Config.Content,
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Size = UDim2.new(1, -40, 1, 0),
			Position = UDim2.fromOffset(20, 60),
			BackgroundTransparency = 1,
			Parent = Dialog.Root,
			ClipsDescendants = false,
			ThemeTag = {
				TextColor3 = "Text",
			},
		})

		New("UISizeConstraint", {
			MinSize = Vector2.new(300, 165),
			MaxSize = Vector2.new(620, math.huge),
			Parent = Dialog.Root,
		})

		Dialog.Root.Size = UDim2.fromOffset(Content.TextBounds.X + 40, 165)
		if Content.TextBounds.X + 40 > Window.Size.X.Offset - 120 then
			Dialog.Root.Size = UDim2.fromOffset(Window.Size.X.Offset - 120, 165)
			Content.TextWrapped = true
			Dialog.Root.Size = UDim2.fromOffset(Window.Size.X.Offset - 120, Content.TextBounds.Y + 150)
		end

		for _, Button in next, Config.Buttons do
			Dialog:Button(Button.Title, Button.Callback)
		end

		Dialog:Open()
		Window.Root.Visible = true
	end

	local TabModule = require(Components.Tab):Init(Window)
	function Window:AddTab(TabConfig)
		return TabModule:New(TabConfig.Title, TabConfig.Icon, Window.TabHolder)
	end

	function Window:SelectTab(Tab)
		TabModule:SelectTab(Tab)
		Window.Root.Visible = not Window.Minimized

		if not Library.IsReady then
			Library.IsReady = true
			for _, Config in next, Library.NotifyQueue do
				Library:Notify(Config)
			end
			table.clear(Library.NotifyQueue)
		end
	end

	Creator.AddSignal(Window.TabHolder:GetPropertyChangedSignal("CanvasPosition"), function()
		LastValue = TabModule:GetCurrentTabPos() + 16
		LastTime = 0
		Window.SelectorPosMotor:setGoal(Instant(TabModule:GetCurrentTabPos()))
	end)

	return Window
end
 end,
    [25] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(25)local Root = script.Parent
local Themes = require(Root.Themes)
local Flipper = require(Root.Packages.Flipper)
local Gradients = require(Root.Gradients) -- Full gradient engine

local Creator = {
	Registry = {},
	GradientRegistry = {}, -- Registry for gradient-enabled instances
	Signals = {},
	TransparencyMotors = {},
	CachedTheme = nil, -- Cached theme table for performance
	DefaultProperties = {
		ScreenGui = {
			ResetOnSpawn = false,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		},
		Frame = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
		},
		ScrollingFrame = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			ScrollBarImageColor3 = Color3.new(0, 0, 0),
		},
		TextLabel = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			Font = Enum.Font.SourceSans,
			Text = "",
			TextColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			TextSize = 14,
		},
		TextButton = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			AutoButtonColor = false,
			Font = Enum.Font.SourceSans,
			Text = "",
			TextColor3 = Color3.new(0, 0, 0),
			TextSize = 14,
		},
		TextBox = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			ClearTextOnFocus = false,
			Font = Enum.Font.SourceSans,
			Text = "",
			TextColor3 = Color3.new(0, 0, 0),
			TextSize = 14,
		},
		ImageLabel = {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
		},
		ImageButton = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			AutoButtonColor = false,
		},
		CanvasGroup = {
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
		},
	},
}

-- Expose Gradients module for external use
Creator.Gradients = Gradients

local function ApplyCustomProps(Object, Props)
	if Props.ThemeTag then
		Creator.AddThemeObject(Object, Props.ThemeTag)
	end
end

function Creator.AddSignal(Signal, Function)
	table.insert(Creator.Signals, Signal:Connect(Function))
end

function Creator.Disconnect()
	for Idx = #Creator.Signals, 1, -1 do
		local Connection = table.remove(Creator.Signals, Idx)
		Connection:Disconnect()
	end
	-- Clean up gradient instances
	for instance, _ in pairs(Creator.GradientRegistry) do
		local gradient = instance:FindFirstChildOfClass("UIGradient")
		if gradient then
			gradient:Destroy()
		end
	end
	Creator.GradientRegistry = {}
end

function Creator.GetThemeProperty(Property)
	-- Use cached theme if available, otherwise lookup
	local currentTheme = Creator.CachedTheme
	if not currentTheme then
		local Library = require(Root)
		currentTheme = Themes[Library.Theme] or Themes["Dark"]
	end
	local value = currentTheme[Property]
	
	-- Handle blend definitions at runtime
	if value and type(value) == "table" and value.Base and value.Blend then
		local blended = Gradients.EvaluateBlend(value, function(key)
			return currentTheme[key] or Themes["Dark"][key]
		end)
		if blended then
			return blended
		end
	end
	
	if value ~= nil then
		return value
	end
	return Themes["Dark"][Property]
end

--[[
    Apply a gradient to an instance. Creates or updates a UIGradient child.
    @param instance: GuiObject - The instance to apply gradient to
    @param themeKey: string - The theme key for the gradient (e.g., "ElementGradient")
    @param rotation: number? - Gradient rotation in degrees (default 90 = vertical)
    @return UIGradient? - The created/updated gradient instance
]]
function Creator.ApplyGradient(instance, themeKey, rotation, interpolationOptions)
	local gradientDef = Creator.GetThemeProperty(themeKey)
	if not gradientDef then
		-- Remove existing gradient if theme doesn't define one
		local existing = instance:FindFirstChildOfClass("UIGradient")
		
		-- Strict cleanup: Destroy if registered OR if explicitly named ThemeGradient
		if existing then
			if Creator.GradientRegistry[instance] or existing.Name == "ThemeGradient" then
				existing:Destroy()
				Creator.GradientRegistry[instance] = nil
			end
		end
		return nil
	end
	
	-- Use new Gradients module for enhanced processing
	local colorSeq
	local transSeq = nil
	
	if typeof(gradientDef) == "ColorSequence" then
		-- Already a ColorSequence, use directly
		colorSeq = gradientDef
	elseif type(gradientDef) == "table" then
		-- Enhanced table format with interpolation mode
		if gradientDef.Colors then
			local mode = gradientDef.Mode or (interpolationOptions and interpolationOptions.Mode) or "Linear"
			local colorSpace = gradientDef.ColorSpace or (interpolationOptions and interpolationOptions.ColorSpace) or "RGB"
			
			local gradient = Gradients.new({
				Colors = gradientDef.Colors,
				Positions = gradientDef.Positions,
				Mode = mode,
				ColorSpace = colorSpace,
			})
			colorSeq = gradient:ToColorSequence()
			
			if gradientDef.Transparency then
				transSeq = Gradients.CreateTransparencyGradient(gradientDef.Transparency, gradientDef.Positions)
			end
		elseif #gradientDef > 0 and typeof(gradientDef[1]) == "Color3" then
			-- Simple array of Color3
			local mode = (interpolationOptions and interpolationOptions.Mode) or "Linear"
			local gradient = Gradients.new({ Colors = gradientDef, Mode = mode })
			colorSeq = gradient:ToColorSequence()
		else
			-- Fallback to old parser
			colorSeq, transSeq = Gradients.ParseGradient(gradientDef)
		end
	else
		-- Fallback to old parser
		colorSeq, transSeq = Gradients.ParseGradient(gradientDef)
	end
	
	if not colorSeq then
		return nil
	end
	
	-- Find or create UIGradient
	local gradient = instance:FindFirstChildOfClass("UIGradient")
	if not gradient then
		gradient = Instance.new("UIGradient")
		gradient.Name = "ThemeGradient"
		gradient.Parent = instance
	end
	
	gradient.Color = colorSeq
	gradient.Rotation = rotation or 90
	
	if transSeq then
		gradient.Transparency = transSeq
	end
	
	-- Register for theme updates
	Creator.GradientRegistry[instance] = {
		ThemeKey = themeKey,
		Rotation = rotation or 90,
		InterpolationOptions = interpolationOptions,
	}
	
	return gradient
end

--[[
    Register an instance to receive gradient updates on theme change.
    @param instance: GuiObject - The instance
    @param themeKey: string - Theme key for gradient
    @param rotation: number? - Gradient rotation
]]
function Creator.AddGradientObject(instance, themeKey, rotation)
	Creator.GradientRegistry[instance] = {
		ThemeKey = themeKey,
		Rotation = rotation or 90,
	}
	Creator.ApplyGradient(instance, themeKey, rotation)
end

--[[
    Remove gradient registration from an instance.
    @param instance: GuiObject
]]
function Creator.RemoveGradientObject(instance)
	Creator.GradientRegistry[instance] = nil
	local gradient = instance:FindFirstChildOfClass("UIGradient")
	if gradient and gradient.Name == "ThemeGradient" then
		gradient:Destroy()
	end
end

function Creator.UpdateTheme()
	-- Update cached theme reference FIRST before processing
	local Library = require(Root)
	Creator.CachedTheme = Themes[Library.Theme] or Themes["Dark"]

	local FluentAdapter = Gradients.GetFluentAdapter()

	-- Update standard theme properties
	for Instance, Object in next, Creator.Registry do
		for Property, ColorIdx in next, Object.Properties do
			local value = Creator.GetThemeProperty(ColorIdx)
			
			local isGradient = FluentAdapter.IsGradientDefinition(value)

			if Property == "Gradient" then
				-- Explicit gradient property: always attempt to apply or clear
				Creator.ApplyGradient(Instance, ColorIdx, Object.GradientRotation)
				
				-- If a gradient is active, ensure background is compatible (white)
				if isGradient then
					if Instance:IsA("GuiObject") and not Instance:IsA("TextLabel") and not Instance:IsA("ScrollingFrame") then
						Instance.BackgroundColor3 = Color3.new(1, 1, 1)
					end
				end
			
			elseif isGradient and not Instance:IsA("UIGradient") then
				-- Implicit gradient (Property mapped to a Theme Key that became a Gradient)
				Creator.ApplyGradient(Instance, ColorIdx, Object.GradientRotation)
				
				-- Set neutral background if we are targeting BackgroundColor3
				if Property == "BackgroundColor3" then
					Instance.BackgroundColor3 = Color3.new(1, 1, 1)
				end
				
			else
				-- Standard property assignment (Color3, etc)
				if Property ~= "Gradient" then
					local finalValue = value
					
					-- Fix: If assigning to UIGradient with a gradient table, parse it first
					if isGradient and Instance:IsA("UIGradient") and (Property == "Color" or Property == "Transparency") then
						local gradient, transparency = FluentAdapter.FromThemeDefinition(value)
						
						if gradient then
							if Property == "Color" then
								finalValue = gradient:ToColorSequence()
							elseif Property == "Transparency" and transparency then
								finalValue = transparency
							end
						end
					end
					
					Instance[Property] = finalValue
				end
				
				-- Cleanup stale gradient if this property previously had an implicit gradient
				local existing = Instance:FindFirstChild("ThemeGradient")
				if existing and Creator.GradientRegistry[Instance] and Creator.GradientRegistry[Instance].ThemeKey == ColorIdx then
					existing:Destroy()
					Creator.GradientRegistry[Instance] = nil
				end
			end
		end
	end
	
	-- Update registered gradients
	for instance, data in pairs(Creator.GradientRegistry) do
		if instance and instance.Parent then
			Creator.ApplyGradient(instance, data.ThemeKey, data.Rotation)
		else
			-- Clean up orphaned entries
			Creator.GradientRegistry[instance] = nil
		end
	end

	for _, Motor in next, Creator.TransparencyMotors do
		Motor:setGoal(Flipper.Instant.new(Creator.GetThemeProperty("ElementTransparency")))
	end
end

-- Apply theme to a single object (used during construction for performance)
local function ApplyThemeToObject(Object, Properties)
	local FluentAdapter = Gradients.GetFluentAdapter()
	
	for Property, ColorIdx in next, Properties do
		local value = Creator.GetThemeProperty(ColorIdx)
		local isGradient = FluentAdapter.IsGradientDefinition(value)
		
		if Property == "Gradient" then
			Creator.ApplyGradient(Object, ColorIdx)
			if isGradient and Object:IsA("GuiObject") and not Object:IsA("TextLabel") and not Object:IsA("ScrollingFrame") then
				Object.BackgroundColor3 = Color3.new(1, 1, 1)
			end
		elseif isGradient and not Object:IsA("UIGradient") then
			Creator.ApplyGradient(Object, ColorIdx)
			if Property == "BackgroundColor3" then
				Object.BackgroundColor3 = Color3.new(1, 1, 1)
			end
		else
			if Property ~= "Gradient" then
				local finalValue = value
				if isGradient and Object:IsA("UIGradient") and (Property == "Color" or Property == "Transparency") then
					local gradient, transparency = FluentAdapter.FromThemeDefinition(value)
					if gradient then
						if Property == "Color" then
							finalValue = gradient:ToColorSequence()
						elseif Property == "Transparency" and transparency then
							finalValue = transparency
						end
					end
				end
				Object[Property] = finalValue
			end
		end
	end
end

function Creator.AddThemeObject(Object, Properties)
	local Data = {
		Object = Object,
		Properties = Properties,
	}

	Creator.Registry[Object] = Data
	
	-- Track base font size for scaling
	if Object:IsA("TextLabel") or Object:IsA("TextButton") or Object:IsA("TextBox") then
		if not Object:GetAttribute("FluentBaseSize") then
			Object:SetAttribute("FluentBaseSize", Object.TextSize)
		end
	end

	-- OPTIMIZATION: Apply theme only to THIS object, not the entire registry
	ApplyThemeToObject(Object, Properties)
	return Object
end

Creator.FontSize = 14

function Creator.UpdateFontSize(NewSize)
	Creator.FontSize = NewSize
	local Scale = NewSize / 14
	
	for Object, _ in next, Creator.Registry do
		local BaseSize = Object:GetAttribute("FluentBaseSize")
		if BaseSize then
			Object.TextSize = math.round(BaseSize * Scale)
		end
	end
end

function Creator.OverrideTag(Object, Properties)
	Creator.Registry[Object].Properties = Properties
	Creator.UpdateTheme()
end

function Creator.New(Name, Properties, Children)
	local Object = Instance.new(Name)

	-- Default properties
	for Name, Value in next, Creator.DefaultProperties[Name] or {} do
		Object[Name] = Value
	end

	-- Properties
	for Name, Value in next, Properties or {} do
		if Name ~= "ThemeTag" then
			Object[Name] = Value
		end
	end

	-- Children
	for _, Child in next, Children or {} do
		Child.Parent = Object
	end

	ApplyCustomProps(Object, Properties)
	return Object
end

function Creator.SpringMotor(Initial, Instance, Prop, IgnoreDialogCheck, ResetOnThemeChange)
	IgnoreDialogCheck = IgnoreDialogCheck or false
	ResetOnThemeChange = ResetOnThemeChange or false
	local Motor = Flipper.SingleMotor.new(Initial)
	Motor:onStep(function(value)
		-- Defensive: Only update if Instance and Prop are valid
		if Instance and Prop then
			Instance[Prop] = value
		end
	end)

	if ResetOnThemeChange then
		table.insert(Creator.TransparencyMotors, Motor)
	end

	local function SetValue(Value, Ignore)
		Ignore = Ignore or false
		if not IgnoreDialogCheck then
			if not Ignore then
				if Prop == "BackgroundTransparency" and require(Root).DialogOpen then
					return
				end
			end
		end
		Motor:setGoal(Flipper.Spring.new(Value, { frequency = 8 }))
	end

	return Motor, SetValue
end

return Creator
 end,
    [26] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(26)--[[
    Docking Module Index
    
    Provides access to all docking system components.
    Exports singleton instances for direct use.
]]

local DockingManager = require(script.DockingManager)
local AnimationController = require(script.AnimationController)
local InputHandler = require(script.InputHandler)
local DockState = require(script.DockState)
local PersistenceService = require(script.PersistenceService)

-- Create singleton instances once
local managerInstance = DockingManager.new()
local animationInstance = AnimationController.new()
local inputInstance = InputHandler.new()

local Docking = {
    -- Singleton instances (use these directly)
    Manager = managerInstance,
    Animation = animationInstance,
    Input = inputInstance,
    
    -- Classes (for advanced use cases)
    DockingManagerClass = DockingManager,
    AnimationControllerClass = AnimationController,
    InputHandlerClass = InputHandler,
    DockStateClass = DockState,
    PersistenceServiceClass = PersistenceService,
}

-- Convenience: Get singleton instances (kept for backwards compatibility)
function Docking.GetManager()
    return managerInstance
end

function Docking.GetAnimation()
    return animationInstance
end

function Docking.GetInput()
    return inputInstance
end

return Docking

 end,
    [27] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(27)--[[
    AnimationController.lua - Physics-based animation engine for docking
    
    Features:
    - Spring physics with configurable parameters
    - Animation profiles (Snappy, Smooth, Bouncy)
    - Edge resistance effect
    - Elastic overshoot
]]

local Root = script.Parent.Parent
local Flipper = require(Root.Packages.Flipper)

local AnimationController = {}
AnimationController.__index = AnimationController

-- Singleton
local instance = nil

-- Animation profiles
local Profiles = {
    Snappy = { frequency = 10, damping = 1.0, overshoot = 0.05 },
    Smooth = { frequency = 6, damping = 0.85, overshoot = 0.1 },
    Bouncy = { frequency = 8, damping = 0.6, overshoot = 0.2 },
}

function AnimationController.new()
    if instance then return instance end
    
    local self = setmetatable({}, AnimationController)
    
    self.CurrentProfile = "Snappy"
    self.ActiveAnimations = {} -- Track running animations
    
    instance = self
    return self
end

function AnimationController:GetInstance()
    return instance or AnimationController.new()
end

-- Profile management
function AnimationController:SetProfile(profileName)
    if Profiles[profileName] then
        self.CurrentProfile = profileName
    end
end

function AnimationController:GetProfile()
    return Profiles[self.CurrentProfile]
end

-- Create spring goal with current profile
function AnimationController:CreateSpring(targetValue, customConfig)
    local profile = self:GetProfile()
    local config = customConfig or {}
    
    return Flipper.Spring.new(targetValue, {
        frequency = config.frequency or profile.frequency,
        dampingRatio = config.damping or profile.damping,
    })
end

-- Animate position using GroupMotor
function AnimationController:AnimatePosition(motor, targetX, targetY, callback)
    local profile = self:GetProfile()
    
    motor:setGoal({
        X = Flipper.Spring.new(targetX, { frequency = profile.frequency }),
        Y = Flipper.Spring.new(targetY, { frequency = profile.frequency }),
    })
    
    if callback then
        motor:onComplete(callback)
    end
end

-- Animate size using GroupMotor
function AnimationController:AnimateSize(motor, targetWidth, targetHeight, callback)
    local profile = self:GetProfile()
    
    motor:setGoal({
        X = Flipper.Spring.new(targetWidth, { frequency = profile.frequency }),
        Y = Flipper.Spring.new(targetHeight, { frequency = profile.frequency }),
    })
    
    if callback then
        motor:onComplete(callback)
    end
end

-- Instant (no animation) position change
function AnimationController:SetPositionInstant(motor, x, y)
    motor:setGoal({
        X = Flipper.Instant.new(x),
        Y = Flipper.Instant.new(y),
    })
end

-- Instant size change
function AnimationController:SetSizeInstant(motor, width, height)
    motor:setGoal({
        X = Flipper.Instant.new(width),
        Y = Flipper.Instant.new(height),
    })
end

-- Apply edge resistance (slow down near edges)
function AnimationController:CalculateResistance(value, edgeMin, edgeMax, resistanceZone)
    resistanceZone = resistanceZone or 50
    local resistance = 1
    
    if value < edgeMin + resistanceZone then
        local depth = (edgeMin + resistanceZone - value) / resistanceZone
        resistance = 1 - (depth * 0.5) -- Max 50% resistance
    elseif value > edgeMax - resistanceZone then
        local depth = (value - (edgeMax - resistanceZone)) / resistanceZone
        resistance = 1 - (depth * 0.5)
    end
    
    return math.clamp(resistance, 0.5, 1)
end

-- Apply elastic overshoot for dock snap
function AnimationController:AnimateWithOvershoot(motor, targetX, targetY, direction)
    local profile = self:GetProfile()
    local overshoot = profile.overshoot * 20 -- Convert to pixels
    
    -- Calculate overshoot position based on direction
    local overX, overY = targetX, targetY
    if direction == "Left" then
        overX = targetX - overshoot
    elseif direction == "Right" then
        overX = targetX + overshoot
    elseif direction == "Top" then
        overY = targetY - overshoot
    elseif direction == "Bottom" then
        overY = targetY + overshoot
    end
    
    -- First animate to overshoot, then to target
    motor:setGoal({
        X = Flipper.Spring.new(overX, { frequency = profile.frequency * 1.5 }),
        Y = Flipper.Spring.new(overY, { frequency = profile.frequency * 1.5 }),
    })
    
    -- After brief delay, settle to target
    task.delay(0.1, function()
        motor:setGoal({
            X = Flipper.Spring.new(targetX, { frequency = profile.frequency }),
            Y = Flipper.Spring.new(targetY, { frequency = profile.frequency }),
        })
    end)
end

-- Animate dock preview frame
function AnimationController:AnimateDockPreview(frame, zone, viewport)
    local targetSize, targetPos
    local profile = self:GetProfile()
    
    -- Define preview positions for each zone
    local zoneLayouts = {
        Top = { Size = UDim2.new(1, -20, 0, 100), Position = UDim2.new(0.5, 0, 0, 60) },
        Bottom = { Size = UDim2.new(1, -20, 0, 100), Position = UDim2.new(0.5, 0, 1, -60) },
        Left = { Size = UDim2.new(0, 150, 1, -20), Position = UDim2.new(0, 85, 0.5, 0) },
        Right = { Size = UDim2.new(0, 150, 1, -20), Position = UDim2.new(1, -85, 0.5, 0) },
        TopLeft = { Size = UDim2.new(0, 150, 0, 100), Position = UDim2.new(0, 85, 0, 60) },
        TopRight = { Size = UDim2.new(0, 150, 0, 100), Position = UDim2.new(1, -85, 0, 60) },
        BottomLeft = { Size = UDim2.new(0, 150, 0, 100), Position = UDim2.new(0, 85, 1, -60) },
        BottomRight = { Size = UDim2.new(0, 150, 0, 100), Position = UDim2.new(1, -85, 1, -60) },
    }
    
    local layout = zoneLayouts[zone]
    if layout and frame then
        frame.Size = layout.Size
        frame.Position = layout.Position
        frame.Visible = true
    end
end

return AnimationController
 end,
    [28] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(28)--[[
    DockState.lua - State container for docking system
    
    Manages:
    - Panel registry and dock states
    - Focus order (z-index stack)
    - Group definitions
]]

local DockState = {}
DockState.__index = DockState

-- Singleton instance
local instance = nil

function DockState.new()
    if instance then return instance end
    
    local self = setmetatable({}, DockState)
    
    -- Panel registry: { [panelId] = { panel, edge, position, size, minimized, pinned } }
    self.Panels = {}
    
    -- Dock groups: { [groupId] = { panels = {}, edge = "", collapsed = false } }
    self.Groups = {}
    
    -- Focus order: panels in z-order (last = top)
    self.FocusOrder = {}
    
    -- Active (currently dragging) panel
    self.ActivePanel = nil
    
    -- Dock zone occupancy: { [edge] = { panels } }
    self.ZoneOccupancy = {
        Top = {},
        Bottom = {},
        Left = {},
        Right = {},
        TopLeft = {},
        TopRight = {},
        BottomLeft = {},
        BottomRight = {},
    }
    
    instance = self
    return self
end

function DockState:GetInstance()
    return instance or DockState.new()
end

-- Panel registration
function DockState:RegisterPanel(panelId, panel, config)
    self.Panels[panelId] = {
        Panel = panel,
        Edge = nil,
        Position = nil,
        Size = nil,
        Minimized = false,
        Pinned = false,
        Config = config or {},
    }
    table.insert(self.FocusOrder, panelId)
end

function DockState:UnregisterPanel(panelId)
    self.Panels[panelId] = nil
    -- Remove from focus order
    for i, id in ipairs(self.FocusOrder) do
        if id == panelId then
            table.remove(self.FocusOrder, i)
            break
        end
    end
    -- Remove from zone occupancy
    for _, zone in pairs(self.ZoneOccupancy) do
        for i, id in ipairs(zone) do
            if id == panelId then
                table.remove(zone, i)
                break
            end
        end
    end
end

-- State updates
function DockState:SetPanelDocked(panelId, edge, position, size)
    local panelData = self.Panels[panelId]
    if panelData then
        panelData.Edge = edge
        panelData.Position = position
        panelData.Size = size
        
        -- Update zone occupancy
        if edge then
            table.insert(self.ZoneOccupancy[edge], panelId)
        end
    end
end

function DockState:SetPanelUndocked(panelId)
    local panelData = self.Panels[panelId]
    if panelData and panelData.Edge then
        -- Remove from zone
        local zone = self.ZoneOccupancy[panelData.Edge]
        for i, id in ipairs(zone) do
            if id == panelId then
                table.remove(zone, i)
                break
            end
        end
        panelData.Edge = nil
    end
end

function DockState:SetPanelMinimized(panelId, minimized)
    local panelData = self.Panels[panelId]
    if panelData then
        panelData.Minimized = minimized
    end
end

function DockState:SetPanelPinned(panelId, pinned)
    local panelData = self.Panels[panelId]
    if panelData then
        panelData.Pinned = pinned
    end
end

-- Focus management
function DockState:BringToFront(panelId)
    for i, id in ipairs(self.FocusOrder) do
        if id == panelId then
            table.remove(self.FocusOrder, i)
            break
        end
    end
    table.insert(self.FocusOrder, panelId)
end

function DockState:GetTopPanel()
    return self.FocusOrder[#self.FocusOrder]
end

-- Zone queries
function DockState:GetPanelsAtZone(zone)
    return self.ZoneOccupancy[zone] or {}
end

function DockState:IsZoneOccupied(zone)
    return #(self.ZoneOccupancy[zone] or {}) > 0
end

-- Serialization for persistence
function DockState:Serialize()
    local data = { Panels = {} }
    for id, panelData in pairs(self.Panels) do
        data.Panels[id] = {
            Edge = panelData.Edge,
            Position = panelData.Position and { X = panelData.Position.X, Y = panelData.Position.Y },
            Size = panelData.Size and { X = panelData.Size.X, Y = panelData.Size.Y },
            Minimized = panelData.Minimized,
            Pinned = panelData.Pinned,
        }
    end
    return data
end

function DockState:Deserialize(data)
    if not data or not data.Panels then return end
    for id, savedData in pairs(data.Panels) do
        local panelData = self.Panels[id]
        if panelData then
            panelData.Edge = savedData.Edge
            panelData.Position = savedData.Position and Vector2.new(savedData.Position.X, savedData.Position.Y)
            panelData.Size = savedData.Size and Vector2.new(savedData.Size.X, savedData.Size.Y)
            panelData.Minimized = savedData.Minimized
            panelData.Pinned = savedData.Pinned
        end
    end
end

return DockState
 end,
    [29] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(29)--[[
    DockingManager.lua - Central controller for panel docking system
    
    Features:
    - Panel registration and lifecycle
    - Dock/undock operations
    - Conflict resolution
    - Multi-panel groups
    - State persistence integration
]]

local Camera = workspace.CurrentCamera

local Root = script.Parent.Parent
local Flipper = require(Root.Packages.Flipper)

local DockState = require(script.Parent.DockState)
local AnimationController = require(script.Parent.AnimationController)
local InputHandler = require(script.Parent.InputHandler)
local PersistenceService = require(script.Parent.PersistenceService)

local DockingManager = {}
DockingManager.__index = DockingManager

-- Singleton
local instance = nil

-- Dock zone configurations (preserves original size per user request)
local ZoneConfigs = {
    Top = { anchor = Vector2.new(0.5, 0), positionFn = function(viewport, size) 
        return Vector2.new(viewport.X / 2, size.Y / 2) 
    end },
    Bottom = { anchor = Vector2.new(0.5, 1), positionFn = function(viewport, size) 
        return Vector2.new(viewport.X / 2, viewport.Y - size.Y / 2) 
    end },
    Left = { anchor = Vector2.new(0, 0.5), positionFn = function(viewport, size) 
        return Vector2.new(size.X / 2, viewport.Y / 2) 
    end },
    Right = { anchor = Vector2.new(1, 0.5), positionFn = function(viewport, size) 
        return Vector2.new(viewport.X - size.X / 2, viewport.Y / 2) 
    end },
    TopLeft = { anchor = Vector2.new(0, 0), positionFn = function(viewport, size) 
        return Vector2.new(size.X / 2, size.Y / 2) 
    end },
    TopRight = { anchor = Vector2.new(1, 0), positionFn = function(viewport, size) 
        return Vector2.new(viewport.X - size.X / 2, size.Y / 2) 
    end },
    BottomLeft = { anchor = Vector2.new(0, 1), positionFn = function(viewport, size) 
        return Vector2.new(size.X / 2, viewport.Y - size.Y / 2) 
    end },
    BottomRight = { anchor = Vector2.new(1, 1), positionFn = function(viewport, size) 
        return Vector2.new(viewport.X - size.X / 2, viewport.Y - size.Y / 2) 
    end },
}

function DockingManager.new()
    if instance then return instance end
    
    local self = setmetatable({}, DockingManager)
    
    self.State = DockState.new()
    self.Animation = AnimationController.new()
    self.Input = InputHandler.new()
    self.Persistence = PersistenceService.new()
    
    -- Config
    self.SnapThreshold = 50
    self.EnableConflictResolution = true
    self.PreserveSize = true -- User preference: keep original size on dock
    
    instance = self
    return self
end

function DockingManager:GetInstance()
    return instance or DockingManager.new()
end

-- Register a panel with the docking system
function DockingManager:RegisterPanel(panel, config)
    local panelId = config.Id or tostring(panel)
    
    self.State:RegisterPanel(panelId, panel, config)
    
    -- Create preview frame if not exists
    if not self.Input.PreviewFrame and panel.Root and panel.Root.Parent then
        self.Input:CreatePreviewFrame(panel.Root.Parent)
    end
    
    return panelId
end

-- Unregister a panel
function DockingManager:UnregisterPanel(panel)
    local panelId = self:_getPanelId(panel)
    if panelId then
        self.State:UnregisterPanel(panelId)
    end
end

-- Get dock zone at position
function DockingManager:GetDockZone(position)
    return self.Input:GetDockZone(position)
end

-- Dock a panel to an edge/corner
function DockingManager:Dock(panel, edge, motors)
    local panelId = self:_getPanelId(panel)
    if not panelId or not edge then return false end
    
    local viewport = Camera.ViewportSize
    local zoneConfig = ZoneConfigs[edge]
    if not zoneConfig then return false end
    
    -- Conflict resolution
    if self.EnableConflictResolution then
        local conflict = self:_resolveConflict(edge, panelId)
        if conflict then
            -- Move conflicting panel elsewhere
            self:Undock(conflict.Panel)
        end
    end
    
    -- Get current size (preserve original)
    local currentSize = panel.Root and panel.Root.AbsoluteSize or Vector2.new(300, 200)
    local targetPos = zoneConfig.positionFn(viewport, currentSize)
    
    -- Update state
    self.State:SetPanelDocked(panelId, edge, targetPos, currentSize)
    
    -- Animate to dock position with overshoot effect
    if motors and motors.Position then
        self.Animation:AnimateWithOvershoot(motors.Position, targetPos.X, targetPos.Y, edge)
    end
    
    -- Mark as docked on panel (and trigger UI updates)
    if panel.ApplyDockState then
        panel:ApplyDockState(true, edge)
    else
        -- Fallback for non-UniversalPanel components
        panel.IsDocked = true
        panel.DockPosition = edge
    end
    
    return true
end

-- Undock a panel
function DockingManager:Undock(panel, motors)
    local panelId = self:_getPanelId(panel)
    if not panelId then return false end
    
    self.State:SetPanelUndocked(panelId)
    
    if panel.ApplyDockState then
        panel:ApplyDockState(false)
    else
        panel.IsDocked = false
        panel.DockPosition = nil
    end
    
    return true
end

-- Bring panel to front (focus)
-- ... (skipping unchanged code)

-- Restore saved state
function DockingManager:RestoreState()
    local stateData = self.Persistence:Load("DockState")
    if stateData then
        self.State:Deserialize(stateData)
        -- Apply restored state to panels
        for id, panelData in pairs(self.State.Panels) do
            if panelData.Panel and panelData.Edge then
                if panelData.Panel.ApplyDockState then
                    panelData.Panel:ApplyDockState(true, panelData.Edge)
                else
                    panelData.Panel.IsDocked = true
                    panelData.Panel.DockPosition = panelData.Edge
                end
            end
        end
    end
end

-- Set animation profile
function DockingManager:SetAnimationProfile(profile)
    self.Animation:SetProfile(profile)
end

-- Set snap threshold
function DockingManager:SetSnapThreshold(pixels)
    self.SnapThreshold = pixels
    self.Input:SetSnapThreshold(pixels)
end

-- Internal: Get panel ID
function DockingManager:_getPanelId(panel)
    for id, data in pairs(self.State.Panels) do
        if data.Panel == panel then
            return id
        end
    end
    return nil
end

-- Internal: Resolve dock conflicts
function DockingManager:_resolveConflict(edge, incomingPanelId)
    local occupants = self.State:GetPanelsAtZone(edge)
    
    for _, id in ipairs(occupants) do
        if id ~= incomingPanelId then
            local data = self.State.Panels[id]
            if data then
                return data
            end
        end
    end
    
    return nil
end

-- Group management
function DockingManager:CreateGroup(panels, edge)
    local groupId = "group_" .. os.tick()
    local panelIds = {}
    
    for _, panel in ipairs(panels) do
        local id = self:_getPanelId(panel)
        if id then
            table.insert(panelIds, id)
        end
    end
    
    self.State.Groups[groupId] = {
        Panels = panelIds,
        Edge = edge,
        Collapsed = false,
    }
    
    return groupId
end

function DockingManager:CollapseGroup(groupId)
    local group = self.State.Groups[groupId]
    if group then
        group.Collapsed = true
        for _, panelId in ipairs(group.Panels) do
            local data = self.State.Panels[panelId]
            if data and data.Panel then
                data.Panel:Minimize()
            end
        end
    end
end

function DockingManager:ExpandGroup(groupId)
    local group = self.State.Groups[groupId]
    if group then
        group.Collapsed = false
        for _, panelId in ipairs(group.Panels) do
            local data = self.State.Panels[panelId]
            if data and data.Panel then
                data.Panel:Expand()
            end
        end
    end
end

return DockingManager
 end,
    [30] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(30)--[[
    InputHandler.lua - Centralized input processing for docking
    
    Features:
    - Drag detection with start/move/end events
    - Visual dock preview
    - Touch support
    - Focus priority system
]]

local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local InputHandler = {}
InputHandler.__index = InputHandler

-- Singleton
local instance = nil

function InputHandler.new()
    if instance then return instance end
    
    local self = setmetatable({}, InputHandler)
    
    -- Event signals
    self._dragStartedCallbacks = {}
    self._dragMovedCallbacks = {}
    self._dragEndedCallbacks = {}
    
    -- State
    self.IsDragging = false
    self.CurrentPanel = nil
    self.DragStartPos = nil
    self.DragInput = nil
    
    -- Dock preview frame
    self.PreviewFrame = nil
    self.PreviewVisible = false
    
    -- Snap threshold
    self.SnapThreshold = 50
    
    instance = self
    return self
end

function InputHandler:GetInstance()
    return instance or InputHandler.new()
end

-- Event registration
function InputHandler:OnDragStarted(callback)
    table.insert(self._dragStartedCallbacks, callback)
end

function InputHandler:OnDragMoved(callback)
    table.insert(self._dragMovedCallbacks, callback)
end

function InputHandler:OnDragEnded(callback)
    table.insert(self._dragEndedCallbacks, callback)
end

-- Fire events (with nil-guard for safety)
function InputHandler:_fireDragStarted(panel, position)
    local callbacks = self._dragStartedCallbacks or {}
    for _, callback in ipairs(callbacks) do
        task.spawn(callback, panel, position)
    end
end

function InputHandler:_fireDragMoved(panel, position, delta)
    local callbacks = self._dragMovedCallbacks or {}
    for _, callback in ipairs(callbacks) do
        task.spawn(callback, panel, position, delta)
    end
end

function InputHandler:_fireDragEnded(panel, position, dockZone)
    local callbacks = self._dragEndedCallbacks or {}
    for _, callback in ipairs(callbacks) do
        task.spawn(callback, panel, position, dockZone)
    end
end

-- Start drag operation
function InputHandler:StartDrag(panel, input)
    self.IsDragging = true
    self.CurrentPanel = panel
    self.DragStartPos = input.Position
    self.DragInput = input
    
    self:_fireDragStarted(panel, input.Position)
end

-- Update drag position
function InputHandler:UpdateDrag(position, delta)
    if not self.IsDragging then return end
    
    local dockZone = self:GetDockZone(position)
    
    -- Update preview
    if dockZone then
        self:ShowDockPreview(dockZone)
    else
        self:HideDockPreview()
    end
    
    self:_fireDragMoved(self.CurrentPanel, position, delta)
    
    return dockZone
end

-- End drag operation
function InputHandler:EndDrag(position)
    if not self.IsDragging then return end
    
    local dockZone = self:GetDockZone(position)
    
    self:HideDockPreview()
    self:_fireDragEnded(self.CurrentPanel, position, dockZone)
    
    self.IsDragging = false
    self.CurrentPanel = nil
    self.DragStartPos = nil
    self.DragInput = nil
    
    return dockZone
end

-- Dock zone detection (edges + corners)
function InputHandler:GetDockZone(position)
    -- Defensive: ensure we have a valid Camera
    local cam = workspace.CurrentCamera
    if not cam then return nil end
    
    local viewport = cam.ViewportSize
    local threshold = self.SnapThreshold or 50 -- Fallback default
    
    -- Guard against nil position
    if not position or typeof(position) ~= "Vector3" then return nil end
    
    local nearTop = position.Y < threshold
    local nearBottom = position.Y > viewport.Y - threshold
    local nearLeft = position.X < threshold
    local nearRight = position.X > viewport.X - threshold
    
    -- Corners first (more specific)
    if nearTop and nearLeft then
        return "TopLeft"
    elseif nearTop and nearRight then
        return "TopRight"
    elseif nearBottom and nearLeft then
        return "BottomLeft"
    elseif nearBottom and nearRight then
        return "BottomRight"
    end
    
    -- Edges
    if nearTop then
        return "Top"
    elseif nearBottom then
        return "Bottom"
    elseif nearLeft then
        return "Left"
    elseif nearRight then
        return "Right"
    end
    
    return nil
end

-- Create dock preview frame
function InputHandler:CreatePreviewFrame(parent)
    self.PreviewFrame = Creator.New("Frame", {
        Name = "DockPreview",
        Size = UDim2.new(0, 100, 0, 100),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 0.7,
        Visible = false,
        ZIndex = 999,
        Parent = parent,
        ThemeTag = { BackgroundColor3 = "Accent" },
    }, {
        Creator.New("UICorner", { CornerRadius = UDim.new(0, 8) }),
        Creator.New("UIStroke", { 
            Thickness = 2,
            ThemeTag = { Color = "Accent" },
        }),
    })
    
    return self.PreviewFrame
end

-- Show dock preview at zone
function InputHandler:ShowDockPreview(zone)
    if not self.PreviewFrame then return end
    
    local viewport = Camera.ViewportSize
    local layouts = {
        Top = { Size = UDim2.new(1, -20, 0, 150), Position = UDim2.new(0.5, 0, 0, 85), Anchor = Vector2.new(0.5, 0.5) },
        Bottom = { Size = UDim2.new(1, -20, 0, 150), Position = UDim2.new(0.5, 0, 1, -85), Anchor = Vector2.new(0.5, 0.5) },
        Left = { Size = UDim2.new(0, 200, 1, -20), Position = UDim2.new(0, 110, 0.5, 0), Anchor = Vector2.new(0.5, 0.5) },
        Right = { Size = UDim2.new(0, 200, 1, -20), Position = UDim2.new(1, -110, 0.5, 0), Anchor = Vector2.new(0.5, 0.5) },
        TopLeft = { Size = UDim2.new(0, 200, 0, 150), Position = UDim2.new(0, 110, 0, 85), Anchor = Vector2.new(0.5, 0.5) },
        TopRight = { Size = UDim2.new(0, 200, 0, 150), Position = UDim2.new(1, -110, 0, 85), Anchor = Vector2.new(0.5, 0.5) },
        BottomLeft = { Size = UDim2.new(0, 200, 0, 150), Position = UDim2.new(0, 110, 1, -85), Anchor = Vector2.new(0.5, 0.5) },
        BottomRight = { Size = UDim2.new(0, 200, 0, 150), Position = UDim2.new(1, -110, 1, -85), Anchor = Vector2.new(0.5, 0.5) },
    }
    
    local layout = layouts[zone]
    if layout then
        self.PreviewFrame.Size = layout.Size
        self.PreviewFrame.Position = layout.Position
        self.PreviewFrame.AnchorPoint = layout.Anchor
        self.PreviewFrame.Visible = true
        self.PreviewVisible = true
    end
end

-- Hide dock preview
function InputHandler:HideDockPreview()
    if self.PreviewFrame then
        self.PreviewFrame.Visible = false
        self.PreviewVisible = false
    end
end

-- Set snap threshold
function InputHandler:SetSnapThreshold(pixels)
    self.SnapThreshold = pixels
end

return InputHandler
 end,
    [31] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(31)--[[
    PersistenceService.lua - Local cache for dock state persistence
    
    Uses simple in-memory cache with optional file persistence
    (via writefile if available in executor environment)
]]

local HttpService = game:GetService("HttpService")

local PersistenceService = {}
PersistenceService.__index = PersistenceService

-- Singleton
local instance = nil

function PersistenceService.new()
    if instance then return instance end
    
    local self = setmetatable({}, PersistenceService)
    
    self.CacheKey = "FluentDockState"
    self.Cache = {}
    self.AutoSaveEnabled = true
    self.AutoSaveDelay = 2 -- seconds
    self._pendingSave = false
    
    instance = self
    return self
end

function PersistenceService:GetInstance()
    return instance or PersistenceService.new()
end

-- Save state to cache
function PersistenceService:Save(key, data)
    self.Cache[key] = data
    
    -- Attempt file persistence if available
    if self.AutoSaveEnabled then
        self:_queueFileSave()
    end
end

-- Load state from cache
function PersistenceService:Load(key)
    -- Try to load from file first
    self:_loadFromFile()
    return self.Cache[key]
end

-- Clear cached state
function PersistenceService:Clear(key)
    if key then
        self.Cache[key] = nil
    else
        self.Cache = {}
    end
end

-- Queue file save (debounced)
function PersistenceService:_queueFileSave()
    if self._pendingSave then return end
    
    self._pendingSave = true
    task.delay(self.AutoSaveDelay, function()
        self:_saveToFile()
        self._pendingSave = false
    end)
end

-- Save to file (if writefile available)
function PersistenceService:_saveToFile()
    local success, _ = pcall(function()
        if writefile then
            local json = HttpService:JSONEncode(self.Cache)
            writefile(self.CacheKey .. ".json", json)
        end
    end)
    return success
end

-- Load from file (if readfile available)
function PersistenceService:_loadFromFile()
    local success, _ = pcall(function()
        if readfile and isfile and isfile(self.CacheKey .. ".json") then
            local json = readfile(self.CacheKey .. ".json")
            local data = HttpService:JSONDecode(json)
            if data then
                self.Cache = data
            end
        end
    end)
    return success
end

-- Configure auto-save
function PersistenceService:SetAutoSave(enabled, delay)
    self.AutoSaveEnabled = enabled
    if delay then
        self.AutoSaveDelay = delay
    end
end

return PersistenceService
 end,
    [32] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(32)local Elements = {}

for _, Theme in next, script:GetChildren() do
	table.insert(Elements, require(Theme))
end

return Elements
 end,
    [33] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(33)local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local New = Creator.New
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "Button"

function Element:New(Config)
	assert(Config.Title, "Button - Missing Title")
	Config.Callback = Config.Callback or function() end

	local ButtonFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, true)

	local ButtonIco = New("ImageLabel", {
		Image = "rbxassetid://10709791437",
		Size = UDim2.fromOffset(16, 16),
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -10, 0.5, 0),
		BackgroundTransparency = 1,
		Parent = ButtonFrame.Frame,
		ThemeTag = {
			ImageColor3 = "Text",
		},
	})

	Creator.AddSignal(ButtonFrame.Frame.MouseButton1Click, function()
		self.Library:SafeCallback(Config.Callback)
	end)

	return ButtonFrame
end

return Element
 end,
    [34] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(34)local UserInputService = game:GetService("UserInputService")
local TouchInputService = game:GetService("TouchInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local RenderStepped = RunService.RenderStepped
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local New = Creator.New
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "Colorpicker"

function Element:New(Idx, Config)
	local Library = self.Library
	assert(Config.Title, "Colorpicker - Missing Title")
	assert(Config.Default, "AddColorPicker: Missing default value.")

	local Colorpicker = {
		Value = Config.Default,
		Transparency = Config.Transparency or 0,
		Type = "Colorpicker",
		Title = type(Config.Title) == "string" and Config.Title or "Colorpicker",
		Callback = Config.Callback or function(Color) end,
	}

	function Colorpicker:SetHSVFromRGB(Color)
		local H, S, V = Color3.toHSV(Color)
		Colorpicker.Hue = H
		Colorpicker.Sat = S
		Colorpicker.Vib = V
	end

	Colorpicker:SetHSVFromRGB(Colorpicker.Value)

	local ColorpickerFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, true)

	Colorpicker.SetTitle = ColorpickerFrame.SetTitle
	Colorpicker.SetDesc = ColorpickerFrame.SetDesc

	local DisplayFrameColor = New("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Colorpicker.Value,
		Parent = ColorpickerFrame.Frame,
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 4),
		}),
	})

	local DisplayFrame = New("ImageLabel", {
		Size = UDim2.fromOffset(26, 26),
		Position = UDim2.new(1, -10, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		Parent = ColorpickerFrame.Frame,
		Image = "http://www.roblox.com/asset/?id=14204231522",
		ImageTransparency = 0.45,
		ScaleType = Enum.ScaleType.Tile,
		TileSize = UDim2.fromOffset(40, 40),
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 4),
		}),
		DisplayFrameColor,
	})

	local function CreateColorDialog()
		local Dialog = require(Components.Dialog):Create()
		Dialog.Title.Text = Colorpicker.Title
		Dialog.Root.Size = UDim2.fromOffset(430, 330)

		local Hue, Sat, Vib = Colorpicker.Hue, Colorpicker.Sat, Colorpicker.Vib
		local Transparency = Colorpicker.Transparency

		local function CreateInput()
			local Box = require(Components.Textbox)()
			Box.Frame.Parent = Dialog.Root
			Box.Frame.Size = UDim2.new(0, 90, 0, 32)

			return Box
		end

		local function CreateInputLabel(Text, Pos)
			return New("TextLabel", {
				FontFace = Font.new(
					"rbxasset://fonts/families/GothamSSm.json",
					Enum.FontWeight.Medium,
					Enum.FontStyle.Normal
				),
				Text = Text,
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, 32),
				Position = Pos,
				BackgroundTransparency = 1,
				Parent = Dialog.Root,
				ThemeTag = {
					TextColor3 = "Text",
				},
			})
		end

		local function GetRGB()
			local Value = Color3.fromHSV(Hue, Sat, Vib)
			return { R = math.floor(Value.r * 255), G = math.floor(Value.g * 255), B = math.floor(Value.b * 255) }
		end

		local SatCursor = New("ImageLabel", {
			Size = UDim2.new(0, 18, 0, 18),
			ScaleType = Enum.ScaleType.Fit,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=4805639000",
		})

		local SatVibMap = New("ImageLabel", {
			Size = UDim2.fromOffset(180, 160),
			Position = UDim2.fromOffset(20, 55),
			Image = "rbxassetid://4155801252",
			BackgroundColor3 = Colorpicker.Value,
			BackgroundTransparency = 0,
			Parent = Dialog.Root,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
			SatCursor,
		})

		local OldColorFrame = New("Frame", {
			BackgroundColor3 = Colorpicker.Value,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = Colorpicker.Transparency,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
		})

		local OldColorFrameChecker = New("ImageLabel", {
			Image = "http://www.roblox.com/asset/?id=14204231522",
			ImageTransparency = 0.45,
			ScaleType = Enum.ScaleType.Tile,
			TileSize = UDim2.fromOffset(40, 40),
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(112, 220),
			Size = UDim2.fromOffset(88, 24),
			Parent = Dialog.Root,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
			New("UIStroke", {
				Thickness = 2,
				Transparency = 0.75,
			}),
			OldColorFrame,
		})

		local DialogDisplayFrame = New("Frame", {
			BackgroundColor3 = Colorpicker.Value,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 0,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
		})

		local DialogDisplayFrameChecker = New("ImageLabel", {
			Image = "http://www.roblox.com/asset/?id=14204231522",
			ImageTransparency = 0.45,
			ScaleType = Enum.ScaleType.Tile,
			TileSize = UDim2.fromOffset(40, 40),
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(20, 220),
			Size = UDim2.fromOffset(88, 24),
			Parent = Dialog.Root,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
			New("UIStroke", {
				Thickness = 2,
				Transparency = 0.75,
			}),
			DialogDisplayFrame,
		})

		local SequenceTable = {}

		for Color = 0, 1, 0.1 do
			table.insert(SequenceTable, ColorSequenceKeypoint.new(Color, Color3.fromHSV(Color, 1, 1)))
		end

		local HueSliderGradient = New("UIGradient", {
			Color = ColorSequence.new(SequenceTable),
			Rotation = 90,
		})

		local HueDragHolder = New("Frame", {
			Size = UDim2.new(1, 0, 1, -10),
			Position = UDim2.fromOffset(0, 5),
			BackgroundTransparency = 1,
		})

		local HueDrag = New("ImageLabel", {
			Size = UDim2.fromOffset(14, 14),
			Image = "http://www.roblox.com/asset/?id=12266946128",
			Parent = HueDragHolder,
			ThemeTag = {
				ImageColor3 = "DialogInput",
			},
		})

		local HueSlider = New("Frame", {
			Size = UDim2.fromOffset(12, 190),
			Position = UDim2.fromOffset(210, 55),
			Parent = Dialog.Root,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(1, 0),
			}),
			HueSliderGradient,
			HueDragHolder,
		})

		local HexInput = CreateInput()
		HexInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 55)
		CreateInputLabel("Hex", UDim2.fromOffset(Config.Transparency and 360 or 340, 55))

		local RedInput = CreateInput()
		RedInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 95)
		CreateInputLabel("Red", UDim2.fromOffset(Config.Transparency and 360 or 340, 95))

		local GreenInput = CreateInput()
		GreenInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 135)
		CreateInputLabel("Green", UDim2.fromOffset(Config.Transparency and 360 or 340, 135))

		local BlueInput = CreateInput()
		BlueInput.Frame.Position = UDim2.fromOffset(Config.Transparency and 260 or 240, 175)
		CreateInputLabel("Blue", UDim2.fromOffset(Config.Transparency and 360 or 340, 175))

		local AlphaInput
		if Config.Transparency then
			AlphaInput = CreateInput()
			AlphaInput.Frame.Position = UDim2.fromOffset(260, 215)
			CreateInputLabel("Alpha", UDim2.fromOffset(360, 215))
		end

		local TransparencySlider, TransparencyDrag, TransparencyColor
		if Config.Transparency then
			local TransparencyDragHolder = New("Frame", {
				Size = UDim2.new(1, 0, 1, -10),
				Position = UDim2.fromOffset(0, 5),
				BackgroundTransparency = 1,
			})

			TransparencyDrag = New("ImageLabel", {
				Size = UDim2.fromOffset(14, 14),
				Image = "http://www.roblox.com/asset/?id=12266946128",
				Parent = TransparencyDragHolder,
				ThemeTag = {
					ImageColor3 = "DialogInput",
				},
			})

			TransparencyColor = New("Frame", {
				Size = UDim2.fromScale(1, 1),
			}, {
				New("UIGradient", {
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(1, 1),
					}),
					Rotation = 270,
				}),
				New("UICorner", {
					CornerRadius = UDim.new(1, 0),
				}),
			})

			TransparencySlider = New("Frame", {
				Size = UDim2.fromOffset(12, 190),
				Position = UDim2.fromOffset(230, 55),
				Parent = Dialog.Root,
				BackgroundTransparency = 1,
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(1, 0),
				}),
				New("ImageLabel", {
					Image = "http://www.roblox.com/asset/?id=14204231522",
					ImageTransparency = 0.45,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.fromOffset(40, 40),
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Parent = Dialog.Root,
				}, {
					New("UICorner", {
						CornerRadius = UDim.new(1, 0),
					}),
				}),
				TransparencyColor,
				TransparencyDragHolder,
			})
		end

		local function Display()
			SatVibMap.BackgroundColor3 = Color3.fromHSV(Hue, 1, 1)
			HueDrag.Position = UDim2.new(0, -1, Hue, -6)
			SatCursor.Position = UDim2.new(Sat, 0, 1 - Vib, 0)
			DialogDisplayFrame.BackgroundColor3 = Color3.fromHSV(Hue, Sat, Vib)

			HexInput.Input.Text = "#" .. Color3.fromHSV(Hue, Sat, Vib):ToHex()
			RedInput.Input.Text = GetRGB()["R"]
			GreenInput.Input.Text = GetRGB()["G"]
			BlueInput.Input.Text = GetRGB()["B"]

			if Config.Transparency then
				TransparencyColor.BackgroundColor3 = Color3.fromHSV(Hue, Sat, Vib)
				DialogDisplayFrame.BackgroundTransparency = Transparency
				TransparencyDrag.Position = UDim2.new(0, -1, 1 - Transparency, -6)
				AlphaInput.Input.Text = require(Root):Round((1 - Transparency) * 100, 0) .. "%"
			end
		end

		Creator.AddSignal(HexInput.Input.FocusLost, function(Enter)
			if Enter then
				local Success, Result = pcall(Color3.fromHex, HexInput.Input.Text)
				if Success and typeof(Result) == "Color3" then
					Hue, Sat, Vib = Color3.toHSV(Result)
				end
			end
			Display()
		end)

		Creator.AddSignal(RedInput.Input.FocusLost, function(Enter)
			if Enter then
				local CurrentColor = GetRGB()
				local Success, Result = pcall(Color3.fromRGB, RedInput.Input.Text, CurrentColor["G"], CurrentColor["B"])
				if Success and typeof(Result) == "Color3" then
					if tonumber(RedInput.Input.Text) <= 255 then
						Hue, Sat, Vib = Color3.toHSV(Result)
					end
				end
			end
			Display()
		end)

		Creator.AddSignal(GreenInput.Input.FocusLost, function(Enter)
			if Enter then
				local CurrentColor = GetRGB()
				local Success, Result =
					pcall(Color3.fromRGB, CurrentColor["R"], GreenInput.Input.Text, CurrentColor["B"])
				if Success and typeof(Result) == "Color3" then
					if tonumber(GreenInput.Input.Text) <= 255 then
						Hue, Sat, Vib = Color3.toHSV(Result)
					end
				end
			end
			Display()
		end)

		Creator.AddSignal(BlueInput.Input.FocusLost, function(Enter)
			if Enter then
				local CurrentColor = GetRGB()
				local Success, Result =
					pcall(Color3.fromRGB, CurrentColor["R"], CurrentColor["G"], BlueInput.Input.Text)
				if Success and typeof(Result) == "Color3" then
					if tonumber(BlueInput.Input.Text) <= 255 then
						Hue, Sat, Vib = Color3.toHSV(Result)
					end
				end
			end
			Display()
		end)

		if Config.Transparency then
			Creator.AddSignal(AlphaInput.Input.FocusLost, function(Enter)
				if Enter then
					pcall(function()
						local Value = tonumber(AlphaInput.Input.Text)
						if Value >= 0 and Value <= 100 then
							Transparency = 1 - Value * 0.01
						end
					end)
				end
				Display()
			end)
		end

		Creator.AddSignal(SatVibMap.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
					local MinX = SatVibMap.AbsolutePosition.X
					local MaxX = MinX + SatVibMap.AbsoluteSize.X
					local MouseX = math.clamp(Mouse.X, MinX, MaxX)

					local MinY = SatVibMap.AbsolutePosition.Y
					local MaxY = MinY + SatVibMap.AbsoluteSize.Y
					local MouseY = math.clamp(Mouse.Y, MinY, MaxY)

					Sat = (MouseX - MinX) / (MaxX - MinX)
					Vib = 1 - ((MouseY - MinY) / (MaxY - MinY))
					Display()

					RenderStepped:Wait()
				end
			end
		end)

		Creator.AddSignal(HueSlider.InputBegan, function(Input)
			if
				Input.UserInputType == Enum.UserInputType.MouseButton1
				or Input.UserInputType == Enum.UserInputType.Touch
			then
				while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
					local MinY = HueSlider.AbsolutePosition.Y
					local MaxY = MinY + HueSlider.AbsoluteSize.Y
					local MouseY = math.clamp(Mouse.Y, MinY, MaxY)

					Hue = ((MouseY - MinY) / (MaxY - MinY))
					Display()

					RenderStepped:Wait()
				end
			end
		end)

		if Config.Transparency then
			Creator.AddSignal(TransparencySlider.InputBegan, function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						local MinY = TransparencySlider.AbsolutePosition.Y
						local MaxY = MinY + TransparencySlider.AbsoluteSize.Y
						local MouseY = math.clamp(Mouse.Y, MinY, MaxY)

						Transparency = 1 - ((MouseY - MinY) / (MaxY - MinY))
						Display()

						RenderStepped:Wait()
					end
				end
			end)
		end

		Display()

		Dialog:Button("Done", function()
			Colorpicker:SetValue({ Hue, Sat, Vib }, Transparency)
		end)
		Dialog:Button("Cancel")
		Dialog:Open()
	end

	function Colorpicker:Display()
		Colorpicker.Value = Color3.fromHSV(Colorpicker.Hue, Colorpicker.Sat, Colorpicker.Vib)

		DisplayFrameColor.BackgroundColor3 = Colorpicker.Value
		DisplayFrameColor.BackgroundTransparency = Colorpicker.Transparency

		Element.Library:SafeCallback(Colorpicker.Callback, Colorpicker.Value)
		Element.Library:SafeCallback(Colorpicker.Changed, Colorpicker.Value)
	end

	function Colorpicker:SetValue(HSV, Transparency)
		local Color = Color3.fromHSV(HSV[1], HSV[2], HSV[3])

		Colorpicker.Transparency = Transparency or 0
		Colorpicker:SetHSVFromRGB(Color)
		Colorpicker:Display()
	end

	function Colorpicker:SetValueRGB(Color, Transparency)
		Colorpicker.Transparency = Transparency or 0
		Colorpicker:SetHSVFromRGB(Color)
		Colorpicker:Display()
	end

	function Colorpicker:OnChanged(Func)
		Colorpicker.Changed = Func
		Func(Colorpicker.Value)
	end

	function Colorpicker:Destroy()
		ColorpickerFrame:Destroy()
		Library.Options[Idx] = nil
	end

	Creator.AddSignal(ColorpickerFrame.Frame.MouseButton1Click, function()
		CreateColorDialog()
	end)

	Colorpicker:Display()

	Library.Options[Idx] = Colorpicker
	return Colorpicker
end

return Element
 end,
    [35] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(35)local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Camera = game:GetService("Workspace").CurrentCamera

local Root = script.Parent.Parent
local Creator = require(Root.Creator)
local Flipper = require(Root.Packages.Flipper)

local New = Creator.New
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "ComboBox"

function Element:New(Idx, Config)
	local Library = self.Library

	local ComboBox = {
		Values = Config.Values or {},
		Value = Config.Default or "",
		Buttons = {},
		Opened = false,
		Type = "ComboBox",
		Callback = Config.Callback or function() end,
	}

	-- Create base element frame (60px height for input + dropdown toggle)
	local ComboBoxFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, false)
	ComboBoxFrame.DescLabel.Size = UDim2.new(1, -170, 0, 14)

	ComboBox.SetTitle = ComboBoxFrame.SetTitle
	ComboBox.SetDesc = ComboBoxFrame.SetDesc

	-- Container for input and dropdown toggle (side-by-side)
	local ComboContainer = New("Frame", {
		Size = UDim2.fromOffset(160, 30),
		Position = UDim2.new(1, -10, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Parent = ComboBoxFrame.Frame,
	})

	-- Input field (main styling is handled by Textbox component)
	local Textbox = require(Components.Textbox)(ComboContainer, true)
	Textbox.Frame.Position = UDim2.fromOffset(0, 0)
	Textbox.Frame.AnchorPoint = Vector2.new(0, 0)
	Textbox.Frame.Size = UDim2.fromScale(1, 1)
	Textbox.Input.Text = Config.Default or ""
	Textbox.Input.PlaceholderText = Config.Placeholder or "Type or select..."
	
	-- Adjust Input Container to leave room for the button on the right
	-- Default is Size = UDim2.new(1, -12, 1, 0). We need to subtract button width (30px)
	Textbox.Container.Size = UDim2.new(1, -42, 1, 0)

	-- Dropdown toggle button (Embedded inside Textbox frame)
	local DropdownToggle = New("TextButton", {
		Size = UDim2.fromOffset(30, 30),
		Position = UDim2.new(1, 0, 0, 0),
		AnchorPoint = Vector2.new(1, 0),
		BackgroundTransparency = 1,
		Parent = Textbox.Frame,
		Text = "",
		ThemeTag = {
			-- BackgroundColor3 = "DropdownFrame", -- Removed for embedded look
			-- Gradient = "DropdownFrameGradient", -- Removed for embedded look
		},
	}, {
		-- New("UICorner", { CornerRadius = UDim.new(0, 5) }), -- Removed since parent has corner
		-- New("UIStroke", { ... }), -- Removed to blend in
		New("ImageLabel", {
			Image = "rbxassetid://10709790948",
			Size = UDim2.fromOffset(16, 16),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundTransparency = 1,
			ThemeTag = {
				ImageColor3 = "SubText",
			},
		}),
	})

	-- Dropdown list container (similar to Dropdown.lua)
	local DropdownListLayout = New("UIListLayout", {
		Padding = UDim.new(0, 3),
	})

	local DropdownScrollFrame = New("ScrollingFrame", {
		Size = UDim2.new(1, -5, 1, -10),
		Position = UDim2.fromOffset(5, 5),
		BackgroundTransparency = 1,
		BottomImage = "rbxassetid://6889812791",
		MidImage = "rbxassetid://6889812721",
		TopImage = "rbxassetid://6276641225",
		ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
		ScrollBarImageTransparency = 0.95,
		ScrollBarThickness = 4,
		BorderSizePixel = 0,
		CanvasSize = UDim2.fromScale(0, 0),
	}, {
		DropdownListLayout,
	})

	local DropdownHolderFrame = New("Frame", {
		Size = UDim2.fromScale(1, 0.6),
		ThemeTag = {
			BackgroundColor3 = "DropdownHolder",
			Gradient = "DropdownHolderGradient",
		},
	}, {
		DropdownScrollFrame,
		New("UICorner", {
			CornerRadius = UDim.new(0, 7),
		}),
		New("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			ThemeTag = {
				Color = "DropdownBorder",
			},
		}),
		New("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554236805",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(23, 23, 277, 277),
			Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
			Position = UDim2.fromOffset(-15, -15),
			ImageColor3 = Color3.fromRGB(0, 0, 0),
			ImageTransparency = 0.1,
		}),
	})

	local DropdownHolderCanvas = New("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(170, 300),
		Parent = self.Library.GUI,
		Visible = false,
	}, {
		DropdownHolderFrame,
		New("UISizeConstraint", {
			MinSize = Vector2.new(170, 0),
		}),
	})
	table.insert(Library.OpenFrames, DropdownHolderCanvas)

	-- Positioning logic for dropdown list
	local function RecalculateListPosition()
		local Add = 0
		if Camera.ViewportSize.Y - ComboContainer.AbsolutePosition.Y < DropdownHolderCanvas.AbsoluteSize.Y - 5 then
			Add = DropdownHolderCanvas.AbsoluteSize.Y
				- 5
				- (Camera.ViewportSize.Y - ComboContainer.AbsolutePosition.Y)
				+ 40
		end
		DropdownHolderCanvas.Position =
			UDim2.fromOffset(ComboContainer.AbsolutePosition.X - 1, ComboContainer.AbsolutePosition.Y - 5 - Add)
	end

	local ListSizeX = 0
	local function RecalculateListSize()
		if #ComboBox.Values > 10 then
			DropdownHolderCanvas.Size = UDim2.fromOffset(ListSizeX, 392)
		else
			DropdownHolderCanvas.Size = UDim2.fromOffset(ListSizeX, DropdownListLayout.AbsoluteContentSize.Y + 10)
		end
	end

	local function RecalculateCanvasSize()
		DropdownScrollFrame.CanvasSize = UDim2.fromOffset(0, DropdownListLayout.AbsoluteContentSize.Y)
	end

	RecalculateListPosition()
	RecalculateListSize()

	Creator.AddSignal(ComboContainer:GetPropertyChangedSignal("AbsolutePosition"), RecalculateListPosition)

	-- Dropdown toggle functionality
	local ScrollFrame = self.ScrollFrame
	function ComboBox:Open()
		ComboBox.Opened = true
		ScrollFrame.ScrollingEnabled = false
		DropdownHolderCanvas.Visible = true
		TweenService:Create(
			DropdownHolderFrame,
			TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
			{ Size = UDim2.fromScale(1, 1) }
		):Play()
	end

	function ComboBox:Close()
		ComboBox.Opened = false
		ScrollFrame.ScrollingEnabled = true
		DropdownHolderFrame.Size = UDim2.fromScale(1, 0.6)
		DropdownHolderCanvas.Visible = false
	end

	-- Click outside to close
	Creator.AddSignal(UserInputService.InputBegan, function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			local AbsPos, AbsSize = DropdownHolderFrame.AbsolutePosition, DropdownHolderFrame.AbsoluteSize
			if
				Mouse.X < AbsPos.X
				or Mouse.X > AbsPos.X + AbsSize.X
				or Mouse.Y < (AbsPos.Y - 20 - 1)
				or Mouse.Y > AbsPos.Y + AbsSize.Y
			then
				ComboBox:Close()
			end
		end
	end)

	Creator.AddSignal(DropdownToggle.MouseButton1Click, function()
		if ComboBox.Opened then
			ComboBox:Close()
		else
			ComboBox:Open()
		end
	end)

	-- Input field change handler
	Creator.AddSignal(Textbox.Input:GetPropertyChangedSignal("Text"), function()
		ComboBox.Value = Textbox.Input.Text
		Library:SafeCallback(ComboBox.Callback, ComboBox.Value)
		Library:SafeCallback(ComboBox.Changed, ComboBox.Value)
	end)

	-- Build dropdown list
	function ComboBox:BuildDropdownList()
		local Values = ComboBox.Values
		local Buttons = {}

		for _, Element in next, DropdownScrollFrame:GetChildren() do
			if not Element:IsA("UIListLayout") then
				Element:Destroy()
			end
		end

		for Idx, Value in next, Values do
			local Table = {}

			local ButtonSelector = New("Frame", {
				Size = UDim2.fromOffset(4, 14),
				BackgroundColor3 = Color3.fromRGB(76, 194, 255),
				Position = UDim2.fromOffset(-1, 16),
				AnchorPoint = Vector2.new(0, 0.5),
				ThemeTag = {
					BackgroundColor3 = "Accent",
				},
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 2),
				}),
			})

			local ButtonLabel = New("TextLabel", {
				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
				Text = Value,
				TextColor3 = Color3.fromRGB(200, 200, 200),
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromOffset(10, 0),
				Name = "ButtonLabel",
				ThemeTag = {
					TextColor3 = "Text",
				},
			})

			local Button = New("TextButton", {
				Size = UDim2.new(1, -5, 0, 32),
				BackgroundTransparency = 1,
				ZIndex = 23,
				Text = "",
				Parent = DropdownScrollFrame,
				ThemeTag = {
					BackgroundColor3 = "DropdownOption",
					Gradient = "DropdownOptionGradient",
				},
			}, {
				ButtonSelector,
				ButtonLabel,
				New("UICorner", {
					CornerRadius = UDim.new(0, 6),
				}),
			})

			local Selected = ComboBox.Value == Value

			local BackMotor, SetBackTransparency = Creator.SpringMotor(1, Button, "BackgroundTransparency")
			local SelMotor, SetSelTransparency = Creator.SpringMotor(1, ButtonSelector, "BackgroundTransparency")
			local SelectorSizeMotor = Flipper.SingleMotor.new(6)

			SelectorSizeMotor:onStep(function(value)
				ButtonSelector.Size = UDim2.new(0, 4, 0, value)
			end)

			Creator.AddSignal(Button.MouseEnter, function()
				SetBackTransparency(Selected and 0.85 or 0.89)
			end)
			Creator.AddSignal(Button.MouseLeave, function()
				SetBackTransparency(Selected and 0.89 or 1)
			end)
			Creator.AddSignal(Button.MouseButton1Down, function()
				SetBackTransparency(0.92)
			end)
			Creator.AddSignal(Button.MouseButton1Up, function()
				SetBackTransparency(Selected and 0.85 or 0.89)
			end)

			function Table:UpdateButton()
				Selected = ComboBox.Value == Value
				SetBackTransparency(Selected and 0.89 or 1)
				SelectorSizeMotor:setGoal(Flipper.Spring.new(Selected and 14 or 6, { frequency = 6 }))
				SetSelTransparency(Selected and 0 or 1)
			end

			Creator.AddSignal(ButtonLabel.InputBegan, function(Input)
				if
					Input.UserInputType == Enum.UserInputType.MouseButton1
					or Input.UserInputType == Enum.UserInputType.Touch
				then
					-- Set the value to the selected option
					ComboBox.Value = Value
					Textbox.Input.Text = Value

					-- Update all buttons
					for _, OtherButton in next, Buttons do
						OtherButton:UpdateButton()
					end

					Table:UpdateButton()

					Library:SafeCallback(ComboBox.Callback, ComboBox.Value)
					Library:SafeCallback(ComboBox.Changed, ComboBox.Value)

					-- Close dropdown after selection
					ComboBox:Close()
				end
			end)

			Table:UpdateButton()

			Buttons[Button] = Table
		end

		ListSizeX = 0
		for Button, Table in next, Buttons do
			if Button.ButtonLabel then
				if Button.ButtonLabel.TextBounds.X > ListSizeX then
					ListSizeX = Button.ButtonLabel.TextBounds.X
				end
			end
		end
		ListSizeX = ListSizeX + 30
		if ListSizeX < 160 then
			ListSizeX = 160
		end

		RecalculateCanvasSize()
		RecalculateListSize()
	end

	function ComboBox:SetValues(NewValues)
		if NewValues then
			ComboBox.Values = NewValues
		end
		ComboBox:BuildDropdownList()
	end

	function ComboBox:OnChanged(Func)
		ComboBox.Changed = Func
		Func(ComboBox.Value)
	end

	function ComboBox:SetValue(Val)
		if not Val then
			ComboBox.Value = ""
		else
			ComboBox.Value = Val
		end

		Textbox.Input.Text = ComboBox.Value
		ComboBox:BuildDropdownList()

		Library:SafeCallback(ComboBox.Callback, ComboBox.Value)
		Library:SafeCallback(ComboBox.Changed, ComboBox.Value)
	end

	function ComboBox:Destroy()
		ComboBoxFrame:Destroy()
		DropdownHolderCanvas:Destroy()
		Library.Options[Idx] = nil
	end

	-- Initialize
	ComboBox:BuildDropdownList()

	-- Set default value if provided
	if Config.Default then
		ComboBox:SetValue(Config.Default)
	end

	Library.Options[Idx] = ComboBox
	return ComboBox
end

return Element
 end,
    [36] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(36)local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Camera = game:GetService("Workspace").CurrentCamera

local Root = script.Parent.Parent
local Creator = require(Root.Creator)
local Flipper = require(Root.Packages.Flipper)

local New = Creator.New
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "Dropdown"

function Element:New(Idx, Config)
	local Library = self.Library

	local Dropdown = {
		Values = Config.Values,
		Value = Config.Default,
		Multi = Config.Multi,
		Buttons = {},
		Opened = false,
		Type = "Dropdown",
		Callback = Config.Callback or function() end,
	}

	local DropdownFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, false)
	DropdownFrame.DescLabel.Size = UDim2.new(1, -170, 0, 14)

	Dropdown.SetTitle = DropdownFrame.SetTitle
	Dropdown.SetDesc = DropdownFrame.SetDesc

	local DropdownDisplay = New("TextLabel", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		Text = "Value",
		TextColor3 = Color3.fromRGB(240, 240, 240),
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, -30, 0, 14),
		Position = UDim2.new(0, 8, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	local DropdownIco = New("ImageLabel", {
		Image = "rbxassetid://10709790948",
		Size = UDim2.fromOffset(16, 16),
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -8, 0.5, 0),
		BackgroundTransparency = 1,
		ThemeTag = {
			ImageColor3 = "SubText",
		},
	})

	local DropdownInner = New("TextButton", {
		Size = UDim2.fromOffset(160, 30),
		Position = UDim2.new(1, -10, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 0.9,
		Parent = DropdownFrame.Frame,
		ThemeTag = {
			BackgroundColor3 = "DropdownFrame",
			Gradient = "DropdownFrameGradient",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 5),
		}),
		New("UIStroke", {
			Transparency = 0.5,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			ThemeTag = {
				Color = "InElementBorder",
			},
		}),
		DropdownIco,
		DropdownDisplay,
	})

	local DropdownListLayout = New("UIListLayout", {
		Padding = UDim.new(0, 3),
	})

	local DropdownScrollFrame = New("ScrollingFrame", {
		Size = UDim2.new(1, -5, 1, -10),
		Position = UDim2.fromOffset(5, 5),
		BackgroundTransparency = 1,
		BottomImage = "rbxassetid://6889812791",
		MidImage = "rbxassetid://6889812721",
		TopImage = "rbxassetid://6276641225",
		ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
		ScrollBarImageTransparency = 0.95,
		ScrollBarThickness = 4,
		BorderSizePixel = 0,
		CanvasSize = UDim2.fromScale(0, 0),
	}, {
		DropdownListLayout,
	})

	local DropdownHolderFrame = New("Frame", {
		Size = UDim2.fromScale(1, 0.6),
		ThemeTag = {
			BackgroundColor3 = "DropdownHolder",
			Gradient = "DropdownHolderGradient",
		},
	}, {
		DropdownScrollFrame,
		New("UICorner", {
			CornerRadius = UDim.new(0, 7),
		}),
		New("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			ThemeTag = {
				Color = "DropdownBorder",
			},
		}),
		New("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554236805",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(23, 23, 277, 277),
			Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
			Position = UDim2.fromOffset(-15, -15),
			ImageColor3 = Color3.fromRGB(0, 0, 0),
			ImageTransparency = 0.1,
		}),
	})

	local DropdownHolderCanvas = New("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(170, 300),
		Parent = self.Library.GUI,
		Visible = false,
	}, {
		DropdownHolderFrame,
		New("UISizeConstraint", {
			MinSize = Vector2.new(170, 0),
		}),
	})
	table.insert(Library.OpenFrames, DropdownHolderCanvas)

	local function RecalculateListPosition()
		local Add = 0
		if Camera.ViewportSize.Y - DropdownInner.AbsolutePosition.Y < DropdownHolderCanvas.AbsoluteSize.Y - 5 then
			Add = DropdownHolderCanvas.AbsoluteSize.Y
				- 5
				- (Camera.ViewportSize.Y - DropdownInner.AbsolutePosition.Y)
				+ 40
		end
		DropdownHolderCanvas.Position =
			UDim2.fromOffset(DropdownInner.AbsolutePosition.X - 1, DropdownInner.AbsolutePosition.Y - 5 - Add)
	end

	local ListSizeX = 0
	local function RecalculateListSize()
		if #Dropdown.Values > 10 then
			DropdownHolderCanvas.Size = UDim2.fromOffset(ListSizeX, 392)
		else
			DropdownHolderCanvas.Size = UDim2.fromOffset(ListSizeX, DropdownListLayout.AbsoluteContentSize.Y + 10)
		end
	end

	local function RecalculateCanvasSize()
		DropdownScrollFrame.CanvasSize = UDim2.fromOffset(0, DropdownListLayout.AbsoluteContentSize.Y)
	end

	RecalculateListPosition()
	RecalculateListSize()

	Creator.AddSignal(DropdownInner:GetPropertyChangedSignal("AbsolutePosition"), RecalculateListPosition)

	Creator.AddSignal(DropdownInner.MouseButton1Click, function()
		Dropdown:Open()
	end)

	Creator.AddSignal(UserInputService.InputBegan, function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			local AbsPos, AbsSize = DropdownHolderFrame.AbsolutePosition, DropdownHolderFrame.AbsoluteSize
			if
				Mouse.X < AbsPos.X
				or Mouse.X > AbsPos.X + AbsSize.X
				or Mouse.Y < (AbsPos.Y - 20 - 1)
				or Mouse.Y > AbsPos.Y + AbsSize.Y
			then
				Dropdown:Close()
			end
		end
	end)

	local ScrollFrame = self.ScrollFrame
	function Dropdown:Open()
		Dropdown.Opened = true
		ScrollFrame.ScrollingEnabled = false
		DropdownHolderCanvas.Visible = true
		TweenService:Create(
			DropdownHolderFrame,
			TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
			{ Size = UDim2.fromScale(1, 1) }
		):Play()
	end

	function Dropdown:Close()
		Dropdown.Opened = false
		ScrollFrame.ScrollingEnabled = true
		DropdownHolderFrame.Size = UDim2.fromScale(1, 0.6)
		DropdownHolderCanvas.Visible = false
	end

	function Dropdown:Display()
		local Values = Dropdown.Values
		local Str = ""

		if Config.Multi then
			for Idx, Value in next, Values do
				if Dropdown.Value[Value] then
					Str = Str .. Value .. ", "
				end
			end
			Str = Str:sub(1, #Str - 2)
		else
			Str = Dropdown.Value or ""
		end

		DropdownDisplay.Text = (Str == "" and "--" or Str)
	end

	function Dropdown:GetActiveValues()
		if Config.Multi then
			local T = {}

			for Value, Bool in next, Dropdown.Value do
				table.insert(T, Value)
			end

			return T
		else
			return Dropdown.Value and 1 or 0
		end
	end

	function Dropdown:BuildDropdownList()
		local Values = Dropdown.Values
		local Buttons = {}

		for _, Element in next, DropdownScrollFrame:GetChildren() do
			if not Element:IsA("UIListLayout") then
				Element:Destroy()
			end
		end

		local Count = 0

		for Idx, Value in next, Values do
			local Table = {}

			Count = Count + 1

			local ButtonSelector = New("Frame", {
				Size = UDim2.fromOffset(4, 14),
				BackgroundColor3 = Color3.fromRGB(76, 194, 255),
				Position = UDim2.fromOffset(-1, 16),
				AnchorPoint = Vector2.new(0, 0.5),
				ThemeTag = {
					BackgroundColor3 = "Accent",
				},
			}, {
				New("UICorner", {
					CornerRadius = UDim.new(0, 2),
				}),
			})

			local ButtonLabel = New("TextLabel", {
				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
				Text = Value,
				TextColor3 = Color3.fromRGB(200, 200, 200),
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromOffset(10, 0),
				Name = "ButtonLabel",
				ThemeTag = {
					TextColor3 = "Text",
				},
			})

			local Button = New("TextButton", {
				Size = UDim2.new(1, -5, 0, 32),
				BackgroundTransparency = 1,
				ZIndex = 23,
				Text = "",
				Parent = DropdownScrollFrame,
				ThemeTag = {
					BackgroundColor3 = "DropdownOption",
					Gradient = "DropdownOptionGradient",
				},
			}, {
				ButtonSelector,
				ButtonLabel,
				New("UICorner", {
					CornerRadius = UDim.new(0, 6),
				}),
			})

			local Selected

			if Config.Multi then
				Selected = Dropdown.Value[Value]
			else
				Selected = Dropdown.Value == Value
			end

			local BackMotor, SetBackTransparency = Creator.SpringMotor(1, Button, "BackgroundTransparency")
			local SelMotor, SetSelTransparency = Creator.SpringMotor(1, ButtonSelector, "BackgroundTransparency")
			local SelectorSizeMotor = Flipper.SingleMotor.new(6)

			SelectorSizeMotor:onStep(function(value)
				ButtonSelector.Size = UDim2.new(0, 4, 0, value)
			end)

			Creator.AddSignal(Button.MouseEnter, function()
				SetBackTransparency(Selected and 0.85 or 0.89)
			end)
			Creator.AddSignal(Button.MouseLeave, function()
				SetBackTransparency(Selected and 0.89 or 1)
			end)
			Creator.AddSignal(Button.MouseButton1Down, function()
				SetBackTransparency(0.92)
			end)
			Creator.AddSignal(Button.MouseButton1Up, function()
				SetBackTransparency(Selected and 0.85 or 0.89)
			end)

			function Table:UpdateButton()
				if Config.Multi then
					Selected = Dropdown.Value[Value]
					if Selected then
						SetBackTransparency(0.89)
					end
				else
					Selected = Dropdown.Value == Value
					SetBackTransparency(Selected and 0.89 or 1)
				end

				SelectorSizeMotor:setGoal(Flipper.Spring.new(Selected and 14 or 6, { frequency = 6 }))
				SetSelTransparency(Selected and 0 or 1)
			end

			ButtonLabel.InputBegan:Connect(function(Input)
				if
					Input.UserInputType == Enum.UserInputType.MouseButton1
					or Input.UserInputType == Enum.UserInputType.Touch
				then
					local Try = not Selected

					if Dropdown:GetActiveValues() == 1 and not Try and not Config.AllowNull then
					else
						if Config.Multi then
							Selected = Try
							Dropdown.Value[Value] = Selected and true or nil
						else
							Selected = Try
							Dropdown.Value = Selected and Value or nil

							for _, OtherButton in next, Buttons do
								OtherButton:UpdateButton()
							end
						end

						Table:UpdateButton()
						Dropdown:Display()

						Library:SafeCallback(Dropdown.Callback, Dropdown.Value)
						Library:SafeCallback(Dropdown.Changed, Dropdown.Value)
					end
				end
			end)

			Table:UpdateButton()
			Dropdown:Display()

			Buttons[Button] = Table
		end

		ListSizeX = 0
		for Button, Table in next, Buttons do
			if Button.ButtonLabel then
				if Button.ButtonLabel.TextBounds.X > ListSizeX then
					ListSizeX = Button.ButtonLabel.TextBounds.X
				end
			end
		end
		ListSizeX = ListSizeX + 30

		RecalculateCanvasSize()
		RecalculateListSize()
	end

	function Dropdown:SetValues(NewValues)
		if NewValues then
			Dropdown.Values = NewValues
		end

		Dropdown:BuildDropdownList()
	end

	function Dropdown:OnChanged(Func)
		Dropdown.Changed = Func
		Func(Dropdown.Value)
	end

	function Dropdown:SetValue(Val)
		if Dropdown.Multi then
			local nTable = {}

			for Value, Bool in next, Val do
				if table.find(Dropdown.Values, Value) then
					nTable[Value] = true
				end
			end

			Dropdown.Value = nTable
		else
			if not Val then
				Dropdown.Value = nil
			elseif table.find(Dropdown.Values, Val) then
				Dropdown.Value = Val
			end
		end

		Dropdown:BuildDropdownList()

		Library:SafeCallback(Dropdown.Callback, Dropdown.Value)
		Library:SafeCallback(Dropdown.Changed, Dropdown.Value)
	end

	function Dropdown:Destroy()
		DropdownFrame:Destroy()
		Library.Options[Idx] = nil
	end

	Dropdown:BuildDropdownList()
	Dropdown:Display()

	local Defaults = {}

	if type(Config.Default) == "string" then
		local Idx = table.find(Dropdown.Values, Config.Default)
		if Idx then
			table.insert(Defaults, Idx)
		end
	elseif type(Config.Default) == "table" then
		for _, Value in next, Config.Default do
			local Idx = table.find(Dropdown.Values, Value)
			if Idx then
				table.insert(Defaults, Idx)
			end
		end
	elseif type(Config.Default) == "number" and Dropdown.Values[Config.Default] ~= nil then
		table.insert(Defaults, Config.Default)
	end

	if next(Defaults) then
		for i = 1, #Defaults do
			local Index = Defaults[i]
			if Config.Multi then
				Dropdown.Value[Dropdown.Values[Index]] = true
			else
				Dropdown.Value = Dropdown.Values[Index]
			end

			if not Config.Multi then
				break
			end
		end

		Dropdown:BuildDropdownList()
		Dropdown:Display()
	end

	Library.Options[Idx] = Dropdown
	return Dropdown
end

return Element
 end,
    [37] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(37)local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local New = Creator.New
local AddSignal = Creator.AddSignal
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "Input"

function Element:New(Idx, Config)
	local Library = self.Library
	assert(Config.Title, "Input - Missing Title")
	Config.Callback = Config.Callback or function() end

	local Input = {
		Value = Config.Default or "",
		Numeric = Config.Numeric or false,
		Finished = Config.Finished or false,
		Callback = Config.Callback or function(Value) end,
		Type = "Input",
	}

	local InputFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, false)

	Input.SetTitle = InputFrame.SetTitle
	Input.SetDesc = InputFrame.SetDesc

	local Textbox = require(Components.Textbox)(InputFrame.Frame, true)
	Textbox.Frame.Position = UDim2.new(1, -10, 0.5, 0)
	Textbox.Frame.AnchorPoint = Vector2.new(1, 0.5)
	Textbox.Frame.Size = UDim2.fromOffset(160, 30)
	Textbox.Input.Text = Config.Default or ""
	Textbox.Input.PlaceholderText = Config.Placeholder or ""

	local Box = Textbox.Input

	function Input:SetValue(Text)
		if Config.MaxLength and #Text > Config.MaxLength then
			Text = Text:sub(1, Config.MaxLength)
		end

		if Input.Numeric then
			if (not tonumber(Text)) and Text:len() > 0 then
				Text = Input.Value
			end
		end

		Input.Value = Text
		Box.Text = Text

		Library:SafeCallback(Input.Callback, Input.Value)
		Library:SafeCallback(Input.Changed, Input.Value)
	end

	if Input.Finished then
		AddSignal(Box.FocusLost, function(enter)
			if not enter then
				return
			end
			Input:SetValue(Box.Text)
		end)
	else
		AddSignal(Box:GetPropertyChangedSignal("Text"), function()
			Input:SetValue(Box.Text)
		end)
	end

	function Input:OnChanged(Func)
		Input.Changed = Func
		Func(Input.Value)
	end

	function Input:Destroy()
		InputFrame:Destroy()
		Library.Options[Idx] = nil
	end

	Library.Options[Idx] = Input
	return Input
end

return Element
 end,
    [38] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(38)local UserInputService = game:GetService("UserInputService")

local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local New = Creator.New
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "Keybind"

function Element:New(Idx, Config)
	local Library = self.Library
	assert(Config.Title, "KeyBind - Missing Title")
	assert(Config.Default, "KeyBind - Missing default value.")

	local Keybind = {
		Value = Config.Default,
		Toggled = false,
		Mode = Config.Mode or "Toggle",
		Type = "Keybind",
		Callback = Config.Callback or function(Value) end,
		ChangedCallback = Config.ChangedCallback or function(New) end,
	}

	local Picking = false

	local KeybindFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, true)

	Keybind.SetTitle = KeybindFrame.SetTitle
	Keybind.SetDesc = KeybindFrame.SetDesc

	local KeybindDisplayLabel = New("TextLabel", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		Text = Config.Default,
		TextColor3 = Color3.fromRGB(240, 240, 240),
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Center,
		Size = UDim2.new(0, 0, 0, 14),
		Position = UDim2.new(0, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	local KeybindDisplayFrame = New("TextButton", {
		Size = UDim2.fromOffset(0, 30),
		Position = UDim2.new(1, -10, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 0.9,
		Parent = KeybindFrame.Frame,
		AutomaticSize = Enum.AutomaticSize.X,
		ThemeTag = {
			BackgroundColor3 = "Keybind",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 5),
		}),
		New("UIPadding", {
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8),
		}),
		New("UIStroke", {
			Transparency = 0.5,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			ThemeTag = {
				Color = "InElementBorder",
			},
		}),
		KeybindDisplayLabel,
	})

	function Keybind:GetState()
		if UserInputService:GetFocusedTextBox() and Keybind.Mode ~= "Always" then
			return false
		end

		if Keybind.Mode == "Always" then
			return true
		elseif Keybind.Mode == "Hold" then
			if Keybind.Value == "None" then
				return false
			end

			local Key = Keybind.Value

			if Key == "MouseLeft" or Key == "MouseRight" then
				return Key == "MouseLeft" and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
					or Key == "MouseRight"
						and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
			else
				return UserInputService:IsKeyDown(Enum.KeyCode[Keybind.Value])
			end
		else
			return Keybind.Toggled
		end
	end

	function Keybind:SetValue(Key, Mode)
		Key = Key or Keybind.Key
		Mode = Mode or Keybind.Mode

		KeybindDisplayLabel.Text = Key
		Keybind.Value = Key
		Keybind.Mode = Mode
	end

	function Keybind:OnClick(Callback)
		Keybind.Clicked = Callback
	end

	function Keybind:OnChanged(Callback)
		Keybind.Changed = Callback
		Callback(Keybind.Value)
	end

	function Keybind:DoClick()
		Library:SafeCallback(Keybind.Callback, Keybind.Toggled)
		Library:SafeCallback(Keybind.Clicked, Keybind.Toggled)
	end

	function Keybind:Destroy()
		KeybindFrame:Destroy()
		Library.Options[Idx] = nil
	end

	Creator.AddSignal(KeybindDisplayFrame.InputBegan, function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			Picking = true
			KeybindDisplayLabel.Text = "..."

			wait(0.2)

			local Event
			Event = UserInputService.InputBegan:Connect(function(Input)
				local Key

				if Input.UserInputType == Enum.UserInputType.Keyboard then
					Key = Input.KeyCode.Name
				elseif Input.UserInputType == Enum.UserInputType.MouseButton1 then
					Key = "MouseLeft"
				elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
					Key = "MouseRight"
				end

				local EndedEvent
				EndedEvent = UserInputService.InputEnded:Connect(function(Input)
					if
						Input.KeyCode.Name == Key
						or Key == "MouseLeft" and Input.UserInputType == Enum.UserInputType.MouseButton1
						or Key == "MouseRight" and Input.UserInputType == Enum.UserInputType.MouseButton2
					then
						Picking = false

						KeybindDisplayLabel.Text = Key
						Keybind.Value = Key

						Library:SafeCallback(Keybind.ChangedCallback, Input.KeyCode or Input.UserInputType)
						Library:SafeCallback(Keybind.Changed, Input.KeyCode or Input.UserInputType)

						Event:Disconnect()
						EndedEvent:Disconnect()
					end
				end)
			end)
		end
	end)

	Creator.AddSignal(UserInputService.InputBegan, function(Input)
		if not Picking and not UserInputService:GetFocusedTextBox() then
			if Keybind.Mode == "Toggle" then
				local Key = Keybind.Value

				if Key == "MouseLeft" or Key == "MouseRight" then
					if
						Key == "MouseLeft" and Input.UserInputType == Enum.UserInputType.MouseButton1
						or Key == "MouseRight" and Input.UserInputType == Enum.UserInputType.MouseButton2
					then
						Keybind.Toggled = not Keybind.Toggled
						Keybind:DoClick()
					end
				elseif Input.UserInputType == Enum.UserInputType.Keyboard then
					if Input.KeyCode.Name == Key then
						Keybind.Toggled = not Keybind.Toggled
						Keybind:DoClick()
					end
				end
			end
		end
	end)

	Library.Options[Idx] = Keybind
	return Keybind
end

return Element
 end,
    [39] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(39)local Root = script.Parent.Parent
local Components = Root.Components
local Flipper = require(Root.Packages.Flipper)
local Creator = require(Root.Creator)

local Paragraph = {}
Paragraph.__index = Paragraph
Paragraph.__type = "Paragraph"

function Paragraph:New(Config)
	assert(Config.Title, "Paragraph - Missing Title")
	Config.Content = Config.Content or ""

	local Paragraph = require(Components.Element)(Config.Title, Config.Content, Paragraph.Container, false)
	Paragraph.Frame.BackgroundTransparency = Creator.GetThemeProperty("ElementTransparency")
	Paragraph.Border.Transparency = 0.5

	return Paragraph
end

return Paragraph
 end,
    [40] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(40)local UserInputService = game:GetService("UserInputService")
local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local New = Creator.New
local AddSignal = Creator.AddSignal
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "Slider"

function Element:New(Idx, Config)
	local Library = self.Library
	assert(Config.Title, "Slider - Missing Title.")
	assert(Config.Default, "Slider - Missing default value.")
	assert(Config.Min, "Slider - Missing minimum value.")
	assert(Config.Max, "Slider - Missing maximum value.")
	assert(Config.Rounding, "Slider - Missing rounding value.")

	local Slider = {
		Value = nil,
		Min = Config.Min,
		Max = Config.Max,
		Rounding = Config.Rounding,
		Callback = Config.Callback or function(Value) end,
		Type = "Slider",
	}

	local Dragging = false

	local SliderFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, false)
	SliderFrame.DescLabel.Size = UDim2.new(1, -190, 0, 14)
	SliderFrame.TitleLabel.Size = UDim2.new(1, -190, 0, 14)

	Slider.SetTitle = SliderFrame.SetTitle
	Slider.SetDesc = SliderFrame.SetDesc

	local SliderDot = New("ImageLabel", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, -7, 0.5, 0),
		Size = UDim2.fromOffset(14, 14),
		Image = "http://www.roblox.com/asset/?id=12266946128",
		ThemeTag = {
			ImageColor3 = "Accent",
		},
	})

	local SliderRail = New("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(7, 0),
		Size = UDim2.new(1, -14, 1, 0),
	}, {
		SliderDot,
	})

	local SliderFill = New("Frame", {
		Size = UDim2.new(0, 0, 1, 0),
		ThemeTag = {
			BackgroundColor3 = "Accent",
			Gradient = "AccentGradient",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(1, 0),
		}),
	})

	local SliderInput = New("TextBox", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
		Text = "Value",
		TextSize = 12,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Center,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromOffset(0, 0),
		ClearTextOnFocus = false,
		ThemeTag = {
			TextColor3 = "Text",
			PlaceholderColor3 = "SubText",
		},
	})
	
	local SliderDisplay = New("Frame", {
		Size = UDim2.new(0, 25, 0, 20),
		Position = UDim2.new(0, -4, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 0,
		ClipsDescendants = false,
		ThemeTag = {
			BackgroundColor3 = "SliderRail",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 4),
		}),
		New("UIStroke", {
			Transparency = 0.5,
			ThemeTag = {
				Color = "SliderRail",
			}
		}),
		SliderInput
	})

	AddSignal(SliderInput.FocusLost, function(enterPressed)
		local inputText = SliderInput.Text
		local numValue = tonumber(inputText)
		if numValue then
			Slider:SetValue(numValue)
		else
			-- Revert to current value if input is not a number
			SliderInput.Text = tostring(Slider.Value)
		end
	end)

	local SliderInner = New("Frame", {
		Size = UDim2.new(1, 0, 0, 4),
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -10, 0.5, 0),
		BackgroundTransparency = 0.4,
		Parent = SliderFrame.Frame,
		ThemeTag = {
			BackgroundColor3 = "SliderRail",
			Gradient = "SliderRailGradient",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(1, 0),
		}),
		New("UISizeConstraint", {
			MaxSize = Vector2.new(150, math.huge),
		}),
		SliderDisplay,
		SliderFill,
		SliderRail,
	})

	Creator.AddSignal(SliderDot.InputBegan, function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			Dragging = true
		end
	end)

	Creator.AddSignal(SliderDot.InputEnded, function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			Dragging = false
		end
	end)

	Creator.AddSignal(UserInputService.InputChanged, function(Input)
		if
			Dragging
			and (
				Input.UserInputType == Enum.UserInputType.MouseMovement
				or Input.UserInputType == Enum.UserInputType.Touch
			)
		then
			local SizeScale =
				math.clamp((Input.Position.X - SliderRail.AbsolutePosition.X) / SliderRail.AbsoluteSize.X, 0, 1)
			Slider:SetValue(Slider.Min + ((Slider.Max - Slider.Min) * SizeScale))
		end
	end)

	function Slider:OnChanged(Func)
		Slider.Changed = Func
		Func(Slider.Value)
	end

	function Slider:SetValue(Value)
		self.Value = Library:Round(math.clamp(Value, Slider.Min, Slider.Max), Slider.Rounding)
		SliderDot.Position = UDim2.new((self.Value - Slider.Min) / (Slider.Max - Slider.Min), -7, 0.5, 0)
		SliderFill.Size = UDim2.fromScale((self.Value - Slider.Min) / (Slider.Max - Slider.Min), 1)
		SliderInput.Text = tostring(self.Value)

		Library:SafeCallback(Slider.Callback, self.Value)
		Library:SafeCallback(Slider.Changed, self.Value)
	end

	function Slider:Destroy()
		SliderFrame:Destroy()
		Library.Options[Idx] = nil
	end

	Slider:SetValue(Config.Default)

	Library.Options[Idx] = Slider
	return Slider
end

return Element
 end,
    [41] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(41)local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
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
		Callback = Config.Callback or function(Value) end,
		Type = "Toggle",
		-- Keybind properties
		KeybindValue = Config.KeybindDefault or nil,
		KeybindMode = Config.KeybindMode or "Toggle",
		KeybindCallback = Config.KeybindCallback or function(Value) end,
		KeybindChangedCallback = Config.KeybindChangedCallback or function(New) end,
	}

	local Picking = false

	local ToggleFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, true)
	ToggleFrame.DescLabel.Size = UDim2.new(1, -120, 0, 14) -- Increased space for keybind + cancel + toggle

	Toggle.SetTitle = ToggleFrame.SetTitle
	Toggle.SetDesc = ToggleFrame.SetDesc

	-- ========== TOGGLE SWITCH (Rightmost) ==========
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
			Gradient = "AccentGradient",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 9),
		}),
		ToggleBorder,
		ToggleCircle,
	})

	-- ========== CANCEL BUTTON (Middle) ==========
	local CancelButton = New("TextButton", {
		Size = UDim2.fromOffset(24, 24),
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -54, 0.5, 0),
		BackgroundTransparency = 0.9,
		Text = "×",
		TextColor3 = Color3.fromRGB(255, 100, 100),
		TextSize = 18,
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
		Parent = ToggleFrame.Frame,
		Visible = Config.KeybindDefault ~= nil, -- Only show if keybind is configured
		ThemeTag = {
			BackgroundColor3 = "Element",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 5),
		}),
		New("UIStroke", {
			Transparency = 0.5,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			ThemeTag = {
				Color = "InElementBorder",
			},
		}),
	})

	-- ========== KEYBIND BUTTON (Leftmost) ==========
	local KeybindDisplayLabel = New("TextLabel", {
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		Text = Toggle.KeybindValue or "None",
		TextColor3 = Color3.fromRGB(240, 240, 240),
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Center,
		Size = UDim2.new(0, 0, 0, 14),
		Position = UDim2.new(0, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	local KeybindDisplayFrame = New("TextButton", {
		Size = UDim2.fromOffset(0, 24),
		Position = UDim2.new(1, -86, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 0.9,
		Parent = ToggleFrame.Frame,
		AutomaticSize = Enum.AutomaticSize.X,
		Visible = Config.KeybindDefault ~= nil or Config.Keybind == true, -- Show if keybind is enabled
		ThemeTag = {
			BackgroundColor3 = "Keybind",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 5),
		}),
		New("UIPadding", {
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8),
		}),
		New("UIStroke", {
			Transparency = 0.5,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			ThemeTag = {
				Color = "InElementBorder",
			},
		}),
		KeybindDisplayLabel,
	})

	-- Show/Hide Cancel button based on keybind visibility
	CancelButton.Visible = KeybindDisplayFrame.Visible

	-- ========== TOGGLE FUNCTIONS ==========
	function Toggle:OnChanged(Func)
		Toggle.Changed = Func
		Func(Toggle.Value)
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

	-- ========== KEYBIND FUNCTIONS ==========
	function Toggle:GetState()
		if UserInputService:GetFocusedTextBox() and Toggle.KeybindMode ~= "Always" then
			return false
		end

		if Toggle.KeybindMode == "Always" then
			return true
		elseif Toggle.KeybindMode == "Hold" then
			if Toggle.KeybindValue == nil or Toggle.KeybindValue == "None" then
				return false
			end

			local Key = Toggle.KeybindValue

			if Key == "MouseLeft" or Key == "MouseRight" then
				return Key == "MouseLeft" and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
					or Key == "MouseRight"
						and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
			else
				return UserInputService:IsKeyDown(Enum.KeyCode[Toggle.KeybindValue])
			end
		else
			return Toggle.Value
		end
	end

	function Toggle:SetKeybind(Key)
		Toggle.KeybindValue = Key
		KeybindDisplayLabel.Text = Key or "None"
		Library:SafeCallback(Toggle.KeybindChangedCallback, Key)
	end

	function Toggle:ClearKeybind()
		Toggle.KeybindValue = nil
		KeybindDisplayLabel.Text = "None"
		Library:SafeCallback(Toggle.KeybindChangedCallback, nil)
	end

	function Toggle:OnKeybindChanged(Callback)
		Toggle.KeybindChanged = Callback
		Callback(Toggle.KeybindValue)
	end

	function Toggle:Destroy()
		ToggleFrame:Destroy()
		Library.Options[Idx] = nil
	end

	-- ========== EVENT HANDLERS ==========

	-- Toggle Switch Click
	Creator.AddSignal(ToggleFrame.Frame.MouseButton1Click, function()
		Toggle:SetValue(not Toggle.Value)
	end)

	-- Cancel Button Click (Clear Keybind)
	Creator.AddSignal(CancelButton.MouseButton1Click, function()
		Toggle:ClearKeybind()
	end)

	-- Keybind Button Input (Left Click to bind, Right Click to clear)
	Creator.AddSignal(KeybindDisplayFrame.InputBegan, function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton2 then
			-- Right-click to clear keybind
			Toggle:ClearKeybind()
		elseif
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			-- Left-click to start picking
			Picking = true
			KeybindDisplayLabel.Text = "..."

			wait(0.2)

			local Event
			Event = UserInputService.InputBegan:Connect(function(Input)
				local Key

				if Input.UserInputType == Enum.UserInputType.Keyboard then
					Key = Input.KeyCode.Name
				elseif Input.UserInputType == Enum.UserInputType.MouseButton1 then
					Key = "MouseLeft"
				elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
					Key = "MouseRight"
				end

				local EndedEvent
				EndedEvent = UserInputService.InputEnded:Connect(function(Input)
					if
						Input.KeyCode.Name == Key
						or Key == "MouseLeft" and Input.UserInputType == Enum.UserInputType.MouseButton1
						or Key == "MouseRight" and Input.UserInputType == Enum.UserInputType.MouseButton2
					then
						Picking = false

						Toggle.KeybindValue = Key
						KeybindDisplayLabel.Text = Key

						Library:SafeCallback(Toggle.KeybindChangedCallback, Input.KeyCode or Input.UserInputType)
						Library:SafeCallback(Toggle.KeybindChanged, Input.KeyCode or Input.UserInputType)

						Event:Disconnect()
						EndedEvent:Disconnect()
					end
				end)
			end)
		end
	end)

	-- Global Input Listener for Keybind Activation
	Creator.AddSignal(UserInputService.InputBegan, function(Input)
		if not Picking and not UserInputService:GetFocusedTextBox() then
			if Toggle.KeybindMode == "Toggle" then
				local Key = Toggle.KeybindValue

				if Key == nil or Key == "None" then
					return
				end

				if Key == "MouseLeft" or Key == "MouseRight" then
					if
						Key == "MouseLeft" and Input.UserInputType == Enum.UserInputType.MouseButton1
						or Key == "MouseRight" and Input.UserInputType == Enum.UserInputType.MouseButton2
					then
						Toggle:SetValue(not Toggle.Value)
						Library:SafeCallback(Toggle.KeybindCallback, Toggle.Value)
					end
				elseif Input.UserInputType == Enum.UserInputType.Keyboard then
					if Input.KeyCode.Name == Key then
						Toggle:SetValue(not Toggle.Value)
						Library:SafeCallback(Toggle.KeybindCallback, Toggle.Value)
					end
				end
			end
		end
	end)

	-- ========== INITIAL STATE ==========
	Toggle:SetValue(Toggle.Value)
	if Toggle.KeybindValue then
		KeybindDisplayLabel.Text = Toggle.KeybindValue
	end

	Library.Options[Idx] = Toggle
	return Toggle
end

return Element
 end,
    [42] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(42)--[[
    Gradients/init.lua
    Main OOP class for the Fluent Gradient System.
    
    Provides:
    - Multi-color gradient creation with customizable interpolation
    - Caching/precomputation for performance
    - Direct UI element application
    - Preset loading
    
    @module Gradients
    
    Usage:
        local Gradients = require(path.To.Gradients)
        
        local gradient = Gradients.new({
            Colors = { Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0) },
            Mode = "EaseInOut",
            Steps = 64
        })
        
        local color = gradient:GetColor(0.5)
        gradient:ApplyTo(myFrame)
]]

local Root = script

local Interpolator = require(Root.Core.Interpolator)
local Presets = require(Root.Core.Presets)

local Gradients = {}
Gradients.__index = Gradients

-- Configuration defaults
Gradients.Defaults = {
    Mode = "Linear",
    ColorSpace = "RGB",
    Steps = 64,
    Rotation = 90,
}

--[[ Constructor ]]

-- Create a new Gradient instance
function Gradients.new(config: {
    Colors: {Color3}?,
    Positions: {number}?,
    Mode: string?,
    ColorSpace: string?,
    Steps: number?,
}?)
    config = config or {}
    
    local self = setmetatable({}, Gradients)
    
    self.Colors = config.Colors or {}
    self.Positions = config.Positions or Gradients._autoPositions(#self.Colors)
    self.Mode = config.Mode or Gradients.Defaults.Mode
    self.ColorSpace = config.ColorSpace or Gradients.Defaults.ColorSpace
    self.Steps = config.Steps or Gradients.Defaults.Steps
    
    -- Internal caches
    self._colorCache = {} -- Precomputed colors at discrete steps
    self._sequenceCache = nil -- Cached ColorSequence
    self._dirty = true -- Whether cache needs rebuild
    
    -- Precompute if enough colors
    if #self.Colors >= 2 then
        self:_precompute()
    end
    
    return self
end

-- Create gradient from a preset name
function Gradients.fromPreset(presetName: string, overrides: {Mode: string?, ColorSpace: string?, Steps: number?}?): any
    local preset = Presets[presetName]
    if not preset then
        warn("[Gradients] Unknown preset: " .. tostring(presetName))
        return Gradients.new({ Colors = { Color3.new(1, 1, 1) } })
    end
    
    overrides = overrides or {}
    return Gradients.new({
        Colors = preset.Colors,
        Mode = overrides.Mode or preset.Mode or "Linear",
        ColorSpace = overrides.ColorSpace or "RGB",
        Steps = overrides.Steps or 64,
    })
end

-- Create gradient from two colors (simple factory)
function Gradients.fromColors(color1: Color3, color2: Color3, mode: string?): any
    return Gradients.new({
        Colors = { color1, color2 },
        Mode = mode or "Linear",
    })
end

--[[ Internal Methods ]]

-- Generate evenly-spaced positions for colors
function Gradients._autoPositions(count: number): {number}
    if count <= 1 then
        return { 0 }
    end
    
    local positions = {}
    for i = 1, count do
        positions[i] = (i - 1) / (count - 1)
    end
    return positions
end

-- Precompute colors at discrete steps for fast lookup
function Gradients:_precompute()
    self._colorCache = {}
    
    for i = 0, self.Steps do
        local t = i / self.Steps
        self._colorCache[i] = self:_computeColor(t)
    end
    
    self._sequenceCache = nil -- Invalidate sequence cache
    self._dirty = false
end

-- Find which segment a position falls into
function Gradients:_findSegment(t: number): (Color3, Color3, number)
    local positions = self.Positions
    local colors = self.Colors
    
    -- Edge cases
    if t <= positions[1] then
        return colors[1], colors[1], 0
    end
    if t >= positions[#positions] then
        return colors[#colors], colors[#colors], 1
    end
    
    -- Find segment
    for i = 1, #positions - 1 do
        if t >= positions[i] and t <= positions[i + 1] then
            local segmentStart = positions[i]
            local segmentEnd = positions[i + 1]
            local segmentT = (t - segmentStart) / (segmentEnd - segmentStart)
            return colors[i], colors[i + 1], segmentT
        end
    end
    
    return colors[1], colors[#colors], t
end

-- Compute color at exact position (no caching)
function Gradients:_computeColor(t: number): Color3
    t = math.clamp(t, 0, 1)
    
    if #self.Colors == 0 then
        return Color3.new(1, 1, 1)
    end
    if #self.Colors == 1 then
        return self.Colors[1]
    end
    
    local c1, c2, segmentT = self:_findSegment(t)
    
    return Interpolator.Lerp(c1, c2, segmentT, {
        Mode = self.Mode,
        ColorSpace = self.ColorSpace,
    })
end

--[[ Public Methods ]]

-- Get color at position (0-1), uses cache when possible
function Gradients:GetColor(t: number): Color3
    t = math.clamp(t, 0, 1)
    
    if self._dirty then
        self:_precompute()
    end
    
    -- Use cached value if available (nearest step)
    local stepIndex = math.floor(t * self.Steps + 0.5)
    stepIndex = math.clamp(stepIndex, 0, self.Steps)
    
    if self._colorCache[stepIndex] then
        return self._colorCache[stepIndex]
    end
    
    -- Fallback to direct computation
    return self:_computeColor(t)
end

-- Get color at position with exact interpolation (bypasses cache)
function Gradients:GetColorExact(t: number): Color3
    return self:_computeColor(t)
end

-- Convert to Roblox ColorSequence
function Gradients:ToColorSequence(): ColorSequence
    if self._sequenceCache and not self._dirty then
        return self._sequenceCache
    end
    
    if #self.Colors == 0 then
        self._sequenceCache = ColorSequence.new(Color3.new(1, 1, 1))
        return self._sequenceCache
    end
    
    if #self.Colors == 1 then
        self._sequenceCache = ColorSequence.new(self.Colors[1])
        return self._sequenceCache
    end
    
    local keypoints = {}
    for i, color in ipairs(self.Colors) do
        local pos = self.Positions[i] or (i - 1) / (#self.Colors - 1)
        table.insert(keypoints, ColorSequenceKeypoint.new(pos, color))
    end
    
    table.sort(keypoints, function(a, b)
        return a.Time < b.Time
    end)
    
    self._sequenceCache = ColorSequence.new(keypoints)
    return self._sequenceCache
end

-- Update colors (marks cache dirty)
function Gradients:SetColors(colors: {Color3}, positions: {number}?)
    self.Colors = colors
    self.Positions = positions or Gradients._autoPositions(#colors)
    self._dirty = true
end

-- Update interpolation mode
function Gradients:SetMode(mode: string)
    self.Mode = mode
    self._dirty = true
end

-- Update color space
function Gradients:SetColorSpace(colorSpace: string)
    self.ColorSpace = colorSpace
    self._dirty = true
end

-- Force cache rebuild
function Gradients:Refresh()
    self:_precompute()
end

--[[ Static Utilities ]]

-- Get available interpolation modes
Gradients.GetModes = Interpolator.GetModes

-- Get list of preset names
function Gradients.GetPresetNames(): {string}
    local names = {}
    for name, _ in pairs(Presets) do
        table.insert(names, name)
    end
    table.sort(names)
    return names
end

-- Get preset data
function Gradients.GetPreset(name: string): {Colors: {Color3}, Mode: string, Description: string}?
    return Presets[name]
end

--[[ UI Application Methods ]]

-- Apply gradient to a UI element
function Gradients:ApplyTo(uiElement: GuiObject, options: {Rotation: number?, Name: string?}?): UIGradient
    local UIApplier = require(Root.Appliers.UIApplier)
    return UIApplier.Apply(self, uiElement, options)
end

-- Animate gradient on a UI element (returns stop function)
function Gradients:Animate(uiElement: GuiObject, animationType: string?, options: any?): () -> ()
    local AnimatedApplier = require(Root.Appliers.AnimatedApplier)
    animationType = animationType or "Rotate"
    
    if animationType == "Rotate" then
        return AnimatedApplier.Rotate(self, uiElement, options)
    elseif animationType == "Scroll" then
        return AnimatedApplier.Scroll(self, uiElement, options)
    elseif animationType == "Pulse" then
        return AnimatedApplier.Pulse(self, uiElement, options)
    else
        warn("[Gradients] Unknown animation type: " .. tostring(animationType))
        return function() end
    end
end

-- Expose submodules
Gradients.Interpolator = Interpolator
Gradients.Presets = Presets

-- Lazy-load appliers to avoid circular dependencies
function Gradients.GetUIApplier()
    return require(Root.Appliers.UIApplier)
end

function Gradients.GetAnimatedApplier()
    return require(Root.Appliers.AnimatedApplier)
end

function Gradients.GetFluentAdapter()
    return require(Root.Adapters.FluentAdapter)
end

--[[ Legacy GradientHelper Functions (merged for compatibility) ]]

-- Blend two Color3 values with an alpha factor
function Gradients.BlendColors(color1: Color3, color2: Color3, alpha: number): Color3
    alpha = math.clamp(alpha or 0.5, 0, 1)
    return Color3.new(
        color1.R + (color2.R - color1.R) * alpha,
        color1.G + (color2.G - color1.G) * alpha,
        color1.B + (color2.B - color1.B) * alpha
    )
end

-- Blend two colors with full RGBA support
function Gradients.BlendRGBA(
    color1: Color3, transparency1: number,
    color2: Color3, transparency2: number,
    alpha: number
): (Color3, number)
    alpha = math.clamp(alpha or 0.5, 0, 1)
    local blendedColor = Gradients.BlendColors(color1, color2, alpha)
    local blendedTransparency = transparency1 + (transparency2 - transparency1) * alpha
    return blendedColor, blendedTransparency
end

-- Create a NumberSequence for transparency gradients
function Gradients.CreateTransparencyGradient(transparencies: {number}, positions: {number}?): NumberSequence
    if #transparencies == 0 then
        return NumberSequence.new(0)
    end
    if #transparencies == 1 then
        return NumberSequence.new(transparencies[1])
    end
    
    local keypoints = {}
    for i, transparency in ipairs(transparencies) do
        local pos = positions and positions[i] or (i - 1) / (#transparencies - 1)
        pos = math.clamp(pos, 0, 1)
        table.insert(keypoints, NumberSequenceKeypoint.new(pos, transparency))
    end
    
    table.sort(keypoints, function(a, b)
        return a.Time < b.Time
    end)
    
    return NumberSequence.new(keypoints)
end

-- Create an auto-gradient from a base color
function Gradients.CreateAutoGradient(baseColor: Color3, direction: string?, intensity: number?): ColorSequence
    direction = direction or "dark"
    intensity = intensity or 0.15
    
    local h, s, v = baseColor:ToHSV()
    
    if direction == "light" then
        local lighterV = math.min(v + intensity, 1)
        local lighterS = math.max(s - intensity * 0.5, 0)
        local lighter = Color3.fromHSV(h, lighterS, lighterV)
        return ColorSequence.new(baseColor, lighter)
    elseif direction == "dark" then
        local darkerV = math.max(v - intensity, 0)
        local darker = Color3.fromHSV(h, s, darkerV)
        return ColorSequence.new(baseColor, darker)
    elseif direction == "both" then
        local lighterV = math.min(v + intensity * 0.5, 1)
        local lighterS = math.max(s - intensity * 0.25, 0)
        local lighter = Color3.fromHSV(h, lighterS, lighterV)
        local darkerV = math.max(v - intensity * 0.5, 0)
        local darker = Color3.fromHSV(h, s, darkerV)
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, lighter),
            ColorSequenceKeypoint.new(0.5, baseColor),
            ColorSequenceKeypoint.new(1, darker),
        })
    end
    
    return ColorSequence.new(baseColor)
end

-- Parse a gradient definition from theme data
function Gradients.ParseGradient(gradientDef: any): (ColorSequence?, NumberSequence?)
    if gradientDef == nil then
        return nil, nil
    end
    
    if typeof(gradientDef) == "ColorSequence" then
        return gradientDef, nil
    end
    
    if typeof(gradientDef) == "Color3" then
        return ColorSequence.new(gradientDef), nil
    end
    
    if type(gradientDef) == "table" then
        if gradientDef.Colors then
            local gradient = Gradients.new({
                Colors = gradientDef.Colors,
                Positions = gradientDef.Positions,
                Mode = gradientDef.Mode or "Linear",
            })
            local transSeq = nil
            if gradientDef.Transparency then
                transSeq = Gradients.CreateTransparencyGradient(gradientDef.Transparency, gradientDef.Positions)
            end
            return gradient:ToColorSequence(), transSeq
        end
        
        if gradientDef.Base and typeof(gradientDef.Base) == "Color3" then
            return Gradients.CreateAutoGradient(
                gradientDef.Base,
                gradientDef.Direction,
                gradientDef.Intensity
            ), nil
        end
        
        if #gradientDef > 0 and typeof(gradientDef[1]) == "Color3" then
            local gradient = Gradients.new({ Colors = gradientDef })
            return gradient:ToColorSequence(), nil
        end
    end
    
    return nil, nil
end

-- Evaluate a blended color definition from theme
function Gradients.EvaluateBlend(blendDef: any, getProperty: (string) -> any): Color3?
    if type(blendDef) ~= "table" or not blendDef.Base or not blendDef.Blend then
        return nil
    end
    
    local baseColor = getProperty(blendDef.Base)
    local blendColor = getProperty(blendDef.Blend)
    
    if typeof(baseColor) ~= "Color3" or typeof(blendColor) ~= "Color3" then
        return nil
    end
    
    return Gradients.BlendColors(baseColor, blendColor, blendDef.Alpha or 0.5)
end

-- Check if a value is a gradient definition
function Gradients.IsGradient(value: any): boolean
    if typeof(value) == "ColorSequence" then
        return true
    end
    if type(value) == "table" then
        if value.Colors or (value.Base and typeof(value.Base) == "Color3") or (#value > 0 and typeof(value[1]) == "Color3") then
            return true
        end
    end
    return false
end

-- Check if a value is a blend definition
function Gradients.IsBlendDefinition(value: any): boolean
    return type(value) == "table" and value.Base ~= nil and value.Blend ~= nil and value.Alpha ~= nil
end

-- Get a color from a ColorSequence at a specific position
function Gradients.SampleGradient(colorSeq: ColorSequence, position: number): Color3
    position = math.clamp(position, 0, 1)
    local keypoints = colorSeq.Keypoints
    
    local prevKeypoint = keypoints[1]
    local nextKeypoint = keypoints[#keypoints]
    
    for i = 1, #keypoints - 1 do
        if position >= keypoints[i].Time and position <= keypoints[i + 1].Time then
            prevKeypoint = keypoints[i]
            nextKeypoint = keypoints[i + 1]
            break
        end
    end
    
    local range = nextKeypoint.Time - prevKeypoint.Time
    if range == 0 then
        return prevKeypoint.Value
    end
    
    local alpha = (position - prevKeypoint.Time) / range
    return Gradients.BlendColors(prevKeypoint.Value, nextKeypoint.Value, alpha)
end

return Gradients
 end,
    [44] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(44)--[[
    Gradients/Adapters/FluentAdapter.lua
    Bridge between Gradients module and Fluent UI theme system.
    
    Provides:
    - Theme property registration
    - Creator.lua integration
    - Dynamic theme gradient updates
    
    @module Gradients.Adapters.FluentAdapter
]]

local FluentAdapter = {}

--[[ Theme Integration ]]

-- Apply gradient as a theme property value
function FluentAdapter.ApplyToTheme(gradientInstance: any, themeKey: string, themes: any)
    if not themes then
        warn("[FluentAdapter] Themes table required")
        return
    end
    
    local sequence = gradientInstance:ToColorSequence()
    
    -- Apply to all themes or specific theme
    for themeName, themeData in pairs(themes) do
        if type(themeData) == "table" and themeData.Name then
            themeData[themeKey] = sequence
        end
    end
end

-- Create a gradient compatible with Fluent theme definitions
function FluentAdapter.CreateThemeGradient(preset: string | any, options: {
    Mode: string?,
    Rotation: number?,
}?): ColorSequence
    local Gradients = require(script.Parent.Parent)
    options = options or {}
    
    local gradient
    if type(preset) == "string" then
        gradient = Gradients.fromPreset(preset, { Mode = options.Mode })
    else
        gradient = preset -- Assume it's already a Gradients instance
    end
    
    return gradient:ToColorSequence()
end

-- Register gradient with Creator.lua's theme system
function FluentAdapter.RegisterWithCreator(gradientInstance: any, creator: any, themeKey: string, options: {
    Rotation: number?,
}?)
    if not creator or not creator.AddThemeObject then
        warn("[FluentAdapter] Invalid Creator module")
        return
    end
    
    options = options or {}
    
    -- Add gradient as a theme property
    creator.AddThemeObject(gradientInstance:ToColorSequence(), themeKey)
end

--[[ Utility Functions ]]

-- Convert Fluent theme gradient definition to Gradients instance
function FluentAdapter.FromThemeDefinition(gradientDef: any): any
    local Gradients = require(script.Parent.Parent)
    
    -- Already a ColorSequence
    if typeof(gradientDef) == "ColorSequence" then
        local colors = {}
        local positions = {}
        for _, keypoint in ipairs(gradientDef.Keypoints) do
            table.insert(colors, keypoint.Value)
            table.insert(positions, keypoint.Time)
        end
        return Gradients.new({ Colors = colors, Positions = positions })
    end
    
    -- Table with Colors array
    if type(gradientDef) == "table" and gradientDef.Colors then
        local gradient = Gradients.new({
            Colors = gradientDef.Colors,
            Positions = gradientDef.Positions,
            Mode = gradientDef.Mode or "Linear",
            ColorSpace = gradientDef.ColorSpace or "RGB"
        })
        
        local transparency
        if gradientDef.Transparency then
            transparency = Gradients.CreateTransparencyGradient(gradientDef.Transparency, gradientDef.Positions)
        end
        
        return gradient, transparency
    end
    
    -- Array of Color3
    if type(gradientDef) == "table" and #gradientDef > 0 and typeof(gradientDef[1]) == "Color3" then
        return Gradients.new({ Colors = gradientDef }), nil
    end
    
    -- Single Color3
    if typeof(gradientDef) == "Color3" then
        return Gradients.new({ Colors = { gradientDef } }), nil
    end
    
    return nil, nil
end

-- Check if a value is a gradient definition
function FluentAdapter.IsGradientDefinition(value: any): boolean
    if typeof(value) == "ColorSequence" then
        return true
    end
    
    if type(value) == "table" then
        if value.Colors then return true end
        if #value > 0 and typeof(value[1]) == "Color3" then return true end
    end
    
    return false
end

return FluentAdapter
 end,
    [46] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(46)--[[
    Gradients/Appliers/AnimatedApplier.lua
    Animated gradient effects for UI elements.
    
    Features:
    - Rotating gradients
    - Scrolling/offset animation
    - Color cycling
    - Performance safeguards (max animations, frame throttling)
    
    @module Gradients.Appliers.AnimatedApplier
]]

local RunService = game:GetService("RunService")
local UIApplier = require(script.Parent.UIApplier)

local AnimatedApplier = {}

-- Configuration
AnimatedApplier.Config = {
    MaxActiveAnimations = 10,     -- Maximum simultaneous animations
    FrameThrottleMs = 16,         -- Minimum ms between updates (~60fps)
    EnableWarnings = true,        -- Warn when limits exceeded
}

-- Internal state
AnimatedApplier._activeAnimations = {}  -- element -> { connection, startTime, ... }
AnimatedApplier._animationCount = 0

--[[ Animation Types ]]

-- Rotating gradient (360 degrees)
function AnimatedApplier.Rotate(gradientInstance: any, uiElement: GuiObject, options: {
    Speed: number?,      -- Rotations per second
    Clockwise: boolean?, -- Direction
    Name: string?,
}?): () -> ()  -- Returns stop function
    options = options or {}
    local speed = options.Speed or 0.5
    local clockwise = options.Clockwise ~= false
    local name = options.Name or "GradientAnimated"
    
    return AnimatedApplier._startAnimation(uiElement, name, function(gradient, elapsed)
        local direction = clockwise and 1 or -1
        gradient.Rotation = (elapsed * speed * 360 * direction) % 360
    end, gradientInstance, options)
end

-- Scrolling/offset animation
function AnimatedApplier.Scroll(gradientInstance: any, uiElement: GuiObject, options: {
    Speed: number?,       -- Speed multiplier
    Direction: string?,   -- "horizontal", "vertical", "diagonal"
    Range: number?,       -- Offset range (0-1)
    Name: string?,
}?): () -> ()
    options = options or {}
    local speed = options.Speed or 1
    local direction = options.Direction or "horizontal"
    local range = options.Range or 0.3
    local name = options.Name or "GradientAnimated"
    
    return AnimatedApplier._startAnimation(uiElement, name, function(gradient, elapsed)
        local offset = math.sin(elapsed * speed * math.pi) * range
        
        if direction == "horizontal" then
            gradient.Offset = Vector2.new(offset, 0)
        elseif direction == "vertical" then
            gradient.Offset = Vector2.new(0, offset)
        elseif direction == "diagonal" then
            gradient.Offset = Vector2.new(offset, offset)
        end
    end, gradientInstance, options)
end

-- Pulsing gradient (scale effect via transparency)
function AnimatedApplier.Pulse(gradientInstance: any, uiElement: GuiObject, options: {
    Speed: number?,        -- Pulses per second
    MinAlpha: number?,     -- Minimum visibility
    MaxAlpha: number?,     -- Maximum visibility
    Name: string?,
}?): () -> ()
    options = options or {}
    local speed = options.Speed or 1
    local minAlpha = options.MinAlpha or 0.3
    local maxAlpha = options.MaxAlpha or 1.0
    local name = options.Name or "GradientAnimated"
    
    return AnimatedApplier._startAnimation(uiElement, name, function(gradient, elapsed)
        local t = (math.sin(elapsed * speed * math.pi * 2) + 1) / 2 -- 0 to 1
        local alpha = minAlpha + (maxAlpha - minAlpha) * t
        local transparency = 1 - alpha
        
        gradient.Transparency = NumberSequence.new(transparency)
    end, gradientInstance, options)
end

--[[ Internal Animation Engine ]]

function AnimatedApplier._startAnimation(
    uiElement: GuiObject,
    name: string,
    updateFunc: (UIGradient, number) -> (),
    gradientInstance: any,
    options: any?
): () -> ()
    options = options or {}
    
    -- Check animation limit
    if AnimatedApplier._animationCount >= AnimatedApplier.Config.MaxActiveAnimations then
        if AnimatedApplier.Config.EnableWarnings then
            warn("[Gradients.AnimatedApplier] Max animations reached (" .. 
                AnimatedApplier.Config.MaxActiveAnimations .. "). Stopping oldest.")
        end
        AnimatedApplier._stopOldest()
    end
    
    -- Stop existing animation on this element
    AnimatedApplier.Stop(uiElement, name)
    
    -- Create/get gradient
    local gradient = UIApplier.Apply(gradientInstance, uiElement, {
        Name = name,
        Rotation = options.Rotation or 90,
    })
    
    -- Animation state
    local startTime = os.clock()
    local lastUpdate = 0
    local throttleSeconds = AnimatedApplier.Config.FrameThrottleMs / 1000
    
    -- Connect to render loop
    local connection
    connection = RunService.RenderStepped:Connect(function()
        local now = os.clock()
        
        -- Frame throttling
        if now - lastUpdate < throttleSeconds then
            return
        end
        lastUpdate = now
        
        local elapsed = now - startTime
        updateFunc(gradient, elapsed)
    end)
    
    -- Store animation
    AnimatedApplier._activeAnimations[uiElement] = AnimatedApplier._activeAnimations[uiElement] or {}
    AnimatedApplier._activeAnimations[uiElement][name] = {
        Connection = connection,
        StartTime = startTime,
        Gradient = gradient,
    }
    AnimatedApplier._animationCount = AnimatedApplier._animationCount + 1
    
    -- Return stop function
    return function()
        AnimatedApplier.Stop(uiElement, name)
    end
end

-- Stop animation on element
function AnimatedApplier.Stop(uiElement: GuiObject, name: string?)
    name = name or "GradientAnimated"
    
    local elementAnimations = AnimatedApplier._activeAnimations[uiElement]
    if not elementAnimations then return end
    
    local anim = elementAnimations[name]
    if anim then
        if anim.Connection then
            anim.Connection:Disconnect()
        end
        elementAnimations[name] = nil
        AnimatedApplier._animationCount = math.max(0, AnimatedApplier._animationCount - 1)
    end
    
    -- Clean up empty tables
    if next(elementAnimations) == nil then
        AnimatedApplier._activeAnimations[uiElement] = nil
    end
end

-- Stop all animations on element
function AnimatedApplier.StopAll(uiElement: GuiObject)
    local elementAnimations = AnimatedApplier._activeAnimations[uiElement]
    if not elementAnimations then return end
    
    for name, _ in pairs(elementAnimations) do
        AnimatedApplier.Stop(uiElement, name)
    end
end

-- Stop oldest animation (for limit enforcement)
function AnimatedApplier._stopOldest()
    local oldest = nil
    local oldestTime = math.huge
    local oldestElement = nil
    local oldestName = nil
    
    for element, animations in pairs(AnimatedApplier._activeAnimations) do
        for name, anim in pairs(animations) do
            if anim.StartTime < oldestTime then
                oldestTime = anim.StartTime
                oldest = anim
                oldestElement = element
                oldestName = name
            end
        end
    end
    
    if oldest and oldestElement and oldestName then
        AnimatedApplier.Stop(oldestElement, oldestName)
    end
end

-- Stop all animations globally
function AnimatedApplier.StopGlobal()
    for element, animations in pairs(AnimatedApplier._activeAnimations) do
        for name, _ in pairs(animations) do
            AnimatedApplier.Stop(element, name)
        end
    end
end

-- Get current animation count
function AnimatedApplier.GetActiveCount(): number
    return AnimatedApplier._animationCount
end

return AnimatedApplier
 end,
    [47] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(47)--[[
    Gradients/Appliers/UIApplier.lua
    Apply gradients to Roblox UI elements.
    
    Handles:
    - UIGradient creation/reuse
    - Rotation and transparency
    - Fluent theme integration
    
    @module Gradients.Appliers.UIApplier
]]

local UIApplier = {}

-- Apply gradient to a UI element
function UIApplier.Apply(gradientInstance: any, uiElement: GuiObject, options: {
    Rotation: number?,
    Transparency: NumberSequence?,
    Name: string?,
}?): UIGradient
    options = options or {}
    
    local gradientName = options.Name or "GradientApplied"
    local rotation = options.Rotation or 90
    
    -- Find or create UIGradient
    local gradient = uiElement:FindFirstChild(gradientName)
    if not gradient or not gradient:IsA("UIGradient") then
        gradient = Instance.new("UIGradient")
        gradient.Name = gradientName
        gradient.Parent = uiElement
    end
    
    -- Apply properties
    gradient.Color = gradientInstance:ToColorSequence()
    gradient.Rotation = rotation
    
    if options.Transparency then
        gradient.Transparency = options.Transparency
    end
    
    return gradient
end

-- Apply gradient to multiple elements
function UIApplier.ApplyToAll(gradientInstance: any, uiElements: {GuiObject}, options: any?): {UIGradient}
    local results = {}
    for _, element in ipairs(uiElements) do
        table.insert(results, UIApplier.Apply(gradientInstance, element, options))
    end
    return results
end

-- Remove gradient from element
function UIApplier.Remove(uiElement: GuiObject, name: string?)
    name = name or "GradientApplied"
    local gradient = uiElement:FindFirstChild(name)
    if gradient then
        gradient:Destroy()
    end
end

-- Check if element has gradient applied
function UIApplier.HasGradient(uiElement: GuiObject, name: string?): boolean
    name = name or "GradientApplied"
    local gradient = uiElement:FindFirstChild(name)
    return gradient ~= nil and gradient:IsA("UIGradient")
end

return UIApplier
 end,
    [49] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(49)--[[
    Gradients/Core/Interpolator.lua
    Interpolation algorithms for smooth color transitions.
    
    Supports multiple easing modes and color space interpolation (RGB/HSV).
    
    @module Gradients.Core.Interpolator
]]

local Interpolator = {}

--[[ Easing Functions ]]

-- Linear interpolation (no easing)
function Interpolator.Linear(t: number): number
    return t
end

-- Quadratic ease-in (slow start)
function Interpolator.EaseIn(t: number): number
    return t * t
end

-- Quadratic ease-out (slow end)
function Interpolator.EaseOut(t: number): number
    return 1 - (1 - t) ^ 2
end

-- Cubic ease-in-out (smooth S-curve)
function Interpolator.EaseInOut(t: number): number
    if t < 0.5 then
        return 2 * t * t
    else
        return 1 - ((-2 * t + 2) ^ 2) / 2
    end
end

-- Exponential ease-in (very slow start)
function Interpolator.ExpoIn(t: number): number
    return t == 0 and 0 or math.pow(2, 10 * t - 10)
end

-- Exponential ease-out (very slow end)
function Interpolator.ExpoOut(t: number): number
    return t == 1 and 1 or 1 - math.pow(2, -10 * t)
end

-- Sine ease-in-out (natural wave)
function Interpolator.Sine(t: number): number
    return -(math.cos(math.pi * t) - 1) / 2
end

--[[ Color Interpolation ]]

-- Apply easing and interpolate in RGB color space
function Interpolator.LerpRGB(c1: Color3, c2: Color3, t: number, mode: string?): Color3
    mode = mode or "Linear"
    local easingFunc = Interpolator[mode] or Interpolator.Linear
    local easedT = easingFunc(math.clamp(t, 0, 1))
    return c1:Lerp(c2, easedT)
end

-- Interpolate in HSV color space (smoother hue transitions)
function Interpolator.LerpHSV(c1: Color3, c2: Color3, t: number, mode: string?): Color3
    mode = mode or "Linear"
    local easingFunc = Interpolator[mode] or Interpolator.Linear
    local easedT = easingFunc(math.clamp(t, 0, 1))
    
    local h1, s1, v1 = c1:ToHSV()
    local h2, s2, v2 = c2:ToHSV()
    
    -- Handle hue wrap-around (take shortest path around the color wheel)
    local hDiff = h2 - h1
    if math.abs(hDiff) > 0.5 then
        if h1 > h2 then
            h2 = h2 + 1
        else
            h1 = h1 + 1
        end
    end
    
    local h = (h1 + (h2 - h1) * easedT) % 1
    local s = s1 + (s2 - s1) * easedT
    local v = v1 + (v2 - v1) * easedT
    
    return Color3.fromHSV(h, s, v)
end

-- General interpolation dispatcher
function Interpolator.Lerp(c1: Color3, c2: Color3, t: number, options: {Mode: string?, ColorSpace: string?}?): Color3
    options = options or {}
    local colorSpace = options.ColorSpace or "RGB"
    local mode = options.Mode or "Linear"
    
    if colorSpace == "HSV" then
        return Interpolator.LerpHSV(c1, c2, t, mode)
    else
        return Interpolator.LerpRGB(c1, c2, t, mode)
    end
end

-- Get list of available easing modes
function Interpolator.GetModes(): {string}
    return { "Linear", "EaseIn", "EaseOut", "EaseInOut", "ExpoIn", "ExpoOut", "Sine" }
end

return Interpolator
 end,
    [50] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(50)--[[
    Gradients/Core/Presets.lua
    Built-in gradient presets for common use cases.
    
    Each preset contains:
    - Colors: Array of Color3 values
    - Mode: Default interpolation mode
    - Description: Human-readable description
    
    @module Gradients.Core.Presets
]]

return {
    -- Warm sunset tones
    Sunset = {
        Colors = {
            Color3.fromRGB(255, 94, 77),   -- Coral
            Color3.fromRGB(255, 154, 0),   -- Orange
            Color3.fromRGB(255, 206, 84),  -- Golden Yellow
        },
        Mode = "EaseInOut",
        Description = "Warm sunset gradient"
    },
    
    -- Cool ocean depths
    Ocean = {
        Colors = {
            Color3.fromRGB(0, 180, 216),   -- Light Blue
            Color3.fromRGB(0, 119, 182),   -- Medium Blue
            Color3.fromRGB(3, 4, 94),      -- Deep Blue
        },
        Mode = "EaseOut",
        Description = "Cool ocean depth gradient"
    },
    
    -- Signature FssVs neon theme
    Neon = {
        Colors = {
            Color3.fromRGB(138, 43, 226),  -- Violet
            Color3.fromRGB(180, 0, 255),   -- Electric Purple
            Color3.fromRGB(0, 255, 255),   -- Cyan
        },
        Mode = "EaseInOut",
        Description = "Cyber neon purple-cyan gradient"
    },
    
    -- Deep space galaxy
    Galaxy = {
        Colors = {
            Color3.fromRGB(15, 10, 30),    -- Deep Space
            Color3.fromRGB(60, 30, 100),   -- Nebula Purple
            Color3.fromRGB(138, 43, 226),  -- Violet
            Color3.fromRGB(0, 200, 255),   -- Cyan Glow
        },
        Mode = "EaseInOut",
        Description = "Deep space galaxy gradient"
    },
    
    -- Bright fire
    Fire = {
        Colors = {
            Color3.fromRGB(255, 0, 0),     -- Red
            Color3.fromRGB(255, 154, 0),   -- Orange
            Color3.fromRGB(255, 255, 0),   -- Yellow
        },
        Mode = "EaseIn",
        Description = "Bright fire gradient"
    },
    
    -- Forest greens
    Forest = {
        Colors = {
            Color3.fromRGB(11, 102, 35),   -- Dark Green
            Color3.fromRGB(46, 139, 87),   -- Sea Green
            Color3.fromRGB(144, 238, 144), -- Light Green
        },
        Mode = "Linear",
        Description = "Natural forest gradient"
    },
    
    -- Rose gold luxury
    RoseGold = {
        Colors = {
            Color3.fromRGB(183, 110, 121), -- Rose
            Color3.fromRGB(226, 185, 168), -- Gold Tint
            Color3.fromRGB(244, 220, 200), -- Light Cream
        },
        Mode = "EaseOut",
        Description = "Luxury rose gold gradient"
    },
    
    -- Midnight aurora
    Aurora = {
        Colors = {
            Color3.fromRGB(25, 25, 112),   -- Midnight Blue
            Color3.fromRGB(0, 255, 127),   -- Spring Green
            Color3.fromRGB(138, 43, 226),  -- Violet
            Color3.fromRGB(0, 191, 255),   -- Deep Sky Blue
        },
        Mode = "Sine",
        Description = "Northern lights aurora gradient"
    },
    
    -- Monochrome dark
    DarkMono = {
        Colors = {
            Color3.fromRGB(30, 30, 35),
            Color3.fromRGB(50, 50, 55),
            Color3.fromRGB(70, 70, 75),
        },
        Mode = "Linear",
        Description = "Subtle dark monochrome gradient"
    },
    
    -- Monochrome light
    LightMono = {
        Colors = {
            Color3.fromRGB(220, 220, 225),
            Color3.fromRGB(240, 240, 245),
            Color3.fromRGB(255, 255, 255),
        },
        Mode = "Linear",
        Description = "Subtle light monochrome gradient"
    },
}
 end,
    [51] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(51)-- This file was @generated by Tarmac. It is not intended for manual editing.
return {
	assets = {
		["lucide-accessibility"] = "rbxassetid://10709751939",
		["lucide-activity"] = "rbxassetid://10709752035",
		["lucide-air-vent"] = "rbxassetid://10709752131",
		["lucide-airplay"] = "rbxassetid://10709752254",
		["lucide-alarm-check"] = "rbxassetid://10709752405",
		["lucide-alarm-clock"] = "rbxassetid://10709752630",
		["lucide-alarm-clock-off"] = "rbxassetid://10709752508",
		["lucide-alarm-minus"] = "rbxassetid://10709752732",
		["lucide-alarm-plus"] = "rbxassetid://10709752825",
		["lucide-album"] = "rbxassetid://10709752906",
		["lucide-alert-circle"] = "rbxassetid://10709752996",
		["lucide-alert-octagon"] = "rbxassetid://10709753064",
		["lucide-alert-triangle"] = "rbxassetid://10709753149",
		["lucide-align-center"] = "rbxassetid://10709753570",
		["lucide-align-center-horizontal"] = "rbxassetid://10709753272",
		["lucide-align-center-vertical"] = "rbxassetid://10709753421",
		["lucide-align-end-horizontal"] = "rbxassetid://10709753692",
		["lucide-align-end-vertical"] = "rbxassetid://10709753808",
		["lucide-align-horizontal-distribute-center"] = "rbxassetid://10747779791",
		["lucide-align-horizontal-distribute-end"] = "rbxassetid://10747784534",
		["lucide-align-horizontal-distribute-start"] = "rbxassetid://10709754118",
		["lucide-align-horizontal-justify-center"] = "rbxassetid://10709754204",
		["lucide-align-horizontal-justify-end"] = "rbxassetid://10709754317",
		["lucide-align-horizontal-justify-start"] = "rbxassetid://10709754436",
		["lucide-align-horizontal-space-around"] = "rbxassetid://10709754590",
		["lucide-align-horizontal-space-between"] = "rbxassetid://10709754749",
		["lucide-align-justify"] = "rbxassetid://10709759610",
		["lucide-align-left"] = "rbxassetid://10709759764",
		["lucide-align-right"] = "rbxassetid://10709759895",
		["lucide-align-start-horizontal"] = "rbxassetid://10709760051",
		["lucide-align-start-vertical"] = "rbxassetid://10709760244",
		["lucide-align-vertical-distribute-center"] = "rbxassetid://10709760351",
		["lucide-align-vertical-distribute-end"] = "rbxassetid://10709760434",
		["lucide-align-vertical-distribute-start"] = "rbxassetid://10709760612",
		["lucide-align-vertical-justify-center"] = "rbxassetid://10709760814",
		["lucide-align-vertical-justify-end"] = "rbxassetid://10709761003",
		["lucide-align-vertical-justify-start"] = "rbxassetid://10709761176",
		["lucide-align-vertical-space-around"] = "rbxassetid://10709761324",
		["lucide-align-vertical-space-between"] = "rbxassetid://10709761434",
		["lucide-anchor"] = "rbxassetid://10709761530",
		["lucide-angry"] = "rbxassetid://10709761629",
		["lucide-annoyed"] = "rbxassetid://10709761722",
		["lucide-aperture"] = "rbxassetid://10709761813",
		["lucide-apple"] = "rbxassetid://10709761889",
		["lucide-archive"] = "rbxassetid://10709762233",
		["lucide-archive-restore"] = "rbxassetid://10709762058",
		["lucide-armchair"] = "rbxassetid://10709762327",
		["lucide-arrow-big-down"] = "rbxassetid://10747796644",
		["lucide-arrow-big-left"] = "rbxassetid://10709762574",
		["lucide-arrow-big-right"] = "rbxassetid://10709762727",
		["lucide-arrow-big-up"] = "rbxassetid://10709762879",
		["lucide-arrow-down"] = "rbxassetid://10709767827",
		["lucide-arrow-down-circle"] = "rbxassetid://10709763034",
		["lucide-arrow-down-left"] = "rbxassetid://10709767656",
		["lucide-arrow-down-right"] = "rbxassetid://10709767750",
		["lucide-arrow-left"] = "rbxassetid://10709768114",
		["lucide-arrow-left-circle"] = "rbxassetid://10709767936",
		["lucide-arrow-left-right"] = "rbxassetid://10709768019",
		["lucide-arrow-right"] = "rbxassetid://10709768347",
		["lucide-arrow-right-circle"] = "rbxassetid://10709768226",
		["lucide-arrow-up"] = "rbxassetid://10709768939",
		["lucide-arrow-up-circle"] = "rbxassetid://10709768432",
		["lucide-arrow-up-down"] = "rbxassetid://10709768538",
		["lucide-arrow-up-left"] = "rbxassetid://10709768661",
		["lucide-arrow-up-right"] = "rbxassetid://10709768787",
		["lucide-asterisk"] = "rbxassetid://10709769095",
		["lucide-at-sign"] = "rbxassetid://10709769286",
		["lucide-award"] = "rbxassetid://10709769406",
		["lucide-axe"] = "rbxassetid://10709769508",
		["lucide-axis-3d"] = "rbxassetid://10709769598",
		["lucide-baby"] = "rbxassetid://10709769732",
		["lucide-backpack"] = "rbxassetid://10709769841",
		["lucide-baggage-claim"] = "rbxassetid://10709769935",
		["lucide-banana"] = "rbxassetid://10709770005",
		["lucide-banknote"] = "rbxassetid://10709770178",
		["lucide-bar-chart"] = "rbxassetid://10709773755",
		["lucide-bar-chart-2"] = "rbxassetid://10709770317",
		["lucide-bar-chart-3"] = "rbxassetid://10709770431",
		["lucide-bar-chart-4"] = "rbxassetid://10709770560",
		["lucide-bar-chart-horizontal"] = "rbxassetid://10709773669",
		["lucide-barcode"] = "rbxassetid://10747360675",
		["lucide-baseline"] = "rbxassetid://10709773863",
		["lucide-bath"] = "rbxassetid://10709773963",
		["lucide-battery"] = "rbxassetid://10709774640",
		["lucide-battery-charging"] = "rbxassetid://10709774068",
		["lucide-battery-full"] = "rbxassetid://10709774206",
		["lucide-battery-low"] = "rbxassetid://10709774370",
		["lucide-battery-medium"] = "rbxassetid://10709774513",
		["lucide-beaker"] = "rbxassetid://10709774756",
		["lucide-bed"] = "rbxassetid://10709775036",
		["lucide-bed-double"] = "rbxassetid://10709774864",
		["lucide-bed-single"] = "rbxassetid://10709774968",
		["lucide-beer"] = "rbxassetid://10709775167",
		["lucide-bell"] = "rbxassetid://10709775704",
		["lucide-bell-minus"] = "rbxassetid://10709775241",
		["lucide-bell-off"] = "rbxassetid://10709775320",
		["lucide-bell-plus"] = "rbxassetid://10709775448",
		["lucide-bell-ring"] = "rbxassetid://10709775560",
		["lucide-bike"] = "rbxassetid://10709775894",
		["lucide-binary"] = "rbxassetid://10709776050",
		["lucide-bitcoin"] = "rbxassetid://10709776126",
		["lucide-bluetooth"] = "rbxassetid://10709776655",
		["lucide-bluetooth-connected"] = "rbxassetid://10709776240",
		["lucide-bluetooth-off"] = "rbxassetid://10709776344",
		["lucide-bluetooth-searching"] = "rbxassetid://10709776501",
		["lucide-bold"] = "rbxassetid://10747813908",
		["lucide-bomb"] = "rbxassetid://10709781460",
		["lucide-bone"] = "rbxassetid://10709781605",
		["lucide-book"] = "rbxassetid://10709781824",
		["lucide-book-open"] = "rbxassetid://10709781717",
		["lucide-bookmark"] = "rbxassetid://10709782154",
		["lucide-bookmark-minus"] = "rbxassetid://10709781919",
		["lucide-bookmark-plus"] = "rbxassetid://10709782044",
		["lucide-bot"] = "rbxassetid://10709782230",
		["lucide-box"] = "rbxassetid://10709782497",
		["lucide-box-select"] = "rbxassetid://10709782342",
		["lucide-boxes"] = "rbxassetid://10709782582",
		["lucide-briefcase"] = "rbxassetid://10709782662",
		["lucide-brush"] = "rbxassetid://10709782758",
		["lucide-bug"] = "rbxassetid://10709782845",
		["lucide-building"] = "rbxassetid://10709783051",
		["lucide-building-2"] = "rbxassetid://10709782939",
		["lucide-bus"] = "rbxassetid://10709783137",
		["lucide-cake"] = "rbxassetid://10709783217",
		["lucide-calculator"] = "rbxassetid://10709783311",
		["lucide-calendar"] = "rbxassetid://10709789505",
		["lucide-calendar-check"] = "rbxassetid://10709783474",
		["lucide-calendar-check-2"] = "rbxassetid://10709783392",
		["lucide-calendar-clock"] = "rbxassetid://10709783577",
		["lucide-calendar-days"] = "rbxassetid://10709783673",
		["lucide-calendar-heart"] = "rbxassetid://10709783835",
		["lucide-calendar-minus"] = "rbxassetid://10709783959",
		["lucide-calendar-off"] = "rbxassetid://10709788784",
		["lucide-calendar-plus"] = "rbxassetid://10709788937",
		["lucide-calendar-range"] = "rbxassetid://10709789053",
		["lucide-calendar-search"] = "rbxassetid://10709789200",
		["lucide-calendar-x"] = "rbxassetid://10709789407",
		["lucide-calendar-x-2"] = "rbxassetid://10709789329",
		["lucide-camera"] = "rbxassetid://10709789686",
		["lucide-camera-off"] = "rbxassetid://10747822677",
		["lucide-car"] = "rbxassetid://10709789810",
		["lucide-carrot"] = "rbxassetid://10709789960",
		["lucide-cast"] = "rbxassetid://10709790097",
		["lucide-charge"] = "rbxassetid://10709790202",
		["lucide-check"] = "rbxassetid://10709790644",
		["lucide-check-circle"] = "rbxassetid://10709790387",
		["lucide-check-circle-2"] = "rbxassetid://10709790298",
		["lucide-check-square"] = "rbxassetid://10709790537",
		["lucide-chef-hat"] = "rbxassetid://10709790757",
		["lucide-cherry"] = "rbxassetid://10709790875",
		["lucide-chevron-down"] = "rbxassetid://10709790948",
		["lucide-chevron-first"] = "rbxassetid://10709791015",
		["lucide-chevron-last"] = "rbxassetid://10709791130",
		["lucide-chevron-left"] = "rbxassetid://10709791281",
		["lucide-chevron-right"] = "rbxassetid://10709791437",
		["lucide-chevron-up"] = "rbxassetid://10709791523",
		["lucide-chevrons-down"] = "rbxassetid://10709796864",
		["lucide-chevrons-down-up"] = "rbxassetid://10709791632",
		["lucide-chevrons-left"] = "rbxassetid://10709797151",
		["lucide-chevrons-left-right"] = "rbxassetid://10709797006",
		["lucide-chevrons-right"] = "rbxassetid://10709797382",
		["lucide-chevrons-right-left"] = "rbxassetid://10709797274",
		["lucide-chevrons-up"] = "rbxassetid://10709797622",
		["lucide-chevrons-up-down"] = "rbxassetid://10709797508",
		["lucide-chrome"] = "rbxassetid://10709797725",
		["lucide-circle"] = "rbxassetid://10709798174",
		["lucide-circle-dot"] = "rbxassetid://10709797837",
		["lucide-circle-ellipsis"] = "rbxassetid://10709797985",
		["lucide-circle-slashed"] = "rbxassetid://10709798100",
		["lucide-citrus"] = "rbxassetid://10709798276",
		["lucide-clapperboard"] = "rbxassetid://10709798350",
		["lucide-clipboard"] = "rbxassetid://10709799288",
		["lucide-clipboard-check"] = "rbxassetid://10709798443",
		["lucide-clipboard-copy"] = "rbxassetid://10709798574",
		["lucide-clipboard-edit"] = "rbxassetid://10709798682",
		["lucide-clipboard-list"] = "rbxassetid://10709798792",
		["lucide-clipboard-signature"] = "rbxassetid://10709798890",
		["lucide-clipboard-type"] = "rbxassetid://10709798999",
		["lucide-clipboard-x"] = "rbxassetid://10709799124",
		["lucide-clock"] = "rbxassetid://10709805144",
		["lucide-clock-1"] = "rbxassetid://10709799535",
		["lucide-clock-10"] = "rbxassetid://10709799718",
		["lucide-clock-11"] = "rbxassetid://10709799818",
		["lucide-clock-12"] = "rbxassetid://10709799962",
		["lucide-clock-2"] = "rbxassetid://10709803876",
		["lucide-clock-3"] = "rbxassetid://10709803989",
		["lucide-clock-4"] = "rbxassetid://10709804164",
		["lucide-clock-5"] = "rbxassetid://10709804291",
		["lucide-clock-6"] = "rbxassetid://10709804435",
		["lucide-clock-7"] = "rbxassetid://10709804599",
		["lucide-clock-8"] = "rbxassetid://10709804784",
		["lucide-clock-9"] = "rbxassetid://10709804996",
		["lucide-cloud"] = "rbxassetid://10709806740",
		["lucide-cloud-cog"] = "rbxassetid://10709805262",
		["lucide-cloud-drizzle"] = "rbxassetid://10709805371",
		["lucide-cloud-fog"] = "rbxassetid://10709805477",
		["lucide-cloud-hail"] = "rbxassetid://10709805596",
		["lucide-cloud-lightning"] = "rbxassetid://10709805727",
		["lucide-cloud-moon"] = "rbxassetid://10709805942",
		["lucide-cloud-moon-rain"] = "rbxassetid://10709805838",
		["lucide-cloud-off"] = "rbxassetid://10709806060",
		["lucide-cloud-rain"] = "rbxassetid://10709806277",
		["lucide-cloud-rain-wind"] = "rbxassetid://10709806166",
		["lucide-cloud-snow"] = "rbxassetid://10709806374",
		["lucide-cloud-sun"] = "rbxassetid://10709806631",
		["lucide-cloud-sun-rain"] = "rbxassetid://10709806475",
		["lucide-cloudy"] = "rbxassetid://10709806859",
		["lucide-clover"] = "rbxassetid://10709806995",
		["lucide-code"] = "rbxassetid://10709810463",
		["lucide-code-2"] = "rbxassetid://10709807111",
		["lucide-codepen"] = "rbxassetid://10709810534",
		["lucide-codesandbox"] = "rbxassetid://10709810676",
		["lucide-coffee"] = "rbxassetid://10709810814",
		["lucide-cog"] = "rbxassetid://10709810948",
		["lucide-coins"] = "rbxassetid://10709811110",
		["lucide-columns"] = "rbxassetid://10709811261",
		["lucide-command"] = "rbxassetid://10709811365",
		["lucide-compass"] = "rbxassetid://10709811445",
		["lucide-component"] = "rbxassetid://10709811595",
		["lucide-concierge-bell"] = "rbxassetid://10709811706",
		["lucide-connection"] = "rbxassetid://10747361219",
		["lucide-contact"] = "rbxassetid://10709811834",
		["lucide-contrast"] = "rbxassetid://10709811939",
		["lucide-cookie"] = "rbxassetid://10709812067",
		["lucide-copy"] = "rbxassetid://10709812159",
		["lucide-copyleft"] = "rbxassetid://10709812251",
		["lucide-copyright"] = "rbxassetid://10709812311",
		["lucide-corner-down-left"] = "rbxassetid://10709812396",
		["lucide-corner-down-right"] = "rbxassetid://10709812485",
		["lucide-corner-left-down"] = "rbxassetid://10709812632",
		["lucide-corner-left-up"] = "rbxassetid://10709812784",
		["lucide-corner-right-down"] = "rbxassetid://10709812939",
		["lucide-corner-right-up"] = "rbxassetid://10709813094",
		["lucide-corner-up-left"] = "rbxassetid://10709813185",
		["lucide-corner-up-right"] = "rbxassetid://10709813281",
		["lucide-cpu"] = "rbxassetid://10709813383",
		["lucide-croissant"] = "rbxassetid://10709818125",
		["lucide-crop"] = "rbxassetid://10709818245",
		["lucide-cross"] = "rbxassetid://10709818399",
		["lucide-crosshair"] = "rbxassetid://10709818534",
		["lucide-crown"] = "rbxassetid://10709818626",
		["lucide-cup-soda"] = "rbxassetid://10709818763",
		["lucide-curly-braces"] = "rbxassetid://10709818847",
		["lucide-currency"] = "rbxassetid://10709818931",
		["lucide-database"] = "rbxassetid://10709818996",
		["lucide-delete"] = "rbxassetid://10709819059",
		["lucide-diamond"] = "rbxassetid://10709819149",
		["lucide-dice-1"] = "rbxassetid://10709819266",
		["lucide-dice-2"] = "rbxassetid://10709819361",
		["lucide-dice-3"] = "rbxassetid://10709819508",
		["lucide-dice-4"] = "rbxassetid://10709819670",
		["lucide-dice-5"] = "rbxassetid://10709819801",
		["lucide-dice-6"] = "rbxassetid://10709819896",
		["lucide-dices"] = "rbxassetid://10723343321",
		["lucide-diff"] = "rbxassetid://10723343416",
		["lucide-disc"] = "rbxassetid://10723343537",
		["lucide-divide"] = "rbxassetid://10723343805",
		["lucide-divide-circle"] = "rbxassetid://10723343636",
		["lucide-divide-square"] = "rbxassetid://10723343737",
		["lucide-dollar-sign"] = "rbxassetid://10723343958",
		["lucide-download"] = "rbxassetid://10723344270",
		["lucide-download-cloud"] = "rbxassetid://10723344088",
		["lucide-droplet"] = "rbxassetid://10723344432",
		["lucide-droplets"] = "rbxassetid://10734883356",
		["lucide-drumstick"] = "rbxassetid://10723344737",
		["lucide-edit"] = "rbxassetid://10734883598",
		["lucide-edit-2"] = "rbxassetid://10723344885",
		["lucide-edit-3"] = "rbxassetid://10723345088",
		["lucide-egg"] = "rbxassetid://10723345518",
		["lucide-egg-fried"] = "rbxassetid://10723345347",
		["lucide-electricity"] = "rbxassetid://10723345749",
		["lucide-electricity-off"] = "rbxassetid://10723345643",
		["lucide-equal"] = "rbxassetid://10723345990",
		["lucide-equal-not"] = "rbxassetid://10723345866",
		["lucide-eraser"] = "rbxassetid://10723346158",
		["lucide-euro"] = "rbxassetid://10723346372",
		["lucide-expand"] = "rbxassetid://10723346553",
		["lucide-external-link"] = "rbxassetid://10723346684",
		["lucide-eye"] = "rbxassetid://10723346959",
		["lucide-eye-off"] = "rbxassetid://10723346871",
		["lucide-factory"] = "rbxassetid://10723347051",
		["lucide-fan"] = "rbxassetid://10723354359",
		["lucide-fast-forward"] = "rbxassetid://10723354521",
		["lucide-feather"] = "rbxassetid://10723354671",
		["lucide-figma"] = "rbxassetid://10723354801",
		["lucide-file"] = "rbxassetid://10723374641",
		["lucide-file-archive"] = "rbxassetid://10723354921",
		["lucide-file-audio"] = "rbxassetid://10723355148",
		["lucide-file-audio-2"] = "rbxassetid://10723355026",
		["lucide-file-axis-3d"] = "rbxassetid://10723355272",
		["lucide-file-badge"] = "rbxassetid://10723355622",
		["lucide-file-badge-2"] = "rbxassetid://10723355451",
		["lucide-file-bar-chart"] = "rbxassetid://10723355887",
		["lucide-file-bar-chart-2"] = "rbxassetid://10723355746",
		["lucide-file-box"] = "rbxassetid://10723355989",
		["lucide-file-check"] = "rbxassetid://10723356210",
		["lucide-file-check-2"] = "rbxassetid://10723356100",
		["lucide-file-clock"] = "rbxassetid://10723356329",
		["lucide-file-code"] = "rbxassetid://10723356507",
		["lucide-file-cog"] = "rbxassetid://10723356830",
		["lucide-file-cog-2"] = "rbxassetid://10723356676",
		["lucide-file-diff"] = "rbxassetid://10723357039",
		["lucide-file-digit"] = "rbxassetid://10723357151",
		["lucide-file-down"] = "rbxassetid://10723357322",
		["lucide-file-edit"] = "rbxassetid://10723357495",
		["lucide-file-heart"] = "rbxassetid://10723357637",
		["lucide-file-image"] = "rbxassetid://10723357790",
		["lucide-file-input"] = "rbxassetid://10723357933",
		["lucide-file-json"] = "rbxassetid://10723364435",
		["lucide-file-json-2"] = "rbxassetid://10723364361",
		["lucide-file-key"] = "rbxassetid://10723364605",
		["lucide-file-key-2"] = "rbxassetid://10723364515",
		["lucide-file-line-chart"] = "rbxassetid://10723364725",
		["lucide-file-lock"] = "rbxassetid://10723364957",
		["lucide-file-lock-2"] = "rbxassetid://10723364861",
		["lucide-file-minus"] = "rbxassetid://10723365254",
		["lucide-file-minus-2"] = "rbxassetid://10723365086",
		["lucide-file-output"] = "rbxassetid://10723365457",
		["lucide-file-pie-chart"] = "rbxassetid://10723365598",
		["lucide-file-plus"] = "rbxassetid://10723365877",
		["lucide-file-plus-2"] = "rbxassetid://10723365766",
		["lucide-file-question"] = "rbxassetid://10723365987",
		["lucide-file-scan"] = "rbxassetid://10723366167",
		["lucide-file-search"] = "rbxassetid://10723366550",
		["lucide-file-search-2"] = "rbxassetid://10723366340",
		["lucide-file-signature"] = "rbxassetid://10723366741",
		["lucide-file-spreadsheet"] = "rbxassetid://10723366962",
		["lucide-file-symlink"] = "rbxassetid://10723367098",
		["lucide-file-terminal"] = "rbxassetid://10723367244",
		["lucide-file-text"] = "rbxassetid://10723367380",
		["lucide-file-type"] = "rbxassetid://10723367606",
		["lucide-file-type-2"] = "rbxassetid://10723367509",
		["lucide-file-up"] = "rbxassetid://10723367734",
		["lucide-file-video"] = "rbxassetid://10723373884",
		["lucide-file-video-2"] = "rbxassetid://10723367834",
		["lucide-file-volume"] = "rbxassetid://10723374172",
		["lucide-file-volume-2"] = "rbxassetid://10723374030",
		["lucide-file-warning"] = "rbxassetid://10723374276",
		["lucide-file-x"] = "rbxassetid://10723374544",
		["lucide-file-x-2"] = "rbxassetid://10723374378",
		["lucide-files"] = "rbxassetid://10723374759",
		["lucide-film"] = "rbxassetid://10723374981",
		["lucide-filter"] = "rbxassetid://10723375128",
		["lucide-fingerprint"] = "rbxassetid://10723375250",
		["lucide-flag"] = "rbxassetid://10723375890",
		["lucide-flag-off"] = "rbxassetid://10723375443",
		["lucide-flag-triangle-left"] = "rbxassetid://10723375608",
		["lucide-flag-triangle-right"] = "rbxassetid://10723375727",
		["lucide-flame"] = "rbxassetid://10723376114",
		["lucide-flashlight"] = "rbxassetid://10723376471",
		["lucide-flashlight-off"] = "rbxassetid://10723376365",
		["lucide-flask-conical"] = "rbxassetid://10734883986",
		["lucide-flask-round"] = "rbxassetid://10723376614",
		["lucide-flip-horizontal"] = "rbxassetid://10723376884",
		["lucide-flip-horizontal-2"] = "rbxassetid://10723376745",
		["lucide-flip-vertical"] = "rbxassetid://10723377138",
		["lucide-flip-vertical-2"] = "rbxassetid://10723377026",
		["lucide-flower"] = "rbxassetid://10747830374",
		["lucide-flower-2"] = "rbxassetid://10723377305",
		["lucide-focus"] = "rbxassetid://10723377537",
		["lucide-folder"] = "rbxassetid://10723387563",
		["lucide-folder-archive"] = "rbxassetid://10723384478",
		["lucide-folder-check"] = "rbxassetid://10723384605",
		["lucide-folder-clock"] = "rbxassetid://10723384731",
		["lucide-folder-closed"] = "rbxassetid://10723384893",
		["lucide-folder-cog"] = "rbxassetid://10723385213",
		["lucide-folder-cog-2"] = "rbxassetid://10723385036",
		["lucide-folder-down"] = "rbxassetid://10723385338",
		["lucide-folder-edit"] = "rbxassetid://10723385445",
		["lucide-folder-heart"] = "rbxassetid://10723385545",
		["lucide-folder-input"] = "rbxassetid://10723385721",
		["lucide-folder-key"] = "rbxassetid://10723385848",
		["lucide-folder-lock"] = "rbxassetid://10723386005",
		["lucide-folder-minus"] = "rbxassetid://10723386127",
		["lucide-folder-open"] = "rbxassetid://10723386277",
		["lucide-folder-output"] = "rbxassetid://10723386386",
		["lucide-folder-plus"] = "rbxassetid://10723386531",
		["lucide-folder-search"] = "rbxassetid://10723386787",
		["lucide-folder-search-2"] = "rbxassetid://10723386674",
		["lucide-folder-symlink"] = "rbxassetid://10723386930",
		["lucide-folder-tree"] = "rbxassetid://10723387085",
		["lucide-folder-up"] = "rbxassetid://10723387265",
		["lucide-folder-x"] = "rbxassetid://10723387448",
		["lucide-folders"] = "rbxassetid://10723387721",
		["lucide-form-input"] = "rbxassetid://10723387841",
		["lucide-forward"] = "rbxassetid://10723388016",
		["lucide-frame"] = "rbxassetid://10723394389",
		["lucide-framer"] = "rbxassetid://10723394565",
		["lucide-frown"] = "rbxassetid://10723394681",
		["lucide-fuel"] = "rbxassetid://10723394846",
		["lucide-function-square"] = "rbxassetid://10723395041",
		["lucide-gamepad"] = "rbxassetid://10723395457",
		["lucide-gamepad-2"] = "rbxassetid://10723395215",
		["lucide-gauge"] = "rbxassetid://10723395708",
		["lucide-gavel"] = "rbxassetid://10723395896",
		["lucide-gem"] = "rbxassetid://10723396000",
		["lucide-ghost"] = "rbxassetid://10723396107",
		["lucide-gift"] = "rbxassetid://10723396402",
		["lucide-gift-card"] = "rbxassetid://10723396225",
		["lucide-git-branch"] = "rbxassetid://10723396676",
		["lucide-git-branch-plus"] = "rbxassetid://10723396542",
		["lucide-git-commit"] = "rbxassetid://10723396812",
		["lucide-git-compare"] = "rbxassetid://10723396954",
		["lucide-git-fork"] = "rbxassetid://10723397049",
		["lucide-git-merge"] = "rbxassetid://10723397165",
		["lucide-git-pull-request"] = "rbxassetid://10723397431",
		["lucide-git-pull-request-closed"] = "rbxassetid://10723397268",
		["lucide-git-pull-request-draft"] = "rbxassetid://10734884302",
		["lucide-glass"] = "rbxassetid://10723397788",
		["lucide-glass-2"] = "rbxassetid://10723397529",
		["lucide-glass-water"] = "rbxassetid://10723397678",
		["lucide-glasses"] = "rbxassetid://10723397895",
		["lucide-globe"] = "rbxassetid://10723404337",
		["lucide-globe-2"] = "rbxassetid://10723398002",
		["lucide-grab"] = "rbxassetid://10723404472",
		["lucide-graduation-cap"] = "rbxassetid://10723404691",
		["lucide-grape"] = "rbxassetid://10723404822",
		["lucide-grid"] = "rbxassetid://10723404936",
		["lucide-grip-horizontal"] = "rbxassetid://10723405089",
		["lucide-grip-vertical"] = "rbxassetid://10723405236",
		["lucide-hammer"] = "rbxassetid://10723405360",
		["lucide-hand"] = "rbxassetid://10723405649",
		["lucide-hand-metal"] = "rbxassetid://10723405508",
		["lucide-hard-drive"] = "rbxassetid://10723405749",
		["lucide-hard-hat"] = "rbxassetid://10723405859",
		["lucide-hash"] = "rbxassetid://10723405975",
		["lucide-haze"] = "rbxassetid://10723406078",
		["lucide-headphones"] = "rbxassetid://10723406165",
		["lucide-heart"] = "rbxassetid://10723406885",
		["lucide-heart-crack"] = "rbxassetid://10723406299",
		["lucide-heart-handshake"] = "rbxassetid://10723406480",
		["lucide-heart-off"] = "rbxassetid://10723406662",
		["lucide-heart-pulse"] = "rbxassetid://10723406795",
		["lucide-help-circle"] = "rbxassetid://10723406988",
		["lucide-hexagon"] = "rbxassetid://10723407092",
		["lucide-highlighter"] = "rbxassetid://10723407192",
		["lucide-history"] = "rbxassetid://10723407335",
		["lucide-home"] = "rbxassetid://10723407389",
		["lucide-hourglass"] = "rbxassetid://10723407498",
		["lucide-ice-cream"] = "rbxassetid://10723414308",
		["lucide-image"] = "rbxassetid://10723415040",
		["lucide-image-minus"] = "rbxassetid://10723414487",
		["lucide-image-off"] = "rbxassetid://10723414677",
		["lucide-image-plus"] = "rbxassetid://10723414827",
		["lucide-import"] = "rbxassetid://10723415205",
		["lucide-inbox"] = "rbxassetid://10723415335",
		["lucide-indent"] = "rbxassetid://10723415494",
		["lucide-indian-rupee"] = "rbxassetid://10723415642",
		["lucide-infinity"] = "rbxassetid://10723415766",
		["lucide-info"] = "rbxassetid://10723415903",
		["lucide-inspect"] = "rbxassetid://10723416057",
		["lucide-italic"] = "rbxassetid://10723416195",
		["lucide-japanese-yen"] = "rbxassetid://10723416363",
		["lucide-joystick"] = "rbxassetid://10723416527",
		["lucide-key"] = "rbxassetid://10723416652",
		["lucide-keyboard"] = "rbxassetid://10723416765",
		["lucide-lamp"] = "rbxassetid://10723417513",
		["lucide-lamp-ceiling"] = "rbxassetid://10723416922",
		["lucide-lamp-desk"] = "rbxassetid://10723417016",
		["lucide-lamp-floor"] = "rbxassetid://10723417131",
		["lucide-lamp-wall-down"] = "rbxassetid://10723417240",
		["lucide-lamp-wall-up"] = "rbxassetid://10723417356",
		["lucide-landmark"] = "rbxassetid://10723417608",
		["lucide-languages"] = "rbxassetid://10723417703",
		["lucide-laptop"] = "rbxassetid://10723423881",
		["lucide-laptop-2"] = "rbxassetid://10723417797",
		["lucide-lasso"] = "rbxassetid://10723424235",
		["lucide-lasso-select"] = "rbxassetid://10723424058",
		["lucide-laugh"] = "rbxassetid://10723424372",
		["lucide-layers"] = "rbxassetid://10723424505",
		["lucide-layout"] = "rbxassetid://10723425376",
		["lucide-layout-dashboard"] = "rbxassetid://10723424646",
		["lucide-layout-grid"] = "rbxassetid://10723424838",
		["lucide-layout-list"] = "rbxassetid://10723424963",
		["lucide-layout-template"] = "rbxassetid://10723425187",
		["lucide-leaf"] = "rbxassetid://10723425539",
		["lucide-library"] = "rbxassetid://10723425615",
		["lucide-life-buoy"] = "rbxassetid://10723425685",
		["lucide-lightbulb"] = "rbxassetid://10723425852",
		["lucide-lightbulb-off"] = "rbxassetid://10723425762",
		["lucide-line-chart"] = "rbxassetid://10723426393",
		["lucide-link"] = "rbxassetid://10723426722",
		["lucide-link-2"] = "rbxassetid://10723426595",
		["lucide-link-2-off"] = "rbxassetid://10723426513",
		["lucide-list"] = "rbxassetid://10723433811",
		["lucide-list-checks"] = "rbxassetid://10734884548",
		["lucide-list-end"] = "rbxassetid://10723426886",
		["lucide-list-minus"] = "rbxassetid://10723426986",
		["lucide-list-music"] = "rbxassetid://10723427081",
		["lucide-list-ordered"] = "rbxassetid://10723427199",
		["lucide-list-plus"] = "rbxassetid://10723427334",
		["lucide-list-start"] = "rbxassetid://10723427494",
		["lucide-list-video"] = "rbxassetid://10723427619",
		["lucide-list-x"] = "rbxassetid://10723433655",
		["lucide-loader"] = "rbxassetid://10723434070",
		["lucide-loader-2"] = "rbxassetid://10723433935",
		["lucide-locate"] = "rbxassetid://10723434557",
		["lucide-locate-fixed"] = "rbxassetid://10723434236",
		["lucide-locate-off"] = "rbxassetid://10723434379",
		["lucide-lock"] = "rbxassetid://10723434711",
		["lucide-log-in"] = "rbxassetid://10723434830",
		["lucide-log-out"] = "rbxassetid://10723434906",
		["lucide-luggage"] = "rbxassetid://10723434993",
		["lucide-magnet"] = "rbxassetid://10723435069",
		["lucide-mail"] = "rbxassetid://10734885430",
		["lucide-mail-check"] = "rbxassetid://10723435182",
		["lucide-mail-minus"] = "rbxassetid://10723435261",
		["lucide-mail-open"] = "rbxassetid://10723435342",
		["lucide-mail-plus"] = "rbxassetid://10723435443",
		["lucide-mail-question"] = "rbxassetid://10723435515",
		["lucide-mail-search"] = "rbxassetid://10734884739",
		["lucide-mail-warning"] = "rbxassetid://10734885015",
		["lucide-mail-x"] = "rbxassetid://10734885247",
		["lucide-mails"] = "rbxassetid://10734885614",
		["lucide-map"] = "rbxassetid://10734886202",
		["lucide-map-pin"] = "rbxassetid://10734886004",
		["lucide-map-pin-off"] = "rbxassetid://10734885803",
		["lucide-maximize"] = "rbxassetid://10734886735",
		["lucide-maximize-2"] = "rbxassetid://10734886496",
		["lucide-medal"] = "rbxassetid://10734887072",
		["lucide-megaphone"] = "rbxassetid://10734887454",
		["lucide-megaphone-off"] = "rbxassetid://10734887311",
		["lucide-meh"] = "rbxassetid://10734887603",
		["lucide-menu"] = "rbxassetid://10734887784",
		["lucide-message-circle"] = "rbxassetid://10734888000",
		["lucide-message-square"] = "rbxassetid://10734888228",
		["lucide-mic"] = "rbxassetid://10734888864",
		["lucide-mic-2"] = "rbxassetid://10734888430",
		["lucide-mic-off"] = "rbxassetid://10734888646",
		["lucide-microscope"] = "rbxassetid://10734889106",
		["lucide-microwave"] = "rbxassetid://10734895076",
		["lucide-milestone"] = "rbxassetid://10734895310",
		["lucide-minimize"] = "rbxassetid://10734895698",
		["lucide-minimize-2"] = "rbxassetid://10734895530",
		["lucide-minus"] = "rbxassetid://10734896206",
		["lucide-minus-circle"] = "rbxassetid://10734895856",
		["lucide-minus-square"] = "rbxassetid://10734896029",
		["lucide-monitor"] = "rbxassetid://10734896881",
		["lucide-monitor-off"] = "rbxassetid://10734896360",
		["lucide-monitor-speaker"] = "rbxassetid://10734896512",
		["lucide-moon"] = "rbxassetid://10734897102",
		["lucide-more-horizontal"] = "rbxassetid://10734897250",
		["lucide-more-vertical"] = "rbxassetid://10734897387",
		["lucide-mountain"] = "rbxassetid://10734897956",
		["lucide-mountain-snow"] = "rbxassetid://10734897665",
		["lucide-mouse"] = "rbxassetid://10734898592",
		["lucide-mouse-pointer"] = "rbxassetid://10734898476",
		["lucide-mouse-pointer-2"] = "rbxassetid://10734898194",
		["lucide-mouse-pointer-click"] = "rbxassetid://10734898355",
		["lucide-move"] = "rbxassetid://10734900011",
		["lucide-move-3d"] = "rbxassetid://10734898756",
		["lucide-move-diagonal"] = "rbxassetid://10734899164",
		["lucide-move-diagonal-2"] = "rbxassetid://10734898934",
		["lucide-move-horizontal"] = "rbxassetid://10734899414",
		["lucide-move-vertical"] = "rbxassetid://10734899821",
		["lucide-music"] = "rbxassetid://10734905958",
		["lucide-music-2"] = "rbxassetid://10734900215",
		["lucide-music-3"] = "rbxassetid://10734905665",
		["lucide-music-4"] = "rbxassetid://10734905823",
		["lucide-navigation"] = "rbxassetid://10734906744",
		["lucide-navigation-2"] = "rbxassetid://10734906332",
		["lucide-navigation-2-off"] = "rbxassetid://10734906144",
		["lucide-navigation-off"] = "rbxassetid://10734906580",
		["lucide-network"] = "rbxassetid://10734906975",
		["lucide-newspaper"] = "rbxassetid://10734907168",
		["lucide-octagon"] = "rbxassetid://10734907361",
		["lucide-option"] = "rbxassetid://10734907649",
		["lucide-outdent"] = "rbxassetid://10734907933",
		["lucide-package"] = "rbxassetid://10734909540",
		["lucide-package-2"] = "rbxassetid://10734908151",
		["lucide-package-check"] = "rbxassetid://10734908384",
		["lucide-package-minus"] = "rbxassetid://10734908626",
		["lucide-package-open"] = "rbxassetid://10734908793",
		["lucide-package-plus"] = "rbxassetid://10734909016",
		["lucide-package-search"] = "rbxassetid://10734909196",
		["lucide-package-x"] = "rbxassetid://10734909375",
		["lucide-paint-bucket"] = "rbxassetid://10734909847",
		["lucide-paintbrush"] = "rbxassetid://10734910187",
		["lucide-paintbrush-2"] = "rbxassetid://10734910030",
		["lucide-palette"] = "rbxassetid://10734910430",
		["lucide-palmtree"] = "rbxassetid://10734910680",
		["lucide-paperclip"] = "rbxassetid://10734910927",
		["lucide-party-popper"] = "rbxassetid://10734918735",
		["lucide-pause"] = "rbxassetid://10734919336",
		["lucide-pause-circle"] = "rbxassetid://10735024209",
		["lucide-pause-octagon"] = "rbxassetid://10734919143",
		["lucide-pen-tool"] = "rbxassetid://10734919503",
		["lucide-pencil"] = "rbxassetid://10734919691",
		["lucide-percent"] = "rbxassetid://10734919919",
		["lucide-person-standing"] = "rbxassetid://10734920149",
		["lucide-phone"] = "rbxassetid://10734921524",
		["lucide-phone-call"] = "rbxassetid://10734920305",
		["lucide-phone-forwarded"] = "rbxassetid://10734920508",
		["lucide-phone-incoming"] = "rbxassetid://10734920694",
		["lucide-phone-missed"] = "rbxassetid://10734920845",
		["lucide-phone-off"] = "rbxassetid://10734921077",
		["lucide-phone-outgoing"] = "rbxassetid://10734921288",
		["lucide-pie-chart"] = "rbxassetid://10734921727",
		["lucide-piggy-bank"] = "rbxassetid://10734921935",
		["lucide-pin"] = "rbxassetid://10734922324",
		["lucide-pin-off"] = "rbxassetid://10734922180",
		["lucide-pipette"] = "rbxassetid://10734922497",
		["lucide-pizza"] = "rbxassetid://10734922774",
		["lucide-plane"] = "rbxassetid://10734922971",
		["lucide-play"] = "rbxassetid://10734923549",
		["lucide-play-circle"] = "rbxassetid://10734923214",
		["lucide-plus"] = "rbxassetid://10734924532",
		["lucide-plus-circle"] = "rbxassetid://10734923868",
		["lucide-plus-square"] = "rbxassetid://10734924219",
		["lucide-podcast"] = "rbxassetid://10734929553",
		["lucide-pointer"] = "rbxassetid://10734929723",
		["lucide-pound-sterling"] = "rbxassetid://10734929981",
		["lucide-power"] = "rbxassetid://10734930466",
		["lucide-power-off"] = "rbxassetid://10734930257",
		["lucide-printer"] = "rbxassetid://10734930632",
		["lucide-puzzle"] = "rbxassetid://10734930886",
		["lucide-quote"] = "rbxassetid://10734931234",
		["lucide-radio"] = "rbxassetid://10734931596",
		["lucide-radio-receiver"] = "rbxassetid://10734931402",
		["lucide-rectangle-horizontal"] = "rbxassetid://10734931777",
		["lucide-rectangle-vertical"] = "rbxassetid://10734932081",
		["lucide-recycle"] = "rbxassetid://10734932295",
		["lucide-redo"] = "rbxassetid://10734932822",
		["lucide-redo-2"] = "rbxassetid://10734932586",
		["lucide-refresh-ccw"] = "rbxassetid://10734933056",
		["lucide-refresh-cw"] = "rbxassetid://10734933222",
		["lucide-refrigerator"] = "rbxassetid://10734933465",
		["lucide-regex"] = "rbxassetid://10734933655",
		["lucide-repeat"] = "rbxassetid://10734933966",
		["lucide-repeat-1"] = "rbxassetid://10734933826",
		["lucide-reply"] = "rbxassetid://10734934252",
		["lucide-reply-all"] = "rbxassetid://10734934132",
		["lucide-rewind"] = "rbxassetid://10734934347",
		["lucide-rocket"] = "rbxassetid://10734934585",
		["lucide-rocking-chair"] = "rbxassetid://10734939942",
		["lucide-rotate-3d"] = "rbxassetid://10734940107",
		["lucide-rotate-ccw"] = "rbxassetid://10734940376",
		["lucide-rotate-cw"] = "rbxassetid://10734940654",
		["lucide-rss"] = "rbxassetid://10734940825",
		["lucide-ruler"] = "rbxassetid://10734941018",
		["lucide-russian-ruble"] = "rbxassetid://10734941199",
		["lucide-sailboat"] = "rbxassetid://10734941354",
		["lucide-save"] = "rbxassetid://10734941499",
		["lucide-scale"] = "rbxassetid://10734941912",
		["lucide-scale-3d"] = "rbxassetid://10734941739",
		["lucide-scaling"] = "rbxassetid://10734942072",
		["lucide-scan"] = "rbxassetid://10734942565",
		["lucide-scan-face"] = "rbxassetid://10734942198",
		["lucide-scan-line"] = "rbxassetid://10734942351",
		["lucide-scissors"] = "rbxassetid://10734942778",
		["lucide-screen-share"] = "rbxassetid://10734943193",
		["lucide-screen-share-off"] = "rbxassetid://10734942967",
		["lucide-scroll"] = "rbxassetid://10734943448",
		["lucide-search"] = "rbxassetid://10734943674",
		["lucide-send"] = "rbxassetid://10734943902",
		["lucide-separator-horizontal"] = "rbxassetid://10734944115",
		["lucide-separator-vertical"] = "rbxassetid://10734944326",
		["lucide-server"] = "rbxassetid://10734949856",
		["lucide-server-cog"] = "rbxassetid://10734944444",
		["lucide-server-crash"] = "rbxassetid://10734944554",
		["lucide-server-off"] = "rbxassetid://10734944668",
		["lucide-settings"] = "rbxassetid://10734950309",
		["lucide-settings-2"] = "rbxassetid://10734950020",
		["lucide-share"] = "rbxassetid://10734950813",
		["lucide-share-2"] = "rbxassetid://10734950553",
		["lucide-sheet"] = "rbxassetid://10734951038",
		["lucide-shield"] = "rbxassetid://10734951847",
		["lucide-shield-alert"] = "rbxassetid://10734951173",
		["lucide-shield-check"] = "rbxassetid://10734951367",
		["lucide-shield-close"] = "rbxassetid://10734951535",
		["lucide-shield-off"] = "rbxassetid://10734951684",
		["lucide-shirt"] = "rbxassetid://10734952036",
		["lucide-shopping-bag"] = "rbxassetid://10734952273",
		["lucide-shopping-cart"] = "rbxassetid://10734952479",
		["lucide-shovel"] = "rbxassetid://10734952773",
		["lucide-shower-head"] = "rbxassetid://10734952942",
		["lucide-shrink"] = "rbxassetid://10734953073",
		["lucide-shrub"] = "rbxassetid://10734953241",
		["lucide-shuffle"] = "rbxassetid://10734953451",
		["lucide-sidebar"] = "rbxassetid://10734954301",
		["lucide-sidebar-close"] = "rbxassetid://10734953715",
		["lucide-sidebar-open"] = "rbxassetid://10734954000",
		["lucide-sigma"] = "rbxassetid://10734954538",
		["lucide-signal"] = "rbxassetid://10734961133",
		["lucide-signal-high"] = "rbxassetid://10734954807",
		["lucide-signal-low"] = "rbxassetid://10734955080",
		["lucide-signal-medium"] = "rbxassetid://10734955336",
		["lucide-signal-zero"] = "rbxassetid://10734960878",
		["lucide-siren"] = "rbxassetid://10734961284",
		["lucide-skip-back"] = "rbxassetid://10734961526",
		["lucide-skip-forward"] = "rbxassetid://10734961809",
		["lucide-skull"] = "rbxassetid://10734962068",
		["lucide-slack"] = "rbxassetid://10734962339",
		["lucide-slash"] = "rbxassetid://10734962600",
		["lucide-slice"] = "rbxassetid://10734963024",
		["lucide-sliders"] = "rbxassetid://10734963400",
		["lucide-sliders-horizontal"] = "rbxassetid://10734963191",
		["lucide-smartphone"] = "rbxassetid://10734963940",
		["lucide-smartphone-charging"] = "rbxassetid://10734963671",
		["lucide-smile"] = "rbxassetid://10734964441",
		["lucide-smile-plus"] = "rbxassetid://10734964188",
		["lucide-snowflake"] = "rbxassetid://10734964600",
		["lucide-sofa"] = "rbxassetid://10734964852",
		["lucide-sort-asc"] = "rbxassetid://10734965115",
		["lucide-sort-desc"] = "rbxassetid://10734965287",
		["lucide-speaker"] = "rbxassetid://10734965419",
		["lucide-sprout"] = "rbxassetid://10734965572",
		["lucide-square"] = "rbxassetid://10734965702",
		["lucide-star"] = "rbxassetid://10734966248",
		["lucide-star-half"] = "rbxassetid://10734965897",
		["lucide-star-off"] = "rbxassetid://10734966097",
		["lucide-stethoscope"] = "rbxassetid://10734966384",
		["lucide-sticker"] = "rbxassetid://10734972234",
		["lucide-sticky-note"] = "rbxassetid://10734972463",
		["lucide-stop-circle"] = "rbxassetid://10734972621",
		["lucide-stretch-horizontal"] = "rbxassetid://10734972862",
		["lucide-stretch-vertical"] = "rbxassetid://10734973130",
		["lucide-strikethrough"] = "rbxassetid://10734973290",
		["lucide-subscript"] = "rbxassetid://10734973457",
		["lucide-sun"] = "rbxassetid://10734974297",
		["lucide-sun-dim"] = "rbxassetid://10734973645",
		["lucide-sun-medium"] = "rbxassetid://10734973778",
		["lucide-sun-moon"] = "rbxassetid://10734973999",
		["lucide-sun-snow"] = "rbxassetid://10734974130",
		["lucide-sunrise"] = "rbxassetid://10734974522",
		["lucide-sunset"] = "rbxassetid://10734974689",
		["lucide-superscript"] = "rbxassetid://10734974850",
		["lucide-swiss-franc"] = "rbxassetid://10734975024",
		["lucide-switch-camera"] = "rbxassetid://10734975214",
		["lucide-sword"] = "rbxassetid://10734975486",
		["lucide-swords"] = "rbxassetid://10734975692",
		["lucide-syringe"] = "rbxassetid://10734975932",
		["lucide-table"] = "rbxassetid://10734976230",
		["lucide-table-2"] = "rbxassetid://10734976097",
		["lucide-tablet"] = "rbxassetid://10734976394",
		["lucide-tag"] = "rbxassetid://10734976528",
		["lucide-tags"] = "rbxassetid://10734976739",
		["lucide-target"] = "rbxassetid://10734977012",
		["lucide-tent"] = "rbxassetid://10734981750",
		["lucide-terminal"] = "rbxassetid://10734982144",
		["lucide-terminal-square"] = "rbxassetid://10734981995",
		["lucide-text-cursor"] = "rbxassetid://10734982395",
		["lucide-text-cursor-input"] = "rbxassetid://10734982297",
		["lucide-thermometer"] = "rbxassetid://10734983134",
		["lucide-thermometer-snowflake"] = "rbxassetid://10734982571",
		["lucide-thermometer-sun"] = "rbxassetid://10734982771",
		["lucide-thumbs-down"] = "rbxassetid://10734983359",
		["lucide-thumbs-up"] = "rbxassetid://10734983629",
		["lucide-ticket"] = "rbxassetid://10734983868",
		["lucide-timer"] = "rbxassetid://10734984606",
		["lucide-timer-off"] = "rbxassetid://10734984138",
		["lucide-timer-reset"] = "rbxassetid://10734984355",
		["lucide-toggle-left"] = "rbxassetid://10734984834",
		["lucide-toggle-right"] = "rbxassetid://10734985040",
		["lucide-tornado"] = "rbxassetid://10734985247",
		["lucide-toy-brick"] = "rbxassetid://10747361919",
		["lucide-train"] = "rbxassetid://10747362105",
		["lucide-trash"] = "rbxassetid://10747362393",
		["lucide-trash-2"] = "rbxassetid://10747362241",
		["lucide-tree-deciduous"] = "rbxassetid://10747362534",
		["lucide-tree-pine"] = "rbxassetid://10747362748",
		["lucide-trees"] = "rbxassetid://10747363016",
		["lucide-trending-down"] = "rbxassetid://10747363205",
		["lucide-trending-up"] = "rbxassetid://10747363465",
		["lucide-triangle"] = "rbxassetid://10747363621",
		["lucide-trophy"] = "rbxassetid://10747363809",
		["lucide-truck"] = "rbxassetid://10747364031",
		["lucide-tv"] = "rbxassetid://10747364593",
		["lucide-tv-2"] = "rbxassetid://10747364302",
		["lucide-type"] = "rbxassetid://10747364761",
		["lucide-umbrella"] = "rbxassetid://10747364971",
		["lucide-underline"] = "rbxassetid://10747365191",
		["lucide-undo"] = "rbxassetid://10747365484",
		["lucide-undo-2"] = "rbxassetid://10747365359",
		["lucide-unlink"] = "rbxassetid://10747365771",
		["lucide-unlink-2"] = "rbxassetid://10747397871",
		["lucide-unlock"] = "rbxassetid://10747366027",
		["lucide-upload"] = "rbxassetid://10747366434",
		["lucide-upload-cloud"] = "rbxassetid://10747366266",
		["lucide-usb"] = "rbxassetid://10747366606",
		["lucide-user"] = "rbxassetid://10747373176",
		["lucide-user-check"] = "rbxassetid://10747371901",
		["lucide-user-cog"] = "rbxassetid://10747372167",
		["lucide-user-minus"] = "rbxassetid://10747372346",
		["lucide-user-plus"] = "rbxassetid://10747372702",
		["lucide-user-x"] = "rbxassetid://10747372992",
		["lucide-users"] = "rbxassetid://10747373426",
		["lucide-utensils"] = "rbxassetid://10747373821",
		["lucide-utensils-crossed"] = "rbxassetid://10747373629",
		["lucide-venetian-mask"] = "rbxassetid://10747374003",
		["lucide-verified"] = "rbxassetid://10747374131",
		["lucide-vibrate"] = "rbxassetid://10747374489",
		["lucide-vibrate-off"] = "rbxassetid://10747374269",
		["lucide-video"] = "rbxassetid://10747374938",
		["lucide-video-off"] = "rbxassetid://10747374721",
		["lucide-view"] = "rbxassetid://10747375132",
		["lucide-voicemail"] = "rbxassetid://10747375281",
		["lucide-volume"] = "rbxassetid://10747376008",
		["lucide-volume-1"] = "rbxassetid://10747375450",
		["lucide-volume-2"] = "rbxassetid://10747375679",
		["lucide-volume-x"] = "rbxassetid://10747375880",
		["lucide-wallet"] = "rbxassetid://10747376205",
		["lucide-wand"] = "rbxassetid://10747376565",
		["lucide-wand-2"] = "rbxassetid://10747376349",
		["lucide-watch"] = "rbxassetid://10747376722",
		["lucide-waves"] = "rbxassetid://10747376931",
		["lucide-webcam"] = "rbxassetid://10747381992",
		["lucide-wifi"] = "rbxassetid://10747382504",
		["lucide-wifi-off"] = "rbxassetid://10747382268",
		["lucide-wind"] = "rbxassetid://10747382750",
		["lucide-wrap-text"] = "rbxassetid://10747383065",
		["lucide-wrench"] = "rbxassetid://10747383470",
		["lucide-x"] = "rbxassetid://10747384394",
		["lucide-x-circle"] = "rbxassetid://10747383819",
		["lucide-x-octagon"] = "rbxassetid://10747384037",
		["lucide-x-square"] = "rbxassetid://10747384217",
		["lucide-zoom-in"] = "rbxassetid://10747384552",
		["lucide-zoom-out"] = "rbxassetid://10747384679",
	},
}
 end,
    [53] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(53)local Flipper = {
	SingleMotor = require(script.SingleMotor),
	GroupMotor = require(script.GroupMotor),

	Instant = require(script.Instant),
	Linear = require(script.Linear),
	Spring = require(script.Spring),

	isMotor = require(script.isMotor),
}

return Flipper
 end,
    [54] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(54)local RunService = game:GetService("RunService")

local Signal = require(script.Parent.Signal)

local noop = function() end

local BaseMotor = {}
BaseMotor.__index = BaseMotor

function BaseMotor.new()
	return setmetatable({
		_onStep = Signal.new(),
		_onStart = Signal.new(),
		_onComplete = Signal.new(),
	}, BaseMotor)
end

function BaseMotor:onStep(handler)
	return self._onStep:connect(handler)
end

function BaseMotor:onStart(handler)
	return self._onStart:connect(handler)
end

function BaseMotor:onComplete(handler)
	return self._onComplete:connect(handler)
end

function BaseMotor:start()
	if not self._connection then
		self._connection = RunService.RenderStepped:Connect(function(deltaTime)
			self:step(deltaTime)
		end)
	end
end

function BaseMotor:stop()
	if self._connection then
		self._connection:Disconnect()
		self._connection = nil
	end
end

BaseMotor.destroy = BaseMotor.stop

BaseMotor.step = noop
BaseMotor.getValue = noop
BaseMotor.setGoal = noop

function BaseMotor:__tostring()
	return "Motor"
end

return BaseMotor
 end,
    [55] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(55)return function()
	local RunService = game:GetService("RunService")

	local BaseMotor = require(script.Parent.BaseMotor)

	describe("connection management", function()
		local motor = BaseMotor.new()

		it("should hook up connections on :start()", function()
			motor:start()
			expect(typeof(motor._connection)).to.equal("RBXScriptConnection")
		end)

		it("should remove connections on :stop() or :destroy()", function()
			motor:stop()
			expect(motor._connection).to.equal(nil)
		end)
	end)

	it("should call :step() with deltaTime", function()
		local motor = BaseMotor.new()

		local argumentsProvided
		function motor:step(...)
			argumentsProvided = { ... }
			motor:stop()
		end

		motor:start()

		local expectedDeltaTime = RunService.RenderStepped:Wait()

		-- Give it another frame, because connections tend to be invoked later than :Wait() calls
		RunService.RenderStepped:Wait()

		expect(argumentsProvided).to.be.ok()
		expect(argumentsProvided[1]).to.equal(expectedDeltaTime)
	end)
end
 end,
    [56] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(56)local BaseMotor = require(script.Parent.BaseMotor)
local SingleMotor = require(script.Parent.SingleMotor)

local isMotor = require(script.Parent.isMotor)

local GroupMotor = setmetatable({}, BaseMotor)
GroupMotor.__index = GroupMotor

local function toMotor(value)
	if isMotor(value) then
		return value
	end

	local valueType = typeof(value)

	if valueType == "number" then
		return SingleMotor.new(value, false)
	elseif valueType == "table" then
		return GroupMotor.new(value, false)
	end

	error(("Unable to convert %q to motor; type %s is unsupported"):format(value, valueType), 2)
end

function GroupMotor.new(initialValues, useImplicitConnections)
	assert(initialValues, "Missing argument #1: initialValues")
	assert(typeof(initialValues) == "table", "initialValues must be a table!")
	assert(
		not initialValues.step,
		'initialValues contains disallowed property "step". Did you mean to put a table of values here?'
	)

	local self = setmetatable(BaseMotor.new(), GroupMotor)

	if useImplicitConnections ~= nil then
		self._useImplicitConnections = useImplicitConnections
	else
		self._useImplicitConnections = true
	end

	self._complete = true
	self._motors = {}

	for key, value in pairs(initialValues) do
		self._motors[key] = toMotor(value)
	end

	return self
end

function GroupMotor:step(deltaTime)
	if self._complete then
		return true
	end

	local allMotorsComplete = true

	for _, motor in pairs(self._motors) do
		local complete = motor:step(deltaTime)
		if not complete then
			-- If any of the sub-motors are incomplete, the group motor will not be complete either
			allMotorsComplete = false
		end
	end

	self._onStep:fire(self:getValue())

	if allMotorsComplete then
		if self._useImplicitConnections then
			self:stop()
		end

		self._complete = true
		self._onComplete:fire()
	end

	return allMotorsComplete
end

function GroupMotor:setGoal(goals)
	assert(not goals.step, 'goals contains disallowed property "step". Did you mean to put a table of goals here?')

	self._complete = false
	self._onStart:fire()

	for key, goal in pairs(goals) do
		local motor = assert(self._motors[key], ("Unknown motor for key %s"):format(key))
		motor:setGoal(goal)
	end

	if self._useImplicitConnections then
		self:start()
	end
end

function GroupMotor:getValue()
	local values = {}

	for key, motor in pairs(self._motors) do
		values[key] = motor:getValue()
	end

	return values
end

function GroupMotor:__tostring()
	return "Motor(Group)"
end

return GroupMotor
 end,
    [57] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(57)return function()
	local GroupMotor = require(script.Parent.GroupMotor)

	local Instant = require(script.Parent.Instant)
	local Spring = require(script.Parent.Spring)

	it("should complete when all child motors are complete", function()
		local motor = GroupMotor.new({
			A = 1,
			B = 2,
		}, false)

		expect(motor._complete).to.equal(true)

		motor:setGoal({
			A = Instant.new(3),
			B = Spring.new(4, { frequency = 7.5, dampingRatio = 1 }),
		})

		expect(motor._complete).to.equal(false)

		motor:step(1 / 60)

		expect(motor._complete).to.equal(false)

		for _ = 1, 0.5 * 60 do
			motor:step(1 / 60)
		end

		expect(motor._complete).to.equal(true)
	end)

	it("should start when the goal is set", function()
		local motor = GroupMotor.new({
			A = 0,
		}, false)

		local bool = false
		motor:onStart(function()
			bool = not bool
		end)

		motor:setGoal({
			A = Instant.new(1),
		})

		expect(bool).to.equal(true)

		motor:setGoal({
			A = Instant.new(1),
		})

		expect(bool).to.equal(false)
	end)

	it("should properly return all values", function()
		local motor = GroupMotor.new({
			A = 1,
			B = 2,
		}, false)

		local value = motor:getValue()

		expect(value.A).to.equal(1)
		expect(value.B).to.equal(2)
	end)

	it("should error when a goal is given to GroupMotor.new", function()
		local success = pcall(function()
			GroupMotor.new(Instant.new(0))
		end)

		expect(success).to.equal(false)
	end)

	it("should error when a single goal is provided to GroupMotor:step", function()
		local success = pcall(function()
			GroupMotor.new({ a = 1 }):setGoal(Instant.new(0))
		end)

		expect(success).to.equal(false)
	end)
end
 end,
    [58] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(58)local Instant = {}
Instant.__index = Instant

function Instant.new(targetValue)
	return setmetatable({
		_targetValue = targetValue,
	}, Instant)
end

function Instant:step()
	return {
		complete = true,
		value = self._targetValue,
	}
end

return Instant
 end,
    [59] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(59)return function()
	local Instant = require(script.Parent.Instant)

	it("should return a completed state with the provided value", function()
		local goal = Instant.new(1.23)
		local state = goal:step(0.1, { value = 0, complete = false })
		expect(state.complete).to.equal(true)
		expect(state.value).to.equal(1.23)
	end)
end
 end,
    [60] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(60)local Linear = {}
Linear.__index = Linear

function Linear.new(targetValue, options)
	assert(targetValue, "Missing argument #1: targetValue")

	options = options or {}

	return setmetatable({
		_targetValue = targetValue,
		_velocity = options.velocity or 1,
	}, Linear)
end

function Linear:step(state, dt)
	local position = state.value
	local velocity = self._velocity -- Linear motion ignores the state's velocity
	local goal = self._targetValue

	local dPos = dt * velocity

	local complete = dPos >= math.abs(goal - position)
	position = position + dPos * (goal > position and 1 or -1)
	if complete then
		position = self._targetValue
		velocity = 0
	end

	return {
		complete = complete,
		value = position,
		velocity = velocity,
	}
end

return Linear
 end,
    [61] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(61)return function()
	local SingleMotor = require(script.Parent.SingleMotor)
	local Linear = require(script.Parent.Linear)

	describe("completed state", function()
		local motor = SingleMotor.new(0, false)

		local goal = Linear.new(1, { velocity = 1 })
		motor:setGoal(goal)

		for _ = 1, 60 do
			motor:step(1 / 60)
		end

		it("should complete", function()
			expect(motor._state.complete).to.equal(true)
		end)

		it("should be exactly the goal value when completed", function()
			expect(motor._state.value).to.equal(1)
		end)
	end)

	describe("uncompleted state", function()
		local motor = SingleMotor.new(0, false)

		local goal = Linear.new(1, { velocity = 1 })
		motor:setGoal(goal)

		for _ = 1, 59 do
			motor:step(1 / 60)
		end

		it("should be uncomplete", function()
			expect(motor._state.complete).to.equal(false)
		end)
	end)

	describe("negative velocity", function()
		local motor = SingleMotor.new(1, false)

		local goal = Linear.new(0, { velocity = 1 })
		motor:setGoal(goal)

		for _ = 1, 60 do
			motor:step(1 / 60)
		end

		it("should complete", function()
			expect(motor._state.complete).to.equal(true)
		end)

		it("should be exactly the goal value when completed", function()
			expect(motor._state.value).to.equal(0)
		end)
	end)
end
 end,
    [62] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(62)local Connection = {}
Connection.__index = Connection

function Connection.new(signal, handler)
	return setmetatable({
		signal = signal,
		connected = true,
		_handler = handler,
	}, Connection)
end

function Connection:disconnect()
	if self.connected then
		self.connected = false

		for index, connection in pairs(self.signal._connections) do
			if connection == self then
				table.remove(self.signal._connections, index)
				return
			end
		end
	end
end

local Signal = {}
Signal.__index = Signal

function Signal.new()
	return setmetatable({
		_connections = {},
		_threads = {},
	}, Signal)
end

function Signal:fire(...)
	for _, connection in pairs(self._connections) do
		connection._handler(...)
	end

	for _, thread in pairs(self._threads) do
		coroutine.resume(thread, ...)
	end

	self._threads = {}
end

function Signal:connect(handler)
	local connection = Connection.new(self, handler)
	table.insert(self._connections, connection)
	return connection
end

function Signal:wait()
	table.insert(self._threads, coroutine.running())
	return coroutine.yield()
end

return Signal
 end,
    [63] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(63)return function()
	local Signal = require(script.Parent.Signal)

	it("should invoke all connections, instantly", function()
		local signal = Signal.new()

		local a, b

		signal:connect(function(value)
			a = value
		end)

		signal:connect(function(value)
			b = value
		end)

		signal:fire("hello")

		expect(a).to.equal("hello")
		expect(b).to.equal("hello")
	end)

	it("should return values when :wait() is called", function()
		local signal = Signal.new()

		spawn(function()
			signal:fire(123, "hello")
		end)

		local a, b = signal:wait()

		expect(a).to.equal(123)
		expect(b).to.equal("hello")
	end)

	it("should properly handle disconnections", function()
		local signal = Signal.new()

		local didRun = false

		local connection = signal:connect(function()
			didRun = true
		end)
		connection:disconnect()

		signal:fire()
		expect(didRun).to.equal(false)
	end)
end
 end,
    [64] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(64)local BaseMotor = require(script.Parent.BaseMotor)

local SingleMotor = setmetatable({}, BaseMotor)
SingleMotor.__index = SingleMotor

function SingleMotor.new(initialValue, useImplicitConnections)
	assert(initialValue, "Missing argument #1: initialValue")
	assert(typeof(initialValue) == "number", "initialValue must be a number!")

	local self = setmetatable(BaseMotor.new(), SingleMotor)

	if useImplicitConnections ~= nil then
		self._useImplicitConnections = useImplicitConnections
	else
		self._useImplicitConnections = true
	end

	self._goal = nil
	self._state = {
		complete = true,
		value = initialValue,
	}

	return self
end

function SingleMotor:step(deltaTime)
	if self._state.complete then
		return true
	end

	local newState = self._goal:step(self._state, deltaTime)

	self._state = newState
	self._onStep:fire(newState.value)

	if newState.complete then
		if self._useImplicitConnections then
			self:stop()
		end

		self._onComplete:fire()
	end

	return newState.complete
end

function SingleMotor:getValue()
	return self._state.value
end

function SingleMotor:setGoal(goal)
	self._state.complete = false
	self._goal = goal

	self._onStart:fire()

	if self._useImplicitConnections then
		self:start()
	end
end

function SingleMotor:__tostring()
	return "Motor(Single)"
end

return SingleMotor
 end,
    [65] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(65)return function()
	local SingleMotor = require(script.Parent.SingleMotor)
	local Instant = require(script.Parent.Instant)

	it("should assign new state on step", function()
		local motor = SingleMotor.new(0, false)

		motor:setGoal(Instant.new(5))
		motor:step(1 / 60)

		expect(motor._state.complete).to.equal(true)
		expect(motor._state.value).to.equal(5)
	end)

	it("should invoke onComplete listeners when the goal is completed", function()
		local motor = SingleMotor.new(0, false)

		local didComplete = false
		motor:onComplete(function()
			didComplete = true
		end)

		motor:setGoal(Instant.new(5))
		motor:step(1 / 60)

		expect(didComplete).to.equal(true)
	end)

	it("should start when the goal is set", function()
		local motor = SingleMotor.new(0, false)

		local bool = false
		motor:onStart(function()
			bool = not bool
		end)

		motor:setGoal(Instant.new(5))

		expect(bool).to.equal(true)

		motor:setGoal(Instant.new(5))

		expect(bool).to.equal(false)
	end)
end
 end,
    [66] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(66)local VELOCITY_THRESHOLD = 0.001
local POSITION_THRESHOLD = 0.001

local EPS = 0.0001

local Spring = {}
Spring.__index = Spring

function Spring.new(targetValue, options)
	assert(targetValue, "Missing argument #1: targetValue")
	options = options or {}

	return setmetatable({
		_targetValue = targetValue,
		_frequency = options.frequency or 4,
		_dampingRatio = options.dampingRatio or 1,
	}, Spring)
end

function Spring:step(state, dt)
	-- Copyright 2018 Parker Stebbins (parker@fractality.io)
	-- github.com/Fraktality/Spring
	-- Distributed under the MIT license

	local d = self._dampingRatio
	local f = self._frequency * 2 * math.pi
	local g = self._targetValue
	local p0 = state.value
	local v0 = state.velocity or 0

	local offset = p0 - g
	local decay = math.exp(-d * f * dt)

	local p1, v1

	if d == 1 then -- Critically damped
		p1 = (offset * (1 + f * dt) + v0 * dt) * decay + g
		v1 = (v0 * (1 - f * dt) - offset * (f * f * dt)) * decay
	elseif d < 1 then -- Underdamped
		local c = math.sqrt(1 - d * d)

		local i = math.cos(f * c * dt)
		local j = math.sin(f * c * dt)

		-- Damping ratios approaching 1 can cause division by small numbers.
		-- To fix that, group terms around z=j/c and find an approximation for z.
		-- Start with the definition of z:
		--    z = sin(dt*f*c)/c
		-- Substitute a=dt*f:
		--    z = sin(a*c)/c
		-- Take the Maclaurin expansion of z with respect to c:
		--    z = a - (a^3*c^2)/6 + (a^5*c^4)/120 + O(c^6)
		--    z ≈ a - (a^3*c^2)/6 + (a^5*c^4)/120
		-- Rewrite in Horner form:
		--    z ≈ a + ((a*a)*(c*c)*(c*c)/20 - c*c)*(a*a*a)/6

		local z
		if c > EPS then
			z = j / c
		else
			local a = dt * f
			z = a + ((a * a) * (c * c) * (c * c) / 20 - c * c) * (a * a * a) / 6
		end

		-- Frequencies approaching 0 present a similar problem.
		-- We want an approximation for y as f approaches 0, where:
		--    y = sin(dt*f*c)/(f*c)
		-- Substitute b=dt*c:
		--    y = sin(b*c)/b
		-- Now reapply the process from z.

		local y
		if f * c > EPS then
			y = j / (f * c)
		else
			local b = f * c
			y = dt + ((dt * dt) * (b * b) * (b * b) / 20 - b * b) * (dt * dt * dt) / 6
		end

		p1 = (offset * (i + d * z) + v0 * y) * decay + g
		v1 = (v0 * (i - z * d) - offset * (z * f)) * decay
	else -- Overdamped
		local c = math.sqrt(d * d - 1)

		local r1 = -f * (d - c)
		local r2 = -f * (d + c)

		local co2 = (v0 - offset * r1) / (2 * f * c)
		local co1 = offset - co2

		local e1 = co1 * math.exp(r1 * dt)
		local e2 = co2 * math.exp(r2 * dt)

		p1 = e1 + e2 + g
		v1 = e1 * r1 + e2 * r2
	end

	local complete = math.abs(v1) < VELOCITY_THRESHOLD and math.abs(p1 - g) < POSITION_THRESHOLD

	return {
		complete = complete,
		value = complete and g or p1,
		velocity = v1,
	}
end

return Spring
 end,
    [67] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(67)return function()
	local SingleMotor = require(script.Parent.SingleMotor)
	local Spring = require(script.Parent.Spring)

	describe("completed state", function()
		local motor = SingleMotor.new(0, false)

		local goal = Spring.new(1, { frequency = 2, dampingRatio = 0.75 })
		motor:setGoal(goal)

		for _ = 1, 100 do
			motor:step(1 / 60)
		end

		it("should complete", function()
			expect(motor._state.complete).to.equal(true)
		end)

		it("should be exactly the goal value when completed", function()
			expect(motor._state.value).to.equal(1)
		end)
	end)

	it("should inherit velocity", function()
		local motor = SingleMotor.new(0, false)
		motor._state = { complete = false, value = 0, velocity = -5 }

		local goal = Spring.new(1, { frequency = 2, dampingRatio = 1 })

		motor:setGoal(goal)
		motor:step(1 / 60)

		expect(motor._state.velocity < 0).to.equal(true)
	end)
end
 end,
    [68] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(68)local function isMotor(value)
	local motorType = tostring(value):match("^Motor%((.+)%)$")

	if motorType then
		return true, motorType
	else
		return false
	end
end

return isMotor
 end,
    [69] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(69)return function()
	local isMotor = require(script.Parent.isMotor)

	local SingleMotor = require(script.Parent.SingleMotor)
	local GroupMotor = require(script.Parent.GroupMotor)

	local singleMotor = SingleMotor.new(0)
	local groupMotor = GroupMotor.new({})

	it("should properly detect motors", function()
		expect(isMotor(singleMotor)).to.equal(true)
		expect(isMotor(groupMotor)).to.equal(true)
	end)

	it("shouldn't detect things that aren't motors", function()
		expect(isMotor({})).to.equal(false)
	end)

	it("should return the proper motor type", function()
		local _, singleMotorType = isMotor(singleMotor)
		local _, groupMotorType = isMotor(groupMotor)

		expect(singleMotorType).to.equal("Single")
		expect(groupMotorType).to.equal("Group")
	end)
end
 end,
    [70] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(70)local Themes = {
	Names = {
		"Dark",
		"Darker",
		"Light",
		"Aqua",
		"Amethyst",
		"Rose",
		"FssVs",
	},
}

for _, Theme in next, script:GetChildren() do
	local Required = require(Theme)
	Themes[Required.Name] = Required
end

return Themes
 end,
    [71] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(71)return {
	Name = "Amethyst",
	Accent = Color3.fromRGB(97, 62, 167),

	AcrylicMain = Color3.fromRGB(20, 20, 20),
	AcrylicBorder = Color3.fromRGB(110, 90, 130),
	AcrylicGradient = ColorSequence.new(Color3.fromRGB(85, 57, 139), Color3.fromRGB(40, 25, 65)),
	AcrylicNoise = 0.92,

	TitleBarLine = Color3.fromRGB(95, 75, 110),
	Tab = Color3.fromRGB(160, 140, 180),

	Element = Color3.fromRGB(140, 120, 160),
	ElementBorder = Color3.fromRGB(60, 50, 70),
	InElementBorder = Color3.fromRGB(100, 90, 110),
	ElementTransparency = 0.87,

	ToggleSlider = Color3.fromRGB(140, 120, 160),
	ToggleToggled = Color3.fromRGB(0, 0, 0),

	SliderRail = Color3.fromRGB(140, 120, 160),

	DropdownFrame = Color3.fromRGB(170, 160, 200),
	DropdownHolder = Color3.fromRGB(60, 45, 80),
	DropdownBorder = Color3.fromRGB(50, 40, 65),
	DropdownOption = Color3.fromRGB(140, 120, 160),

	Keybind = Color3.fromRGB(140, 120, 160),

	Input = Color3.fromRGB(140, 120, 160),
	InputFocused = Color3.fromRGB(20, 10, 30),
	InputIndicator = Color3.fromRGB(170, 150, 190),

	Dialog = Color3.fromRGB(60, 45, 80),
	DialogHolder = Color3.fromRGB(45, 30, 65),
	DialogHolderLine = Color3.fromRGB(40, 25, 60),
	DialogButton = Color3.fromRGB(60, 45, 80),
	DialogButtonBorder = Color3.fromRGB(95, 80, 110),
	DialogBorder = Color3.fromRGB(85, 70, 100),
	DialogInput = Color3.fromRGB(70, 55, 85),
	DialogInputLine = Color3.fromRGB(175, 160, 190),

	Text = Color3.fromRGB(240, 240, 240),
	SubText = Color3.fromRGB(170, 170, 170),
	Hover = Color3.fromRGB(140, 120, 160),
	HoverChange = 0.04,

	Scrollbar = Color3.fromRGB(120, 90, 150),
	ScrollbarHover = Color3.fromRGB(150, 100, 200),

	-- Panel
	PanelMain = Color3.fromRGB(50, 40, 70),
	PanelBorder = Color3.fromRGB(95, 80, 110),
	PanelHeader = Color3.fromRGB(45, 35, 65),
	PanelHeaderBorder = Color3.fromRGB(85, 70, 100),
	PanelDockIndicator = Color3.fromRGB(97, 62, 167),
	PanelMinimized = Color3.fromRGB(55, 45, 75),
}
 end,
    [72] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(72)return {
	Name = "Aqua",
	Accent = Color3.fromRGB(60, 165, 165),

	AcrylicMain = Color3.fromRGB(20, 20, 20),
	AcrylicBorder = Color3.fromRGB(50, 100, 100),
	AcrylicGradient = ColorSequence.new(Color3.fromRGB(60, 140, 140), Color3.fromRGB(40, 80, 80)),
	AcrylicNoise = 0.92,

	TitleBarLine = Color3.fromRGB(60, 120, 120),
	Tab = Color3.fromRGB(140, 180, 180),

	Element = Color3.fromRGB(110, 160, 160),
	ElementBorder = Color3.fromRGB(40, 70, 70),
	InElementBorder = Color3.fromRGB(80, 110, 110),
	ElementTransparency = 0.84,

	ToggleSlider = Color3.fromRGB(110, 160, 160),
	ToggleToggled = Color3.fromRGB(0, 0, 0),

	SliderRail = Color3.fromRGB(110, 160, 160),

	DropdownFrame = Color3.fromRGB(160, 200, 200),
	DropdownHolder = Color3.fromRGB(40, 80, 80),
	DropdownBorder = Color3.fromRGB(40, 65, 65),
	DropdownOption = Color3.fromRGB(110, 160, 160),

	Keybind = Color3.fromRGB(110, 160, 160),

	Input = Color3.fromRGB(110, 160, 160),
	InputFocused = Color3.fromRGB(20, 10, 30),
	InputIndicator = Color3.fromRGB(130, 170, 170),

	Dialog = Color3.fromRGB(40, 80, 80),
	DialogHolder = Color3.fromRGB(30, 60, 60),
	DialogHolderLine = Color3.fromRGB(25, 50, 50),
	DialogButton = Color3.fromRGB(40, 80, 80),
	DialogButtonBorder = Color3.fromRGB(80, 110, 110),
	DialogBorder = Color3.fromRGB(50, 100, 100),
	DialogInput = Color3.fromRGB(45, 90, 90),
	DialogInputLine = Color3.fromRGB(130, 170, 170),

	Text = Color3.fromRGB(240, 240, 240),
	SubText = Color3.fromRGB(170, 170, 170),
	Hover = Color3.fromRGB(110, 160, 160),
	HoverChange = 0.04,

	Scrollbar = Color3.fromRGB(80, 140, 140),
	ScrollbarHover = Color3.fromRGB(100, 200, 200),

	-- Panel
	PanelMain = Color3.fromRGB(35, 70, 70),
	PanelBorder = Color3.fromRGB(60, 100, 100),
	PanelHeader = Color3.fromRGB(30, 60, 60),
	PanelHeaderBorder = Color3.fromRGB(50, 90, 90),
	PanelDockIndicator = Color3.fromRGB(60, 165, 165),
	PanelMinimized = Color3.fromRGB(40, 75, 75),
}
 end,
    [73] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(73)return {
	Name = "Dark",
	Accent = Color3.fromRGB(96, 205, 255),

	AcrylicMain = Color3.fromRGB(60, 60, 60),
	AcrylicBorder = Color3.fromRGB(90, 90, 90),
	AcrylicGradient = ColorSequence.new(Color3.fromRGB(40, 40, 40), Color3.fromRGB(40, 40, 40)),
	AcrylicNoise = 0.9,

	TitleBarLine = Color3.fromRGB(75, 75, 75),
	Tab = Color3.fromRGB(120, 120, 120),

	Element = Color3.fromRGB(120, 120, 120),
	ElementBorder = Color3.fromRGB(35, 35, 35),
	InElementBorder = Color3.fromRGB(90, 90, 90),
	ElementTransparency = 0.87,

	ToggleSlider = Color3.fromRGB(120, 120, 120),
	ToggleToggled = Color3.fromRGB(0, 0, 0),

	SliderRail = Color3.fromRGB(120, 120, 120),

	DropdownFrame = Color3.fromRGB(160, 160, 160),
	DropdownHolder = Color3.fromRGB(45, 45, 45),
	DropdownBorder = Color3.fromRGB(35, 35, 35),
	DropdownOption = Color3.fromRGB(120, 120, 120),

	Keybind = Color3.fromRGB(120, 120, 120),

	Input = Color3.fromRGB(160, 160, 160),
	InputFocused = Color3.fromRGB(10, 10, 10),
	InputIndicator = Color3.fromRGB(150, 150, 150),

	Dialog = Color3.fromRGB(45, 45, 45),
	DialogHolder = Color3.fromRGB(35, 35, 35),
	DialogHolderLine = Color3.fromRGB(30, 30, 30),
	DialogButton = Color3.fromRGB(45, 45, 45),
	DialogButtonBorder = Color3.fromRGB(80, 80, 80),
	DialogBorder = Color3.fromRGB(70, 70, 70),
	DialogInput = Color3.fromRGB(55, 55, 55),
	DialogInputLine = Color3.fromRGB(160, 160, 160),

	Text = Color3.fromRGB(240, 240, 240),
	SubText = Color3.fromRGB(170, 170, 170),
	Hover = Color3.fromRGB(120, 120, 120),
	HoverChange = 0.07,

	-- Scroll bar
	Scrollbar = Color3.fromRGB(100, 100, 100),
	ScrollbarHover = Color3.fromRGB(150, 150, 150),

	-- Panel
	PanelMain = Color3.fromRGB(50, 50, 50),
	PanelBorder = Color3.fromRGB(80, 80, 80),
	PanelHeader = Color3.fromRGB(45, 45, 45),
	PanelHeaderBorder = Color3.fromRGB(70, 70, 70),
	PanelDockIndicator = Color3.fromRGB(96, 205, 255),
	PanelMinimized = Color3.fromRGB(60, 60, 60),
}
 end,
    [74] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(74)return {
	Name = "Darker",
	Accent = Color3.fromRGB(72, 138, 182),

	AcrylicMain = Color3.fromRGB(30, 30, 30),
	AcrylicBorder = Color3.fromRGB(60, 60, 60),
	AcrylicGradient = ColorSequence.new(Color3.fromRGB(25, 25, 25), Color3.fromRGB(15, 15, 15)),
	AcrylicNoise = 0.94,

	TitleBarLine = Color3.fromRGB(65, 65, 65),
	Tab = Color3.fromRGB(100, 100, 100),

	Element = Color3.fromRGB(70, 70, 70),
	ElementBorder = Color3.fromRGB(25, 25, 25),
	InElementBorder = Color3.fromRGB(55, 55, 55),
	ElementTransparency = 0.82,

	DropdownFrame = Color3.fromRGB(120, 120, 120),
	DropdownHolder = Color3.fromRGB(35, 35, 35),
	DropdownBorder = Color3.fromRGB(25, 25, 25),

	Dialog = Color3.fromRGB(35, 35, 35),
	DialogHolder = Color3.fromRGB(25, 25, 25),
	DialogHolderLine = Color3.fromRGB(20, 20, 20),
	DialogButton = Color3.fromRGB(35, 35, 35),
	DialogButtonBorder = Color3.fromRGB(55, 55, 55),
	DialogBorder = Color3.fromRGB(50, 50, 50),
	DialogInput = Color3.fromRGB(45, 45, 45),
	DialogInputLine = Color3.fromRGB(120, 120, 120),

	Scrollbar = Color3.fromRGB(70, 70, 70),
	ScrollbarHover = Color3.fromRGB(110, 110, 110),

	-- Panel
	PanelMain = Color3.fromRGB(30, 30, 30),
	PanelBorder = Color3.fromRGB(55, 55, 55),
	PanelHeader = Color3.fromRGB(25, 25, 25),
	PanelHeaderBorder = Color3.fromRGB(50, 50, 50),
	PanelDockIndicator = Color3.fromRGB(72, 138, 182),
	PanelMinimized = Color3.fromRGB(35, 35, 35),
}
 end,
    [75] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(75)return {
    Name = "FssVs",
    
    -- ═══════════════════════════════════════════════════════════════════
    -- GALAXY HARMONY THEME (Golden Accent Edition)
    -- Background: Deep cosmic void with nebula gradient
    -- Accents: Golden Yellow (#ffd900) core with galaxy undertones
    -- ═══════════════════════════════════════════════════════════════════

    -- PRIMARY ACCENT (Golden Yellow)
    -- User Request: #ffd900
    Accent = Color3.fromHex("#ffd900"),
    AccentGradient = {
        Colors = {
            Color3.fromHex("#ffd900"),   -- Pure Gold
            Color3.fromRGB(255, 100, 0), -- Solar Flare Orange
            Color3.fromRGB(200, 0, 255), -- Cosmic Purple (End tail)
        },
        Mode = "EaseInOut",
        ColorSpace = "HSV",
    },

    -- WINDOW BACKGROUND
    AcrylicMain = Color3.fromRGB(8, 8, 18),
    AcrylicBorder = Color3.fromRGB(60, 50, 90),
    AcrylicGradient = {
        Colors = {
            Color3.fromRGB(15, 10, 40),    -- Deep Purple Void
            Color3.fromRGB(30, 60, 120),   -- Nebula Blue
            Color3.fromRGB(80, 30, 100),   -- Purple Cloud
            Color3.fromRGB(40, 20, 60),    -- Dark Violet
        },
        Mode = "EaseInOut",
    },
    AcrylicNoise = 0.85,

    -- WINDOW CHROME
    TitleBarLine = Color3.fromRGB(120, 100, 200),
    TitleBarLineGradient = {
        Colors = {
            Color3.fromHex("#ffd900"),   -- Gold
            Color3.fromRGB(255, 0, 200), -- Magenta
            Color3.fromRGB(0, 255, 255), -- Cyan
        },
        Mode = "Linear",
    },
    Tab = Color3.fromRGB(220, 220, 255),
    TabGradient = {
        Colors = {
            Color3.fromRGB(255, 220, 100), -- Pale Gold
            Color3.fromRGB(255, 255, 255),
        },
        Mode = "EaseInOut",
    },

    -- ELEMENTS
    Element = Color3.fromRGB(25, 22, 45),
    ElementTransparency = 0.45,
    ElementBorder = Color3.fromRGB(60, 55, 100),
    InElementBorder = Color3.fromRGB(110, 90, 180),
    ElementGradient = {
        Colors = {
            Color3.fromRGB(35, 30, 60),
            Color3.fromRGB(20, 18, 35),
        },
        Mode = "Linear",
    },

    -- CONTROLS
    -- Toggle Off: Made brighter for visibility (was 35,30,55)
    ToggleSlider = Color3.fromRGB(70, 60, 100), 
    ToggleToggled = Color3.fromRGB(20, 20, 20), -- Checkmark/Knob background when on
    SliderRail = Color3.fromRGB(70, 60, 100),

    -- INPUTS & DROPDOWNS
    DropdownFrame = Color3.fromRGB(50, 45, 80),
    DropdownHolder = Color3.fromRGB(25, 22, 40),
    DropdownBorder = Color3.fromRGB(80, 70, 130),
    DropdownOption = Color3.fromRGB(35, 30, 55),

    Keybind = Color3.fromRGB(35, 30, 55),

    Input = Color3.fromRGB(35, 30, 55),
    InputFocused = Color3.fromRGB(15, 15, 30),
    InputIndicator = Color3.fromHex("#ffd900"), -- Match accent

    -- DIALOGS
    Dialog = Color3.fromRGB(30, 28, 50),
    DialogHolder = Color3.fromRGB(20, 18, 35),
    DialogBorder = Color3.fromRGB(90, 70, 150),
    DialogButton = Color3.fromRGB(50, 45, 80),
    DialogInput = Color3.fromRGB(25, 22, 40),

    -- TEXT
    Text = Color3.fromRGB(255, 255, 255),
    SubText = Color3.fromRGB(190, 185, 220),

    -- HOVER (High Contrast)
    -- Much brighter to clearly show interaction
    Hover = Color3.fromRGB(90, 80, 140), 
    HoverBlend = { Base = "Element", Blend = "Accent", Alpha = 0.2 },
    HoverChange = 0.25, -- Increased from 0.12 for distinct visual pop

    -- SCROLL BAR
    Scrollbar = Color3.fromRGB(80, 60, 140),
    ScrollbarHover = Color3.fromRGB(255, 217, 0), -- Gold glow on hover

    -- PANEL
    PanelMain = Color3.fromRGB(25, 22, 45),
    PanelBorder = Color3.fromRGB(80, 70, 130),
    PanelHeader = Color3.fromRGB(20, 18, 38),
    PanelHeaderBorder = Color3.fromRGB(70, 60, 120),
    PanelDockIndicator = Color3.fromHex("#ffd900"),
    PanelMinimized = Color3.fromRGB(30, 26, 50),
}
 end,
    [76] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(76)return {
	Name = "Light",
	Accent = Color3.fromRGB(0, 103, 192),

	AcrylicMain = Color3.fromRGB(200, 200, 200),
	AcrylicBorder = Color3.fromRGB(120, 120, 120),
	AcrylicGradient = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255)),
	AcrylicNoise = 0.96,

	TitleBarLine = Color3.fromRGB(160, 160, 160),
	Tab = Color3.fromRGB(90, 90, 90),

	Element = Color3.fromRGB(255, 255, 255),
	ElementBorder = Color3.fromRGB(180, 180, 180),
	InElementBorder = Color3.fromRGB(150, 150, 150),
	ElementTransparency = 0.65,

	ToggleSlider = Color3.fromRGB(40, 40, 40),
	ToggleToggled = Color3.fromRGB(255, 255, 255),

	SliderRail = Color3.fromRGB(40, 40, 40),

	DropdownFrame = Color3.fromRGB(200, 200, 200),
	DropdownHolder = Color3.fromRGB(240, 240, 240),
	DropdownBorder = Color3.fromRGB(200, 200, 200),
	DropdownOption = Color3.fromRGB(150, 150, 150),

	Keybind = Color3.fromRGB(120, 120, 120),

	Input = Color3.fromRGB(200, 200, 200),
	InputFocused = Color3.fromRGB(100, 100, 100),
	InputIndicator = Color3.fromRGB(80, 80, 80),

	Dialog = Color3.fromRGB(255, 255, 255),
	DialogHolder = Color3.fromRGB(240, 240, 240),
	DialogHolderLine = Color3.fromRGB(228, 228, 228),
	DialogButton = Color3.fromRGB(255, 255, 255),
	DialogButtonBorder = Color3.fromRGB(190, 190, 190),
	DialogBorder = Color3.fromRGB(140, 140, 140),
	DialogInput = Color3.fromRGB(250, 250, 250),
	DialogInputLine = Color3.fromRGB(160, 160, 160),

	Text = Color3.fromRGB(0, 0, 0),
	SubText = Color3.fromRGB(40, 40, 40),
	Hover = Color3.fromRGB(50, 50, 50),
	HoverChange = 0.16,

	Scrollbar = Color3.fromRGB(180, 180, 180),
	ScrollbarHover = Color3.fromRGB(120, 120, 120),

	-- Panel
	PanelMain = Color3.fromRGB(245, 245, 245),
	PanelBorder = Color3.fromRGB(180, 180, 180),
	PanelHeader = Color3.fromRGB(235, 235, 235),
	PanelHeaderBorder = Color3.fromRGB(170, 170, 170),
	PanelDockIndicator = Color3.fromRGB(0, 103, 192),
	PanelMinimized = Color3.fromRGB(230, 230, 230),
}
 end,
    [77] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(77)return {
	Name = "Rose",
	Accent = Color3.fromRGB(180, 55, 90),

	AcrylicMain = Color3.fromRGB(40, 40, 40),
	AcrylicBorder = Color3.fromRGB(130, 90, 110),
	AcrylicGradient = ColorSequence.new(Color3.fromRGB(190, 60, 135), Color3.fromRGB(165, 50, 70)),
	AcrylicNoise = 0.92,

	TitleBarLine = Color3.fromRGB(140, 85, 105),
	Tab = Color3.fromRGB(180, 140, 160),

	Element = Color3.fromRGB(200, 120, 170),
	ElementBorder = Color3.fromRGB(110, 70, 85),
	InElementBorder = Color3.fromRGB(120, 90, 90),
	ElementTransparency = 0.86,

	ToggleSlider = Color3.fromRGB(200, 120, 170),
	ToggleToggled = Color3.fromRGB(0, 0, 0),

	SliderRail = Color3.fromRGB(200, 120, 170),

	DropdownFrame = Color3.fromRGB(200, 160, 180),
	DropdownHolder = Color3.fromRGB(120, 50, 75),
	DropdownBorder = Color3.fromRGB(90, 40, 55),
	DropdownOption = Color3.fromRGB(200, 120, 170),

	Keybind = Color3.fromRGB(200, 120, 170),

	Input = Color3.fromRGB(200, 120, 170),
	InputFocused = Color3.fromRGB(20, 10, 30),
	InputIndicator = Color3.fromRGB(170, 150, 190),

	Dialog = Color3.fromRGB(120, 50, 75),
	DialogHolder = Color3.fromRGB(95, 40, 60),
	DialogHolderLine = Color3.fromRGB(90, 35, 55),
	DialogButton = Color3.fromRGB(120, 50, 75),
	DialogButtonBorder = Color3.fromRGB(155, 90, 115),
	DialogBorder = Color3.fromRGB(100, 70, 90),
	DialogInput = Color3.fromRGB(135, 55, 80),
	DialogInputLine = Color3.fromRGB(190, 160, 180),

	Text = Color3.fromRGB(240, 240, 240),
	SubText = Color3.fromRGB(170, 170, 170),
	Hover = Color3.fromRGB(200, 120, 170),
	HoverChange = 0.04,

	Scrollbar = Color3.fromRGB(180, 100, 140),
	ScrollbarHover = Color3.fromRGB(220, 120, 170),

	-- Panel
	PanelMain = Color3.fromRGB(100, 45, 65),
	PanelBorder = Color3.fromRGB(140, 80, 105),
	PanelHeader = Color3.fromRGB(90, 40, 60),
	PanelHeaderBorder = Color3.fromRGB(130, 70, 95),
	PanelDockIndicator = Color3.fromRGB(180, 55, 90),
	PanelMinimized = Color3.fromRGB(105, 50, 70),
}
 end
}

do
    local task, setmetatable, error, newproxy, getmetatable, next, table, unpack, coroutine, script, type, require, pcall, getfenv, setfenv, rawget= task, setmetatable, error, newproxy, getmetatable, next, table, unpack, coroutine, script, type, require, pcall, getfenv, setfenv, rawget

    local table_insert = table.insert
    local table_remove = table.remove
    local table_freeze = table.freeze or function(t) return t end

    local Defer = task and task.defer or function(f, ...)
        local Thread = coroutine.create(f)
        coroutine.resume(Thread, ...)
        return Thread
    end

    local Version = "0.0.0-venv"
    local RefBindings = {}
    local ScriptClosures = {}
    local StoredModuleValues = {}
    local ScriptsToRun = {}
    local SharedEnvironment = {}
    local RefChildren = {}

    local InstanceMethods = {
        GetChildren = function(self)
            local Children = RefChildren[self]
            local ReturnArray = {}
    
            for Child in next, Children do
                table_insert(ReturnArray, Child)
            end
    
            return ReturnArray
        end,

        FindFirstChild = function(self, name)
            if not name then
                error("Argument 1 missing or nil", 2)
            end

            for Child in next, RefChildren[self] do
                if Child.Name == name then
                    return Child
                end
            end

            return
        end,

        GetFullName = function(self)
            local Path = self.Name
            local ObjectPointer = self.Parent

            while ObjectPointer do
                Path = ObjectPointer.Name .. "." .. Path
                ObjectPointer = ObjectPointer.Parent
            end

            return "VirtualEnv." .. Path
        end,
    }

    local InstanceMethodProxies = {}
    for MethodName, Method in next, InstanceMethods do
        InstanceMethodProxies[MethodName] = function(self, ...)
            if not RefChildren[self] then
                error("Expected ':' not '.' calling member function " .. MethodName, 1)
            end

            return Method(self, ...)
        end
    end

    local function CreateRef(className, name, parent)
        local StringValue_Value
        local Children = setmetatable({}, {__mode = "k"})

        local function InvalidMember(member)
            error(member .. " is not a valid (virtual) member of " .. className .. " \"" .. name .. "\"", 1)
        end

        local function ReadOnlyProperty(property)
            error("Unable to assign (virtual) property " .. property .. ". Property is read only", 1)
        end

        local Ref = newproxy(true)
        local RefMetatable = getmetatable(Ref)

        RefMetatable.__index = function(_, index)
            if index == "ClassName" then
                return className
            elseif index == "Name" then
                return name
            elseif index == "Parent" then
                return parent
            elseif className == "StringValue" and index == "Value" then
                return StringValue_Value
            else
                local InstanceMethod = InstanceMethodProxies[index]

                if InstanceMethod then
                    return InstanceMethod
                end
            end

            for Child in next, Children do
                if Child.Name == index then
                    return Child
                end
            end

            InvalidMember(index)
        end

        RefMetatable.__newindex = function(_, index, value)
            if index == "ClassName" then
                ReadOnlyProperty(index)
            elseif index == "Name" then
                name = value
            elseif index == "Parent" then
                if value == Ref then
                    return
                end

                if parent ~= nil then
                    RefChildren[parent][Ref] = nil
                end

                parent = value

                if value ~= nil then
                    RefChildren[value][Ref] = true
                end
            elseif className == "StringValue" and index == "Value" then
                StringValue_Value = value
            else
                InvalidMember(index)
            end
        end

        RefMetatable.__tostring = function()
            return name
        end

        RefChildren[Ref] = Children

        if parent ~= nil then
            RefChildren[parent][Ref] = true
        end

        return Ref
    end

    local function CreateRefFromObject(object, parent)
        local RefId = object[1]
        local ClassName = object[2]
        local Properties = object[3]
        local Children = object[4]

        local Name = table_remove(Properties, 1)

        local Ref = CreateRef(ClassName, Name, parent)
        RefBindings[RefId] = Ref

        if Properties then
            for PropertyName, PropertyValue in next, Properties do
                Ref[PropertyName] = PropertyValue
            end
        end

        if Children then
            for _, ChildObject in next, Children do
                CreateRefFromObject(ChildObject, Ref)
            end
        end

        return Ref
    end

    local RealObjectRoot = {}
    for _, Object in next, ObjectTree do
        table_insert(RealObjectRoot, CreateRefFromObject(Object))
    end

    for RefId, Closure in next, ClosureBindings do
        local Ref = RefBindings[RefId]

        ScriptClosures[Ref] = Closure

        local ClassName = Ref.ClassName
        if ClassName == "LocalScript" or ClassName == "Script" then
            table_insert(ScriptsToRun, Ref)
        end
    end

    local function LoadScript(scriptRef)
        local ScriptClassName = scriptRef.ClassName

        local StoredModuleValue = StoredModuleValues[scriptRef]
        if StoredModuleValue and ScriptClassName == "ModuleScript" then
            return unpack(StoredModuleValue)
        end

        local Closure = ScriptClosures[scriptRef]
        if not Closure then
            return
        end

        if ScriptClassName == "LocalScript" or ScriptClassName == "Script" then
            Closure()
            return
        else
            local ClosureReturn = {Closure()}
            StoredModuleValues[scriptRef] = ClosureReturn
            return unpack(ClosureReturn)
        end
    end

    function ImportGlobals(refId)
        local ScriptRef = RefBindings[refId]

        local Closure = ScriptClosures[ScriptRef]
        if not Closure then
            return
        end

        local EnvHasBeenSet = false
        local RealEnv
        local VirtualEnv
        local SetEnv

        local Global_maui = table_freeze({
            Version = Version,
            Script = script,
            Shared = SharedEnvironment,

            GetScript = function()
                return script
            end,
            GetShared = function()
                return SharedEnvironment
            end,
        })

        local Global_script = ScriptRef

        local function Global_require(module, ...)
            if RefChildren[module] and module.ClassName == "ModuleScript" and ScriptClosures[module] then
                return LoadScript(module)
            end

            return require(module, ...)
        end

        local function Global_getfenv(stackLevel, ...)
            if not EnvHasBeenSet then
                SetEnv()
            end

            if type(stackLevel) == "number" and stackLevel >= 0 then
                if stackLevel == 0 then
                    return VirtualEnv
                else
                    stackLevel = stackLevel + 1

                    local GetOk, FunctionEnv = pcall(getfenv, stackLevel)
                    if GetOk and FunctionEnv == RealEnv then
                        return VirtualEnv
                    end
                end
            end

            return getfenv(stackLevel, ...)
        end

        local function Global_setfenv(stackLevel, newEnv, ...)
            if not EnvHasBeenSet then
                SetEnv()
            end

            if type(stackLevel) == "number" and stackLevel >= 0 then
                if stackLevel == 0 then
                    return setfenv(VirtualEnv, newEnv)
                else
                    stackLevel = stackLevel + 1

                    local GetOk, FunctionEnv = pcall(getfenv, stackLevel)
                    if GetOk and FunctionEnv == RealEnv then
                        return setfenv(VirtualEnv, newEnv)
                    end
                end
            end

            return setfenv(stackLevel, newEnv, ...)
        end

        function SetEnv()
            RealEnv = getfenv(0)

            local GlobalEnvOverride = {
                ["maui"] = Global_maui,
                ["script"] = Global_script,
                ["require"] = Global_require,
                ["getfenv"] = Global_getfenv,
                ["setfenv"] = Global_setfenv,
            }

            VirtualEnv = setmetatable({}, {
                __index = function(_, index)
                    local IndexInVirtualEnv = rawget(VirtualEnv, index)
                    if IndexInVirtualEnv ~= nil then
                        return IndexInVirtualEnv
                    end

                    local IndexInGlobalEnvOverride = GlobalEnvOverride[index]
                    if IndexInGlobalEnvOverride ~= nil then
                        return IndexInGlobalEnvOverride
                    end

                    return RealEnv[index]
                end
            })

            setfenv(Closure, VirtualEnv)
            EnvHasBeenSet = true
        end

        return Global_maui, Global_script, Global_require, Global_getfenv, Global_setfenv
    end

    for _, ScriptRef in next, ScriptsToRun do
        Defer(LoadScript, ScriptRef)
    end

    do
        local MainModule
        for _, Ref in next, RealObjectRoot do
            if Ref.ClassName == "ModuleScript" and Ref.Name == "MainModule" then
                MainModule = Ref
                break
            end
        end

        if MainModule then
            return LoadScript(MainModule)
        end
    end
end

