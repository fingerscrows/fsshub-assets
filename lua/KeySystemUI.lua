local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local UI = {}

-- Sentinel Style Colors
local Colors = {
    Background = Color3.fromRGB(15, 15, 20),      -- LoaderBg
    InputBg = Color3.fromRGB(15, 15, 15),         -- InputBg
    Button = Color3.fromRGB(47, 47, 47),          -- ButtonStatic
    Stroke = Color3.fromRGB(29, 29, 29),          -- StrokeLight
    Accent = Color3.fromRGB(113, 56, 255),        -- StrokeAccent / Primary
    TextWhite = Color3.fromRGB(255, 255, 255),
    TextDim = Color3.fromRGB(220, 220, 220),
    TextPlaceholder = Color3.fromRGB(68, 63, 79),
    Success = Color3.fromRGB(83, 156, 70),
    Error = Color3.fromRGB(156, 63, 99)
}

UI.Keys = {
    MainTitle = "Junkie", -- Default, will be overwritten by loader
    MainDesc = "Please enter your key to continue"
}

-- Icons (RBXAssetIDs)
local Icons = {
    Logo = "rbxassetid://101364305979184", -- Sentinel Logo as placeholder/default
    Key = "rbxassetid://6031215978",
    Link = "rbxassetid://6034509993",
    Close = "rbxassetid://6031094678"
}

local gui, container, inputSection
local blur

local function createGradient(parent, color1, color2)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, color1),
        ColorSequenceKeypoint.new(1, color2)
    }
    gradient.Parent = parent
    return gradient
end

function UI.Initialize(config)
    local validateCallback = config.Function or config.validateCallback
    local keyLink = config.KeyLink or config.keyLink or "https://fsshub.com/getkey"

    if gui then gui:Destroy() end

    gui = Instance.new("ScreenGui")
    gui.Name = "FSSHUB_Sentinel_Loader"
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 10000
    
    -- Protect GUI
    if syn and syn.protect_gui then
        syn.protect_gui(gui)
        gui.Parent = CoreGui
    elseif gethui then
        gui.Parent = gethui()
    else
        gui.Parent = CoreGui
    end

    -- Blur
    blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = game:GetService("Lighting")
    TweenService:Create(blur, TweenInfo.new(0.5), {Size = 15}):Play()

    -- Main Container (Sentinel Style)
    container = Instance.new("Frame")
    container.Name = "MainContainer"
    container.Size = UDim2.new(0, 500, 0, 350) 
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundColor3 = Colors.Background
    container.BorderSizePixel = 0
    container.BackgroundTransparency = 1 -- Start hidden
    container.Parent = gui

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 6)
    uiCorner.Parent = container

    -- Stroke with Gradient
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 1.5
    uiStroke.Transparency = 0
    uiStroke.Parent = container
    createGradient(uiStroke, Colors.Accent, Color3.fromRGB(145, 99, 240)) -- AccentGradient

    -- Elegant 'F' Logo
    local logoLabel = Instance.new("TextLabel")
    logoLabel.Name = "LogoF"
    logoLabel.Text = "F"
    logoLabel.Font = Enum.Font.Bodoni
    logoLabel.TextSize = 80
    logoLabel.TextColor3 = Colors.Accent
    logoLabel.Size = UDim2.new(0, 100, 0, 100)
    logoLabel.Position = UDim2.new(0.5, 0, 0, 20)
    logoLabel.AnchorPoint = Vector2.new(0.5, 0)
    logoLabel.BackgroundTransparency = 1
    logoLabel.Parent = container
    
    -- Gradient for Logo
    local logoGradient = createGradient(logoLabel, Colors.Accent, Color3.new(1,1,1))
    logoGradient.Rotation = 45

    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Text = UI.Keys.MainTitle
    title.Font = Enum.Font.GothamBold
    title.TextSize = 24
    title.TextColor3 = Colors.TextWhite
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 110)
    title.BackgroundTransparency = 1
    title.Parent = container

    -- Description
    local desc = Instance.new("TextLabel")
    desc.Name = "Description"
    desc.Text = UI.Keys.MainDesc
    desc.Font = Enum.Font.Gotham
    desc.TextSize = 14
    desc.TextColor3 = Colors.TextDim
    desc.Size = UDim2.new(1, 0, 0, 20)
    desc.Position = UDim2.new(0, 0, 0, 140)
    desc.BackgroundTransparency = 1
    desc.Parent = container

    -- Input Box
    inputSection = Instance.new("Frame")
    inputSection.Name = "InputSection"
    inputSection.Size = UDim2.new(1, -60, 0, 45)
    inputSection.Position = UDim2.new(0.5, 0, 0, 200)
    inputSection.AnchorPoint = Vector2.new(0.5, 0)
    inputSection.BackgroundColor3 = Colors.InputBg
    inputSection.Parent = container

    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 4)
    inputCorner.Parent = inputSection

    local inputStroke = Instance.new("UIStroke")
    inputStroke.Color = Colors.Stroke
    inputStroke.Thickness = 1
    inputStroke.Parent = inputSection

    local keyInput = Instance.new("TextBox")
    keyInput.Name = "KeyInput"
    keyInput.Size = UDim2.new(1, -20, 1, 0)
    keyInput.Position = UDim2.new(0, 10, 0, 0)
    keyInput.BackgroundTransparency = 1
    keyInput.Font = Enum.Font.Gotham
    keyInput.Text = ""
    keyInput.PlaceholderText = "Enter Key"
    keyInput.PlaceholderColor3 = Colors.TextPlaceholder
    keyInput.TextColor3 = Colors.TextWhite
    keyInput.TextSize = 14
    keyInput.Parent = inputSection

    -- Buttons Logic
    local function createButton(text, pos, primary, callback)
        local btn = Instance.new("TextButton")
        btn.Name = text
        btn.Size = UDim2.new(0.5, -35, 0, 40)
        btn.Position = pos
        btn.BackgroundColor3 = Colors.Button
        btn.Text = text
        btn.Font = Enum.Font.GothamBold
        btn.TextColor3 = Colors.TextWhite
        btn.TextSize = 14
        btn.Parent = container
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 4)
        btnCorner.Parent = btn

        local btnStroke = Instance.new("UIStroke")
        btnStroke.Color = Colors.Stroke
        btnStroke.Thickness = 1
        btnStroke.Parent = btn

        if primary then
             btnStroke.Color = Colors.Accent
             -- Optional: Add gradient to stroke if desired for valid button
        end

        -- Hover Effects
        btn.MouseEnter:Connect(function()
            TweenService:Create(btnStroke, TweenInfo.new(0.3), {Color = Colors.Accent}):Play()
            TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btnStroke, TweenInfo.new(0.3), {Color = primary and Colors.Accent or Colors.Stroke}):Play()
            TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundColor3 = Colors.Button}):Play()
        end)
        
        btn.MouseButton1Click:Connect(function() 
            callback()
             -- Squish effect
            local originalSize = btn.Size
            TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset - 2, originalSize.Y.Scale, originalSize.Y.Offset - 2)}):Play()
            task.wait(0.1)
            TweenService:Create(btn, TweenInfo.new(0.1), {Size = originalSize}):Play()
        end)
    end

    -- Get Key Button
    createButton("Get Key", UDim2.new(0, 30, 0, 260), false, function()
        if setclipboard then
            setclipboard(keyLink)
            UI.ShowStatus("Copied to clipboard!", Colors.Success)
        else
            UI.ShowStatus("Link: "..keyLink, Colors.Accent)
        end
    end)

    -- Check Key Button
    createButton("Check Key", UDim2.new(0.5, 5, 0, 260), true, function()
        local input = keyInput.Text:gsub("%s+", "")
        if input == "" then
             UI.ShowStatus("Please enter a key", Colors.Error)
             UI.ShakeInput()
             return
        end
        if validateCallback then validateCallback(input) end
    end)
    
    -- Auto-check on Enter
    keyInput.FocusLost:Connect(function(enter)
        if enter then
             local input = keyInput.Text:gsub("%s+", "")
             if input ~= "" and validateCallback then validateCallback(input) end
        end
    end)

    UI.AnimateEntrance(container)
