--[[
    FSSHUB Key System UI
    Pure UI Implementation (Sentinel Pattern)
    Version: 1.0.0
]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")

local UI = {}

-- 1. Configuration Table (Accessible by user)
UI.Keys = {
    MainTitle = "FSSHUB",
    MainDesc = "Please enter your key to continue",
    Directory = "FssHub_Key",
    KeyLink = "", -- Set via Initialize or directly
    Assets = {
        Logo = {
            ID = "rbxassetid://75038032192167", -- Default Junkie/FSS Icon
            Size = UDim2.fromScale(1, 1)
        }
    }
}

-- Private state
local State = {
    Connections = {},
    Screen = nil,
    Callback = nil
}

-- Constants & Theme
local Colors = {
    Bg = Color3.fromRGB(12, 12, 12),
    Primary = Color3.fromRGB(59, 130, 246),
    Surface = Color3.fromRGB(30, 30, 35),
    TextMain = Color3.fromRGB(255, 255, 255),
    TextSec = Color3.fromRGB(161, 161, 170),
    Success = Color3.fromRGB(16, 185, 129),
    Error = Color3.fromRGB(239, 68, 68),
    Warning = Color3.fromRGB(245, 158, 11),
    Loading = Color3.fromRGB(59, 130, 246)
}

-- Icons
local Icons = {
    Key = "rbxassetid://93569468678423",
    Copy = "rbxassetid://107485544510830",
    Lock = "rbxassetid://114355063515473",
    Loading = "rbxassetid://116535712789945",
    Check = "rbxassetid://10709790644",
    Error = "rbxassetid://10747384394"
}

-- Helpers
local function Tween(obj, props, time, style)
    local t = TweenService:Create(obj, TweenInfo.new(time or 0.3, style or Enum.EasingStyle.Quint), props)
    t:Play()
    return t
end

local function Round(obj, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 8)
    c.Parent = obj
    return c
end

local function Toast(parent, msg, type)
    local t = Instance.new("Frame")
    t.Size = UDim2.new(0, 0, 0, 40)
    t.Position = UDim2.new(0.5, 0, 0, 20)
    t.AnchorPoint = Vector2.new(0.5, 0)
    t.BackgroundColor3 = Colors.Surface
    t.BackgroundTransparency = 0.5
    t.ClipsDescendants = true
    t.Parent = parent
    Round(t, 20)
    
    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.new(1, 0, 1, 0)
    txt.BackgroundTransparency = 1
    txt.Text = msg
    txt.TextColor3 = Colors.TextMain
    txt.Font = Enum.Font.GothamMedium
    txt.TextSize = 14
    txt.Parent = t
    
    Tween(t, {Size = UDim2.new(0, 300, 0, 40)}, 0.4, Enum.EasingStyle.Back)
    
    task.delay(3, function()
        if t.Parent then
            Tween(t, {Size = UDim2.new(0, 0, 0, 40), BackgroundTransparency = 1}, 0.3)
            task.wait(0.3)
            t:Destroy()
        end
    end)
end

-- 2. Main Logic
function UI.Initialize(options)
    options = options or {}
    
    -- Config updates
    if options.KeyLink then UI.Keys.KeyLink = options.KeyLink end
    State.Callback = options.Function
    
    -- Clean existing
    local old = CoreGui:FindFirstChild("FSSHUB_KeySystem")
    if old then old:Destroy() end
    
    -- GUI Creation
    local screen = Instance.new("ScreenGui")
    screen.Name = "FSSHUB_KeySystem"
    screen.Parent = CoreGui
    State.Screen = screen
    
    -- Main Frame
    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 320, 0, 450)
    main.Position = UDim2.new(0.5, 0, 0.5, 0)
    main.AnchorPoint = Vector2.new(0.5, 0.5)
    main.BackgroundColor3 = Colors.Bg
    main.BackgroundTransparency = 0.1
    main.ClipsDescendants = true
    main.Parent = screen
    Round(main, 16)
    
    -- Stroke
    local stroke = Instance.new("UIStroke")
    stroke.Color = Colors.Surface
    stroke.Thickness = 1
    stroke.Parent = main
    
    -- Gradient
    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Colors.Bg),
        ColorSequenceKeypoint.new(1, Colors.Surface)
    }
    grad.Rotation = 45
    grad.Parent = main
    
    -- Content Container
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -40, 1, -40)
    content.Position = UDim2.new(0.5, 0, 0.5, 0)
    content.AnchorPoint = Vector2.new(0.5, 0.5)
    content.BackgroundTransparency = 1
    content.Parent = main
    
    -- Logo Area
    local logoCont = Instance.new("Frame")
    logoCont.Size = UDim2.new(0, 80, 0, 80)
    logoCont.Position = UDim2.new(0.5, 0, 0, 20)
    logoCont.AnchorPoint = Vector2.new(0.5, 0)
    logoCont.BackgroundColor3 = Colors.Surface
    logoCont.Parent = content
    Round(logoCont, 20)
    
    local logo = Instance.new("ImageLabel")
    logo.Size = UI.Keys.Assets.Logo.Size
    logo.Position = UDim2.fromScale(0.5, 0.5)
    logo.AnchorPoint = Vector2.new(0.5, 0.5)
    logo.Image = UI.Keys.Assets.Logo.ID
    logo.BackgroundTransparency = 1
    logo.ScaleType = Enum.ScaleType.Fit
    logo.Parent = logoCont
    
    -- Texts
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 110)
    title.Text = UI.Keys.MainTitle
    title.TextColor3 = Colors.TextMain
    title.Font = Enum.Font.GothamBold
    title.TextSize = 24
    title.BackgroundTransparency = 1
    title.Parent = content
    
    local desc = Instance.new("TextLabel")
    desc.Size = UDim2.new(1, 0, 0, 20)
    desc.Position = UDim2.new(0, 0, 0, 140)
    desc.Text = UI.Keys.MainDesc
    desc.TextColor3 = Colors.TextSec
    desc.Font = Enum.Font.Gotham
    desc.TextSize = 13
    desc.BackgroundTransparency = 1
    desc.Parent = content
    
    -- Status
    local statusFrame = Instance.new("Frame")
    statusFrame.Size = UDim2.new(1, 0, 0, 40)
    statusFrame.Position = UDim2.new(0, 0, 0, 180)
    statusFrame.BackgroundColor3 = Colors.Surface
    statusFrame.BackgroundTransparency = 0.5
    statusFrame.Parent = content
    Round(statusFrame, 10)
    
    local statusIcon = Instance.new("ImageLabel")
    statusIcon.Size = UDim2.new(0, 16, 0, 16)
    statusIcon.Position = UDim2.new(0, 12, 0.5, 0)
    statusIcon.AnchorPoint = Vector2.new(0, 0.5)
    statusIcon.Image = Icons.Lock
    statusIcon.ImageColor3 = Colors.TextSec
    statusIcon.BackgroundTransparency = 1
    statusIcon.Parent = statusFrame
    
    local statusText = Instance.new("TextLabel")
    statusText.Size = UDim2.new(1, -40, 1, 0)
    statusText.Position = UDim2.new(0, 34, 0, 0)
    statusText.Text = "Waiting for key..."
    statusText.TextColor3 = Colors.TextSec
    statusText.Font = Enum.Font.GothamMedium
    statusText.TextSize = 12
    statusText.TextXAlignment = Enum.TextXAlignment.Left
    statusText.BackgroundTransparency = 1
    statusText.Parent = statusFrame
    
    -- Input
    local inputSeq = Instance.new("Frame")
    inputSeq.Size = UDim2.new(1, 0, 0, 50)
    inputSeq.Position = UDim2.new(0, 0, 0, 240)
    inputSeq.BackgroundColor3 = Colors.Surface
    inputSeq.Parent = content
    Round(inputSeq, 10)
    
    local keyIcon = Instance.new("ImageLabel")
    keyIcon.Size = UDim2.new(0, 18, 0, 18)
    keyIcon.Position = UDim2.new(0, 12, 0.5, 0)
    keyIcon.AnchorPoint = Vector2.new(0, 0.5)
    keyIcon.Image = Icons.Key
    keyIcon.ImageColor3 = Colors.TextSec
    keyIcon.BackgroundTransparency = 1
    keyIcon.Parent = inputSeq
    
    local input = Instance.new("TextBox")
    input.Size = UDim2.new(1, -40, 1, 0)
    input.Position = UDim2.new(0, 40, 0, 0)
    input.Text = ""
    input.PlaceholderText = "Paste your key here"
    input.TextColor3 = Colors.TextMain
    input.PlaceholderColor3 = Colors.TextSec
    input.Font = Enum.Font.Gotham
    input.TextSize = 14
    input.TextXAlignment = Enum.TextXAlignment.Left
    input.BackgroundTransparency = 1
    input.Parent = inputSeq
    
    -- Buttons
    local btnContainer = Instance.new("Frame")
    btnContainer.Size = UDim2.new(1, 0, 0, 90)
    btnContainer.Position = UDim2.new(0, 0, 1, -95)
    btnContainer.BackgroundTransparency = 1
    btnContainer.Parent = content
    
    local function CreateBtn(text, color, pos, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 40)
        btn.Position = pos
        btn.BackgroundColor3 = color
        btn.Text = text
        btn.TextColor3 = Colors.TextMain
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.AutoButtonColor = false
        btn.Parent = btnContainer
        Round(btn, 10)
        
        btn.MouseButton1Click:Connect(function()
            Tween(btn, {Size = UDim2.new(1, -4, 0, 36), Position = pos + UDim2.new(0, 2, 0, 2)}, 0.1)
            task.wait(0.1)
            Tween(btn, {Size = UDim2.new(1, 0, 0, 40), Position = pos}, 0.1)
            callback(btn)
        end)
        
        return btn
    end
    
    -- Redeem Button
    local redeemBtn = CreateBtn("Redeem Key", Colors.Primary, UDim2.new(0, 0, 0, 0), function(btn)
        if State.Callback then
            local key = input.Text
            if #key < 1 then return Toast(screen, "Please enter a key", "error") end
            
            -- Validation Animation
            btn.Text = "Checking..."
            statusText.Text = "Verifying key..."
            statusText.TextColor3 = Colors.Loading
            statusIcon.Image = Icons.Loading
            statusIcon.ImageColor3 = Colors.Loading
            
            -- Call logic
            State.Callback(key)
            
            -- Reset if not authorized immediately
            task.delay(1, function()
                if screen.Parent then
                    btn.Text = "Redeem Key"
                end
            end)
        end
    end)
    
    -- Get Key Button
    local getBtn = CreateBtn("Get Key", Colors.Surface, UDim2.new(0, 0, 0, 50), function()
        if setclipboard then
            setclipboard(UI.Keys.KeyLink)
            Toast(screen, "Link copied to clipboard!", "success")
        else
            Toast(screen, "Clipboard not supported", "error")
        end
    end)
    
    -- Dragging
    local dragging, dragInput, dragStart, startPos
    
    main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
        end
    end)
    
    main.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- Expose internals
    UI.Screen = screen
    UI.Main = main
    UI.Status = {Text = statusText, Icon = statusIcon}
end

-- 3. Methods
function UI.Authorize()
    if UI.Screen then
        UI.Status.Text.Text = "Access Granted!"
        UI.Status.Text.TextColor3 = Colors.Success
        UI.Status.Icon.Image = Icons.Check
        UI.Status.Icon.ImageColor3 = Colors.Success
        
        task.wait(1)
        
        Tween(UI.Main, {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        task.wait(0.5)
        UI.Screen:Destroy()
    end
end

function UI.Fail()
    if UI.Screen then
        UI.Status.Text.Text = "Invalid Key"
        UI.Status.Text.TextColor3 = Colors.Error
        UI.Status.Icon.Image = Icons.Error
        UI.Status.Icon.ImageColor3 = Colors.Error
        
        -- Shake effect
        local basePos = UI.Main.Position
        for i = 1, 5 do
            UI.Main.Position = basePos + UDim2.new(0, math.random(-5, 5), 0, 0)
            task.wait(0.05)
        end
        UI.Main.Position = basePos
    end
end

return UI
