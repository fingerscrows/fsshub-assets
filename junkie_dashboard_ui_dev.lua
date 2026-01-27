--[[
    FSSHUB Dashboard UI Source
    Target: Junkie Dashboard -> "UI Source" Field
    Action: Obfuscate with Prometheus (free) before uploading.

    Generated: 2026-01-18T14:12:00Z (Fixed: TweenService error + Auto-close on ready)
]]

local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "FSSHUB Official"
Junkie.identifier = "1000139"
Junkie.provider = "FSSHUB - KEY SYSTEM"

-- [ CONFIG ]
local LogoAsset = "rbxthumb://type=Asset&id=120860566854298&w=420&h=420"
local LogoSize = UDim2.new(0, 80, 0, 80)

-- [ UI WRAPPER ]
local result = (function()
    -- =====================================================
    -- GLOBAL CLEANUP FUNCTION (for re-execution & close)
    -- =====================================================
    _G.FSSHUB_CLEANUP = function()
        pcall(function()
            local CoreGui = game:GetService("CoreGui")
            local Lighting = game:GetService("Lighting")

            -- Emit Cleanup Signal for Feature Scripts
            if _G.FSSHUB_EVENTS and _G.FSSHUB_EVENTS.Emit then
                pcall(function() _G.FSSHUB_EVENTS:Emit("cleanup") end)
            end

            -- Destroy UI elements
            local guiNames = { "FSSHUB_Cyber_Loader", "FSSHUB_Lazy_Loader", "Fluent", "FSSHUB" }
            for _, name in ipairs(guiNames) do
                local gui = CoreGui:FindFirstChild(name)
                if gui then gui:Destroy() end
                if gethui then
                    local hui = gethui():FindFirstChild(name)
                    if hui then hui:Destroy() end
                end
            end

            -- Destroy Fluent Window
            if _G.FSSHUB_WINDOW then
                pcall(function() _G.FSSHUB_WINDOW:Destroy() end)
            end

            -- Remove blur effects
            for _, effect in ipairs(Lighting:GetChildren()) do
                if effect:IsA("BlurEffect") then
                    effect:Destroy()
                end
            end

            -- Reset globals
            _G.FSSHUB_WINDOW = nil
            _G.FSSHUB_FLUENT = nil
            _G.FSSHUB_OPTIONS = nil
            _G.FSSHUB_STATUS = nil
            _G.FSSHUB_EXECUTE_UI = nil
            _G.FSSHUB_EVENTS = nil

            if getgenv then
                getgenv().FSSHUB_MAIN_MENU_READY = nil
                getgenv().SCRIPT_KEY = nil
                getgenv().UI_CLOSED = nil
                getgenv().FSSHUB_WORKSPACE = nil
                getgenv().FSSHUB_GET_FLUENT = nil
                getgenv().FSSHUB_UI_BUNDLE = nil -- Critical: Clear cached bundle to force reload
                getgenv().Junkie = nil           -- Reset Junkie SDK ref just in case
            end
        end)
    end

    -- AUTO-CLEANUP on re-execution (destroy old UI before creating new one)
    if _G.FSSHUB_WINDOW or _G.FSSHUB_CLEANUP then
        if _G.FSSHUB_CLEANUP then
            _G.FSSHUB_CLEANUP()
        end
    end

    getgenv().SCRIPT_KEY = nil
    getgenv().UI_CLOSED = false

    -- [ EMBEDDED KEY SYSTEM UI ]
    local KeySystemUI = (function()
        --[[
    FSSHUB Inline UI Source - Junkie Dashboard Ready
    Target: UI-Source Field (LuaPRH/Prometheus Obfuscated)
    Version: 2.0 (Detailed UI + Security Loop)
]]

        local TweenService = game:GetService("TweenService")
        local CoreGui = game:GetService("CoreGui")

        -- [ JUNKIE SDK INITIALIZATION ]
        -- Safe check for Junkie SDK
        local Junkie = getgenv().Junkie
        if not Junkie then
            pcall(function()
                Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
                if Junkie then
                    Junkie.service = "FSSHUB Official"
                    Junkie.identifier = "1000139"
                    Junkie.provider = "FSSHUB - KEY SYSTEM"
                end
            end)
        end
        local KeyStoragePath = "FSSHUB/bin/SavedKeyFSSHUB.cfg"

        -- =====================================================
        -- CONFIGURATION (MOVED UP FOR SCOPE VISIBILITY)
        -- =====================================================
        local Config = {
            Title = "FSSHUB",
            Desc = "KEYSYSTEM GATEWAY",
            Assets = {
                Logo = "rbxthumb://type=Asset&id=120860566854298&w=420&h=420"
            },
            Colors = {
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
        }

        -- =====================================================
        -- KEY SYSTEM UI MODULE (MOVED UP)
        -- =====================================================
        local Library = {
            Connections = {},
            UI = nil,
            Keys = { -- Compatibility with bundle_junkie.js
                Assets = Config.Assets,
                MainTitle = Config.Title,
                MainDesc = Config.Desc
            }
        }

        -- [ KEY STORAGE HELPERS ]
        function Library.SaveKey(key)
            if not isfolder("FSSHUB") then makefolder("FSSHUB") end
            if not isfolder("FSSHUB/bin") then makefolder("FSSHUB/bin") end
            if writefile then pcall(writefile, KeyStoragePath, key) end

            -- Clean up old files
            pcall(function()
                if isfile("verifiedkey") then delfile("verifiedkey") end
                if isfile("verifedkey") then delfile("verifedkey") end
                if isfile("FSSHUB/bin/SavedKeyFSSHUB") then delfile("FSSHUB/bin/SavedKeyFSSHUB") end
            end)
        end

        function Library.LoadKey()
            if isfile and isfile(KeyStoragePath) then
                local s, key = pcall(readfile, KeyStoragePath)
                if s and key and key ~= "" then
                    local res = Junkie.check_key(key)
                    if res and (res.valid or res.message == "KEY_VALID" or res.message == "KEYLESS") then
                        return key
                    end
                end
            end
            return nil
        end

        -- Auto-Login Check
        local saved = Library.LoadKey()
        if saved then
            Library.SavedKey = saved
            Library.AutoLoggedIn = true
        end



        -- [ UTILS ]
        local Utils = {}

        function Utils.RandomString(len)
            local s = ""
            for i = 1, len do s = s .. string.char(math.random(65, 90)) end
            return s
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

        function Utils.GlitchText(label, finalStats)
            task.spawn(function()
                local originalText = finalStats.Text or label.Text
                for i = 1, 10 do
                    if not label or not label.Parent then break end
                    label.Text = Utils.RandomString(#originalText)
                    local targetColor = finalStats.TextColor3 or Config.Colors.TextLight
                    label.TextColor3 = (i % 2 == 0) and Config.Colors.TextLight or targetColor
                    task.wait(0.05)
                end
                if label and label.Parent then
                    label.Text = originalText
                    label.TextColor3 = finalStats.TextColor3 or Config.Colors.TextLight
                end
            end)
        end

        -- [ UI CONSTRUCTION ]
        function Library.Initialize(junkieConfig)
            local validateCallback = junkieConfig.Function or junkieConfig.validateCallback
            local keyLink = junkieConfig.KeyLink or junkieConfig.keyLink or "https://fsshub.com/getkey"

            if Library.UI then Library.UI:Destroy() end

            -- Cleanup Lazy Loader if present
            local lazy = CoreGui:FindFirstChild("FSSHUB_Lazy_Loader") or
                (gethui and gethui():FindFirstChild("FSSHUB_Lazy_Loader"))
            if lazy then lazy:Destroy() end

            local gui = Instance.new("ScreenGui")
            gui.Name = "FSSHUB_Cyber_Loader"
            gui.IgnoreGuiInset = true
            gui.DisplayOrder = 10000
            if gethui then gui.Parent = gethui() else gui.Parent = CoreGui end
            Library.UI = gui

            -- Background Blur
            local blur = Instance.new("BlurEffect")
            blur.Size = 0
            blur.Parent = game:GetService("Lighting")
            TweenService:Create(blur, TweenInfo.new(0.5), { Size = 24 }):Play()

            -- Determine container config from external injection (Keys) or default
            local activeLogo = Config.Assets.Logo
            local activeLogoSize = UDim2.new(0, 80, 0, 80)

            if Library.Keys.Assets and Library.Keys.Assets.Logo then
                -- Support both String and Table formats
                if type(Library.Keys.Assets.Logo) == "table" then
                    activeLogo = Library.Keys.Assets.Logo.ID
                    activeLogoSize = Library.Keys.Assets.Logo.Size or UDim2.new(0, 80, 0, 80)
                else
                    activeLogo = Library.Keys.Assets.Logo
                end
            end

            local hasLogo = (activeLogo ~= nil and activeLogo ~= "")
            local containerHeight = hasLogo and 340 or 280

            -- Main Container
            local container = Instance.new("Frame")
            container.Name = "MainContainer"
            container.Size = UDim2.new(0, 400, 0, containerHeight)
            container.Position = UDim2.new(0.5, 0, 0.5, 0)
            container.AnchorPoint = Vector2.new(0.5, 0.5)
            container.BackgroundColor3 = Config.Colors.Background
            container.BorderSizePixel = 0
            container.BackgroundTransparency = 0.25
            container.Parent = gui
            container.ClipsDescendants = true

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

            -- Neon Stroke
            local mainStroke = Utils.NeonStroke(container, Config.Colors.MainStroke, 2)

            -- Stroke Gradient
            local strokeGradient = Instance.new("UIGradient")
            strokeGradient.Rotation = 45
            strokeGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Config.Colors.Secondary),
                ColorSequenceKeypoint.new(0.5, Config.Colors.Accent),
                ColorSequenceKeypoint.new(1, Config.Colors.Secondary)
            })
            strokeGradient.Parent = mainStroke

            -- Galaxy Particle Background
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
                local particleColors = { Config.Colors.Accent, Config.Colors.Secondary, Color3.fromRGB(150, 50, 255),
                    Color3
                        .fromRGB(255, 255, 255) }
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
                        local endPos = particle.Position +
                            UDim2.new(math.random(-0.1, 0.1), 0, math.random(-0.1, 0.1), 0)

                        TweenService:Create(particle,
                            TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                            { Position = endPos, BackgroundTransparency = 1 }):Play()
                        game.Debris:AddItem(particle, duration)
                    end
                    task.wait(0.05)
                end
            end)

            -- Static Inner Highlight
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
            highlightStroke.Color = Config.Colors.TextLight
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

            -- Close Button
            local closeBtn = Instance.new("TextButton")
            closeBtn.Text = "X"
            closeBtn.TextColor3 = Config.Colors.TextDim
            closeBtn.Font = Enum.Font.Code
            closeBtn.TextSize = 18
            closeBtn.BackgroundTransparency = 1
            closeBtn.Size = UDim2.new(0, 30, 0, 30)
            closeBtn.Position = UDim2.new(1, -30, 0, 0)
            closeBtn.Parent = container

            closeBtn.MouseEnter:Connect(function() closeBtn.TextColor3 = Config.Colors.Error end)
            closeBtn.MouseLeave:Connect(function() closeBtn.TextColor3 = Config.Colors.TextDim end)

            -- Elements
            local logoImage = nil

            if hasLogo then
                logoImage = Instance.new("ImageLabel")
                logoImage.Image = activeLogo
                logoImage.Size = activeLogoSize
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
            logoLabel.Text = Library.Keys.MainTitle or "FSSHUB"
            logoLabel.Font = Enum.Font.GothamBold
            logoLabel.TextSize = 28
            logoLabel.TextColor3 = Config.Colors.Accent
            logoLabel.Size = UDim2.new(1, 0, 0, 30)
            logoLabel.Position = UDim2.new(0, 0, 0, logoImage and 105 or 30)
            logoLabel.BackgroundTransparency = 1
            logoLabel.TextTransparency = 1
            logoLabel.Parent = container

            local subLabel = Instance.new("TextLabel")
            subLabel.Text = Library.Keys.MainDesc or "KEYSYSTEM GATEWAY"
            subLabel.Font = Enum.Font.Gotham
            subLabel.TextSize = 12
            subLabel.TextColor3 = Config.Colors.TextDim
            subLabel.Size = UDim2.new(1, 0, 0, 20)
            subLabel.Position = UDim2.new(0, 0, 0, logoImage and 135 or 60)
            subLabel.BackgroundTransparency = 1
            subLabel.TextTransparency = 1
            subLabel.Parent = container

            -- Greeting
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local greetingLabel = Instance.new("TextLabel")
            greetingLabel.Text = "Welcome, @" .. (LocalPlayer and LocalPlayer.Name or "User")
            greetingLabel.Font = Enum.Font.GothamMedium
            greetingLabel.TextSize = 13
            greetingLabel.TextColor3 = Config.Colors.Accent
            greetingLabel.Size = UDim2.new(1, 0, 0, 20)
            greetingLabel.Position = UDim2.new(0, 0, 0, logoImage and 155 or 85)
            greetingLabel.BackgroundTransparency = 1
            greetingLabel.TextTransparency = 1
            greetingLabel.Parent = container

            -- Input Field
            local inputYPos = logoImage and 195 or 125
            local inputSection = Instance.new("Frame")
            inputSection.Size = UDim2.new(0.85, 0, 0, 42)
            inputSection.Position = UDim2.new(0.5, 0, 0, inputYPos)
            inputSection.AnchorPoint = Vector2.new(0.5, 0)
            inputSection.BackgroundColor3 = Config.Colors.InputBg
            inputSection.BackgroundTransparency = 0.5
            inputSection.Parent = container
            inputSection.Visible = false

            local inputCorner = Instance.new("UICorner")
            inputCorner.CornerRadius = UDim.new(0, 6)
            inputCorner.Parent = inputSection

            Utils.NeonStroke(inputSection, Config.Colors.TextDim, 1)

            local keyInput = Instance.new("TextBox")
            keyInput.Size = UDim2.new(1, -20, 1, 0)
            keyInput.Position = UDim2.new(0, 10, 0, 0)
            keyInput.BackgroundTransparency = 1
            keyInput.Font = Enum.Font.Code
            keyInput.Text = ""
            keyInput.PlaceholderText = "INPUT_KEY_HERE"
            keyInput.PlaceholderColor3 = Color3.fromRGB(60, 80, 80)
            keyInput.TextColor3 = Config.Colors.Secondary
            keyInput.TextSize = 14
            keyInput.Parent = inputSection

            -- Helpers
            local function createCyberButton(text, pos, isPrimary, action)
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(0.35, 0, 0, 35)
                btn.AnchorPoint = Vector2.new(0.5, 0)
                btn.Position = pos
                btn.BackgroundColor3 = Config.Colors.ButtonBg
                btn.BackgroundTransparency = 0.3
                btn.Text = text
                btn.Font = Enum.Font.GothamBold
                btn.TextColor3 = isPrimary and Config.Colors.Accent or Config.Colors.TextDim
                btn.TextSize = 14
                btn.Parent = container
                btn.Visible = false

                local btnCorner = Instance.new("UICorner")
                btnCorner.CornerRadius = UDim.new(0, 8)
                btnCorner.Parent = btn

                local stroke = Utils.NeonStroke(btn, isPrimary and Config.Colors.Accent or Config.Colors.TextDim, 1)

                -- Hover Glitch
                btn.MouseEnter:Connect(function()
                    TweenService:Create(stroke, TweenInfo.new(0.2),
                        { Color = isPrimary and Config.Colors.Secondary or Config.Colors.TextLight }):Play()
                    btn.TextColor3 = isPrimary and Config.Colors.Secondary or Config.Colors.TextLight
                end)
                btn.MouseLeave:Connect(function()
                    TweenService:Create(stroke, TweenInfo.new(0.2),
                        { Color = isPrimary and Config.Colors.Accent or Config.Colors.TextDim }):Play()
                    btn.TextColor3 = isPrimary and Config.Colors.Accent or Config.Colors.TextDim
                end)
                btn.MouseButton1Click:Connect(function()
                    action()
                    local flash = Instance.new("Frame")
                    flash.Size = UDim2.new(1, 0, 1, 0)
                    flash.BackgroundColor3 = Config.Colors.TextLight
                    flash.BackgroundTransparency = 0.5
                    flash.Parent = btn
                    local flashCorner = Instance.new("UICorner")
                    flashCorner.CornerRadius = UDim.new(0, 6)
                    flashCorner.Parent = flash
                    TweenService:Create(flash, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
                    game.Debris:AddItem(flash, 0.4)
                end)
                return btn
            end

            local buttonYPos = logoImage and 255 or 185
            local btnGet = createCyberButton("GET KEY", UDim2.new(0.28, 0, 0, buttonYPos), false, function()
                if setclipboard then
                    setclipboard(keyLink)
                    Library.ShowStatus("LINK_COPIED", Config.Colors.Info)
                else
                    Library.ShowStatus("LINK: " .. keyLink, Config.Colors.Info)
                end
            end)
            local btnVerify = createCyberButton("VERIFY", UDim2.new(0.72, 0, 0, buttonYPos), true, function()
                local input = keyInput.Text:gsub("%s+", "")
                if input == "" then
                    Library.ShowStatus("NO_KEY_ENTERED", Config.Colors.Error)
                    return
                end
                if validateCallback then validateCallback(input) end
            end)



            keyInput.FocusLost:Connect(function(enter)
                if enter then
                    local input = keyInput.Text:gsub("%s+", "")
                    if input == "" then
                        Library.ShowStatus("NO_KEY_ENTERED", Config.Colors.Error)
                        return
                    end
                    if validateCallback then validateCallback(input) end
                end
            end)

            -- Status Function
            function Library.ShowStatus(msg, color)
                local existing = container:FindFirstChild("StatusFrame")
                if existing then existing:Destroy() end

                local statusFrame = Instance.new("Frame")
                statusFrame.Name = "StatusFrame"
                statusFrame.Size = UDim2.new(0, 0, 0, 26)
                statusFrame.Position = UDim2.new(0.5, 0, 1, -12)
                statusFrame.AnchorPoint = Vector2.new(0.5, 1)
                statusFrame.BackgroundColor3 = Config.Colors.InputBg
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
                label.TextTransparency = 1
                label.Parent = statusFrame

                local tweenSize = TweenService:Create(statusFrame,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                    { Size = UDim2.new(0.9, 0, 0, 26) })
                tweenSize:Play()

                task.delay(0.2, function()
                    TweenService:Create(label, TweenInfo.new(0.2), { TextTransparency = 0 }):Play()
                    Utils.GlitchText(label, { Text = string.upper(msg), TextColor3 = color })
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

            -- External Control
            function Library.Close(keepEnvironment)
                -- Set UI_CLOSED flag for wait loop
                getgenv().UI_CLOSED = true

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

                -- Call global cleanup to reset all state ONLY if we are not keeping the env
                if not keepEnvironment and _G.FSSHUB_CLEANUP then
                    _G.FSSHUB_CLEANUP()
                end
            end

            function Library.Authorize()
                Library.ShowStatus("ACCESS_GRANTED... AUTHENTICATING", Config.Colors.Success)

                -- Transition to Loading Screen
                task.delay(1, function()
                    -- Clear container content but keep background & Branding
                    for _, child in ipairs(container:GetChildren()) do
                        local keep = false
                        if child.Name == "GalaxyBg" or child.Name == "MainGradient" or child.Name == "InnerHighlight" or child.ClassName == "UICorner" then keep = true end
                        if child == mainStroke then keep = true end
                        -- Keep Branding & Controls
                        if child == logoImage or child == logoLabel or child == subLabel or child == closeBtn then keep = true end

                        if not keep then
                            -- Safely tween only compatible properties
                            pcall(function()
                                local tweenProps = {}
                                if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                                    tweenProps.TextTransparency = 1
                                    tweenProps.BackgroundTransparency = 1
                                elseif child:IsA("ImageLabel") or child:IsA("ImageButton") then
                                    tweenProps.ImageTransparency = 1
                                    tweenProps.BackgroundTransparency = 1
                                elseif child:IsA("Frame") then
                                    tweenProps.BackgroundTransparency = 1
                                end
                                if next(tweenProps) then
                                    TweenService:Create(child, TweenInfo.new(0.3), tweenProps):Play()
                                end
                            end)
                            task.delay(0.3, function() pcall(function() child:Destroy() end) end)
                        end
                    end

                    task.wait(0.4)

                    -- Loosy Logo Animation (Optional Pulse)
                    if logoImage then
                        TweenService:Create(logoImage,
                            TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
                            { Size = UDim2.new(0, 85, 0, 85) }):Play()
                    end

                    -- Loader UI (Shifted Down)
                    local loadLabel = Instance.new("TextLabel")
                    loadLabel.Text = "LOADING CORE..."
                    loadLabel.Font = Enum.Font.Code
                    loadLabel.TextSize = 18
                    loadLabel.TextColor3 = Config.Colors.Accent
                    loadLabel.Size = UDim2.new(1, 0, 0, 30)
                    loadLabel.Position = UDim2.new(0, 0, 0.65, 0) -- Adjusted to be below branding
                    loadLabel.BackgroundTransparency = 1
                    loadLabel.TextTransparency = 1
                    loadLabel.Parent = container

                    TweenService:Create(loadLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                        { TextTransparency = 0 }):Play()
                    Utils.GlitchText(loadLabel, { Text = "LOADING CORE...", TextColor3 = Config.Colors.Accent })

                    -- Spinner / Bar (Shifted Down)
                    local barBg = Instance.new("Frame")
                    barBg.Size = UDim2.new(0.6, 0, 0, 4)
                    barBg.Position = UDim2.new(0.5, 0, 0.75, 0) -- Adjusted to be below text
                    barBg.AnchorPoint = Vector2.new(0.5, 0.5)
                    barBg.BackgroundColor3 = Config.Colors.InputBg
                    barBg.BackgroundTransparency = 1 -- Fade in
                    barBg.Parent = container
                    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

                    local barFill = Instance.new("Frame")
                    barFill.Size = UDim2.new(0, 0, 1, 0)
                    barFill.BackgroundColor3 = Config.Colors.Success
                    barFill.Parent = barBg
                    Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

                    TweenService:Create(barBg, TweenInfo.new(0.5), { BackgroundTransparency = 0.5 }):Play()

                    -- Loading Loop - waits for main menu signal or window
                    task.spawn(function()
                        local startTime = tick()

                        -- Set initial status
                        _G.FSSHUB_STATUS = "REQUESTING CORE..."

                        while (tick() - startTime < 60) do -- 60s timeout for slow connections
                            -- Safety: Stop if UI is destroyed
                            if not gui or not gui.Parent then break end
                            -- Check for UI ready signals
                            local isReady = (getgenv().FSSHUB_MAIN_MENU_READY == true) or (_G.FSSHUB_WINDOW ~= nil)

                            if isReady then
                                -- Success! Fill bar and close
                                pcall(function()
                                    TweenService:Create(barFill, TweenInfo.new(0.3), { Size = UDim2.new(1, 0, 1, 0) })
                                        :Play()
                                    loadLabel.Text = "READY - LAUNCHING"
                                    loadLabel.TextColor3 = Config.Colors.Success
                                end)
                                task.wait(2)
                                Library.Close(true) -- CRITICAL: Keep environment active
                                return              -- Exit the loop and function completely
                            end

                            -- Read Global Status set by Installer/MainScript
                            local currentStatus = _G.FSSHUB_STATUS or "WAITING..."

                            -- Update Label (Upper Case)
                            pcall(function()
                                loadLabel.Text = string.upper(currentStatus)

                                -- Dynamic Dots
                                local dots = string.rep(".", math.floor(tick() * 2) % 4)
                                if not string.find(loadLabel.Text, "%.%.%.") then
                                    loadLabel.Text = loadLabel.Text .. dots
                                end

                                -- Indeterminate Bar Animation (Ping Pong)
                                local time = tick() * 2
                                local pos = (math.sin(time) + 1) / 2 -- 0 to 1
                                barFill.Size = UDim2.new(0.3, 0, 1, 0)
                                barFill.Position = UDim2.new(pos * 0.7, 0, 0, 0)
                            end)

                            task.wait(0.1)
                        end

                        -- Timeout reached - cleanup anyway
                        Library.Close()
                    end)
                end)
            end

            function Library.Fail()
                Library.ShowStatus("ACCESS_DENIED: INVALID_KEY", Config.Colors.Error)
                -- Shake
                local orig = UDim2.new(0.5, 0, 0.5, 0)
                for i = 1, 6 do
                    container.Position = orig + UDim2.new(0, math.random(-5, 5), 0, math.random(-5, 5))
                    task.wait(0.04)
                end
                container.Position = orig
            end

            closeBtn.MouseButton1Click:Connect(Library.Close)

            -- Animation Sequence
            container.Size = UDim2.new(0, 150, 0, 50)
            container.BackgroundTransparency = 0.05
            local loadLabel = Instance.new("TextLabel")
            loadLabel.Text = "INITIALIZING..."
            loadLabel.Font = Enum.Font.Code
            loadLabel.TextSize = 12
            loadLabel.TextColor3 = Config.Colors.Secondary
            loadLabel.Size = UDim2.new(1, 0, 1, 0)
            loadLabel.BackgroundTransparency = 1
            loadLabel.Parent = container

            task.spawn(function()
                task.wait(0.4)
                loadLabel:Destroy()

                local targetSize = UDim2.new(0, 400, 0, containerHeight)
                TweenService:Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                    { Size = targetSize }):Play()
                task.wait(0.35)

                if logoImage then
                    TweenService:Create(logoImage, TweenInfo.new(0.3), { ImageTransparency = 0 }):Play()
                end
                TweenService:Create(logoLabel, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
                TweenService:Create(subLabel, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()

                -- Auto-Login Handling VS Normal
                if Library.AutoLoggedIn then
                    inputSection.Visible = false
                    btnGet.Visible = false
                    btnVerify.Visible = false
                    -- Update Greeting for Auto-Login
                    greetingLabel.Text = "Welcome Back, @" .. (LocalPlayer and LocalPlayer.Name or "User")
                    TweenService:Create(greetingLabel, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()

                    Library.ShowStatus("WELCOME BACK", Config.Colors.Success)

                    task.delay(1.5, function()
                        Library.Authorize()
                        task.wait(1)
                        getgenv().SCRIPT_KEY = Library.SavedKey
                    end)
                else
                    TweenService:Create(greetingLabel, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
                    inputSection.Visible = true
                    btnGet.Visible = true
                    btnVerify.Visible = true
                end

                task.spawn(function()
                    task.wait(0.2)
                    Utils.GlitchText(logoLabel,
                        { Text = Library.Keys.MainTitle or "FSSHUB", TextColor3 = Config.Colors.Accent })
                end)
            end)
        end

        return Library
    end)()

    -- [ AUTO-LOGIN HANDLING ]
    -- (Handled internally in Initialize now)

    if not KeySystemUI then return nil end -- Safety

    -- [ CONFIGURE UI ]
    KeySystemUI.Keys.MainTitle = "FSSHUB"
    KeySystemUI.Keys.MainDesc = "KeySystem Gateway"
    if KeySystemUI.Keys.Assets then
        KeySystemUI.Keys.Assets.Logo = { ID = LogoAsset, Size = LogoSize }
    end

    -- [ INITIALIZE LOGIC ]
    KeySystemUI.Initialize({
        KeyLink = Junkie.get_key_link(),

        Function = function(userInput)
            -- Capture UI reference and function locally to prevent upvalue loss
            local UI = KeySystemUI
            local saveFunc = UI and UI.SaveKey
            local uiAuthorize = UI and UI.Authorize
            local uiFail = UI and UI.Fail

            local res = Junkie.check_key(userInput)

            if res and (res.valid or res.message == "KEY_VALID" or res.message == "KEYLESS") then
                if uiAuthorize then
                    uiAuthorize() -- Show success animation
                end

                -- Wait for animation then confirm
                task.delay(2, function()
                    if saveFunc then
                        pcall(saveFunc, userInput)
                    end
                    getgenv().SCRIPT_KEY = userInput
                end)
            else
                if uiFail then
                    uiFail()
                end
            end
        end
    })

    -- Handle Close
    -- (You might need to add a cleanup callback to KeySystemUI if not present)

    -- [ WAIT LOOP ]
    while not getgenv().SCRIPT_KEY and not getgenv().UI_CLOSED do
        task.wait(0.1)
    end

    return getgenv().SCRIPT_KEY
end)()

if not result then
    return -- User closed UI or failed
end

-- =====================================================
-- V6.3 SMART CACHING UI LOADING (Versioned)
-- =====================================================
do
    local function Notify(title, text, duration)
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = title, Text = text, Duration = duration or 5
            })
        end)
    end

    local FOLDER = "FSSHUB_DEV"
    local ASSETS = FOLDER .. "/assets"
    local BUNDLE_PATH = ASSETS .. "/uibundle.luau"
    local VERSION_PATH = ASSETS .. "/version.txt"

    local function SafeWrite(path, content)
        if not isfolder(FOLDER) then makefolder(FOLDER) end
        if not isfolder(ASSETS) then makefolder(ASSETS) end
        writefile(path, content)
    end

    _G.FSSHUB_STATUS = "CHECKING UPDATES..."

    -- URLs
    local versionUrl = "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/dev/VERSION"
    local bundleUrls = {
        "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/dev/uibundle.luau",
        "https://cdn.jsdelivr.net/gh/fingerscrows/fsshub-assets@dev/uibundle.luau"
    }

    local targetBundle = nil

    -- 1. Get Remote Version
    local remoteVer = nil
    local s, v = pcall(game.HttpGet, game, versionUrl)
    if s and v then remoteVer = v:gsub("%s+", "") end -- clean whitespace

    -- 2. Check Local Version
    local localVer = nil
    if isfile(VERSION_PATH) then
        localVer = readfile(VERSION_PATH):gsub("%s+", "")
    end

    -- 3. Compare & Decide
    local useCache = false
    if remoteVer and localVer and remoteVer == localVer and isfile(BUNDLE_PATH) then
        useCache = true
    elseif not remoteVer and isfile(BUNDLE_PATH) then
        -- Fallback: Remote failed, but we have cache
        useCache = true
        Notify("FSSHUB Warning", "Update check failed, using cached UI.", 5)
    end

    -- 4. Load or Download
    if useCache then
        _G.FSSHUB_STATUS = "LOADING CACHED UI..."
        targetBundle = readfile(BUNDLE_PATH)
    else
        _G.FSSHUB_STATUS = "DOWNLOADING UI..."
        -- Download new bundle
        for _, url in ipairs(bundleUrls) do
            local s, content = pcall(game.HttpGet, game, url)
            if s and content and #content > 1000 then
                targetBundle = content
                break
            end
        end

        if targetBundle then
            -- Cache it
            pcall(SafeWrite, BUNDLE_PATH, targetBundle)
            if remoteVer then pcall(SafeWrite, VERSION_PATH, remoteVer) end
        else
            Notify("FSSHUB Error", "Failed to download UI.", 8)
            return
        end
    end

    _G.FSSHUB_STATUS = "INITIALIZING..."

    -- Strip BOM if present (UTF-8 Byte Order Mark: EF BB BF)
    if targetBundle:sub(1, 3) == string.char(239, 187, 191) then
        targetBundle = targetBundle:sub(4)
    end

    -- Execute
    local BundleChunk, BundleErr = loadstring(targetBundle)
    if not BundleChunk then
        warn("[FSSHUB] Bundle compile error: " .. tostring(BundleErr))
        return
    end

    -- Execute Chunk to get Factory -> Execute Factory to get Instances
    local success, Fluent, Builder = pcall(function()
        local Factory = BundleChunk()
        if type(Factory) ~= "function" then
            error("Invalid bundle format (not a factory)")
        end
        return Factory()
    end)

    if success and Fluent and Builder then
        -- V6.9: FETCH PAYLOAD FIRST (to set FSSHUB_INFO before UI builds)
        getgenv().FSSHUB_FLUENT = Fluent

        -- Fetch and Execute Payload (SYNCHRONOUSLY - UI needs FSSHUB_INFO)
        print("[FSSHUB] Fetching Payload...")

        -- Get Key & HWID
        local key = getgenv().SCRIPT_KEY
        local hwid
        pcall(function()
            hwid = (gethwid and gethwid()) or (get_hwid and get_hwid())
        end)
        if not hwid then
            pcall(function()
                hwid = game:GetService("RbxAnalyticsService"):GetClientId()
            end)
        end
        hwid = hwid or "unknown"

        -- Build URL (Dynamic Env Support)
        local baseUrl = getgenv().FSSHUB_LOADER_BASE_URL or "https://script.fsshub-services.workers.dev"

        -- Load dev token from local file (if exists)
        local devToken = ""
        pcall(function()
            if isfile and isfile("FSSHUB/bin/.dev_token") then
                devToken = readfile("FSSHUB/bin/.dev_token"):gsub("%s+", "")
            end
        end)

        local url = baseUrl .. "/load"
            .. "?key=" .. tostring(key or "unknown")
            .. "&hwid=" .. tostring(hwid)
            .. "&placeId=" .. tostring(game.PlaceId)

        -- LOGGING: Print FULL URL to verify Cache Buster
        print("[FSSHUB DEBUG] Full Payload URL: " .. url)
        task.wait(0.01)

        -- Fetch Payload
        -- Fetch Payload (Simplification to match Production)
        print("[FSSHUB DEBUG] Fetching with simple game:HttpGet...")
        local fetchSuccess, payload = pcall(game.HttpGet, game, url)
        if fetchSuccess and payload then
            print("[FSSHUB] Payload received, length = " .. #payload)
            task.wait(0.01)

            -- Compile Payload
            local chunk, err = loadstring(payload)
            if chunk then
                print("[FSSHUB] Executing Payload (sync for info, async for features)...")

                -- Execute payload SYNCHRONOUSLY
                -- The payload structure is:
                -- 1. Security Header (sync, fast) - Sets Event Bus
                -- 2. Context Header (sync, fast) - Sets FSSHUB_INFO
                -- 3. Orchestrator (has internal task.spawn) - Features load async
                local execSuccess, execErr = pcall(chunk)
                if execSuccess then
                    print("[FSSHUB] Payload Executed!")
                    -- Check both getgenv and _G for FSSHUB_INFO (V7 redundancy)
                    local hasInfo = (getgenv().FSSHUB_INFO ~= nil) or (_G.FSSHUB_INFO ~= nil)
                    print("[FSSHUB] FSSHUB_INFO check: " .. tostring(hasInfo))
                else
                    warn("[FSSHUB] Payload Exec Error: " .. tostring(execErr))
                end
            else
                warn("[FSSHUB] Payload Compile Error: " .. tostring(err))
                Notify("FSSHUB Critical", "Payload Compile Failed. Check console.", 10)
                return -- ABORT
            end
        else
            warn("[FSSHUB] Payload Fetch Error: " .. tostring(payload))
            Notify("FSSHUB Critical", "Failed to fetch payload from server.", 10)
            return -- ABORT
        end

        task.wait(0.05) -- Short yield after payload

        -- NOW build UI (FSSHUB_INFO is available!)
        print("[FSSHUB] Building UI (with context data)...")
        task.spawn(function()
            local buildSuccess, buildErr = pcall(Builder, Fluent)
            if buildSuccess then
                print("[FSSHUB] UI Builder Completed.")
                getgenv().FSSHUB_MAIN_MENU_READY = true
            else
                warn("[FSSHUB] UI Build Error: " .. tostring(buildErr))
                Notify("FSSHUB Error", "UI Build Failed: " .. tostring(buildErr), 10)
            end
            print("[FSSHUB] All Systems Ready!")
        end)
    else
        warn("[FSSHUB] Bundle Init Failed: " .. tostring(Fluent))
        -- Invalidate potentially corrupted/outdated cache
        if useCache then
            pcall(function()
                if isfile(BUNDLE_PATH) then delfile(BUNDLE_PATH) end
                if isfile(VERSION_PATH) then delfile(VERSION_PATH) end
            end)
            Notify("FSSHUB", "Cache invalidated. Please re-run the script.", 5)
        end
    end

    _G.FSSHUB_STATUS = nil
end
