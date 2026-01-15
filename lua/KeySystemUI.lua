-- KeySystemUI.lua
-- Pure UI component for Key System
-- Designed to be controlled by an external Logic Controller (CF Worker Loader)
-- API: Initialize(options), Authorize(), Fail(), ShowError(msg)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

-- COLOR PALETTE
local Colors = {
    background = Color3.fromRGB(13, 17, 23),
    surface = Color3.fromRGB(22, 27, 34),
    surfaceLight = Color3.fromRGB(30, 36, 44),
    primary = Color3.fromRGB(88, 166, 255),
    primaryDark = Color3.fromRGB(58, 136, 225),
    success = Color3.fromRGB(47, 183, 117),
    error = Color3.fromRGB(248, 81, 73),
    textPrimary = Color3.fromRGB(230, 237, 243),
    textSecondary = Color3.fromRGB(139, 148, 158),
    textMuted = Color3.fromRGB(110, 118, 129),
    borderLight = Color3.fromRGB(63, 71, 79),
    glass = Color3.fromRGB(255, 255, 255),
    neonBlue = Color3.fromRGB(0, 229, 255)
}

local IconAssets = {
    shield = "rbxassetid://84528813312016",
    x = "rbxassetid://73070135088117",
    key = "rbxassetid://128426502701541",
    link = "rbxassetid://73034596791310"
}

local function createIconImage(id)
    local icon = Instance.new("ImageLabel")
    icon.BackgroundTransparency = 1
    icon.Image = id
    icon.Size = UDim2.new(1, 0, 1, 0)
    return icon
end

-- UI Module
local UI = {}
UI.Keys = {
    MainTitle = "FSSHUB Official",
    MainDesc = "SECURITY GATEWAY"
}

-- Internal State
local gui, backdrop, blur, container, keyInput, verifyButton, getLinkButton, inputSection, iconGradient
local validateCallback = nil
local keyLink = nil

