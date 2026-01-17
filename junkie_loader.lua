--[[
    FSSHUB Loader - Junkie CDN Ready

    This file is designed to be:
    1. Obfuscated with Luraph/Prometheus
    2. Uploaded to Junkie Dev Dashboard (UI-Source field)

    Flow:
    1. Load Junkie SDK (external - required)
    2. Show KeySystem UI (bundled inline)
    3. Validate key with Junkie SDK
    4. On success -> Fetch payload from Worker

    Generated: 2026-01-16T10:20:55.112Z
]]

-- =====================================================
-- JUNKIE SDK LOADER (External - Cannot Bundle)
-- =====================================================
local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "FSSHUB Official"
Junkie.identifier = "1000139"
Junkie.provider = "FSSHUB - KEY SYSTEM"

-- =====================================================
-- HWID GENERATION
-- =====================================================
local function generateHWID()
    local hardwareId = nil
    pcall(function()
        if gethwid then
            hardwareId = gethwid()
        elseif get_hwid then
            hardwareId = get_hwid()
        end
    end)

    if hardwareId and #hardwareId > 0 then
        return hardwareId
    end

    -- Fallback
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local userId = tostring(LocalPlayer and LocalPlayer.UserId or "0")
    local executorName = "unknown"

    pcall(function()
        if getexecutorname then
            executorName = getexecutorname()
        elseif identifyexecutor then
            executorName = identifyexecutor()
        end
    end)

    return executorName .. "_" .. userId
end

local HWID = generateHWID()

-- =====================================================
-- CONFIGURATION
-- =====================================================
local WorkerUrl = "https://script.fsshub-services.workers.dev"
local LogoAsset = "rbxthumb://type=Asset&id=120860566854298&w=420&h=420"
local LogoSize = UDim2.new(0, 80, 0, 80)

