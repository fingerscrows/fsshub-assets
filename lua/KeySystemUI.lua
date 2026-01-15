-- KeySystemUI.lua (Pure UI)
-- Handles visual elements and user input. No business logic.

local function loadUIFactory()
    return function(Colors, Players, TweenService, UserInputService, Lighting)
        
        local IconAssets = {
            shield = "rbxassetid://84528813312016",
            x = "rbxassetid://73070135088117",
            key = "rbxassetid://128426502701541",
            link = "rbxassetid://73034596791310",
            check = "rbxassetid://83827110621355"
        }
        
        local function createIconImage(id)
            local icon = Instance.new("ImageLabel")
            icon.BackgroundTransparency = 1
            icon.Image = id
            icon.Size = UDim2.new(1, 0, 1, 0)
            return icon
        end
        
        -- UI CLASS
        return function(self)
            local gui = Instance.new("ScreenGui")
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
            
            local backdrop = Instance.new("Frame")
            backdrop.Name = "Backdrop"
            backdrop.Size = UDim2.new(1, 0, 1, 0)
            backdrop.BackgroundColor3 = Colors.background
            backdrop.BackgroundTransparency = 0.3
            backdrop.Parent = gui
            
            local blur = Instance.new("BlurEffect")
            blur.Size = 15
            blur.Parent = game:GetService("Lighting")

            local mainCentering = Instance.new("Frame")
            mainCentering.Name = "Centering"
            mainCentering.Size = UDim2.new(1, 0, 1, 0)
            mainCentering.BackgroundTransparency = 1
            mainCentering.Parent = gui
            
            local container = Instance.new("Frame")
            container.Name = "Container"
            container.Size = UDim2.new(0, 480, 0, 320)
            container.Position = UDim2.new(0.5, 0, 0.5, 0)
            container.AnchorPoint = Vector2.new(0.5, 0.5)
            container.BackgroundColor3 = Colors.surface
            container.BackgroundTransparency = 0.1
            container.ClipsDescendants = true
            container.Parent = mainCentering
            
            local aspectRatio = Instance.new("UIAspectRatioConstraint")
            aspectRatio.AspectRatio = 1.5
            aspectRatio.Parent = container
            
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 16)
            corner.Parent = container
            
            local stroke = Instance.new("UIStroke")
            stroke.Color = Colors.borderLight
            stroke.Thickness = 1
            stroke.Transparency = 0.5
            stroke.Parent = container
            
            local glowTween = TweenService:Create(stroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
                Color = Colors.primary,
                Transparency = 0.2
            })
            glowTween:Play()
            
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
            glassOverlay.Name = "GlassOverlay"
            glassOverlay.Size = UDim2.new(1, 0, 0.5, 0)
            glassOverlay.BackgroundColor3 = Colors.glass
            glassOverlay.BackgroundTransparency = 0.95
            glassOverlay.BorderSizePixel = 0
            glassOverlay.Parent = container
            
            local glassGradient = Instance.new("UIGradient")
            glassGradient.Rotation = 90
            glassGradient.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.8),
                NumberSequenceKeypoint.new(1, 1)
            })
            glassGradient.Parent = glassOverlay
            
            local topBar = Instance.new("Frame")
            topBar.Name = "TopBar"
            topBar.Size = UDim2.new(1, 0, 0, 40)
            topBar.BackgroundColor3 = Colors.surfaceLight
            topBar.BackgroundTransparency = 0.5
            topBar.BorderSizePixel = 0
            topBar.Parent = container

            local iconContainer = Instance.new("Frame")
            iconContainer.Name = "IconContainer"
            iconContainer.Size = UDim2.new(0, 48, 0, 48)
            iconContainer.Position = UDim2.new(0, 16, 0.5, 0)
            iconContainer.AnchorPoint = Vector2.new(0, 0.5)
            iconContainer.BackgroundTransparency = 1
            iconContainer.Parent = topBar
            
            local mainIcon = createIconImage(IconAssets.shield)
            mainIcon.Size = UDim2.new(1, -12, 1, -12)
            mainIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
            mainIcon.AnchorPoint = Vector2.new(0.5, 0.5)
            mainIcon.Parent = iconContainer
            
            local iconGradient = Instance.new("UIGradient")
            iconGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Colors.primary),
                ColorSequenceKeypoint.new(1, Colors.neonBlue)
            })
            iconGradient.Rotation = 45
            iconGradient.Parent = mainIcon
            
            local titleText = Instance.new("TextLabel")
            titleText.Name = "Title"
            titleText.Text = self.title -- Dynamic Title
            titleText.TextColor3 = Colors.textPrimary
            titleText.Font = Enum.Font.GothamBold
            titleText.TextSize = 16
            titleText.TextXAlignment = Enum.TextXAlignment.Left
            titleText.BackgroundTransparency = 1
            titleText.Size = UDim2.new(1, -70, 0, 20)
            titleText.Position = UDim2.new(0, 60, 0.5, -9)
            titleText.AnchorPoint = Vector2.new(0, 0)
            titleText.Parent = topBar
            
            local subtitleText = Instance.new("TextLabel")
            subtitleText.Name = "Subtitle"
            subtitleText.Text = self.subtitle
            subtitleText.TextColor3 = Colors.primary
            subtitleText.Font = Enum.Font.GothamMedium
            subtitleText.TextSize = 10
            subtitleText.TextTransparency = 0.4
            subtitleText.TextXAlignment = Enum.TextXAlignment.Left
            subtitleText.BackgroundTransparency = 1
            subtitleText.Size = UDim2.new(1, -70, 0, 14)
            subtitleText.Position = UDim2.new(0, 60, 0.5, 9)
            subtitleText.Parent = topBar
            
            local inputSection = Instance.new("Frame")
            inputSection.Name = "InputSection"
            inputSection.Size = UDim2.new(1, -64, 1, -80)
            inputSection.Position = UDim2.new(0.5, 0, 0.5, 20)
            inputSection.AnchorPoint = Vector2.new(0.5, 0.5)
            inputSection.BackgroundTransparency = 1
            inputSection.Parent = container
            
            local keyInputContainer = Instance.new("Frame")
            keyInputContainer.Name = "KeyInputContainer"
            keyInputContainer.Size = UDim2.new(1, 0, 0, 42)
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
            
            local keyInput = Instance.new("TextBox")
            keyInput.Name = "Input"
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
            
            local buttonSection = Instance.new("Frame")
            buttonSection.Name = "Buttons"
            buttonSection.Size = UDim2.new(1, 0, 0, 38)
            buttonSection.Position = UDim2.new(0, 0, 0, 50)
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
            
            local getLinkButton = createButton("GetLink", "Get Link", false, IconAssets.link)
            getLinkButton.LayoutOrder = 1
            getLinkButton.Parent = buttonSection
            
            local verifyButton = createButton("Verify", "Verify Key", true, IconAssets.key)
            verifyButton.LayoutOrder = 2
            verifyButton.Parent = buttonSection
            
            local statusBar = Instance.new("Frame")
            statusBar.Name = "StatusBar"
            statusBar.Size = UDim2.new(1, 0, 0, 2)
            statusBar.Position = UDim2.new(0, 0, 1, 0)
            statusBar.AnchorPoint = Vector2.new(0, 1)
            statusBar.BackgroundColor3 = Colors.primary
            statusBar.BackgroundTransparency = 1
            statusBar.BorderSizePixel = 0
            statusBar.Parent = container

            local closeButton = Instance.new("ImageButton")
            closeButton.Name = "Close"
            closeButton.Size = UDim2.new(0, 40, 0, 40)
            closeButton.Position = UDim2.new(1, 0, 0, 0)
            closeButton.AnchorPoint = Vector2.new(1, 0)
            closeButton.BackgroundTransparency = 1
            closeButton.Image = IconAssets.x
            closeButton.ImageColor3 = Colors.textSecondary
            closeButton.ImageTransparency = 0.4
            closeButton.ScaleType = Enum.ScaleType.Fit
            closeButton.SliceScale = 0.4
            closeButton.Parent = topBar 
            
            -- Ambient Particles
            local function createAmbientParticle()
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
            end

            -- Animations Setup
            local function setupAnimations()
                local hoverInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                
                -- Button Animations
                for _, btn in pairs({getLinkButton, verifyButton, closeButton}) do
                    btn.MouseEnter:Connect(function()
                        TweenService:Create(btn, hoverInfo, {ImageTransparency = 0, BackgroundTransparency = btn == closeButton and 1 or (btn.Name == "Verify" and 0 or 0.4)}):Play()
                    end)
                    btn.MouseLeave:Connect(function()
                        TweenService:Create(btn, hoverInfo, {ImageTransparency = 0.4, BackgroundTransparency = btn == closeButton and 1 or (btn.Name == "Verify" and 0.1 or 0.5)}):Play()
                    end)
                    btn.MouseButton1Down:Connect(function()
                        TweenService:Create(btn, hoverInfo, {ImageTransparency = 0.6}):Play()
                    end)
                    btn.MouseButton1Up:Connect(function()
                        TweenService:Create(btn, hoverInfo, {ImageTransparency = 0}):Play()
                    end)
                end
                
                -- Input Glow
                keyInput.Focused:Connect(function()
                    TweenService:Create(keyInput.Parent.UIStroke, hoverInfo, {Color = Colors.primary, Transparency = 0}):Play()
                    TweenService:Create(keyInput.Parent, hoverInfo, {BackgroundTransparency = 0.4}):Play()
                end)
                keyInput.FocusLost:Connect(function()
                    TweenService:Create(keyInput.Parent.UIStroke, hoverInfo, {Color = Colors.borderLight, Transparency = 0.5}):Play()
                    TweenService:Create(keyInput.Parent, hoverInfo, {BackgroundTransparency = 0.5}):Play()
                end)
                
                -- Icon Gradient Animation
                task.spawn(function()
                    while gui.Parent do
                        local rotTween = TweenService:Create(iconGradient, TweenInfo.new(2, Enum.EasingStyle.Linear), {Rotation = 360 + 45})
                        rotTween:Play()
                        rotTween.Completed:Wait()
                        iconGradient.Rotation = 45
                    end
                end)
                
                -- Particles Loop
                task.spawn(function()
                    while gui.Parent do
                        createAmbientParticle()
                        task.wait(0.5)
                    end
                end)
            end
            
            -- Entrance Animation
            local function animateEntrance()
                container.Size = UDim2.new(0, 460, 0, 300)
                container.GroupTransparency = 1
                backdrop.BackgroundTransparency = 1
                
                TweenService:Create(container, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 480, 0, 320),
                    GroupTransparency = 0
                }):Play()
                
                TweenService:Create(backdrop, TweenInfo.new(0.4), {BackgroundTransparency = 0.3}):Play()
            end

            -- Helper: Show Success
            local function showSuccess(text)
                local toast = Instance.new("Frame")
                toast.Name = "Toast"
                toast.Size = UDim2.new(0, 200, 0, 40)
                toast.Position = UDim2.new(0.5, 0, 0.9, 0)
                toast.AnchorPoint = Vector2.new(0.5, 1)
                toast.BackgroundColor3 = Colors.success
                toast.BackgroundTransparency = 0.1
                toast.BorderSizePixel = 0
                toast.Parent = container
                
                local tCorner = Instance.new("UICorner")
                tCorner.CornerRadius = UDim.new(0, 8)
                tCorner.Parent = toast
                
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.Text = text
                label.TextColor3 = Colors.textPrimary
                label.Font = Enum.Font.GothamBold
                label.TextSize = 14
                label.Parent = toast
                
                toast.BackgroundTransparency = 1
                label.TextTransparency = 1
                
                TweenService:Create(toast, TweenInfo.new(0.5), {BackgroundTransparency = 0.1}):Play()
                TweenService:Create(label, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
                
                task.delay(3, function()
                    if toast.Parent then
                        TweenService:Create(toast, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(label, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
                        task.wait(0.5)
                        toast:Destroy()
                    end
                end)
            end

            -- Helper: Update Status
            local function updateStatus(text, color, resetTime)
                statusBar.BackgroundColor3 = color
                
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
                            TweenService:Create(statusBar, TweenInfo.new(0.5), {BackgroundColor3 = Colors.primary}):Play()
                        end
                    end)
                end
            end
            
            -- Helper: Set Loading
            local function setButtonLoading(isBtnLoading)
                local content = verifyButton:FindFirstChild("Content")
                if not content then return end
                
                if isBtnLoading then
                    for _, child in pairs(content:GetChildren()) do
                        if child:IsA("GuiObject") then child.Visible = false end
                    end
                    
                    local spinner = Instance.new("ImageLabel")
                    spinner.Name = "Spinner"
                    spinner.Size = UDim2.new(0, 20, 0, 20)
                    spinner.Position = UDim2.new(0.5, 0, 0.5, 0)
                    spinner.AnchorPoint = Vector2.new(0.5, 0.5)
                    spinner.BackgroundTransparency = 1
                    spinner.Image = "rbxassetid://16966567539"
                    spinner.ImageColor3 = Colors.textPrimary
                    spinner.Parent = verifyButton
                    
                    local rotation = 0
                    local stop = false
                    
                    task.spawn(function()
                        while spinner.Parent and not stop do
                            rotation = rotation + 15
                            TweenService:Create(spinner, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {Rotation = rotation}):Play()
                            task.wait(0.05)
                        end
                    end)

                    verifyButton:SetAttribute("IsLoading", true)
                else
                    local spinner = verifyButton:FindFirstChild("Spinner")
                    if spinner then spinner:Destroy() end
                    for _, child in pairs(content:GetChildren()) do
                        if child:IsA("GuiObject") then child.Visible = true end
                    end
                    verifyButton:SetAttribute("IsLoading", nil)
                end
            end

            -- Helper: Shake Input
            local function shakeInput()
                local originalPos = UDim2.new(0.5, 0, 0.5, 20)
                local intensity = 5
                for i = 1, 6 do
                    local offset = (i % 2 == 0 and -intensity or intensity)
                    TweenService:Create(inputSection, TweenInfo.new(0.05), {Position = originalPos + UDim2.new(0, offset, 0, 0)}):Play()
                    task.wait(0.05)
                end
                TweenService:Create(inputSection, TweenInfo.new(0.05), {Position = originalPos}):Play()
            end
            
            -- Helper: Animate Success
            local function animateSuccess()
                TweenService:Create(statusBar, TweenInfo.new(0.5), {BackgroundColor3 = Colors.success}):Play()
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
            end
            
            -- Return Elements & Control
            setupAnimations()
            animateEntrance()

            return {
                Gui = gui,
                KeyInput = keyInput,
                VerifyButton = verifyButton,
                GetLinkButton = getLinkButton,
                CloseButton = closeButton,
                ShowSuccess = showSuccess,
                UpdateStatus = updateStatus,
                SetButtonLoading = setButtonLoading,
                ShakeInput = shakeInput,
                AnimateSuccess = animateSuccess,
                Close = function()
                    if gui then gui:Destroy() end
                end
            }
        end
    end
end

-- MODULE INTERFACE
local UI = {}
UI.__index = UI

function UI.new(options)
    local self = setmetatable({}, UI)
    self.options = options or {}
    self.title = self.options.title or "FSSHUB OFFICIAL"
    self.subtitle = self.options.subtitle or "SECURITY GATEWAY"
    
    self.Events = {
        OnVerify = nil,
        OnGetLink = nil,
        OnClose = nil
    }
    return self
end

function UI:Create()
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local Lighting = game:GetService("Lighting")
    
    local Colors = {
        background = Color3.fromRGB(13, 17, 23),
        surface = Color3.fromRGB(22, 27, 34),
        surfaceLight = Color3.fromRGB(30, 36, 44),
        primary = Color3.fromRGB(88, 166, 255),
        primaryDark = Color3.fromRGB(58, 136, 225),
        primaryGlow = Color3.fromRGB(120, 180, 255),
        accent = Color3.fromRGB(136, 87, 224),
        success = Color3.fromRGB(47, 183, 117),
        successDark = Color3.fromRGB(37, 153, 97),
        successGlow = Color3.fromRGB(67, 203, 137),
        error = Color3.fromRGB(248, 81, 73),
        textPrimary = Color3.fromRGB(230, 237, 243),
        textSecondary = Color3.fromRGB(139, 148, 158),
        textMuted = Color3.fromRGB(110, 118, 129),
        border = Color3.fromRGB(48, 54, 61),
        borderLight = Color3.fromRGB(63, 71, 79),
        glass = Color3.fromRGB(255, 255, 255),
        neonBlue = Color3.fromRGB(0, 229, 255),
        neonPurple = Color3.fromRGB(187, 134, 252)
    }

    local createUI = loadUIFactory()
    local uiBuilder = createUI(Colors, Players, TweenService, UserInputService, Lighting)
    local controls = uiBuilder(self)
    
    -- Bind Events
    controls.VerifyButton.MouseButton1Click:Connect(function()
        if self.Events.OnVerify then
            local key = controls.KeyInput.Text:gsub("%s+", "")
            self.Events.OnVerify(key, controls)
        end
    end)
    
    controls.KeyInput.FocusLost:Connect(function(enter)
        if enter and self.Events.OnVerify then
            local key = controls.KeyInput.Text:gsub("%s+", "")
            self.Events.OnVerify(key, controls)
        end
    end)
    
    controls.GetLinkButton.MouseButton1Click:Connect(function()
        if self.Events.OnGetLink then
            self.Events.OnGetLink(controls)
        end
    end)
    
    controls.CloseButton.MouseButton1Click:Connect(function()
        if self.Events.OnClose then
            self.Events.OnClose()
        end
        controls.Close()
    end)

    return controls
end

return UI