end

function UI.ShowStatus(msg, color)
    local label = Instance.new("TextLabel")
    label.Text = msg
    label.TextColor3 = color
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Position = UDim2.new(0, 0, 0, 310)
    label.BackgroundTransparency = 1
    label.TextTransparency = 1
    label.Parent = container
    
    TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    task.delay(2, function()
        TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
         task.wait(0.3)
         label:Destroy()
    end)
    
    if color == Colors.Error then
         -- Auto reset input logic reused
         local input = container:FindFirstChild("InputSection") and container.InputSection:FindFirstChild("KeyInput")
         if input then task.delay(0.5, function() input.Text = "" end) end
    end
end

function UI.ShakeInput()
   -- Simple shake
   local input = container:FindFirstChild("InputSection") 
   if not input then return end
   local originalPos = UDim2.new(0.5, 0, 0, 200)
    for i=1,6 do
        local offset = (i%2==0 and -5 or 5)
        input.Position = originalPos + UDim2.new(0, offset, 0, 0)
        task.wait(0.05)
    end
     input.Position = originalPos
end

function UI.ShowError(msg)
    UI.ShowStatus(msg, Colors.Error)
    UI.ShakeInput()
end

function UI.AnimateEntrance(frame)
   frame.Position = UDim2.new(0.5, 0, 0.45, 0)
   frame.BackgroundTransparency = 1
   -- Fade In + Slide Up
   TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 0
   }):Play()
   
   -- Fade in descendants (manual loop)
   for _, child in pairs(frame:GetDescendants()) do
      if child:IsA("GuiObject") then
           local originalTrans = child.BackgroundTransparency
           local originalTextTrans = 0
           if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                originalTextTrans = child.TextTransparency
                if originalTextTrans == 0 then
                     child.TextTransparency = 1
                     TweenService:Create(child, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
                end
           end
           if (child:IsA("ImageLabel") or child:IsA("ImageButton")) and child.ImageTransparency == 0 then
                child.ImageTransparency = 1
                TweenService:Create(child, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
           end
      end
   end
end

function UI.Authorize()
    UI.ShowStatus("Successfully Verified!", Colors.Success)
    task.wait(1)
    UI.Close()
end

function UI.Fail()
   UI.ShowStatus("Invalid Key", Colors.Error)
   UI.ShakeInput()
end

function UI.Close()
   if blur then TweenService:Create(blur, TweenInfo.new(0.5), {Size = 0}):Play() end
   if container then
       TweenService:Create(container, TweenInfo.new(0.5), {Position = UDim2.new(0.5, 0, 0.45, 0), BackgroundTransparency = 1}):Play()
   end
   task.wait(0.5)
   if gui then gui:Destroy() end
   if blur then blur:Destroy() end
end

return UI