-- =====================================================
-- KEY SYSTEM UI (Bundled Inline)
-- =====================================================
local KeySystemUI = (function()
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local CoreGui = game:GetService("CoreGui")

    local UI = {}

    -- FSS Purple Theme (Matches Logo)
    local Colors = {
        Background = Color3.fromRGB(15, 15, 20),    -- Deep Dark
        MainStroke = Color3.fromRGB(140, 120, 210), -- Lighter Purple for contrast
        Accent = Color3.fromRGB(127, 106, 196),     -- Purple
        Secondary = Color3.fromRGB(160, 140, 230),  -- Light Purple
        Error = Color3.fromRGB(255, 80, 100),       -- Soft Red
        Success = Color3.fromRGB(50, 255, 120),     -- Neon Green
        Info = Color3.fromRGB(0, 200, 255),         -- Neon Blue
        TextLight = Color3.fromRGB(240, 240, 255),
        TextDim = Color3.fromRGB(140, 140, 170),
        InputBg = Color3.fromRGB(20, 20, 30),
        ButtonBg = Color3.fromRGB(30, 25, 45)
    }
    UI.Colors = Colors

    UI.Keys = {
        MainTitle = "FSSHUB",
        MainDesc = "KEYSYSTEM GATEWAY",
        Assets = {
            Logo = { ID = nil, Size = UDim2.new(0, 80, 0, 80) }
        },
        Directory = "FSSHUB" -- Save folder
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
                local targetColor = finalStats.TextColor3 or Colors.TextLight
                label.TextColor3 = (i % 2 == 0) and Colors.TextLight or targetColor
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

        -- Cleanup Lazy Loader if present
        local lazy = CoreGui:FindFirstChild("FSSHUB_Lazy_Loader") or
            (gethui and gethui():FindFirstChild("FSSHUB_Lazy_Loader"))
        if lazy then lazy:Destroy() end

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
        TweenService:Create(blur, TweenInfo.new(0.5), { Size = 20 }):Play()

        -- Determine container size based on logo
        local hasLogo = UI.Keys.Assets and UI.Keys.Assets.Logo and UI.Keys.Assets.Logo.ID
        local containerHeight = hasLogo and 340 or 280

        -- Main Container
        container = Instance.new("Frame")
        container.Name = "MainContainer"
        container.Size = UDim2.new(0, 400, 0, containerHeight)
        container.Position = UDim2.new(0.5, 0, 0.5, 0)
        container.AnchorPoint = Vector2.new(0.5, 0.5)
        container.BackgroundColor3 = Colors.Background
        container.BorderSizePixel = 0
        container.BackgroundTransparency = 0.4 -- Thinner Glass Effect
        container.Parent = gui
        container.ClipsDescendants = true

        -- Rounded Corners for Container
        local containerCorner = Instance.new("UICorner")
        containerCorner.CornerRadius = UDim.new(0, 12)
        containerCorner.Parent = container

        -- Main Gradient
        local mainGradient = Instance.new("UIGradient")
        mainGradient.Rotation = 45
        mainGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 25)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 15))
        })
        mainGradient.Parent = container

        -- Neon Stroke around Container
        local mainStroke = addNeonStroke(container, Colors.MainStroke, 2)

        -- Stroke Gradient (Professional Look)
        local strokeGradient = Instance.new("UIGradient")
        strokeGradient.Rotation = 45
        strokeGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Colors.Secondary),
            ColorSequenceKeypoint.new(0.5, Colors.Accent),
            ColorSequenceKeypoint.new(1, Colors.Secondary)
        })
        strokeGradient.Parent = mainStroke

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
            local particleColors = { Colors.Accent, Colors.Secondary, Color3.fromRGB(150, 50, 255), Color3.fromRGB(255,
                255, 255) }
            while gui and gui.Parent do
                if not galaxyContainer.Parent then break end -- Safety check
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

                    TweenService:Create(particle,
                        TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            Position = endPos,
                            BackgroundTransparency = 1
                        }):Play()

                    task.delay(duration, function() particle:Destroy() end)
                end
                task.wait(0.05)
            end
        end)

        -- Static Inner Highlight (Glassy Glow)
        local highlight = Instance.new("Frame")
        highlight.Name = "InnerHighlight"
        highlight.Size = UDim2.new(1, 0, 1, 0)
        highlight.BackgroundTransparency = 1
        highlight.Parent = container

        local highlightCorner = Instance.new("UICorner")
        highlightCorner.CornerRadius = UDim.new(0, 12)
        highlightCorner.Parent = highlight

        local highlightStroke = Instance.new("UIStroke")
        highlightStroke.Thickness = 1.5
        highlightStroke.Transparency = 0.5
        highlightStroke.Color = Colors.TextLight
        highlightStroke.Parent = highlight

        local highlightGrad = Instance.new("UIGradient")
        highlightGrad.Rotation = 90
        highlightGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 150, 150)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 50))
        })
        highlightGrad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.4),
            NumberSequenceKeypoint.new(0.5, 0.8),
            NumberSequenceKeypoint.new(1, 1)
        })
        highlightGrad.Parent = highlightStroke

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

        -- Logo Image (with round corners)
        local logoImage = nil
        local logoYOffset = 25

        if UI.Keys.Assets and UI.Keys.Assets.Logo and UI.Keys.Assets.Logo.ID then
            logoImage = Instance.new("ImageLabel")
            logoImage.Image = UI.Keys.Assets.Logo.ID
            logoImage.Size = UI.Keys.Assets.Logo.Size or UDim2.new(0, 80, 0, 80)
            logoImage.Position = UDim2.new(0.5, 0, 0, 20)
            logoImage.AnchorPoint = Vector2.new(0.5, 0)
            logoImage.BackgroundTransparency = 1
            logoImage.ImageTransparency = 1 -- Start invisible
            logoImage.ZIndex = 5            -- Ensure it is on top
            logoImage.Parent = container

            -- Round corners for logo
            local logoCorner = Instance.new("UICorner")
            logoCorner.CornerRadius = UDim.new(0, 12)
            logoCorner.Parent = logoImage

            logoYOffset = 110 -- Adjust text position if logo exists
        end

        -- Logo Text / Header
        local logoLabel = Instance.new("TextLabel")
        logoLabel.Text = UI.Keys.MainTitle or "FSSHUB"
        logoLabel.Font = Enum.Font.GothamBold
        logoLabel.TextSize = 28
        logoLabel.TextColor3 = Colors.Accent
        logoLabel.Size = UDim2.new(1, 0, 0, 30)
        logoLabel.Position = UDim2.new(0, 0, 0, logoImage and 105 or 30)
        logoLabel.BackgroundTransparency = 1
        logoLabel.TextTransparency = 1 -- Start invisible
        logoLabel.Parent = container

        -- Subheader
        local subLabel = Instance.new("TextLabel")
        subLabel.Text = UI.Keys.MainDesc or "KEYSYSTEM GATEWAY"
        subLabel.Font = Enum.Font.Gotham
        subLabel.TextSize = 12
        subLabel.TextColor3 = Colors.TextDim
        subLabel.Size = UDim2.new(1, 0, 0, 20)
        subLabel.Position = UDim2.new(0, 0, 0, logoImage and 135 or 60)
        subLabel.BackgroundTransparency = 1
        subLabel.TextTransparency = 1 -- Start invisible
        subLabel.Name = "SubLabel"
        subLabel.Parent = container

        -- Greeting
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local greetingLabel = Instance.new("TextLabel")
        greetingLabel.Text = "Welcome, @" .. (LocalPlayer and LocalPlayer.Name or "User")
        greetingLabel.Font = Enum.Font.GothamMedium
        greetingLabel.TextSize = 13
        greetingLabel.TextColor3 = Colors.Accent
        greetingLabel.Size = UDim2.new(1, 0, 0, 20)
        greetingLabel.Position = UDim2.new(0, 0, 0, logoImage and 155 or 85)
        greetingLabel.BackgroundTransparency = 1
        greetingLabel.TextTransparency = 1 -- Start invisible
        greetingLabel.Name = "GreetingLabel"
        greetingLabel.Parent = container

        -- Input Field (position adjusted for logo)
        local inputYPos = logoImage and 195 or 125
        inputSection = Instance.new("Frame")
        inputSection.Size = UDim2.new(0.85, 0, 0, 42)
        inputSection.Position = UDim2.new(0.5, 0, 0, inputYPos)
        inputSection.AnchorPoint = Vector2.new(0.5, 0)
        inputSection.BackgroundColor3 = Colors.InputBg
        inputSection.BackgroundTransparency = 0.5 -- More transparent
        inputSection.Parent = container
        inputSection.Name = "InputFrame"
        inputSection.Visible = false -- Start hidden

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
        keyInput.PlaceholderText = "INPUT_KEY_HERE"
        keyInput.PlaceholderColor3 = Color3.fromRGB(60, 80, 80)
        keyInput.TextColor3 = Colors.Secondary
        keyInput.TextSize = 14
        keyInput.Parent = inputSection

        -- Button Creator
        local function createCyberButton(text, pos, isPrimary, action)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0.35, 0, 0, 35)
            btn.AnchorPoint = Vector2.new(0.5, 0)
            btn.Position = pos
            btn.BackgroundColor3 = Colors.ButtonBg
            btn.BackgroundTransparency = 0.3 -- Semi-transparent
            btn.Text = text
            btn.Font = Enum.Font.GothamBold  -- Professional font
            btn.TextColor3 = isPrimary and Colors.Accent or Colors.TextDim
            btn.TextSize = 14
            btn.Parent = container
            btn.Visible = false -- Start hidden

            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 8)
            btnCorner.Parent = btn

            local stroke = addNeonStroke(btn, isPrimary and Colors.Accent or Colors.TextDim, 1)

            -- Hover Glitch Effect
            btn.MouseEnter:Connect(function()
                TweenService:Create(stroke, TweenInfo.new(0.2),
                    { Color = isPrimary and Colors.Secondary or Colors.TextLight }):Play()
                btn.TextColor3 = isPrimary and Colors.Secondary or Colors.TextLight
                btn.Position = pos + UDim2.new(0, math.random(-2, 2), 0, math.random(-2, 2))
                task.delay(0.05, function() btn.Position = pos end)
            end)

            btn.MouseLeave:Connect(function()
                TweenService:Create(stroke, TweenInfo.new(0.2), { Color = isPrimary and Colors.Accent or Colors.TextDim })
                    :Play()
                btn.TextColor3 = isPrimary and Colors.Accent or Colors.TextDim
            end)

            btn.MouseButton1Click:Connect(function()
                action()
                local flash = Instance.new("Frame")
                flash.Size = UDim2.new(1, 0, 1, 0)
                flash.BackgroundColor3 = Colors.TextLight
                flash.BackgroundTransparency = 0.5
                flash.Parent = btn
                local flashCorner = Instance.new("UICorner")
                flashCorner.CornerRadius = UDim.new(0, 6)
                flashCorner.Parent = flash
                TweenService:Create(flash, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
                task.delay(0.2, function() flash:Destroy() end)
            end)
            return btn
        end

        -- Button positions adjusted for logo
        local buttonYPos = logoImage and 255 or 185

        local btnGet = createCyberButton("GET KEY", UDim2.new(0.28, 0, 0, buttonYPos), false, function()
            if setclipboard then
                setclipboard(keyLink)
                UI.ShowStatus("LINK_COPIED", Colors.Info)
            else
                UI.ShowStatus("LINK: " .. keyLink, Colors.Info)
            end
        end)
        btnGet.Name = "BtnGet"

        local btnVerify = createCyberButton("VERIFY", UDim2.new(0.72, 0, 0, buttonYPos), true, function()
            local input = keyInput.Text:gsub("%s+", "")
            if input == "" then
                UI.ShowStatus("NO_KEY_ENTERED", Colors.Error)
                return
            end
            if validateCallback then validateCallback(input) end
        end)
        btnVerify.Name = "BtnVerify"

        keyInput.FocusLost:Connect(function(enter)
            if enter then
                local input = keyInput.Text:gsub("%s+", "")
                if input ~= "" and validateCallback then validateCallback(input) end
            end
        end)

        -- "Loading" -> Immediate Show
        -- Start small, "Loading..." text
        container.Size = UDim2.new(0, 150, 0, 50)
        container.BackgroundTransparency = 0.05
        local loadLabel = Instance.new("TextLabel")
        loadLabel.Text = "INITIALIZING..."
        loadLabel.Font = Enum.Font.Code
        loadLabel.TextSize = 12
        loadLabel.TextColor3 = Colors.Secondary
        loadLabel.Size = UDim2.new(1, 0, 1, 0)
        loadLabel.BackgroundTransparency = 1
        loadLabel.Parent = container

        -- Expand to Full UI Sequence
        task.spawn(function()
            task.wait(0.4) -- Short fake load
            loadLabel:Destroy()

            -- Expansion
            local targetSize = UDim2.new(0, 400, 0, logoImage and 340 or 280)
            TweenService:Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                { Size = targetSize }):Play()
            task.wait(0.35)

            -- Fade Elements In
            if logoImage then
                TweenService:Create(logoImage, TweenInfo.new(0.3), { ImageTransparency = 0 }):Play()
            end
            TweenService:Create(logoLabel, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
            TweenService:Create(subLabel, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
            TweenService:Create(greetingLabel, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
            inputSection.Visible = true
            btnGet.Visible = true
            btnVerify.Visible = true

            -- Subtle pulse effect on logo text
            task.spawn(function()
                task.wait(0.2)
                glitchText(logoLabel, { Text = UI.Keys.MainTitle or "FSSHUB", TextColor3 = Colors.Accent })
            end)
        end)
    end

    function UI.ShowStatus(msg, color)
        -- Remove existing status if any
        local existing = container:FindFirstChild("StatusFrame")
        if existing then existing:Destroy() end

        local statusFrame = Instance.new("Frame")
        statusFrame.Name = "StatusFrame"
        statusFrame.Size = UDim2.new(0, 0, 0, 26) -- Start width 0 for animation
        statusFrame.Position = UDim2.new(0.5, 0, 1, -12)
        statusFrame.AnchorPoint = Vector2.new(0.5, 1)
        statusFrame.BackgroundColor3 = Colors.InputBg
        statusFrame.BackgroundTransparency = 0.3
        statusFrame.BorderSizePixel = 0
        statusFrame.Parent = container

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = statusFrame

        local stroke = Instance.new("UIStroke")
        stroke.Color = color
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Transparency = 0
        stroke.Parent = statusFrame

        local label = Instance.new("TextLabel")
        label.Text = string.upper(msg)
        label.TextColor3 = color
        label.Font = Enum.Font.GothamMedium
        label.TextSize = 12
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextTransparency = 1 -- Start hidden
        label.Parent = statusFrame

        -- Animate In
        local tweenSize = TweenService:Create(statusFrame,
            TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0.9, 0, 0, 26) })
        tweenSize:Play()

        task.delay(0.2, function()
            TweenService:Create(label, TweenInfo.new(0.2), { TextTransparency = 0 }):Play()
            glitchText(label, { Text = string.upper(msg), TextColor3 = color })
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

    function UI.ShowError(msg)
        UI.ShowStatus(msg, Colors.Error)
        -- Shake Container
        local orig = UDim2.new(0.5, 0, 0.5, 0)
        for i = 1, 6 do
            container.Position = orig + UDim2.new(0, math.random(-5, 5), 0, math.random(-5, 5))
            task.wait(0.04)
        end
        container.Position = orig
    end

    function UI.Authorize()
        UI.ShowStatus("ACCESS_GRANTED... AUTHENTICATING", Colors.Success)
        -- Removed auto-close to allow loading process to show
    end

    function UI.Fail()
        UI.ShowError("ACCESS_DENIED: INVALID_KEY")
    end

    -- =====================================================
    -- LOADING PANEL (Progress UI)
    -- =====================================================
    local loadingPanel = {}
    local progressBar, progressFill, statusLabel, logLabel, pulseOverlay
    local currentProgress = 0

    function UI.ShowLoadingPanel()
        -- Canvas Clearing: Destroy input elements to prevent overlap
        local elementsToClear = { "InputFrame", "BtnGet", "BtnVerify", "GreetingLabel", "SubLabel" }
        for _, name in ipairs(elementsToClear) do
            local el = container:FindFirstChild(name)
            if el then el:Destroy() end
        end

        -- Also clean up any other buttons except Close (X)
        for _, child in ipairs(container:GetChildren()) do
            if child:IsA("TextButton") and child.Text ~= "X" then child:Destroy() end
        end

        -- Remove status frame if present
        local existing = container:FindFirstChild("StatusFrame")
        if existing then existing:Destroy() end

        -- Loading Panel Container (overlay on existing container)
        loadingPanel = Instance.new("Frame")
        loadingPanel.Name = "LoadingPanel"
        loadingPanel.Size = UDim2.new(1, -40, 0, 180)
        loadingPanel.Position = UDim2.new(0.5, 0, 0.5, 20)
        loadingPanel.AnchorPoint = Vector2.new(0.5, 0.5)
        loadingPanel.BackgroundTransparency = 1
        loadingPanel.Parent = container

        -- Status Label (current task name)
        statusLabel = Instance.new("TextLabel")
        statusLabel.Name = "StatusLabel"
        statusLabel.Text = "INITIALIZING..."
        statusLabel.Font = Enum.Font.Code
        statusLabel.TextSize = 14
        statusLabel.TextColor3 = Colors.Secondary
        statusLabel.Size = UDim2.new(1, 0, 0, 20)
        statusLabel.Position = UDim2.new(0, 0, 0, 0)
        statusLabel.BackgroundTransparency = 1
        statusLabel.TextXAlignment = Enum.TextXAlignment.Left
        statusLabel.Parent = loadingPanel

        -- Progress Bar Background
        progressBar = Instance.new("Frame")
        progressBar.Name = "ProgressBar"
        progressBar.Size = UDim2.new(1, 0, 0, 8)
        progressBar.Position = UDim2.new(0, 0, 0, 28)
        progressBar.BackgroundColor3 = Colors.InputBg
        progressBar.BorderSizePixel = 0
        progressBar.Parent = loadingPanel

        local progressCorner = Instance.new("UICorner")
        progressCorner.CornerRadius = UDim.new(0, 4)
        progressCorner.Parent = progressBar

        addNeonStroke(progressBar, Colors.TextDim, 1)

        -- Progress Bar Fill
        progressFill = Instance.new("Frame")
        progressFill.Name = "ProgressFill"
        progressFill.Size = UDim2.new(0, 0, 1, 0)
        progressFill.BackgroundColor3 = Colors.Accent
        progressFill.BorderSizePixel = 0
        progressFill.Parent = progressBar

        local fillCorner = Instance.new("UICorner")
        fillCorner.CornerRadius = UDim.new(0, 4)
        fillCorner.Parent = progressFill

        -- Gradient on fill
        local fillGradient = Instance.new("UIGradient")
        fillGradient.Rotation = 0
        fillGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Colors.Secondary),
            ColorSequenceKeypoint.new(0.5, Colors.Accent),
            ColorSequenceKeypoint.new(1, Colors.Secondary)
        })
        fillGradient.Parent = progressFill

        -- Pulse overlay for slow operations
        pulseOverlay = Instance.new("Frame")
        pulseOverlay.Name = "PulseOverlay"
        pulseOverlay.Size = UDim2.new(0.1, 0, 1, 0)
        pulseOverlay.Position = UDim2.new(0, 0, 0, 0)
        pulseOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        pulseOverlay.BackgroundTransparency = 0.7
        pulseOverlay.BorderSizePixel = 0
        pulseOverlay.Visible = false
        pulseOverlay.Parent = progressFill

        local pulseCorner = Instance.new("UICorner")
        pulseCorner.CornerRadius = UDim.new(0, 4)
        pulseCorner.Parent = pulseOverlay

        -- Percentage Label
        local percentLabel = Instance.new("TextLabel")
        percentLabel.Name = "PercentLabel"
        percentLabel.Text = "0%"
        percentLabel.Font = Enum.Font.Code
        percentLabel.TextSize = 11
        percentLabel.TextColor3 = Colors.TextDim
        percentLabel.Size = UDim2.new(1, 0, 0, 16)
        percentLabel.Position = UDim2.new(0, 0, 0, 40)
        percentLabel.BackgroundTransparency = 1
        percentLabel.TextXAlignment = Enum.TextXAlignment.Right
        percentLabel.Parent = loadingPanel

        -- Log Display Frame
        local logFrame = Instance.new("Frame")
        logFrame.Name = "LogFrame"
        logFrame.Size = UDim2.new(1, 0, 0, 80)
        logFrame.Position = UDim2.new(0, 0, 0, 60)
        logFrame.BackgroundColor3 = Colors.InputBg
        logFrame.BackgroundTransparency = 0.5
        logFrame.BorderSizePixel = 0
        logFrame.ClipsDescendants = true
        logFrame.Parent = loadingPanel

        local logCorner = Instance.new("UICorner")
        logCorner.CornerRadius = UDim.new(0, 6)
        logCorner.Parent = logFrame

        addNeonStroke(logFrame, Colors.TextDim, 1)

        -- Log Label (scrolling text)
        logLabel = Instance.new("TextLabel")
        logLabel.Name = "LogLabel"
        logLabel.Text = ""
        logLabel.Font = Enum.Font.Code
        logLabel.TextSize = 10
        logLabel.TextColor3 = Colors.TextDim
        logLabel.Size = UDim2.new(1, -10, 1, -10)
        logLabel.Position = UDim2.new(0, 5, 0, 5)
        logLabel.BackgroundTransparency = 1
        logLabel.TextXAlignment = Enum.TextXAlignment.Left
        logLabel.TextYAlignment = Enum.TextYAlignment.Bottom
        logLabel.TextWrapped = true
        logLabel.Parent = logFrame

        -- Total time label (hidden until complete)
        local totalTimeLabel = Instance.new("TextLabel")
        totalTimeLabel.Name = "TotalTimeLabel"
        totalTimeLabel.Text = ""
        totalTimeLabel.Font = Enum.Font.Code
        totalTimeLabel.TextSize = 12
        totalTimeLabel.TextColor3 = Colors.Success
        totalTimeLabel.Size = UDim2.new(1, 0, 0, 20)
        totalTimeLabel.Position = UDim2.new(0, 0, 0, 150)
        totalTimeLabel.BackgroundTransparency = 1
        totalTimeLabel.Parent = loadingPanel

        currentProgress = 0
    end

    function UI.UpdateProgress(taskName, progress, taskTime)
        if not loadingPanel or not loadingPanel.Parent then return end

        -- Update status with glitch effect
        if statusLabel then
            glitchText(statusLabel, { Text = taskName:upper(), TextColor3 = Colors.Secondary })
        end

        -- Tween progress bar
        if progressFill then
            local targetSize = UDim2.new(progress / 100, 0, 1, 0)
            TweenService:Create(progressFill, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                { Size = targetSize }):Play()
        end

        -- Update percentage
        local percentLabel = loadingPanel:FindFirstChild("PercentLabel")
        if percentLabel then
            percentLabel.Text = math.floor(progress) .. "%"
        end

        -- Append to log
        if logLabel and taskTime then
            local logEntry = string.format("[%s] Done in %.2fs", taskName, taskTime)
            local currentLog = logLabel.Text
            local lines = {}
            for line in currentLog:gmatch("[^\n]+") do
                table.insert(lines, line)
            end
            table.insert(lines, logEntry)
            -- Keep only last 6 lines
            while #lines > 6 do
                table.remove(lines, 1)
            end
            logLabel.Text = table.concat(lines, "\n")
        end

        currentProgress = progress
    end

    function UI.StartPulseAnimation()
        if not pulseOverlay then return end
        pulseOverlay.Visible = true

        task.spawn(function()
            while pulseOverlay and pulseOverlay.Visible and pulseOverlay.Parent do
                pulseOverlay.Position = UDim2.new(0, 0, 0, 0)
                local tween = TweenService:Create(pulseOverlay,
                    TweenInfo.new(1, Enum.EasingStyle.Linear),
                    { Position = UDim2.new(0.9, 0, 0, 0) })
                tween:Play()
                tween.Completed:Wait()
            end
        end)
    end

    function UI.StopPulseAnimation()
        if pulseOverlay then
            pulseOverlay.Visible = false
        end
    end

    function UI.CompleteLoading(totalTime, updateUIFunc)
        -- Update via ShowLoadingMode's updateUI function if provided
        if updateUIFunc then
            updateUIFunc("LAUNCH READY", 100, string.format("Total load time: %.2fs", totalTime))
            return
        end

        if not loadingPanel or not loadingPanel.Parent then return end

        UI.StopPulseAnimation()

        -- Update to 100%
        if progressFill then
            TweenService:Create(progressFill, TweenInfo.new(0.3),
                { Size = UDim2.new(1, 0, 1, 0) }):Play()
        end

        local percentLabel = loadingPanel:FindFirstChild("PercentLabel")
        if percentLabel then
            percentLabel.Text = "100%"
            percentLabel.TextColor3 = Colors.Success
        end

        -- Show total time
        local totalTimeLabel = loadingPanel:FindFirstChild("TotalTimeLabel")
        if totalTimeLabel then
            totalTimeLabel.Text = string.format("TOTAL LOAD TIME: %.2fs", totalTime)
            glitchText(totalTimeLabel, { Text = totalTimeLabel.Text, TextColor3 = Colors.Success })
        end

        -- Update status
        if statusLabel then
            statusLabel.Text = "LAUNCH READY"
            statusLabel.TextColor3 = Colors.Success
        end
    end

    -- =====================================================
    -- LOADING MODE (Optimized UI Transition - Returns Update Function)
    -- =====================================================
    function UI.ShowLoadingMode()
        -- 1. Destroy Input Elements (Prevents overlap)
        local elementsToClear = { "InputFrame", "BtnGet", "BtnVerify" }
        for _, name in ipairs(elementsToClear) do
            local el = container:FindFirstChild(name)
            if el then el:Destroy() end
        end

        -- Also clean up any other buttons except Close (X)
        for _, child in ipairs(container:GetChildren()) do
            if child:IsA("TextButton") and child.Text ~= "X" then child:Destroy() end
        end

        -- Remove status frame if present
        local existing = container:FindFirstChild("StatusFrame")
        if existing then existing:Destroy() end

        -- 2. Transform SubHeader into real-time status
        local subLabel = container:FindFirstChild("SubLabel")
        if subLabel then
            subLabel.Text = "INITIALIZING..."
            subLabel.TextColor3 = Colors.Accent
        end

        -- 3. Create Progress Bar Container
        local barContainer = Instance.new("Frame")
        barContainer.Name = "ProgressBarContainer"
        barContainer.Size = UDim2.new(0.8, 0, 0, 6)
        barContainer.Position = UDim2.new(0.5, 0, 0, 210)
        barContainer.AnchorPoint = Vector2.new(0.5, 0)
        barContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        barContainer.BorderSizePixel = 0
        barContainer.Parent = container

        local barCorner = Instance.new("UICorner")
        barCorner.CornerRadius = UDim.new(0, 3)
        barCorner.Parent = barContainer

        local barFill = Instance.new("Frame")
        barFill.Name = "BarFill"
        barFill.Size = UDim2.new(0, 0, 1, 0)
        barFill.BackgroundColor3 = Colors.Success
        barFill.BorderSizePixel = 0
        barFill.Parent = barContainer

        local fillCorner = Instance.new("UICorner")
        fillCorner.CornerRadius = UDim.new(0, 3)
        fillCorner.Parent = barFill

        -- Gradient on fill
        local fillGradient = Instance.new("UIGradient")
        fillGradient.Rotation = 0
        fillGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Colors.Secondary),
            ColorSequenceKeypoint.new(0.5, Colors.Accent),
            ColorSequenceKeypoint.new(1, Colors.Secondary)
        })
        fillGradient.Parent = barFill

        -- 4. Create Log Container (ScrollingFrame)
        local logFrame = Instance.new("ScrollingFrame")
        logFrame.Name = "LogFrame"
        logFrame.Size = UDim2.new(0.85, 0, 0, 60)
        logFrame.Position = UDim2.new(0.5, 0, 0, 230)
        logFrame.AnchorPoint = Vector2.new(0.5, 0)
        logFrame.BackgroundTransparency = 1
        logFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        logFrame.ScrollBarThickness = 2
        logFrame.ScrollBarImageColor3 = Colors.TextDim
        logFrame.Parent = container

        local logList = Instance.new("UIListLayout")
        logList.SortOrder = Enum.SortOrder.LayoutOrder
        logList.Parent = logFrame

        -- Return update function
        return function(status, percent, logMsg)
            -- Update status label
            if subLabel then
                subLabel.Text = status:upper()
            end

            -- Tween progress bar
            TweenService:Create(barFill, TweenInfo.new(0.4, Enum.EasingStyle.Quad),
                { Size = UDim2.new(percent / 100, 0, 1, 0) }):Play()

            -- Add log entry if provided
            if logMsg then
                local logEntry = Instance.new("TextLabel")
                logEntry.Text = "> " .. logMsg
                logEntry.Font = Enum.Font.Code
                logEntry.TextSize = 10
                logEntry.TextColor3 = Colors.TextDim
                logEntry.Size = UDim2.new(1, 0, 0, 15)
                logEntry.BackgroundTransparency = 1
                logEntry.TextXAlignment = Enum.TextXAlignment.Left
                logEntry.Parent = logFrame

                -- Update canvas size for scroll
                logFrame.CanvasSize = UDim2.new(0, 0, 0, logList.AbsoluteContentSize.Y)
                logFrame.CanvasPosition = Vector2.new(0, logFrame.AbsoluteCanvasSize.Y)
            end
        end
    end

    function UI.Close()
        if blur then TweenService:Create(blur, TweenInfo.new(0.3), { Size = 0 }):Play() end
        if container then
            -- Shrink to center
            local tween = TweenService:Create(container,
                TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
                { Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1 })
            tween:Play()
            tween.Completed:Wait()
        end
        if gui then gui:Destroy() end
        if blur then blur:Destroy() end
    end

    return UI