function UI.Initialize(options)
    options = options or {}
    keyLink = options.KeyLink
    validateCallback = options.Function
    
    -- Create UI
    gui = Instance.new("ScreenGui")
    gui.Name = "KeyVerificationUI"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.IgnoreGuiInset = true
    
    if syn and syn.protect_gui then
        syn.protect_gui(gui)
    elseif gethui then
        gui.Parent = gethui()
    elseif game:GetService("CoreGui") then
        gui.Parent = game:GetService("CoreGui")
    else
        gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    end
    
    backdrop = Instance.new("Frame")
    backdrop.Name = "Backdrop"
    backdrop.Size = UDim2.new(1, 0, 1, 0)
    backdrop.BackgroundColor3 = Colors.background
    backdrop.BackgroundTransparency = 0.3
    backdrop.Parent = gui
    
    blur = Instance.new("BlurEffect")
    blur.Size = 15
    blur.Parent = Lighting

    local mainCentering = Instance.new("Frame")
    mainCentering.Size = UDim2.new(1, 0, 1, 0)
    mainCentering.BackgroundTransparency = 1
    mainCentering.Parent = gui
    
    container = Instance.new("CanvasGroup")
    container.Name = "Container"
    container.Size = UDim2.new(0, 420, 0, 260)
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundColor3 = Colors.surface
    container.BackgroundTransparency = 0.1
    container.GroupTransparency = 1 -- Start transparent for animation
    container.Parent = mainCentering
    
    local aspectRatio = Instance.new("UIAspectRatioConstraint")
    aspectRatio.AspectRatio = 1.5
    aspectRatio.Parent = container
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = container
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Colors.borderLight
    stroke.Thickness = 1
    stroke.Transparency = 0.5
    stroke.Parent = container
    
    TweenService:Create(stroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Color = Colors.primary,
        Transparency = 0.2
    }):Play()
    
    local dropShadow = Instance.new("ImageLabel")
    dropShadow.Name = "Shadow"
    dropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    dropShadow.BackgroundTransparency = 1
    dropShadow.Position = UDim2.new(0.5, 0, 0.5, 10)
    dropShadow.Size = UDim2.new(1, 60, 1, 60)
    dropShadow.ZIndex = -1
    dropShadow.Image = "rbxassetid://6015897843"
    dropShadow.ImageColor3 = Color3.new(0, 0, 0)
    dropShadow.ImageTransparency = 0.4
    dropShadow.SliceCenter = Rect.new(47, 47, 450, 450)
    dropShadow.ScaleType = Enum.ScaleType.Slice
    dropShadow.SliceScale = 1
    dropShadow.Parent = container
    
    local glassOverlay = Instance.new("Frame")
    glassOverlay.Size = UDim2.new(1, 0, 0.6, 0)
    glassOverlay.BackgroundColor3 = Colors.glass
    glassOverlay.BackgroundTransparency = 0.96
    glassOverlay.BorderSizePixel = 0
    glassOverlay.Parent = container
    
    local glassGradient = Instance.new("UIGradient")
    glassGradient.Rotation = 90
    glassGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.8),
        NumberSequenceKeypoint.new(1, 1)
    })
    glassGradient.Parent = glassOverlay
    
    -- Top Bar
    local topBar = Instance.new("Frame")
    topBar.Name = "TopBar"
    topBar.Size = UDim2.new(1, 0, 0, 36)
    topBar.BackgroundColor3 = Colors.surfaceLight
    topBar.BackgroundTransparency = 0.8
    topBar.BorderSizePixel = 0
    topBar.Parent = container

    local iconContainer = Instance.new("Frame")
    iconContainer.Size = UDim2.new(0, 32, 0, 32)
    iconContainer.Position = UDim2.new(0, 12, 0.5, 0)
    iconContainer.AnchorPoint = Vector2.new(0, 0.5)
    iconContainer.BackgroundTransparency = 1
    iconContainer.Parent = topBar
    
    local mainIcon = createIconImage(IconAssets.shield)
    mainIcon.Size = UDim2.new(1, -8, 1, -8)
    mainIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    mainIcon.Parent = iconContainer
    
    iconGradient = Instance.new("UIGradient")
    iconGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Colors.primary),
        ColorSequenceKeypoint.new(1, Colors.neonBlue)
    })
    iconGradient.Rotation = 45
    iconGradient.Parent = mainIcon
    
    local titleText = Instance.new("TextLabel")
    titleText.Text = UI.Keys.MainTitle
    titleText.TextColor3 = Colors.textPrimary
    titleText.Font = Enum.Font.GothamBold
    titleText.TextSize = 14
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.BackgroundTransparency = 1
    titleText.Size = UDim2.new(1, -50, 0, 16)
    titleText.Position = UDim2.new(0, 50, 0.5, -7)
    titleText.Parent = topBar
    
    local subtitleText = Instance.new("TextLabel")
    subtitleText.Text = UI.Keys.MainDesc
    subtitleText.TextColor3 = Colors.primary
    subtitleText.Font = Enum.Font.GothamMedium
    subtitleText.TextSize = 10
    subtitleText.TextTransparency = 0.4
    subtitleText.TextXAlignment = Enum.TextXAlignment.Left
    subtitleText.BackgroundTransparency = 1
    subtitleText.Size = UDim2.new(1, -50, 0, 12)
    subtitleText.Position = UDim2.new(0, 50, 0.5, 7)
    subtitleText.Parent = topBar
    
    local closeButton = Instance.new("ImageButton")
    closeButton.Size = UDim2.new(0, 36, 0, 36)
    closeButton.Position = UDim2.new(1, 0, 0, 0)
    closeButton.AnchorPoint = Vector2.new(1, 0)
    closeButton.BackgroundTransparency = 1
    closeButton.Image = IconAssets.x
    closeButton.ImageColor3 = Colors.textSecondary
    closeButton.ImageTransparency = 0.4
    closeButton.ScaleType = Enum.ScaleType.Fit
    closeButton.Parent = topBar
    closeButton.MouseButton1Click:Connect(function()
        UI.Close()
    end)
    
    -- Input Section
    inputSection = Instance.new("Frame")
    inputSection.Size = UDim2.new(1, -40, 1, -70)
    inputSection.Position = UDim2.new(0.5, 0, 0.5, 18)
    inputSection.AnchorPoint = Vector2.new(0.5, 0.5)
    inputSection.BackgroundTransparency = 1
    inputSection.Parent = container
    
    local keyInputContainer = Instance.new("Frame")
    keyInputContainer.Size = UDim2.new(1, 0, 0, 38)
    keyInputContainer.BackgroundColor3 = Colors.surfaceLight
    keyInputContainer.BackgroundTransparency = 0.5
    keyInputContainer.Parent = inputSection
    
    local keyCorner = Instance.new("UICorner")
    keyCorner.CornerRadius = UDim.new(0, 8)
    keyCorner.Parent = keyInputContainer
    
    local keyStroke = Instance.new("UIStroke")
    keyStroke.Color = Colors.borderLight
    keyStroke.Thickness = 1
    keyStroke.Transparency = 0.5
    keyStroke.Parent = keyInputContainer
    
    local inputIcon = createIconImage(IconAssets.key)
    inputIcon.Size = UDim2.new(0, 16, 0, 16)
    inputIcon.Position = UDim2.new(0, 12, 0.5, 0)
    inputIcon.AnchorPoint = Vector2.new(0, 0.5)
    inputIcon.ImageColor3 = Colors.textSecondary
    inputIcon.ImageTransparency = 0.2
    inputIcon.Parent = keyInputContainer
    
    keyInput = Instance.new("TextBox")
    keyInput.Size = UDim2.new(1, -40, 1, 0)
    keyInput.Position = UDim2.new(0, 36, 0, 0)
    keyInput.BackgroundTransparency = 1
    keyInput.Font = Enum.Font.Gotham
    keyInput.PlaceholderText = "Enter key here..."
    keyInput.Text = ""
    keyInput.TextColor3 = Colors.textPrimary
    keyInput.PlaceholderColor3 = Colors.textMuted
    keyInput.TextSize = 14
    keyInput.TextXAlignment = Enum.TextXAlignment.Left
    keyInput.ClearTextOnFocus = false
    keyInput.Parent = keyInputContainer
    
    -- Buttons
    local buttonSection = Instance.new("Frame")
    buttonSection.Size = UDim2.new(1, 0, 0, 32)
    buttonSection.Position = UDim2.new(0, 0, 0, 48)
    buttonSection.BackgroundTransparency = 1
    buttonSection.Parent = inputSection
    
    local gridLayout = Instance.new("UIGridLayout")
    gridLayout.CellPadding = UDim2.new(0, 10, 0, 0)
    gridLayout.CellSize = UDim2.new(0.5, -5, 1, 0)
    gridLayout.FillDirection = Enum.FillDirection.Horizontal
    gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    gridLayout.Parent = buttonSection
    
    local function createButton(name, text, primary, iconId)
        local button = Instance.new("TextButton")
        button.Name = name
        button.BackgroundColor3 = primary and Colors.primary or Colors.surfaceLight
        button.BackgroundTransparency = primary and 0.1 or 0.5
        button.Text = ""
        button.AutoButtonColor = false
        
        local bCorner = Instance.new("UICorner")
        bCorner.CornerRadius = UDim.new(0, 8)
        bCorner.Parent = button
        
        local bStroke = Instance.new("UIStroke")
        bStroke.Color = primary and Colors.primaryDark or Colors.borderLight
        bStroke.Transparency = 0.5
        bStroke.Parent = button
        
        local content = Instance.new("Frame")
        content.Name = "Content"
        content.Size = UDim2.new(1, 0, 1, 0)
        content.BackgroundTransparency = 1
        content.Parent = button
        
        local layout = Instance.new("UIListLayout")
        layout.FillDirection = Enum.FillDirection.Horizontal
        layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        layout.VerticalAlignment = Enum.VerticalAlignment.Center
        layout.Padding = UDim.new(0, 8)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Parent = content
        
        if iconId then
            local icon = createIconImage(iconId)
            icon.Size = UDim2.new(0, 14, 0, 14)
            icon.ImageColor3 = primary and Colors.textPrimary or Colors.textSecondary
            icon.LayoutOrder = 1
            icon.Parent = content
        end
        
        local label = Instance.new("TextLabel")
        label.Text = text
        label.Font = Enum.Font.GothamBold
        label.TextSize = 13
        label.TextColor3 = primary and Colors.textPrimary or Colors.textSecondary
        label.BackgroundTransparency = 1
        label.AutomaticSize = Enum.AutomaticSize.XY
        label.LayoutOrder = 2
        label.Parent = content
        
        return button
    end
    
    getLinkButton = createButton("GetLink", "Get Link", false, IconAssets.link)
    getLinkButton.LayoutOrder = 1
    getLinkButton.Parent = buttonSection
    getLinkButton.MouseButton1Click:Connect(function()
        if keyLink then
            if setclipboard then
                setclipboard(keyLink)
                UI.ShowStatus("Link copied!", Colors.success, 3)
            else
                UI.ShowStatus("Link: " .. keyLink, Colors.primary, 10)
            end
        else
            UI.ShowStatus("No key link available", Colors.error, 3)
        end
    end)
    
    verifyButton = createButton("Verify", "Verify Key", true, IconAssets.key)
    verifyButton.LayoutOrder = 2
    verifyButton.Parent = buttonSection
    verifyButton.MouseButton1Click:Connect(function()
        local key = keyInput.Text:gsub("%s+", "")
        if key == "" then
            UI.ShowStatus("Please enter a key", Colors.error, 3)
            UI.ShakeInput()
            return
        end
        if validateCallback then
            validateCallback(key)
        end
    end)
    
    -- Enter to verify
    keyInput.FocusLost:Connect(function(enter)
        if enter then
            local key = keyInput.Text:gsub("%s+", "")
            if key ~= "" and validateCallback then
                validateCallback(key)
            end
        end
    end)
    
    -- Animations
    UI.SetupAnimations()
    UI.AnimateEntrance()
