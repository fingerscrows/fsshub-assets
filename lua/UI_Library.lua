--[[
    FSSHUB UI Library
    Version: 1.0.0
    GitHub-hosted UI framework for Roblox scripts
    
    Usage:
        local UI = loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/[user]/fsshub-assets@main/lua/UI_Library.lua"))()
        local Window = UI.CreateWindow({ Title = "FSSHUB" })
]]

local UI = {}
UI.Version = "1.0.0"

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

-- Configuration
UI.Config = {
    ScreenGuiName = "FSSHUB_UI",
    DefaultTheme = "Dark",
    AnimationSpeed = 0.3,
    CornerRadius = 8
}

-- Theme System
UI.Themes = {
    Dark = {
        Background = Color3.fromRGB(20, 20, 25),
        Surface = Color3.fromRGB(30, 30, 35),
        Primary = Color3.fromRGB(59, 130, 246),
        PrimaryDark = Color3.fromRGB(37, 99, 235),
        Success = Color3.fromRGB(16, 185, 129),
        Error = Color3.fromRGB(239, 68, 68),
        Warning = Color3.fromRGB(245, 158, 11),
        TextPrimary = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(161, 161, 170),
        TextMuted = Color3.fromRGB(113, 113, 122),
        Border = Color3.fromRGB(63, 63, 70),
        Premium = Color3.fromRGB(255, 215, 0)
    },
    Light = {
        Background = Color3.fromRGB(250, 250, 250),
        Surface = Color3.fromRGB(255, 255, 255),
        Primary = Color3.fromRGB(59, 130, 246),
        PrimaryDark = Color3.fromRGB(37, 99, 235),
        Success = Color3.fromRGB(16, 185, 129),
        Error = Color3.fromRGB(239, 68, 68),
        Warning = Color3.fromRGB(245, 158, 11),
        TextPrimary = Color3.fromRGB(17, 17, 17),
        TextSecondary = Color3.fromRGB(82, 82, 91),
        TextMuted = Color3.fromRGB(161, 161, 170),
        Border = Color3.fromRGB(228, 228, 231),
        Premium = Color3.fromRGB(234, 179, 8)
    }
}

UI.CurrentTheme = UI.Themes.Dark

-- Utility Functions
function UI.SetTheme(themeName)
    if UI.Themes[themeName] then
        UI.CurrentTheme = UI.Themes[themeName]
    end
end

function UI.Tween(instance, properties, duration, easingStyle, easingDirection)
    local tween = TweenService:Create(
        instance,
        TweenInfo.new(
            duration or UI.Config.AnimationSpeed,
            easingStyle or Enum.EasingStyle.Quint,
            easingDirection or Enum.EasingDirection.Out
        ),
        properties
    )
    tween:Play()
    return tween
end

function UI.CreateCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or UI.Config.CornerRadius)
    corner.Parent = parent
    return corner
end

function UI.CreateStroke(parent, color, thickness, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or UI.CurrentTheme.Border
    stroke.Thickness = thickness or 1
    stroke.Transparency = transparency or 0
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = parent
    return stroke
end

function UI.CreatePadding(parent, padding)
    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, padding or 10)
    pad.PaddingBottom = UDim.new(0, padding or 10)
    pad.PaddingLeft = UDim.new(0, padding or 10)
    pad.PaddingRight = UDim.new(0, padding or 10)
    pad.Parent = parent
    return pad
end