end)()

-- =====================================================
-- CONFIGURE UI
-- =====================================================
KeySystemUI.Keys.MainTitle = "FSSHUB"
KeySystemUI.Keys.MainDesc = "KeySystem Gateway"

-- Logo Configuration (if UI supports it)
if KeySystemUI.Keys.Assets then
    KeySystemUI.Keys.Assets.Logo = {
        ID = LogoAsset,
        Size = LogoSize
    }
end

-- =====================================================
-- WORKER PAYLOAD FETCHER (with Progress Orchestration)
-- =====================================================
local cachedVersion = nil
local cachedPayload = nil

-- =====================================================
-- PERFORMANCE OPTIMIZATIONS
-- =====================================================
local prefetchedVersion = nil
local prefetchComplete = false
local cachedFluentLoader = nil
local fluentPrefetchComplete = false
local lastSuccessTime = 0
local VALIDATION_BYPASS_SECONDS = 1800 -- 30 minutes

-- Pre-fetch: Start version check immediately (while user types key)
task.spawn(function()
    local success, response = pcall(function()
        return game:HttpGet(WorkerUrl .. "/health")
    end)
    if success and response then
        prefetchedVersion = response:match('"version":"([^"]+)"') or response:match('version=([%w%.%-]+)')
        print("[FSSHUB] Pre-fetch complete: version = " .. tostring(prefetchedVersion))
    end
    prefetchComplete = true
end)

