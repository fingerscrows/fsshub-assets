local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")

-- [ CONSTANTS ]
local FILE_EXT = ".txt"

local KeySystem = {}

-- [ PROPERTIES ]
KeySystem.Appearance = {
    Title = "Arqel",
    Subtitle = "Enter your key to continue",
    Icon = "rbxassetid://95721401302279",
    IconSize = UDim2.new(0, 30, 0, 30)
}

KeySystem.Links = {
    GetKey = "",
    Discord = ""
}

KeySystem.Storage = {
    FileName = "Arqel_Key",
    Remember = true,
    AutoLoad = true
}

KeySystem.Options = {
    Keyless = nil, -- nil = auto-detect (Junkie), true = force keyless, false = force key
    Blur = true,
    Draggable = true
}

KeySystem.Theme = {
    Accent = Color3.fromRGB(138, 110, 215), -- Defaulting to the "Cyber" purple from junkie_ui
    AccentHover = Color3.fromRGB(170, 150, 240),
    Background = Color3.fromRGB(25, 20, 35),
    Header = Color3.fromRGB(20, 20, 25),
    Input = Color3.fromRGB(15, 12, 25),
    Text = Color3.fromRGB(255, 255, 255),
    TextDim = Color3.fromRGB(180, 180, 200),
    Success = Color3.fromRGB(50, 255, 120),
    Error = Color3.fromRGB(255, 80, 100),
    Warning = Color3.fromRGB(255, 180, 50),
    StatusIdle = Color3.fromRGB(180, 80, 80),
    Discord = Color3.fromRGB(88, 101, 242),
    DiscordHover = Color3.fromRGB(114, 137, 218),
    Divider = Color3.fromRGB(45, 45, 70),
    Pending = Color3.fromRGB(60, 60, 60),
    MainStroke = Color3.fromRGB(140, 120, 210), -- Additional from junkie_ui
    ButtonBg = Color3.fromRGB(40, 30, 60)       -- Additional from junkie_ui
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
    UI = nil,
    Container = nil,
    BlurEffect = nil,
    Connections = {}
}

-- [ UTILITIES ]
local function RandomString(len)
    local s = ""
    for i = 1, len do s = s .. string.char(math.random(65, 90)) end
    return s
end

