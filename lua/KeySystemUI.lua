local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local UI = {}

-- Cyber Neon Palette
local Colors = {
    Background = Color3.fromRGB(10, 10, 15),       -- Deep Dark
    MainStroke = Color3.fromRGB(0, 255, 255),      -- Cyan Neon
    Accent = Color3.fromRGB(0, 255, 255),          -- Cyan
    Secondary = Color3.fromRGB(57, 255, 20),       -- Neon Green (Matrix)
    Error = Color3.fromRGB(255, 0, 85),            -- Neon Pink/Red
    TextLight = Color3.fromRGB(220, 255, 255),
    TextDim = Color3.fromRGB(100, 150, 150),
    InputBg = Color3.fromRGB(5, 5, 10),
    ButtonBg = Color3.fromRGB(15, 20, 25)
}

UI.Keys = {
    MainTitle = "SYSTEM ACCESS", 
    MainDesc = "AUTHENTICATION REQUIRED"
}

local gui, container, inputSection
local blur
local connections = {}

-- Utility: Random String Generator for glitch effect
local function randomString(len)
    local s = ""
    for i = 1, len do
        s = s .. string.char(math.random(65, 90)) -- A-Z
    end
    return s
end

-- Utility: Create Neon Stroke
local function addNeonStroke(parent, color, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = thickness or 1
    stroke.Color = color
    stroke.Transparency = 0.2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = parent
    return stroke
end

-- Utility: Glitch Text Effect
local function glitchText(label, finalStats)
    task.spawn(function()
        local originalText = finalStats.Text or label.Text
        for i = 1, 10 do
            if not label or not label.Parent then break end
            label.Text = randomString(#originalText)
            label.TextColor3 = (i % 2 == 0) and Colors.Secondary or Colors.Error
            task.wait(0.05)
        end
        if label and label.Parent then
            label.Text = originalText
            label.TextColor3 = finalStats.TextColor3 or Colors.TextLight
        end
    end)
end

function UI.Initialize(config)
    local validateCallback = config.Function or config.validateCallback
    local keyLink = config.KeyLink or config.keyLink or "https://fsshub.com/getkey"

    if gui then gui:Destroy() end

    gui = Instance.new("ScreenGui")
    gui.Name = "FSSHUB_Cyber_Loader"
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 10000
    
    if syn and syn.protect_gui then
        syn.protect_gui(gui)
        gui.Parent = CoreGui
    elseif gethui then
        gui.Parent = gethui()
    else
        gui.Parent = CoreGui
    end

    -- Background Blur
    blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = game:GetService("Lighting")
    TweenService:Create(blur, TweenInfo.new(0.5), {Size = 20}):Play()

    -- Main Container (Cyber Box)
    container = Instance.new("Frame")
    container.Name = "MainContainer"
    container.Size = UDim2.new(0, 480, 0, 280) 
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundColor3 = Colors.Background
    container.BorderSizePixel = 0
    container.BackgroundTransparency = 0.05
    container.Parent = gui

    -- Rounded Corners for Container
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 8)
    containerCorner.Parent = container

    -- Neon Stroke around Container
    local mainStroke = addNeonStroke(container, Colors.MainStroke, 2)

    -- Galaxy Particle Background Effect
    local galaxyContainer = Instance.new("Frame")
    galaxyContainer.Name = "GalaxyBg"
    galaxyContainer.Size = UDim2.new(1, 0, 1, 0)
    galaxyContainer.BackgroundTransparency = 1
    galaxyContainer.ClipsDescendants = true
    
    local galaxyCorner = Instance.new("UICorner") -- mask content
    galaxyCorner.CornerRadius = UDim.new(0, 8)
    galaxyCorner.Parent = galaxyContainer
    galaxyContainer.Parent = container

    -- Spawn "Galaxy Particles"
    task.spawn(function()
        local particleColors = {Colors.Accent, Colors.Secondary, Color3.fromRGB(150, 50, 255), Color3.fromRGB(255, 255, 255)}
        while gui and gui.Parent do
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

                -- Twinkle & Drift
                local duration = math.random(3, 8)
                local endPos = particle.Position + UDim2.new(math.random(-0.1, 0.1), 0, math.random(-0.1, 0.1), 0)
                
                TweenService:Create(particle, TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    Position = endPos,
                    BackgroundTransparency = 1
                }):Play()
                
                task.delay(duration, function() particle:Destroy() end)
            end
            task.wait(0.05)
        end
    end)

    -- Close Button (X)
    local closeBtn = Instance.new("TextButton")
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Colors.TextDim
    closeBtn.Font = Enum.Font.Code
    closeBtn.TextSize = 18
    closeBtn.BackgroundTransparency = 1
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -30, 0, 0)
    closeBtn.Parent = container
    closeBtn.MouseButton1Click:Connect(UI.Close)
    closeBtn.MouseEnter:Connect(function() closeBtn.TextColor3 = Colors.Error end)
    closeBtn.MouseLeave:Connect(function() closeBtn.TextColor3 = Colors.TextDim end)

    -- Logo / Header
    local logoLabel = Instance.new("TextLabel")
    logoLabel.Text = "FSSHUB"
    logoLabel.Font = Enum.Font.Sarpanch -- "Sci-fi" look
    logoLabel.TextSize = 36
    logoLabel.TextColor3 = Colors.Accent
    logoLabel.Size = UDim2.new(1, 0, 0, 60)
    logoLabel.Position = UDim2.new(0, 0, 0, 20)
    logoLabel.BackgroundTransparency = 1
    logoLabel.Parent = container
    
    -- Subheader
    local subLabel = Instance.new("TextLabel")
    subLabel.Text = UI.Keys.MainDesc
    subLabel.Font = Enum.Font.Code
    subLabel.TextSize = 12
    subLabel.TextColor3 = Colors.TextDim
    subLabel.Size = UDim2.new(1, 0, 0, 20)
    subLabel.Position = UDim2.new(0, 0, 0, 65)
    subLabel.BackgroundTransparency = 1
    subLabel.Parent = container

    -- Input Field
    inputSection = Instance.new("Frame")
    inputSection.Size = UDim2.new(0.8, 0, 0, 40)
    inputSection.Position = UDim2.new(0.5, 0, 0, 110)
    inputSection.AnchorPoint = Vector2.new(0.5, 0)
    inputSection.BackgroundColor3 = Colors.InputBg
    inputSection.BackgroundTransparency = 0.5
    inputSection.Parent = container
    
    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 6)
    inputCorner.Parent = inputSection
    
    addNeonStroke(inputSection, Colors.TextDim, 1)

    local keyInput = Instance.new("TextBox")
    keyInput.Size = UDim2.new(1, -20, 1, 0)
    keyInput.Position = UDim2.new(0, 10, 0, 0)
    keyInput.BackgroundTransparency = 1
    keyInput.Font = Enum.Font.Code
    keyInput.Text = ""
    keyInput.PlaceholderText = "_ENTER_KEY_CODE"
    keyInput.PlaceholderColor3 = Color3.fromRGB(60, 80, 80)
    keyInput.TextColor3 = Colors.Secondary -- Terminal Green typing
    keyInput.TextSize = 14
    keyInput.Parent = inputSection

    -- Button Creator
    local function createCyberButton(text, pos, isPrimary, action)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.35, 0, 0, 35)
        btn.AnchorPoint = Vector2.new(0.5, 0)
        btn.Position = pos
        btn.BackgroundColor3 = Colors.ButtonBg
        btn.Text = text
        btn.Font = Enum.Font.Sarpanch
        btn.TextColor3 = isPrimary and Colors.Accent or Colors.TextDim
        btn.TextSize = 16
        btn.Parent = container
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 6)
        btnCorner.Parent = btn
        
        local stroke = addNeonStroke(btn, isPrimary and Colors.Accent or Colors.TextDim, 1)

        -- Hover Glitch Effect
        btn.MouseEnter:Connect(function()
            TweenService:Create(stroke, TweenInfo.new(0.2), {Color = isPrimary and Colors.Secondary or Colors.TextLight}):Play()
            btn.TextColor3 = isPrimary and Colors.Secondary or Colors.TextLight
            -- Random slight offset
            btn.Position = pos + UDim2.new(0, math.random(-2,2), 0, math.random(-2,2))
            task.delay(0.05, function() btn.Position = pos end)
        end)
        
        btn.MouseLeave:Connect(function()
            TweenService:Create(stroke, TweenInfo.new(0.2), {Color = isPrimary and Colors.Accent or Colors.TextDim}):Play()
            btn.TextColor3 = isPrimary and Colors.Accent or Colors.TextDim
        end)

        btn.MouseButton1Click:Connect(function() 
            action()
            -- Click Flash
            local flash = Instance.new("Frame")
            flash.Size = UDim2.new(1,0,1,0)
            flash.BackgroundColor3 = Colors.TextLight
            flash.BackgroundTransparency = 0.5
            flash.Parent = btn
            local flashCorner = Instance.new("UICorner")
            flashCorner.CornerRadius = UDim.new(0, 6)
            flashCorner.Parent = flash
            TweenService:Create(flash, TweenInfo.new(0.2), {BackgroundTransparency=1}):Play()
            task.delay(0.2, function() flash:Destroy() end)
        end)
    end

    createCyberButton("GET KEY", UDim2.new(0.3, 0, 0, 180), false, function()
        if setclipboard then
            setclipboard(keyLink)
            UI.ShowStatus("LINK_COPIED_TO_CLIPBOARD", Colors.Secondary)
        else
            UI.ShowStatus("LINK: "..keyLink, Colors.Accent)
        end
    end)

    createCyberButton("VERIFY", UDim2.new(0.7, 0, 0, 180), true, function()
        local input = keyInput.Text:gsub("%s+", "")
        if input == "" then
             UI.ShowStatus("ERROR: NO_INPUT_DETECTED", Colors.Error)
             return
        end
        if validateCallback then validateCallback(input) end
    end)
    
    keyInput.FocusLost:Connect(function(enter)
        if enter then
             local input = keyInput.Text:gsub("%s+", "")
             if input ~= "" and validateCallback then validateCallback(input) end
        end
    end)
    
    -- "Terminal" Reveal
    container.Size = UDim2.new(0, 0, 0, 2)
    container.BackgroundTransparency = 1
    
    TweenService:Create(container, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 480, 0, 2), BackgroundTransparency = 0.2}):Play()
    task.wait(0.4)
    TweenService:Create(container, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 480, 0, 280)}):Play()