-- Pre-fetch: Start downloading Fluent UI Library immediately
task.spawn(function()
    local success, content = pcall(function()
        return game:HttpGet(
            "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/fluent_loader.lua?v=4.0.8")
    end)
    if success and content then
        cachedFluentLoader = content
        print("[FSSHUB] Pre-fetched Fluent UI Library")
    else
        warn("[FSSHUB] Failed to pre-fetch Fluent UI")
    end
    fluentPrefetchComplete = true
end)

-- Inject Asset Provider for Payload
if getgenv then
    getgenv().FSSHUB_GET_FLUENT = function(timeout)
        local start = tick()
        timeout = timeout or 10

        -- Wait for pre-fetch to complete if needed
        while not fluentPrefetchComplete do
            if tick() - start > timeout then break end
            game:GetService("RunService").Heartbeat:Wait()
        end

        if cachedFluentLoader then
            return loadstring(cachedFluentLoader)()
        end
        return nil
    end
end

-- Async workspace initialization (prepare cache folder early)
task.spawn(function()
    pcall(function()
        if makefolder and not isfolder("FSSHUB") then
            makefolder("FSSHUB")
            makefolder("FSSHUB/cache")
        end
    end)
end)

-- Check if we can bypass validation (recent successful run)
local function canBypassValidation()
    if lastSuccessTime > 0 then
        local elapsed = tick() - lastSuccessTime
        if elapsed < VALIDATION_BYPASS_SECONDS and cachedPayload then
            return true
        end
    end
    return false