local function NeonStroke(parent, color, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = thickness or 1
    stroke.Color = color
    stroke.Transparency = 0.2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = parent
    return stroke
end

local function GlitchText(label, finalStats)
    task.spawn(function()
        local originalText = finalStats.Text or label.Text
        for i = 1, 10 do
            if not label or not label.Parent then break end
            label.Text = RandomString(#originalText)
            local targetColor = finalStats.TextColor3 or KeySystem.Theme.Text
            label.TextColor3 = (i % 2 == 0) and KeySystem.Theme.Text or targetColor
            task.wait(0.05)
        end
        if label and label.Parent then
            label.Text = originalText
            label.TextColor3 = finalStats.TextColor3 or KeySystem.Theme.Text
        end
    end)
end

-- [ STORAGE METHODS ]
function KeySystem:GetSavedKey()
    if not self.Storage.Remember then return nil end
    local path = self.Storage.FileName .. FILE_EXT

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

    if writefile then
        pcall(writefile, path, key)
    end
end

function KeySystem:ClearSavedKey()
    local path = self.Storage.FileName .. FILE_EXT
    if isfile and isfile(path) then
        delfile(path)
        return true
    end
    return false
end

-- [ NOTIFICATION SYSTEM ]
function KeySystem:Notify(title, message, duration, iconType)
    -- This would ideally integrate with Fluent's notification system if available,
    -- or implement a standalone one. For now, we'll use a simple print and
    -- the StatusFrame inside the UI if it exists.

    print(string.format("[KeySystem] %s: %s", title, message))

    if State.Container then
        local color = self.Theme.Text
        if iconType == "error" then color = self.Theme.Error end
        if iconType == "success" then color = self.Theme.Success end
        if iconType == "warning" then color = self.Theme.Warning end
        if iconType == "info" then color = self.Theme.Accent end

        self:ShowStatus(message, color)
    end
end

function KeySystem:ShowStatus(msg, color)
    if not State.Container then return end

    local existing = State.Container:FindFirstChild("StatusFrame")
    if existing then existing:Destroy() end

    local statusFrame = Instance.new("Frame")
    statusFrame.Name = "StatusFrame"
    statusFrame.Size = UDim2.new(0, 0, 0, 26)
    statusFrame.Position = UDim2.new(0.5, 0, 1, -12)
    statusFrame.AnchorPoint = Vector2.new(0.5, 1)
    statusFrame.BackgroundColor3 = self.Theme.Input
    statusFrame.BackgroundTransparency = 0.3
    statusFrame.Parent = State.Container

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = statusFrame

    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Thickness = 1
    stroke.Parent = statusFrame

    local label = Instance.new("TextLabel")
    label.Text = string.upper(msg)
    label.TextColor3 = color
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 12
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextTransparency = 1
    label.Parent = statusFrame

    TweenService:Create(statusFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        { Size = UDim2.new(0.9, 0, 0, 26) }):Play()

    task.delay(0.2, function()
        TweenService:Create(label, TweenInfo.new(0.2), { TextTransparency = 0 }):Play()
        GlitchText(label, { Text = string.upper(msg), TextColor3 = color })
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
    if State.UI then State.UI:Destroy() end

    -- ScreenGui
    local gui = Instance.new("ScreenGui")
    gui.Name = "KeySystemUI"
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 10000
    if gethui then gui.Parent = gethui() else gui.Parent = CoreGui end
    State.UI = gui

    -- Blur
    if self.Options.Blur then
        local blur = Instance.new("BlurEffect")
        blur.Size = 0
        blur.Parent = game:GetService("Lighting")
        TweenService:Create(blur, TweenInfo.new(0.5), { Size = 24 }):Play()
        State.BlurEffect = blur
    end

    -- Dimensions
    local hasLogo = (self.Appearance.Icon ~= nil and self.Appearance.Icon ~= "")
    local containerHeight = hasLogo and 340 or 280

    -- Main Container
    local container = Instance.new("Frame")
    container.Name = "MainContainer"
    container.Size = UDim2.new(0, 400, 0, containerHeight)
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundColor3 = self.Theme.Background
    container.BorderSizePixel = 0
    container.BackgroundTransparency = 0.25
    container.Parent = gui
    container.ClipsDescendants = true
    State.Container = container

    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 12)
    containerCorner.Parent = container

    -- Dragging
    if self.Options.Draggable then
        local dragging, dragInput, dragStart, startPos

        container.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = container.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        container.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                container.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y)
            end
        end)
    end

    -- Gradients & Strokes
    local mainGradient = Instance.new("UIGradient")
    mainGradient.Rotation = 45
    mainGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 25)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 15))
    })
    mainGradient.Parent = container

    local mainStroke = NeonStroke(container, self.Theme.MainStroke, 2)
    local strokeGradient = Instance.new("UIGradient")
    strokeGradient.Rotation = 45
    strokeGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, self.Theme.AccentHover),
        ColorSequenceKeypoint.new(0.5, self.Theme.Accent),
        ColorSequenceKeypoint.new(1, self.Theme.AccentHover)
    })
    strokeGradient.Parent = mainStroke

    -- Particles (Galaxy Effect)
    local galaxyContainer = Instance.new("Frame")
    galaxyContainer.Name = "GalaxyBg"
    galaxyContainer.Size = UDim2.new(1, 0, 1, 0)
    galaxyContainer.BackgroundTransparency = 1
    galaxyContainer.ClipsDescendants = true
    galaxyContainer.Parent = container
    local galaxyCorner = Instance.new("UICorner")
    galaxyCorner.CornerRadius = UDim.new(0, 8)
    galaxyCorner.Parent = galaxyContainer

    task.spawn(function()
        local particleColors = { self.Theme.Accent, self.Theme.AccentHover, Color3.fromRGB(150, 50, 255), Color3.fromRGB(
        255, 255, 255) }
        while gui and gui.Parent do
            if not galaxyContainer.Parent then break end
            if math.random() > 0.5 then
                local particle = Instance.new("Frame")
                local size = math.random(2, 4)
                particle.Size = UDim2.new(0, size, 0, size)
                particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
                particle.BackgroundColor3 = particleColors[math.random(1, #particleColors)]
                particle.BorderSizePixel = 0
                particle.BackgroundTransparency = math.random(0.3, 0.7)
                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(1, 0)
                corner.Parent = particle
                particle.Parent = galaxyContainer
                local duration = math.random(3, 8)
                local endPos = particle.Position + UDim2.new(math.random(-0.1, 0.1), 0, math.random(-0.1, 0.1), 0)
                TweenService:Create(particle,
                    TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    { Position = endPos, BackgroundTransparency = 1 }):Play()
                Debris:AddItem(particle, duration)
            end
            task.wait(0.05)
        end
    end)

    -- Close Button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Text = "X"
    closeBtn.TextColor3 = self.Theme.TextDim
    closeBtn.Font = Enum.Font.Code
    closeBtn.TextSize = 18
    closeBtn.BackgroundTransparency = 1
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -30, 0, 0)
    closeBtn.Parent = container
    closeBtn.MouseEnter:Connect(function() closeBtn.TextColor3 = self.Theme.Error end)
    closeBtn.MouseLeave:Connect(function() closeBtn.TextColor3 = self.Theme.TextDim end)

    closeBtn.MouseButton1Click:Connect(function()
        if self.Callbacks.OnClose then self.Callbacks.OnClose() end
        self:Close()
    end)

    -- Logo & Labels
    local logoImage
    if hasLogo then
        logoImage = Instance.new("ImageLabel")
        logoImage.Image = self.Appearance.Icon
        logoImage.Size = self.Appearance.IconSize
        logoImage.Position = UDim2.new(0.5, 0, 0, 20)
        logoImage.AnchorPoint = Vector2.new(0.5, 0)
        logoImage.BackgroundTransparency = 1
        logoImage.ImageTransparency = 1
        logoImage.ZIndex = 5
        logoImage.Parent = container
        local logoCorner = Instance.new("UICorner")
        logoCorner.CornerRadius = UDim.new(0, 12)
        logoCorner.Parent = logoImage
    end

    local logoLabel = Instance.new("TextLabel")
    logoLabel.Text = self.Appearance.Title
    logoLabel.Font = Enum.Font.GothamBold
    logoLabel.TextSize = 28
    logoLabel.TextColor3 = self.Theme.Accent
    logoLabel.Size = UDim2.new(1, 0, 0, 30)
    logoLabel.Position = UDim2.new(0, 0, 0, logoImage and 105 or 30)
    logoLabel.BackgroundTransparency = 1
    logoLabel.TextTransparency = 1
    logoLabel.Parent = container

    local subLabel = Instance.new("TextLabel")
    subLabel.Text = self.Appearance.Subtitle
    subLabel.Font = Enum.Font.Gotham
    subLabel.TextSize = 12
    subLabel.TextColor3 = self.Theme.TextDim
    subLabel.Size = UDim2.new(1, 0, 0, 20)
    subLabel.Position = UDim2.new(0, 0, 0, logoImage and 135 or 60)
    subLabel.BackgroundTransparency = 1
    subLabel.TextTransparency = 1
    subLabel.Parent = container

    local greetingLabel = Instance.new("TextLabel")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    greetingLabel.Text = "Welcome, @" .. (LocalPlayer and LocalPlayer.Name or "User")
    greetingLabel.Font = Enum.Font.GothamMedium
    greetingLabel.TextSize = 13
    greetingLabel.TextColor3 = self.Theme.Accent
    greetingLabel.Size = UDim2.new(1, 0, 0, 20)
    greetingLabel.Position = UDim2.new(0, 0, 0, logoImage and 155 or 85)
    greetingLabel.BackgroundTransparency = 1
    greetingLabel.TextTransparency = 1
    greetingLabel.Parent = container

    -- Input Section
    local inputYPos = logoImage and 195 or 125
    local inputSection = Instance.new("Frame")
    inputSection.Size = UDim2.new(0.85, 0, 0, 42)
    inputSection.Position = UDim2.new(0.5, 0, 0, inputYPos)
    inputSection.AnchorPoint = Vector2.new(0.5, 0)
    inputSection.BackgroundColor3 = self.Theme.Input
    inputSection.BackgroundTransparency = 0.5
    inputSection.Parent = container
    inputSection.Visible = false

    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 6)
    inputCorner.Parent = inputSection
    NeonStroke(inputSection, self.Theme.TextDim, 1)

    local keyInput = Instance.new("TextBox")
    keyInput.Size = UDim2.new(1, -20, 1, 0)
    keyInput.Position = UDim2.new(0, 10, 0, 0)
    keyInput.BackgroundTransparency = 1
    keyInput.Font = Enum.Font.Code
    keyInput.Text = ""
    keyInput.PlaceholderText = "INPUT_KEY_HERE"
    keyInput.PlaceholderColor3 = Color3.fromRGB(60, 80, 80)
    keyInput.TextColor3 = self.Theme.AccentHover
    keyInput.TextSize = 14
    keyInput.Parent = inputSection

    -- Buttons Helper
    local function createButton(text, pos, isPrimary, action)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.35, 0, 0, 35)
        btn.AnchorPoint = Vector2.new(0.5, 0)
        btn.Position = pos
        btn.BackgroundColor3 = self.Theme.ButtonBg
        btn.BackgroundTransparency = 0.3
        btn.Text = text
        btn.Font = Enum.Font.GothamBold
        btn.TextColor3 = isPrimary and self.Theme.Accent or self.Theme.TextDim
        btn.TextSize = 14
        btn.Parent = container
        btn.Visible = false

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 8)
        btnCorner.Parent = btn

        local stroke = NeonStroke(btn, isPrimary and self.Theme.Accent or self.Theme.TextDim, 1)

        btn.MouseEnter:Connect(function()
            TweenService:Create(stroke, TweenInfo.new(0.2),
                { Color = isPrimary and self.Theme.AccentHover or self.Theme.Text }):Play()
            btn.TextColor3 = isPrimary and self.Theme.AccentHover or self.Theme.Text
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(stroke, TweenInfo.new(0.2),
                { Color = isPrimary and self.Theme.Accent or self.Theme.TextDim }):Play()
            btn.TextColor3 = isPrimary and self.Theme.Accent or self.Theme.TextDim
        end)

        btn.MouseButton1Click:Connect(function()
            action()
            local flash = Instance.new("Frame")
            flash.Size = UDim2.new(1, 0, 1, 0)
            flash.BackgroundColor3 = self.Theme.Text
            flash.BackgroundTransparency = 0.5
            flash.Parent = btn
            local flashCorner = Instance.new("UICorner")
            flashCorner.CornerRadius = UDim.new(0, 6)
            flashCorner.Parent = flash
            TweenService:Create(flash, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
            Debris:AddItem(flash, 0.4)
        end)
        return btn
    end

    local buttonYPos = logoImage and 255 or 185

    local btnGet = createButton("GET KEY", UDim2.new(0.28, 0, 0, buttonYPos), false, function()
        if setclipboard then
            setclipboard(self.Links.GetKey)
            self:ShowStatus("LINK_COPIED", self.Theme.Accent)
        else
            self:ShowStatus("LINK: " .. self.Links.GetKey, self.Theme.Accent)
        end
    end)

    local btnVerify = createButton("VERIFY", UDim2.new(0.72, 0, 0, buttonYPos), true, function()
        local input = keyInput.Text:gsub("%s+", "")
        if input == "" then
            self:ShowStatus("NO_KEY_ENTERED", self.Theme.Error)
            return
        end
        self:ProcessKey(input)
    end)

    keyInput.FocusLost:Connect(function(enter)
        if enter then
            local input = keyInput.Text:gsub("%s+", "")
            if input == "" then
                self:ShowStatus("NO_KEY_ENTERED", self.Theme.Error)
                return
            end
            self:ProcessKey(input)
        end
    end)

    -- Elements table
    State.Elements = {
        InitLabel = nil,
        LogoImage = logoImage,
        LogoLabel = logoLabel,
        SubLabel = subLabel,
        GreetingLabel = greetingLabel,
        InputSection = inputSection,
        BtnGet = btnGet,
        BtnVerify = btnVerify,
        KeyInput = keyInput
    }

    return container
end

function KeySystem:AnimateEntry(isAutoLogin)
    local container = State.Container
    if not container then return end

    -- Setup Initial State
    container.Size = UDim2.new(0, 150, 0, 50)
    container.BackgroundTransparency = 0.05

    local initLabel = Instance.new("TextLabel")
    initLabel.Text = "INITIALIZING..."
    initLabel.Font = Enum.Font.Code
    initLabel.TextSize = 12
    initLabel.TextColor3 = self.Theme.AccentHover
    initLabel.Size = UDim2.new(1, 0, 1, 0)
    initLabel.BackgroundTransparency = 1
    initLabel.Parent = container
    State.Elements.InitLabel = initLabel

    task.spawn(function()
        task.wait(0.4)
        initLabel:Destroy()

        local targetHeight = container.Size.Y.Offset -- Should calculate based on logo presence
        local hasLogo = (self.Appearance.Icon ~= nil and self.Appearance.Icon ~= "")
        targetHeight = hasLogo and 340 or 280

        local targetSize = UDim2.new(0, 400, 0, targetHeight)

        TweenService:Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            { Size = targetSize }):Play()

        task.wait(0.35)

        local els = State.Elements
        if els.LogoImage then TweenService:Create(els.LogoImage, TweenInfo.new(0.3), { ImageTransparency = 0 }):Play() end
        TweenService:Create(els.LogoLabel, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
        TweenService:Create(els.SubLabel, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
        TweenService:Create(els.GreetingLabel, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()

        if isAutoLogin then
            els.GreetingLabel.Text = "Welcome Back, @" .. (game.Players.LocalPlayer.Name)
            self:ShowStatus("WELCOME BACK", self.Theme.Success)
            task.delay(1.5, function()
                self:CompleteAuth()
            end)
        else
            els.InputSection.Visible = true
            els.BtnGet.Visible = true
            els.BtnVerify.Visible = true
        end

        task.spawn(function()
            task.wait(0.2)
            GlitchText(els.LogoLabel, { Text = self.Appearance.Title, TextColor3 = self.Theme.Accent })
        end)
    end)
end

function KeySystem:ProcessKey(key)
    if not self.Callbacks.OnVerify then
        warn("KeySystem: No OnVerify callback defined!")
        self:ShowStatus("CONFIG_ERROR", self.Theme.Error)
        return
    end

    self:ShowStatus("VERIFYING...", self.Theme.Accent)

    local success, result = pcall(self.Callbacks.OnVerify, key)

    if not success then
        self:ShowStatus("SCRIPT_ERROR", self.Theme.Error)
        warn("Key Verification Error:", result)
        if self.Callbacks.OnFail then self.Callbacks.OnFail("Script Error during validation") end
        return
    end

    -- Handle Result (Bool or Table)
    local isValid = false
    local errorMsg = "Invalid Key"

    if type(result) == "boolean" then
        isValid = result
    elseif type(result) == "table" then
        isValid = result.valid
        errorMsg = result.message or result.error or "Invalid Key"
    end

    if isValid then
        getgenv().SCRIPT_KEY = key
        if self.Storage.Remember then
            self:SaveKey(key)
        end
        self:ShowStatus("SUCCESS", self.Theme.Success)
        task.wait(1)
        self:CompleteAuth()
    else
        self:FailAuth(errorMsg)
    end
end

function KeySystem:FailAuth(msg)
    self:ShowStatus("ACCESS_DENIED: " .. string.upper(msg or "INVALID"), self.Theme.Error)

    local container = State.Container
    if container then
        local orig = UDim2.new(0.5, 0, 0.5, 0)
        for i = 1, 6 do
            container.Position = orig + UDim2.new(0, math.random(-5, 5), 0, math.random(-5, 5))
            task.wait(0.04)
        end
        container.Position = orig
    end

    if self.Callbacks.OnFail then self.Callbacks.OnFail(msg) end
end

function KeySystem:CompleteAuth()
    self:ShowStatus("ACCESS_GRANTED... AUTHENTICATING", self.Theme.Success)

    task.delay(1, function()
        -- Cleanup Elements
        local els = State.Elements
        local tweenProps = { BackgroundTransparency = 1, TextTransparency = 1, ImageTransparency = 1 }

        local function fade(inst)
            if not inst then return end
            pcall(function()
                local t = {}
                if inst:IsA("Frame") then t.BackgroundTransparency = 1 end
                if inst:IsA("TextLabel") or inst:IsA("TextButton") or inst:IsA("TextBox") then t.TextTransparency = 1 end
                if inst:IsA("ImageLabel") then t.ImageTransparency = 1 end
                TweenService:Create(inst, TweenInfo.new(0.3), t):Play()
            end)
        end

        fade(els.InputSection)
        fade(els.BtnGet)
        fade(els.BtnVerify)
        fade(els.GreetingLabel)
        fade(els.SubLabel)
        fade(els.LogoLabel)

        task.wait(0.4)

        -- Logo Pulse
        if els.LogoImage then
            TweenService:Create(els.LogoImage,
                TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
                { Size = UDim2.new(0, 85, 0, 85) }):Play()
        end

        task.wait(1.5)

        if self.Callbacks.OnSuccess then
            local s, err = pcall(self.Callbacks.OnSuccess)
            if not s then warn("OnSuccess Callback Error:", err) end
        end

        self:Close()
    end)
end

function KeySystem:Launch()
    getgenv().ArqelLoaded = true
    getgenv().ArqelClosed = false
    getgenv().SCRIPT_KEY = nil

    -- Check for saved key
    local savedKey = nil
    if self.Storage.AutoLoad then
        savedKey = self:GetSavedKey()
    end

    if self.Options.Keyless == true then
        -- Force Keyless
        getgenv().SCRIPT_KEY = "KEYLESS"
        self:ConstructUI()
        self:AnimateEntry(false)
        -- Simulate immediate success logic
        task.delay(1, function()
            self:ShowStatus("KEYLESS MODE ENABLED", self.Theme.Accent)
            task.wait(1)
            self:CompleteAuth()
        end)
        return
    end

    self:ConstructUI()

    if savedKey then
        -- Validate saved key
        if self.Callbacks.OnVerify then
            local success, result = pcall(self.Callbacks.OnVerify, savedKey)
            local isValid = false
            if success then
                if type(result) == "boolean" then isValid = result end
                if type(result) == "table" then isValid = result.valid end
            end

            if isValid then
                getgenv().SCRIPT_KEY = savedKey
                self:AnimateEntry(true)  -- Auto login flow
                return
            end
        end
    end

    self:AnimateEntry(false) -- Standard flow
end

function KeySystem:LaunchJunkie(config)
    if not config or not config.Service or not config.Identifier then
        warn("KeySystem: Invalid Junkie Configuration")
        return
    end

    -- Load Junkie SDK
    local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
    if not Junkie then
        self:Notify("Error", "Failed to load Junkie SDK", 5, "error")
        return
    end

    Junkie.service = config.Service
    Junkie.identifier = config.Identifier
    Junkie.provider = config.Provider or "Junkie Provider"

    -- Set Keyless option based on Junkie
    if self.Options.Keyless == nil then
        self.Options.Keyless = Junkie.keyless
    end

    self.Links.GetKey = Junkie.get_key_link()

    -- Override Verify Callback
    self.Callbacks.OnVerify = function(key)
        local result = Junkie.check_key(key)
        if result then
            return {
                valid = (result.valid or result.message == "KEY_VALID" or result.message == "KEYLESS"),
                message = result.message
            }
        end
        return false
    end

    self:Launch()
end

function KeySystem:Close()
    getgenv().ArqelLoaded = false

    local container = State.Container
    local blur = State.BlurEffect
    local gui = State.UI

    if blur then TweenService:Create(blur, TweenInfo.new(0.3), { Size = 0 }):Play() end

    if container then
        local tween = TweenService:Create(container,
            TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
            { Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1 })
        tween:Play()
        tween.Completed:Wait()
    end

    if gui then gui:Destroy() end
    if blur then blur:Destroy() end

    State.UI = nil
    State.Container = nil
end

return KeySystem
