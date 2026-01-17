--[[
    FSSHUB UI Library
    Hosted on GitHub: fsshub-assets/fsshub_ui_lib.lua

    Architecture:
    - Separates Logic from Configuration
    - Integrates Advanced Toasts (Lilias inspired)
    - Integrates Persistent Key Storage
    - Main UI logic for Junkie Key System
]]

local Lib = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

-- ============================================================================
-- UTILITIES
-- ============================================================================
local Utils = {}

function Utils.Tween(obj, props, time, style, dir)
    local info = TweenInfo.new(time or 0.3, style or Enum.EasingStyle.Quart, dir or Enum.EasingDirection.Out)
    local tween = TweenService:Create(obj, info, props)
    tween:Play()
    return tween
end

function Utils.Round(obj, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 8)
    corner.Parent = obj
    return corner
end

function Utils.Stroke(obj, color, thickness, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Color3.new(1, 1, 1)
    stroke.Thickness = thickness or 1
    stroke.Transparency = transparency or 0
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = obj
    return stroke
end

function Utils.randomString(len)
    local s = ""
    for i = 1, len do s = s .. string.char(math.random(65, 90)) end
    return s
end

-- ============================================================================
-- KEY STORAGE SYSTEM
-- ============================================================================
local KeyStorage = {}

function KeyStorage.Init(fileName)
    KeyStorage.FileName = fileName or "FSSHUB_Key.txt"
end

function KeyStorage.Save(key)
    if writefile then
        pcall(function() writefile(KeyStorage.FileName, key) end)
    end
end

function KeyStorage.Load()
    if isfile and isfile(KeyStorage.FileName) then
        local success, content = pcall(function() return readfile(KeyStorage.FileName) end)
        if success then return content end
    end
    return nil
end

-- ============================================================================
-- TOAST SYSTEM (Advanced Notification)
-- ============================================================================
local ToastSystem = {
    ActiveToasts = {},
    MaxToasts = 3,
    Container = nil
}

function ToastSystem.Notify(title, message, duration, type, colors)
    if not ToastSystem.Container then return end

    local toastHeight = 50
    local toastColor = (type == "error" and colors.Error) or
        (type == "success" and colors.Success) or
        (type == "info" and colors.Info) or colors.Accent

    -- Manage Queue
    if #ToastSystem.ActiveToasts >= ToastSystem.MaxToasts then
        local oldest = table.remove(ToastSystem.ActiveToasts, 1)
        if oldest and oldest.Parent then
            Utils.Tween(oldest, { BackgroundTransparency = 1 }, 0.2).Completed:Wait(); oldest:Destroy()
        end
    end

    -- Create Toast
    local toast = Instance.new("Frame")
    toast.Size = UDim2.new(0, 0, 0, toastHeight) -- Start width 0
    toast.Position = UDim2.new(0.5, 0, 0.1, (#ToastSystem.ActiveToasts * (toastHeight + 10)))
    toast.AnchorPoint = Vector2.new(0.5, 0)
    toast.BackgroundColor3 = colors.InputBg
    toast.BackgroundTransparency = 0.2
    toast.Parent = ToastSystem.Container

    Utils.Round(toast, 8)
    local stroke = Utils.Stroke(toast, toastColor, 1, 0.5)

    local label = Instance.new("TextLabel")
    label.Text = title .. ": " .. message
    label.TextColor3 = toastColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.Size = UDim2.new(1, -20, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.TextTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toast

    -- Animate In
    Utils.Tween(toast, { Size = UDim2.new(0, 300, 0, toastHeight) }, 0.4)
    task.delay(0.2, function() Utils.Tween(label, { TextTransparency = 0 }, 0.3) end)

    table.insert(ToastSystem.ActiveToasts, toast)

    -- Auto Dismiss
    task.delay(duration or 3, function()
        if toast.Parent then
            Utils.Tween(label, { TextTransparency = 1 }, 0.2)
            local t = Utils.Tween(toast, { Size = UDim2.new(0, 0, 0, toastHeight) }, 0.3)
            t.Completed:Wait()
            toast:Destroy()
            -- Remove from table if exists
            for i, v in ipairs(ToastSystem.ActiveToasts) do
                if v == toast then
                    table.remove(ToastSystem.ActiveToasts, i)
                    break
                end
            end
        end
    end)
end

-- ============================================================================
-- MAIN LIBRARY
-- ============================================================================

function Lib.Initialize(Config)
    local Config = Config or {}
    local Colors = Config.Colors
    local Assets = Config.Assets
    local Settings = Config.Settings or {}
    local ValidateFunc = Config.Function

    if Settings.FileName then KeyStorage.Init(Settings.FileName) end

    -- Cleanup
    if CoreGui:FindFirstChild("FSSHUB_UI_Lib") then CoreGui.FSSHUB_UI_Lib:Destroy() end

    -- GUI Creation
    local gui = Instance.new("ScreenGui")
    gui.Name = "FSSHUB_UI_Lib"
    gui.IgnoreGuiInset = true
    if gethui then gui.Parent = gethui() else gui.Parent = CoreGui end

    -- Blur
    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = game:GetService("Lighting")
    Utils.Tween(blur, { Size = 24 }, 0.5)

    -- Toast Container
    ToastSystem.Container = Instance.new("Frame")
    ToastSystem.Container.Size = UDim2.new(1, 0, 1, 0)
    ToastSystem.BackgroundTransparency = 1
    ToastSystem.Parent = gui

    -- Main Container
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 400, 0, 0) -- Start Height 0
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundColor3 = Colors.Background
    container.BackgroundTransparency = 0.25
    container.ClipsDescendants = true
    container.Parent = gui

    Utils.Round(container, 12)
    Utils.Stroke(container, Colors.MainStroke, 2, 0.2)

    -- Galaxy Effect (Simplified)
    local galaxyObj = Instance.new("Frame")
    galaxyObj.Size = UDim2.new(1, 0, 1, 0)
    galaxyObj.BackgroundTransparency = 1
    galaxyObj.Parent = container
    task.spawn(function()
        while gui.Parent do
            local p = Instance.new("Frame")
            p.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
            p.Position = UDim2.new(math.random(), 0, math.random(), 0)
            p.BackgroundColor3 = Colors.Accent
            p.BackgroundTransparency = 0.5
            p.Parent = galaxyObj
            Utils.Round(p, 2)
            Utils.Tween(p,
                { Position = p.Position + UDim2.new(math.random(-0.1, 0.1), 0, math.random(-0.1, 0.1), 0), BackgroundTransparency = 1 },
                math.random(3, 5))
            game.Debris:AddItem(p, 5)
            task.wait(0.1)
        end
    end)

    -- UI Elements Ref
    local Elements = {}

    -- Close Button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Colors.TextDim
    closeBtn.BackgroundTransparency = 1
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -30, 0, 0)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 18
    closeBtn.Parent = container
    closeBtn.MouseButton1Click:Connect(function()
        Utils.Tween(container, { Size = UDim2.new(0, 0, 0, 0) }, 0.3).Completed:Wait()
        gui:Destroy()
        blur:Destroy()
    end)

    -- Logo & Title Logic
    local currentY = 20
    if Assets.Logo then
        local logo = Instance.new("ImageLabel")
        logo.Image = Assets.Logo.ID
        logo.Size = Assets.Logo.Size
        logo.Position = UDim2.new(0.5, 0, 0, currentY)
        logo.AnchorPoint = Vector2.new(0.5, 0)
        logo.BackgroundTransparency = 1
        logo.Parent = container
        currentY = currentY + Assets.Logo.Size.Y.Offset + 10
    end

    local title = Instance.new("TextLabel")
    title.Text = Config.Title
    title.Font = Enum.Font.GothamBold
    title.TextSize = 24
    title.TextColor3 = Colors.Accent
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, currentY)
    title.BackgroundTransparency = 1
    title.Parent = container
    currentY = currentY + 30

    local desc = Instance.new("TextLabel")
    desc.Text = Config.Desc
    desc.Font = Enum.Font.Gotham
    desc.TextSize = 12
    desc.TextColor3 = Colors.TextDim
    desc.Size = UDim2.new(1, 0, 0, 20)
    desc.Position = UDim2.new(0, 0, 0, currentY)
    desc.BackgroundTransparency = 1
    desc.Parent = container
    currentY = currentY + 40

    -- Input Area
    local inputFrame = Instance.new("Frame")
    inputFrame.Size = UDim2.new(0.85, 0, 0, 42)
    inputFrame.Position = UDim2.new(0.5, 0, 0, currentY)
    inputFrame.AnchorPoint = Vector2.new(0.5, 0)
    inputFrame.BackgroundColor3 = Colors.InputBg
    inputFrame.BackgroundTransparency = 0.5
    inputFrame.Parent = container
    Utils.Round(inputFrame, 6)
    Utils.Stroke(inputFrame, Colors.TextDim, 1, 0.5)

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(1, -20, 1, 0)
    input.Position = UDim2.new(0, 10, 0, 0)
    input.BackgroundTransparency = 1
    input.TextColor3 = Colors.TextHigh
    input.PlaceholderText = "Enter Key Here..."
    input.Text = ""
    input.Font = Enum.Font.Code
    input.TextSize = 14
    input.Parent = inputFrame
    Elements.Input = input

    -- Auto Load Key
    local savedKey = KeyStorage.Load()
    if savedKey then
        input.Text = savedKey
        ToastSystem.Notify("System", "Restored saved key.", 2, "info", Colors)
    end

    currentY = currentY + 60

    -- Buttons
    local function createButton(text, posScale, primary, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.4, 0, 0, 35)
        btn.Position = UDim2.new(posScale, 0, 0, currentY)
        btn.AnchorPoint = Vector2.new(0.5, 0)
        btn.BackgroundColor3 = Colors.ButtonBg
        btn.BackgroundTransparency = 0.3
        btn.Text = text
        btn.TextColor3 = primary and Colors.Accent or Colors.TextDim
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.Parent = container
        Utils.Round(btn, 8)
        local s = Utils.Stroke(btn, primary and Colors.Accent or Colors.TextDim, 1, 0.5)

        btn.MouseEnter:Connect(function()
            Utils.Tween(s, { Color = Colors.TextHigh }, 0.2)
            btn.TextColor3 = Colors.TextHigh
        end)
        btn.MouseLeave:Connect(function()
            Utils.Tween(s, { Color = primary and Colors.Accent or Colors.TextDim }, 0.2)
            btn.TextColor3 = primary and Colors.Accent or Colors.TextDim
        end)

        btn.MouseButton1Click:Connect(callback)
        return btn
    end

    createButton("Get Key", 0.25, false, function()
        if setclipboard then
            setclipboard(Config.KeyLink or "")
            ToastSystem.Notify("Link", "Key link copied to clipboard!", 3, "success", Colors)
        end
    end)

    local verifyBtn = createButton("Verify Key", 0.75, true, function()
        local key = input.Text:gsub("%s+", "")
        if key == "" then
            -- Shake Effect
            local origPos = inputFrame.Position
            for i = 1, 5 do
                inputFrame.Position = origPos + UDim2.new(0, math.random(-5, 5), 0, 0)
                task.wait(0.05)
            end
            inputFrame.Position = origPos
            ToastSystem.Notify("Error", "Please enter a key.", 2, "error", Colors)
            return
        end

        -- Loading Spinner state
        Elements.VerifyBtn.Text = "Verifying..."

        task.spawn(function()
            if ValidateFunc then
                local res = ValidateFunc(key)
                if res == true then
                    ToastSystem.Notify("Success", "Key Valid! Loading Hub...", 3, "success", Colors)

                    if Settings.AutoSaveKey then KeyStorage.Save(key) end

                    -- Transition
                    Utils.Tween(container, { Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1 }, 0.5)
                    task.wait(0.5)
                    gui:Destroy()
                    blur:Destroy()

                    -- Callback Success
                    if Config.OnSuccess then Config.OnSuccess() end
                else
                    ToastSystem.Notify("Error", "Invalid Key. Please try again.", 3, "error", Colors)
                    Elements.VerifyBtn.Text = "Verify Key"
                    -- Shake
                    local origPos = inputFrame.Position
                    for i = 1, 5 do
                        inputFrame.Position = origPos + UDim2.new(0, math.random(-5, 5), 0, 0)
                        task.wait(0.05)
                    end
                    inputFrame.Position = origPos
                end
            end
        end)
    end)
    Elements.VerifyBtn = verifyBtn

    -- Final Size Calculation
    local finalHeight = currentY + 50

    -- Open Animation
    Utils.Tween(container, { Size = UDim2.new(0, 400, 0, finalHeight) }, 0.6, Enum.EasingStyle.Back)
end

function Lib.GetKey()
    return KeyStorage.Load()
end

return Lib