end

-- Task helper functions
local function checkVersion()
    local success, response = pcall(function()
        return game:HttpGet(WorkerUrl .. "/health")
    end)
    if success and response then
        -- Try to parse version from response
        local serverVersion = response:match('"version":"([^"]+)"') or response:match('version=([%w%.%-]+)')
        return serverVersion, true
    end
    return nil, false
end

local function checkCache(serverVersion)
    -- Smart caching: check if we have a cached version
    if cachedVersion and cachedPayload and cachedVersion == serverVersion then
        return true, cachedPayload
    end
    return false, nil
end

local function downloadBundle(key)
    local placeId = tostring(game.PlaceId)
    local HttpService = game:GetService("HttpService")

    local requestUrl = WorkerUrl .. "/load"
        .. "?key=" .. HttpService:UrlEncode(key)
        .. "&placeId=" .. placeId
        .. "&hwid=" .. HttpService:UrlEncode(HWID)

    local success, content = pcall(function()
        return game:HttpGet(requestUrl)
    end)

    if success and content then
        return true, content
    end
    return false, content
end

local function compilePayload(content)
    local chunk, err = loadstring(content)
    if chunk then
        return true, chunk
    end
    return false, err
end

local function executePayload(chunk)
    local success, err = pcall(chunk)
    return success, err
