--[[
    FSSHUB Inline UI Source - Junkie Dashboard Ready
    Target: UI-Source Field (LuaPRH/Prometheus Obfuscated)
    Version: 2.0 (Detailed UI + Security Loop)
]]

-- =====================================================
-- JUNKIE SDK LOADER
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
getgenv().SCRIPT_HWID = HWID -- Export for bridge script

-- =====================================================
-- CONFIGURATION
-- =====================================================
local LogoAsset = "rbxthumb://type=Asset&id=120860566854298&w=420&h=420"
local LogoSize = UDim2.new(0, 80, 0, 80)

-- =====================================================
-- KEY SYSTEM UI (Detailed Version)
-- =====================================================
local KeySystemUI = (function()
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local CoreGui = game:GetService("CoreGui")

    local UI = {}

    -- FSS Purple Theme (Matches Logo)
    local Colors = {
        Background = Color3.fromRGB(25, 20, 35),    -- Dark Purple Glass Tint
        MainStroke = Color3.fromRGB(140, 120, 210), -- Lighter Purple for contrast
        Accent = Color3.fromRGB(138, 110, 215),     -- Vibrant Purple
        Secondary = Color3.fromRGB(170, 150, 240),  -- Light Purple
        Error = Color3.fromRGB(255, 80, 100),       -- Soft Red
        Success = Color3.fromRGB(50, 255, 120),     -- Neon Green
        Info = Color3.fromRGB(0, 200, 255),         -- Neon Blue
        TextLight = Color3.fromRGB(255, 255, 255),  -- Pure White for readability
        TextDim = Color3.fromRGB(180, 180, 200),    -- Light Gray-Purple
        InputBg = Color3.fromRGB(15, 12, 25),       -- Darker Input BG
        ButtonBg = Color3.fromRGB(40, 30, 60)       -- Purple-ish Button BG
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
        TweenService:Create(blur, TweenInfo.new(0.5), { Size = 24 }):Play() -- Stronger blur for glass effect

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
        container.BackgroundTransparency = 0.25 -- Glassy but readable
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
    end

    function UI.Fail()
        UI.ShowError("ACCESS_DENIED: INVALID_KEY")
    end

    function UI.TransitionToLoading()
        -- Hide Input & Buttons with animation
        if inputSection then inputSection.Visible = false end
        local btnGet = container:FindFirstChild("BtnGet")
        local btnVerify = container:FindFirstChild("BtnVerify")
        if btnGet then btnGet.Visible = false end
        if btnVerify then btnVerify.Visible = false end

        -- Central Status
        local loadLabel = Instance.new("TextLabel")
        loadLabel.Name = "MasterLoader"
        loadLabel.Size = UDim2.new(1, 0, 0, 30)
        loadLabel.Position = UDim2.new(0, 0, 0.6, 0)
        loadLabel.BackgroundTransparency = 1
        loadLabel.TextColor3 = Colors.Accent
        loadLabel.Font = Enum.Font.GothamBold
        loadLabel.TextSize = 16
        loadLabel.Text = "AUTHENTICATED"
        loadLabel.Parent = container

        -- Progress Bar
        local barBg = Instance.new("Frame")
        barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        barBg.Size = UDim2.new(0.7, 0, 0, 4)
        barBg.Position = UDim2.new(0.5, 0, 0.7, 0)
        barBg.AnchorPoint = Vector2.new(0.5, 0)
        barBg.BorderSizePixel = 0
        barBg.Parent = container
        Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

        local barFill = Instance.new("Frame")
        barFill.BackgroundColor3 = Colors.Success
        barFill.Size = UDim2.new(0, 0, 1, 0)
        barFill.BorderSizePixel = 0
        barFill.Parent = barBg
        Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

        -- Start Wait Loop
        task.spawn(function()
            local TweenService = game:GetService("TweenService")
            TweenService:Create(barFill, TweenInfo.new(1), { Size = UDim2.new(0.3, 0, 1, 0) }):Play()
            loadLabel.Text = "DOWNLOADING PAYLOAD..."

            -- Wait for Bridge to Fetch Payload
            local timeout = 0
            while not getgenv().FSSHUB_MAIN_MENU_READY and not _G.FSSHUB_WINDOW do
                timeout = timeout + 0.1
                task.wait(0.1)

                -- Fake Progress
                local progress = 0.3 + (timeout / 20) * 0.6 -- Max 90% via fake
                TweenService:Create(barFill, TweenInfo.new(0.5), { Size = UDim2.new(math.min(progress, 0.9), 0, 1, 0) })
                    :Play()

                if timeout > 30 then
                    loadLabel.Text = "TIMEOUT - RETRYING..."
                    loadLabel.TextColor3 = Colors.Error
                    break
                end
            end

            if getgenv().FSSHUB_MAIN_MENU_READY or _G.FSSHUB_WINDOW then
                TweenService:Create(barFill, TweenInfo.new(0.3), { Size = UDim2.new(1, 0, 1, 0) }):Play()
                loadLabel.Text = "LAUNCHING..."
                loadLabel.TextColor3 = Colors.Success
                task.wait(0.5)
                UI.Close()
            end
        end)
    end

    function UI.Close()
        getgenv().UI_CLOSED = true
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
-- CONFIGURE UI & ASSETS
-- =====================================================
KeySystemUI.Keys.MainTitle = "FSSHUB"
KeySystemUI.Keys.MainDesc = "KeySystem Gateway"

if KeySystemUI.Keys.Assets then
    KeySystemUI.Keys.Assets.Logo = { ID = LogoAsset, Size = LogoSize }
end

-- =====================================================
-- INITIALIZE KEY SYSTEM (Validation Logic)
-- =====================================================
getgenv().SCRIPT_KEY = nil
getgenv().UI_CLOSED = false

KeySystemUI.Initialize({
    KeyLink = Junkie.get_key_link(),
    Function = function(userInput)
        -- 1. Junkie SDK Check
        local result = Junkie.check_key(userInput)

        if result and (result.valid or result.message == "KEY_VALID" or result.message == "KEYLESS") then
            -- SUCCESS
            -- Note: We do NOT close immediately. We signal the bridge to start via SCRIPT_KEY
            -- and transition the UI to a loading state.

            getgenv().SCRIPT_KEY = userInput

            KeySystemUI.Authorize()
            task.wait(1)

            -- Transition to Loader instead of Closing
            KeySystemUI.TransitionToLoading()
        else
            -- FAIL
            KeySystemUI.ShowStatus(result.message or "INVALID KEY", KeySystemUI.Colors.Error)
            if result.message == "HWID_BANNED" then
                game.Players.LocalPlayer:Kick("Hardware ID banned")
            end
        end
    end
})

-- =====================================================
-- SECURITY LOOP (Blocks execution until key is valid)
-- =====================================================
-- This ensures the Main Script (Bridge) is not loaded until
-- the key is firmly established in getgenv
while not getgenv().SCRIPT_KEY and not getgenv().UI_CLOSED do
    task.wait(0.1)
end