-- Main Window Creation
function UI.CreateWindow(options)
    options = options or {}
    local title = options.Title or "FSSHUB"
    local size = options.Size or UDim2.new(0, 320, 0, 400)
    local isPremium = options.IsPremium or false
    
    -- Cleanup existing
    local existing = CoreGui:FindFirstChild(UI.Config.ScreenGuiName)
    if existing then existing:Destroy() end
    
    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = UI.Config.ScreenGuiName
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = CoreGui
    
    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = size
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = UI.CurrentTheme.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Parent = screenGui
    
    UI.CreateCorner(mainFrame, 12)
    UI.CreateStroke(mainFrame, isPremium and UI.CurrentTheme.Premium or UI.CurrentTheme.Border, 2, 0.5)
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 50)
    titleBar.BackgroundTransparency = 1
    titleBar.Parent = mainFrame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = isPremium and (title .. " 👑") or title
    titleLabel.TextColor3 = isPremium and UI.CurrentTheme.Premium or UI.CurrentTheme.TextPrimary
    titleLabel.TextSize = 20
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Parent = titleBar
    
    -- Content Container
    local content = Instance.new("ScrollingFrame")
    content.Name = "Content"
    content.Size = UDim2.new(1, -20, 1, -60)
    content.Position = UDim2.new(0, 10, 0, 55)
    content.BackgroundTransparency = 1
    content.ScrollBarThickness = 4
    content.ScrollBarImageColor3 = UI.CurrentTheme.Border
    content.CanvasSize = UDim2.new(0, 0, 0, 0)
    content.AutomaticCanvasSize = Enum.AutomaticSize.Y
    content.Parent = mainFrame
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 10)
    listLayout.Parent = content
    
    -- Dragging
    local dragging, dragStart, startPos
    
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- Animation
    mainFrame.Position = UDim2.new(0.5, 0, 0.6, 0)
    mainFrame.BackgroundTransparency = 1
    UI.Tween(mainFrame, {
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 0
    }, 0.5, Enum.EasingStyle.Back)
    
    -- Window Object
    local window = {
        ScreenGui = screenGui,
        MainFrame = mainFrame,
        Content = content,
        IsPremium = isPremium
    }
    
    -- Add Section
    function window:AddSection(sectionTitle)
        local section = Instance.new("Frame")
        section.Name = "Section_" .. sectionTitle
        section.Size = UDim2.new(1, 0, 0, 0)
        section.AutomaticSize = Enum.AutomaticSize.Y
        section.BackgroundColor3 = UI.CurrentTheme.Surface
        section.Parent = content
        
        UI.CreateCorner(section)
        UI.CreatePadding(section, 12)
        
        local sectionLayout = Instance.new("UIListLayout")
        sectionLayout.Padding = UDim.new(0, 8)
        sectionLayout.Parent = section
        
        local sectionLabel = Instance.new("TextLabel")
        sectionLabel.Size = UDim2.new(1, 0, 0, 20)
        sectionLabel.BackgroundTransparency = 1
        sectionLabel.Text = sectionTitle
        sectionLabel.TextColor3 = UI.CurrentTheme.TextSecondary
        sectionLabel.TextSize = 12
        sectionLabel.Font = Enum.Font.GothamBold
        sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
        sectionLabel.Parent = section
        
        local sectionObj = { Frame = section }
        
        -- Add Toggle
        function sectionObj:AddToggle(name, default, isPremiumFeature, callback)
            local toggleFrame = Instance.new("Frame")
            toggleFrame.Size = UDim2.new(1, 0, 0, 30)
            toggleFrame.BackgroundTransparency = 1
            toggleFrame.Parent = section
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, -60, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = name .. (isPremiumFeature and " 🔒" or "")
            label.TextColor3 = UI.CurrentTheme.TextPrimary
            label.TextSize = 14
            label.Font = Enum.Font.GothamMedium
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = toggleFrame
            
            local toggleBtn = Instance.new("TextButton")
            toggleBtn.Size = UDim2.new(0, 50, 0, 24)
            toggleBtn.Position = UDim2.new(1, 0, 0.5, 0)
            toggleBtn.AnchorPoint = Vector2.new(1, 0.5)
            toggleBtn.BackgroundColor3 = default and UI.CurrentTheme.Success or UI.CurrentTheme.Error
            toggleBtn.Text = default and "ON" or "OFF"
            toggleBtn.TextColor3 = Color3.new(1, 1, 1)
            toggleBtn.TextSize = 11
            toggleBtn.Font = Enum.Font.GothamBold
            toggleBtn.AutoButtonColor = false
            toggleBtn.Parent = toggleFrame
            
            UI.CreateCorner(toggleBtn, 12)
            
            local state = default
            local isLocked = isPremiumFeature and not window.IsPremium
            
            if isLocked then
                toggleBtn.BackgroundColor3 = UI.CurrentTheme.TextMuted
                toggleBtn.Text = "🔒"
            end
            
            toggleBtn.MouseButton1Click:Connect(function()
                if isLocked then return end
                state = not state
                toggleBtn.Text = state and "ON" or "OFF"
                UI.Tween(toggleBtn, {
                    BackgroundColor3 = state and UI.CurrentTheme.Success or UI.CurrentTheme.Error
                }, 0.2)
                if callback then callback(state) end
            end)
            
            return { Button = toggleBtn, GetState = function() return state end }
        end
        
        -- Add Slider
        function sectionObj:AddSlider(name, min, max, default, isPremiumFeature, callback)
            local sliderFrame = Instance.new("Frame")
            sliderFrame.Size = UDim2.new(1, 0, 0, 45)
            sliderFrame.BackgroundTransparency = 1
            sliderFrame.Parent = section
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, -50, 0, 20)
            label.BackgroundTransparency = 1
            label.Text = name
            label.TextColor3 = UI.CurrentTheme.TextPrimary
            label.TextSize = 14
            label.Font = Enum.Font.GothamMedium
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = sliderFrame
            
            local valueLabel = Instance.new("TextLabel")
            valueLabel.Size = UDim2.new(0, 50, 0, 20)
            valueLabel.Position = UDim2.new(1, 0, 0, 0)
            valueLabel.AnchorPoint = Vector2.new(1, 0)
            valueLabel.BackgroundTransparency = 1
            valueLabel.Text = tostring(default)
            valueLabel.TextColor3 = UI.CurrentTheme.TextSecondary
            valueLabel.TextSize = 14
            valueLabel.Font = Enum.Font.Gotham
            valueLabel.TextXAlignment = Enum.TextXAlignment.Right
            valueLabel.Parent = sliderFrame
            
            local sliderBg = Instance.new("Frame")
            sliderBg.Size = UDim2.new(1, 0, 0, 8)
            sliderBg.Position = UDim2.new(0, 0, 0, 28)
            sliderBg.BackgroundColor3 = UI.CurrentTheme.Border
            sliderBg.Parent = sliderFrame
            UI.CreateCorner(sliderBg, 4)
            
            local sliderFill = Instance.new("Frame")
            sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            sliderFill.BackgroundColor3 = window.IsPremium and UI.CurrentTheme.Premium or UI.CurrentTheme.Primary
            sliderFill.Parent = sliderBg
            UI.CreateCorner(sliderFill, 4)
            
            local isLocked = isPremiumFeature and not window.IsPremium
            if isLocked then
                sliderFill.BackgroundColor3 = UI.CurrentTheme.TextMuted
            end
            
            local trigger = Instance.new("TextButton")
            trigger.Size = UDim2.new(1, 0, 1, 0)
            trigger.BackgroundTransparency = 1
            trigger.Text = ""
            trigger.Parent = sliderBg
            
            local dragging = false
            local value = default
            
            local function update(input)
                if isLocked then return end
                local pos = math.clamp((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
                value = math.floor(min + ((max - min) * pos))
                sliderFill.Size = UDim2.new(pos, 0, 1, 0)
                valueLabel.Text = tostring(value)
                if callback then callback(value) end
            end
            
            trigger.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    update(input)
                end
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    update(input)
                end
            end)
            
            return { GetValue = function() return value end }
        end
        
        return sectionObj
    end
    
    -- Destroy
    function window:Destroy()
        UI.Tween(mainFrame, {
            Position = UDim2.new(0.5, 0, 0.6, 0),
            BackgroundTransparency = 1
        }, 0.3)
        task.delay(0.3, function()
            screenGui:Destroy()
        end)
    end
    
    return window
end

return UI