end

local function fetchAndExecutePayload(key)
    -- Set suppression flag for payload (prevents double loading screens)
    if getgenv then
        getgenv().FSSHUB_SKIP_LOADING = true
    end

    -- Use new ShowLoadingMode (returns updateUI function)
    local updateUI = KeySystemUI.ShowLoadingMode()

    local startTime = tick()
    local currentProgress = 0
    local serverVersion = nil
    local payloadContent = nil
    local compiledChunk = nil

    -- Weighted Task Configuration
    local Tasks = {
        { ID = "VAL",  Name = "Validating Data",       Weight = 15 },
        { ID = "DL",   Name = "Downloading UI Bundle", Weight = 65 },
        { ID = "INIT", Name = "Initializing System",   Weight = 10 },
        { ID = "UI",   Name = "Preparing Main Menu",   Weight = 10 }
    }

    -- Task Lookup Helper
    local function getTask(taskID)
        for _, t in ipairs(Tasks) do
            if t.ID == taskID then return t end
        end
        return nil
    end

    -- runTask Helper (User's specified pattern)
    local function runTask(taskID, func)
        local taskObj = getTask(taskID)
        if not taskObj then return false, "Unknown task" end

        local taskStart = tick()
        updateUI(taskObj.Name, currentProgress)

        -- Non-blocking yield for UI responsiveness
        game:GetService("RunService").Heartbeat:Wait()

        local success, result = pcall(func)

        local duration = tick() - taskStart
        if success then
            currentProgress = currentProgress + taskObj.Weight
            updateUI(taskObj.Name, currentProgress, string.format("%s finished in %.2fs", taskObj.Name, duration))
            print(string.format("[FSSHUB] %s completed in %.2fs", taskObj.Name, duration))
        end

        return success, result
    end

    -- Check for validation bypass
    local bypassValidation = canBypassValidation()
    if bypassValidation and cachedPayload then
        print("[FSSHUB] Validation bypass active - using cached payload")
        currentProgress = 75
        updateUI("Instant Load (Cached)", currentProgress)
        payloadContent = cachedPayload
        serverVersion = cachedVersion
    end

    -- Define weighted tasks
    local Tasks = {
        {
            Name = "Validating Server",
            Weight = 5, -- Reduced since we have fake lead-in
            Skip = bypassValidation,
            Run = function()
                -- Use pre-fetched version if available
                if prefetchedVersion then
                    serverVersion = prefetchedVersion
                    print("[FSSHUB] Using pre-fetched version: " .. tostring(prefetchedVersion))
                    return true
                end
                -- Fallback to fresh check
                local version, success = checkVersion()
                if success then
                    serverVersion = version
                    return true
                end
                return true -- Continue even if version check fails
            end
        },
        {
            Name = "Checking Cache",
            Weight = 5,
            Run = function()
                local cached, payload = checkCache(serverVersion)
                if cached then
                    payloadContent = payload
                    -- Skip download - jump progress
                    currentProgress = currentProgress + 60 -- Add download weight
                    KeySystemUI.UpdateProgress("Cache Hit - Skipping Download", currentProgress + 5)
                    return true, true                      -- Second bool = cache hit
                end
                return true, false
            end
        },
        {
            Name = "Downloading Bundle",
            Weight = 60,
            Run = function()
                if payloadContent then return true end -- Already cached

                KeySystemUI.StartPulseAnimation()      -- Show activity for slow operation
                local success, content = downloadBundle(key)
                KeySystemUI.StopPulseAnimation()

                if success then
                    payloadContent = content
                    -- Cache for future use
                    cachedVersion = serverVersion
                    cachedPayload = content
                    return true
                else
                    return false, content
                end
            end
        },
        {
            Name = "Preparing Assets",
            Weight = 5,
            Run = function()
                -- Wait for Fluent pre-fetch to finish (up to 5s)
                local start = tick()
                while not fluentPrefetchComplete do
                    if tick() - start > 5 then break end
                    game:GetService("RunService").Heartbeat:Wait()
                end

                if cachedFluentLoader then
                    return true
                else
                    return true -- Proceed anyway, payload has fallback
                end
            end
        },
        {
            Name = "Compiling Payload",
            Weight = 10,
            Run = function()
                local success, result = compilePayload(payloadContent)
                if success then
                    compiledChunk = result
                    return true
                end
                return false, result
            end
        },
        {
            Name = "Initializing Interface",
            Weight = 15,
            Run = function()
                local success, err = executePayload(compiledChunk)
                if success then
                    return true
                end
                return false, err
            end
        }
    }

    -- Execute tasks with progress tracking
    local failed = false
    local failError = nil

    for _, task in ipairs(Tasks) do
        if failed then break end

        -- Skip tasks if marked (e.g., when validation bypass is active)
        if task.Skip then
            print(string.format("[FSSHUB] Skipping %s (bypass active)", task.Name))
            currentProgress = currentProgress + task.Weight
            KeySystemUI.UpdateProgress(task.Name .. " (Skipped)", currentProgress, 0)
        else
            local taskStart = tick()
            KeySystemUI.UpdateProgress(task.Name, currentProgress)

            -- Non-blocking yield for UI responsiveness
            game:GetService("RunService").Heartbeat:Wait()

            local success, result = task.Run()

            local taskDuration = tick() - taskStart

            if success then
                -- Check for cache hit skip (second return value)
                if not (task.Name == "Checking Cache" and result == true) then
                    currentProgress = currentProgress + task.Weight
                end
                KeySystemUI.UpdateProgress(task.Name, currentProgress, taskDuration)
                print(string.format("[FSSHUB] %s completed in %.2fs", task.Name, taskDuration))
            else
                failed = true
                failError = result or "Unknown error"
                warn("[FSSHUB] Task failed: " .. task.Name .. " - " .. tostring(failError))
            end
        end
    end

    local totalTime = tick() - startTime

    if failed then
        KeySystemUI.ShowError("LOAD_FAIL: " .. tostring(failError))
    else
        -- Record successful load time for future validation bypass
        lastSuccessTime = tick()

        KeySystemUI.CompleteLoading(totalTime, updateUI)
        print(string.format("[FSSHUB] Total load time: %.2fs", totalTime))

        -- Wait for Main Menu UI to be ready before closing
        updateUI("Waiting for Main Menu...", 100)

        local waitStart = tick()
        local maxWait = 30 -- Maximum 30 seconds wait

        while not getgenv().FSSHUB_MAIN_MENU_READY do
            if tick() - waitStart > maxWait then
                warn("[FSSHUB] Timeout waiting for Main Menu, closing loader anyway")
                break
            end
            game:GetService("RunService").Heartbeat:Wait()
        end

        -- Small delay for smooth transition
        task.wait(0.3)
        KeySystemUI.Close()
    end
end

-- =====================================================
-- INITIALIZE KEY SYSTEM
-- =====================================================
KeySystemUI.Initialize({
    KeyLink = Junkie.get_key_link(),

    Function = function(userInput)
        getgenv().SCRIPT_KEY = userInput

        local result = Junkie.check_key(userInput)

        if result and (result.valid or result.message == "KEY_VALID" or result.message == "KEYLESS") then
            KeySystemUI.Authorize()

            -- Fetch payload after UI closes
            task.spawn(function()
                task.wait(0.5) -- Small delay for UX
                fetchAndExecutePayload(userInput)
            end)
        else
            KeySystemUI.Fail()

            -- Handle specific errors
            local errorMsg = result and result.message or "Unknown error"
            if errorMsg == "HWID_BANNED" then
                game.Players.LocalPlayer:Kick("Hardware ID banned")
            end
        end
    end
})

-- =====================================================
-- WAIT FOR KEY (Required by Junkie)
-- =====================================================
while not getgenv().SCRIPT_KEY do
    task.wait(0.1)
end
