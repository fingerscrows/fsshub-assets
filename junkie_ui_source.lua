--[[
    FSSHUB UI Source (Refined)
    Junkie Inline Architecture

    Features:
    - Persistent Key System
    - Advanced Toast Notifications
    - Dynamic Interaction Polish
    - Config-Driven Architecture
]]

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- [ JUNKIE SDK INITIALIZATION ]
local Junkie = getgenv().Junkie
if not Junkie then
    Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
    Junkie.service = "FSSHUB Official"
    Junkie.identifier = "1000139"
    Junkie.provider = "FSSHUB - KEY SYSTEM"
end

-- [ CONFIGURATION ]
local Config = {
    Title = "FSSHUB",
    Desc = "KEYSYSTEM GATEWAY",
    KeyFile = "FSSHUB/Data/key.cfg",
    Assets = {
        Logo = "rbxassetid://120860566854298" -- FSS Logo
    },
    Colors = {
        Background = Color3.fromRGB(15, 15, 20),
        MainStroke = Color3.fromRGB(140, 120, 210),
        Accent = Color3.fromRGB(127, 106, 196),
        Secondary = Color3.fromRGB(160, 140, 230),
        Error = Color3.fromRGB(255, 80, 100),
        Success = Color3.fromRGB(50, 255, 120),
        Info = Color3.fromRGB(0, 200, 255),
        TextLight = Color3.fromRGB(240, 240, 255),
        TextDim = Color3.fromRGB(140, 140, 170),
        InputBg = Color3.fromRGB(20, 20, 30),
        ButtonBg = Color3.fromRGB(30, 25, 45)
    }
}

local Library = {
    Connections = {},
    UI = nil
}

-- [ UTILS ]
local Utils = {}

function Utils.RandomString(len)
    local s = ""
    for i = 1, len do s = s .. string.char(math.random(65, 90)) end
    return s
end

function Utils.SaveKey(key)
    if writefile then
        if makefolder and not isfolder("FSSHUB") then
            makefolder("FSSHUB")
        end
        if makefolder and not isfolder("FSSHUB/Data") then
            makefolder("FSSHUB/Data")
        end
        pcall(function() writefile(Config.KeyFile, key) end)
    end
end

function Utils.LoadKey()
    if isfile and isfile(Config.KeyFile) then
        local success, key = pcall(function() return readfile(Config.KeyFile) end)
        if success then return key end
    end
    return nil
end