end

function UI.ShowStatus(text, color, resetTime)
    local label = Instance.new("TextLabel")
    label.Text = text
    label.TextColor3 = color
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 12
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Position = UDim2.new(0, 0, 1, -25)
    label.BackgroundTransparency = 1
    label.TextTransparency = 1
    label.Parent = container
    
    TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    
    if resetTime > 0 then
        task.delay(resetTime, function()
            if label.Parent then
                TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
                task.wait(0.3)
                label:Destroy()
            end
        end)
    end
end

function UI.ShowError(msg)
    UI.ShowStatus(msg, Colors.error, 5)
    UI.ShakeInput()
end

function UI.ShakeInput()
    local originalPos = UDim2.new(0.5, 0, 0.5, 20)
    local intensity = 5
    for i = 1, 6 do
        local offset = (i % 2 == 0 and -intensity or intensity)
        TweenService:Create(inputSection, TweenInfo.new(0.05), {Position = originalPos + UDim2.new(0, offset, 0, 0)}):Play()
        task.wait(0.05)
    end
    TweenService:Create(inputSection, TweenInfo.new(0.05), {Position = originalPos}):Play()
end

function UI.Authorize()
    UI.ShowStatus("Key Verified!", Colors.success, 0)
    
    local statusBar = Instance.new("Frame")
    statusBar.Size = UDim2.new(1, 0, 0, 2)
    statusBar.Position = UDim2.new(0, 0, 1, 0)
    statusBar.AnchorPoint = Vector2.new(0, 1)
    statusBar.BackgroundColor3 = Colors.success
    statusBar.BorderSizePixel = 0
    statusBar.Parent = container
    
    local cover = Instance.new("Frame")
    cover.Size = UDim2.new(1, 0, 1, 0)
    cover.BackgroundColor3 = Colors.success
    cover.BackgroundTransparency = 1
    cover.Parent = container
    
    TweenService:Create(cover, TweenInfo.new(0.5), {BackgroundTransparency = 0.8}):Play()
    task.wait(0.5)
    TweenService:Create(cover, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    task.wait(0.5)
    cover:Destroy()
    
    -- Close UI after success animation
    task.delay(1, function()
        UI.Close()
    end)
end

function UI.Fail()
    UI.ShowStatus("Invalid Key", Colors.error, 3)
    UI.ShakeInput()
end

function UI.Close()
    if blur then blur:Destroy() end
    if gui then gui:Destroy() end
end

function UI.SetupAnimations()
    -- Icon Gradient Animation
    task.spawn(function()
        while gui and gui.Parent do
            local rotTween = TweenService:Create(iconGradient, TweenInfo.new(2, Enum.EasingStyle.Linear), {Rotation = 360 + 45})
            rotTween:Play()
            rotTween.Completed:Wait()
            iconGradient.Rotation = 45
        end
    end)
    
    -- Particles
    task.spawn(function()
        while gui and gui.Parent do
            local p = Instance.new("Frame")
            p.BackgroundColor3 = Colors.primary
            p.BackgroundTransparency = 0.8
            p.BorderSizePixel = 0
            local size = math.random(2, 4)
            p.Size = UDim2.new(0, size, 0, size)
            p.Position = UDim2.new(math.random(), 0, 1, 10)
            p.Parent = container
            
            local duration = math.random(30, 60) / 10
            local tween = TweenService:Create(p, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
                Position = UDim2.new(math.random(), 0, -0.2, 0),
                BackgroundTransparency = 1
            })
            tween:Play()
            tween.Completed:Connect(function() p:Destroy() end)
            task.wait(0.5)
        end
    end)
end

function UI.AnimateEntrance()
    container.Size = UDim2.new(0, 400, 0, 240)
    container.GroupTransparency = 1
    backdrop.BackgroundTransparency = 1
    
    TweenService:Create(container, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 420, 0, 260),
        GroupTransparency = 0
    }):Play()
    
    TweenService:Create(backdrop, TweenInfo.new(0.4), {BackgroundTransparency = 0.3}):Play()
end

return UI