end

function UI.ShowStatus(msg, color)
    local label = Instance.new("TextLabel")
    label.Text = "> " .. string.upper(msg)
    label.TextColor3 = color
    label.Font = Enum.Font.Code
    label.TextSize = 14
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Position = UDim2.new(0, 0, 0, 240)
    label.BackgroundTransparency = 1
    label.TextTransparency = 0
    label.Parent = container
    
    -- Glitch in
    glitchText(label, {Text = label.Text})
    
    task.delay(3, function()
        TweenService:Create(label, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        task.wait(0.5)
        label:Destroy()
    end)
end

function UI.ShowError(msg)
    UI.ShowStatus(msg, Colors.Error)
    -- Shake Container
    local orig = UDim2.new(0.5, 0, 0.5, 0)
    for i=1,6 do
        container.Position = orig + UDim2.new(0, math.random(-5,5), 0, math.random(-5,5))
        task.wait(0.04)
    end
    container.Position = orig
end

function UI.Authorize()
    UI.ShowStatus("ACCESS_GRANTED... LOADING_MODULES", Colors.Secondary)
    task.wait(1.5)
    UI.Close()
end

function UI.Fail()
    UI.ShowError("ACCESS_DENIED: INVALID_KEY")
end

function UI.Close()
    if blur then TweenService:Create(blur, TweenInfo.new(0.5), {Size = 0}):Play() end
    if container then
        -- Collapse effect
        TweenService:Create(container, TweenInfo.new(0.3), {Size = UDim2.new(0, 480, 0, 2)}):Play()
        task.wait(0.3)
        TweenService:Create(container, TweenInfo.new(0.2), {Size = UDim2.new(0,0,0,0), BackgroundTransparency=1}):Play()
    end
    task.wait(0.5)
    if gui then gui:Destroy() end
    if blur then blur:Destroy() end
end

return UI