function Utils.NeonStroke(parent, color, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = thickness or 1
    stroke.Color = color
    stroke.Transparency = 0.2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = parent
    return stroke
end

function Utils.GlitchText(label, originalText, color)
    task.spawn(function()
        for i = 1, 10 do
            if not label or not label.Parent then break end
            label.Text = Utils.RandomString(#originalText)
            label.TextColor3 = (i % 2 == 0) and Config.Colors.TextLight or color
            task.wait(0.05)
        end
        if label and label.Parent then
            label.Text = originalText
            label.TextColor3 = color
        end
    end)
end

-- [ TOAST SYSTEM ]
local ToastSystem = {}
ToastSystem.ActiveToasts = {}

function ToastSystem.Notify(msg, type, duration)
    local container = Library.UI and Library.UI:FindFirstChild("MainContainer")
    if not container then return end

    local color = Config.Colors.Info
    if type == "success" then color = Config.Colors.Success end
    if type == "error" then color = Config.Colors.Error end

    -- Cleanup old toasts
    if #ToastSystem.ActiveToasts >= 3 then
        local old = table.remove(ToastSystem.ActiveToasts, 1)
        if old and old.Parent then old:Destroy() end
    end

    local toast = Instance.new("Frame")
    toast.Size = UDim2.new(0.8, 0, 0, 30)
    toast.Position = UDim2.new(0.1, 0, 0.9, -40 * (#ToastSystem.ActiveToasts))
    toast.BackgroundColor3 = Config.Colors.InputBg
    toast.BackgroundTransparency = 0.2
    toast.Parent = container

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = toast

    Utils.NeonStroke(toast, color, 1)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "  " .. msg:upper()
    label.TextColor3 = color
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toast

    table.insert(ToastSystem.ActiveToasts, toast)

    -- Animation
    toast.Position = toast.Position + UDim2.new(0, 20, 0, 0)
    toast.BackgroundTransparency = 1
    label.TextTransparency = 1

    TweenService:Create(toast, TweenInfo.new(0.3),
        { Position = toast.Position - UDim2.new(0, 20, 0, 0), BackgroundTransparency = 0.2 }):Play()
    TweenService:Create(label, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()

    task.delay(duration or 3, function()
        if toast.Parent then
            TweenService:Create(toast, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(label, TweenInfo.new(0.3), { TextTransparency = 1 }):Play()
            task.wait(0.3)
            toast:Destroy()
            -- Remove from active list
            for i, v in ipairs(ToastSystem.ActiveToasts) do
                if v == toast then
                    table.remove(ToastSystem.ActiveToasts, i)
                    break
                end
            end
        end
    end)
end

-- [ UI CONSTRUCTION ]
function Library.Initialize(junkieConfig)
    local validateCallback = junkieConfig.Function
    local keyLink = junkieConfig.KeyLink or "https://fsshub.com/getkey"

    if Library.UI then Library.UI:Destroy() end

    -- Main GUI
    local gui = Instance.new("ScreenGui")
    gui.Name = "FSSHUB_Inline_UI"
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 10000
    if gethui then gui.Parent = gethui() else gui.Parent = CoreGui end
    Library.UI = gui

    -- Blur
    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = game:GetService("Lighting")
    TweenService:Create(blur, TweenInfo.new(0.5), { Size = 20 }):Play()

    -- Container
    local container = Instance.new("Frame")
    container.Name = "MainContainer"
    container.Size = UDim2.new(0, 420, 0, 280)
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundColor3 = Config.Colors.Background
    container.BackgroundTransparency = 0.4
    container.ClipsDescendants = true
    container.Parent = gui

    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 12)
    containerCorner.Parent = container

    Utils.NeonStroke(container, Config.Colors.MainStroke, 2)

    -- Galaxy Background (Simplified)
    local galaxy = Instance.new("Frame")
    galaxy.Size = UDim2.new(1, 0, 1, 0)
    galaxy.BackgroundTransparency = 1
    galaxy.Parent = container

    task.spawn(function()
        while galaxy.Parent do
            if math.random() > 0.8 then
                local p = Instance.new("Frame")
                p.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
                p.Position = UDim2.new(math.random(), 0, math.random(), 0)
                p.BackgroundColor3 = Config.Colors.Accent
                p.BorderSizePixel = 0
                p.Parent = galaxy
                TweenService:Create(p, TweenInfo.new(math.random(2, 5)),
                    { BackgroundTransparency = 1, Position = p.Position + UDim2.new(0, 0, -0.2, 0) }):Play()
                game.Debris:AddItem(p, 5)
            end
            task.wait(0.1)
        end
    end)

    -- Elements
    local logoLabel = Instance.new("TextLabel")
    logoLabel.Text = Config.Title
    logoLabel.Font = Enum.Font.GothamBold
    logoLabel.TextSize = 28
    logoLabel.TextColor3 = Config.Colors.Accent
    logoLabel.Size = UDim2.new(1, 0, 0, 30)
    logoLabel.Position = UDim2.new(0, 0, 0, 30)
    logoLabel.BackgroundTransparency = 1
    logoLabel.Parent = container

    local subLabel = Instance.new("TextLabel")
    subLabel.Text = Config.Desc
    subLabel.Font = Enum.Font.Gotham
    subLabel.TextSize = 12
    subLabel.TextColor3 = Config.Colors.TextDim
    subLabel.Size = UDim2.new(1, 0, 0, 20)
    subLabel.Position = UDim2.new(0, 0, 0, 60)
    subLabel.BackgroundTransparency = 1
    subLabel.Parent = container

    -- Input
    local inputFrame = Instance.new("Frame")
    inputFrame.Size = UDim2.new(0.8, 0, 0, 42)
    inputFrame.Position = UDim2.new(0.5, 0, 0, 100)
    inputFrame.AnchorPoint = Vector2.new(0.5, 0)
    inputFrame.BackgroundColor3 = Config.Colors.InputBg
    inputFrame.BackgroundTransparency = 0.5
    inputFrame.Parent = container

    Instance.new("UICorner", inputFrame).CornerRadius = UDim.new(0, 6)
    Utils.NeonStroke(inputFrame, Config.Colors.TextDim, 1)

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(1, -20, 1, 0)
    input.Position = UDim2.new(0, 10, 0, 0)
    input.BackgroundTransparency = 1
    input.Font = Enum.Font.Code
    input.Text = ""
    input.PlaceholderText = "ENTER KEY"
    input.TextColor3 = Config.Colors.Secondary
    input.TextSize = 14
    input.Parent = inputFrame

    -- Check Saved Key & Auto-Verify
    local savedKey = Utils.LoadKey()
    if savedKey then
        input.Text = savedKey
        ToastSystem.Notify("Saved Key Loaded", "success", 2)

        -- Auto Verify
        task.delay(0.5, function()
            if validateCallback then
                ToastSystem.Notify("Auto-Verifying...", "info", 2)
                validateCallback(savedKey)
            end
        end)
    end

    -- Buttons
    local function CreateButton(text, pos, primary, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.38, 0, 0, 35)
        btn.Position = pos
        btn.AnchorPoint = Vector2.new(0.5, 0)
        btn.BackgroundColor3 = Config.Colors.ButtonBg
        btn.BackgroundTransparency = 0.3
        btn.Text = text
        btn.TextColor3 = primary and Config.Colors.Accent or Config.Colors.TextDim
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.Parent = container

        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
        local s = Utils.NeonStroke(btn, primary and Config.Colors.Accent or Config.Colors.TextDim, 1)

        btn.MouseButton1Click:Connect(callback)

        -- Polish: Hover
        btn.MouseEnter:Connect(function()
            TweenService:Create(s, TweenInfo.new(0.2), { Color = Config.Colors.Secondary }):Play()
            btn.TextColor3 = Config.Colors.Secondary
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(s, TweenInfo.new(0.2),
                { Color = primary and Config.Colors.Accent or Config.Colors.TextDim }):Play()
            btn.TextColor3 = primary and Config.Colors.Accent or Config.Colors.TextDim
        end)
        return btn
    end

    CreateButton("GET KEY", UDim2.new(0.25, 0, 0, 160), false, function()
        setclipboard(keyLink)
        ToastSystem.Notify("Link Copied to Clipboard", "info", 2)
    end)

    local verifyBtn = CreateButton("VERIFY", UDim2.new(0.75, 0, 0, 160), true, function()
        local key = input.Text:gsub("%s+", "")
        if key == "" then
            -- Shake Effect
            local x = inputFrame.Position.X.Scale
            local y = inputFrame.Position.Y.Scale
            for i = 1, 5 do
                inputFrame.Position = UDim2.new(x + math.random(-5, 5) / 1000, 0, y, 0)
                task.wait(0.05)
            end
            inputFrame.Position = UDim2.new(x, 0, y, 0)
            ToastSystem.Notify("Please enter a key", "error", 2)
            return
        end

        ToastSystem.Notify("Verifying...", "info", 1)
        if validateCallback then
            validateCallback(key)
        end
    end)

    -- Close
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -30, 0, 0)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Config.Colors.TextDim
    closeBtn.Parent = container
    closeBtn.MouseButton1Click:Connect(function()
        gui:Destroy()
        blur:Destroy()
    end)

    -- Functions for external use
    function Library.Close()
        gui:Destroy()
        blur:Destroy()
    end

    function Library.Succeed(key)
        Utils.SaveKey(key) -- Auto Save
        ToastSystem.Notify("Access Granted", "success", 2)
        -- Transition to Loader...
        container:ClearAllChildren()

        -- Centered Loader
        local loadLabel = Instance.new("TextLabel")
        loadLabel.Text = "AUTHENTICATED"
        loadLabel.Size = UDim2.new(1, 0, 1, 0)
        loadLabel.BackgroundTransparency = 1
        loadLabel.TextColor3 = Config.Colors.Success
        loadLabel.Font = Enum.Font.GothamBold
        loadLabel.TextSize = 18
        loadLabel.Parent = container

        -- Wait loop for Signal
        task.spawn(function()
            local dots = ""
            while not getgenv().FSSHUB_MAIN_MENU_READY and not _G.FSSHUB_WINDOW do
                dots = dots .. "."
                if #dots > 3 then dots = "" end
                loadLabel.Text = "LOADING PAYLOAD" .. dots
                task.wait(0.5)
            end
            Library.Close()
        end)
    end

    function Library.Fail()
        ToastSystem.Notify("Invalid Key", "error", 3)
        Utils.GlitchText(subLabel, "ACCESS DENIED", Config.Colors.Error)
        task.delay(2, function()
            subLabel.Text = Config.Desc
            subLabel.TextColor3 = Config.Colors.TextDim
        end)
    end
end

-- [ JUNKIE INIT ]

-- This part mirrors the Gamerfoxy Init structure
-- [ INITIALIZATION ]
-- Connects the Library to the Junkie SDK


Library.Initialize({
    KeyLink = Junkie.get_key_link(),
    Function = function(userInput)
        getgenv().SCRIPT_KEY = userInput
        local key = userInput
        -- Async check
        task.spawn(function()
            local result = Junkie.check_key(key)
            if result and (result.valid or result.message == "KEY_VALID" or result.message == "KEYLESS") then
                Library.Succeed(key)
            else
                Library.Fail()
            end
        end)
    end
})

return Library
