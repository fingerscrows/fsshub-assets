--[[
    FSSHUB Main Menu - Fluent Renewed (v4.0.8)
    Universal FREE + PREMIUM Features
    Workspace: FSSHUBLibrary/
]]

-- Production mode: disable verbose logging (set by payload)
local PRODUCTION = getgenv().FSSHUB_PRODUCTION or false
local function Log(msg)
    if not PRODUCTION then
        print("[FSSHUB] " .. tostring(msg))
    end
end

if not getgenv().FSSHUB_INFO then
    warn("[FSSHUB] Error: FSSHUB_INFO not found.")
    return
end

-- Cleanup Old UI
if _G.FSSHUB_FLUENT then 
    pcall(function() _G.FSSHUB_FLUENT:Destroy() end) 
end
_G.FSSHUB_WINDOW = nil

local Info = getgenv().FSSHUB_INFO

-- Loading GUI
local function CreateLoadingGui()
    if _G.FSSHUB_LOADING_GUI then pcall(function() _G.FSSHUB_LOADING_GUI:Destroy() end) end
    
    local TweenService = game:GetService("TweenService")
    local gui = Instance.new("ScreenGui")
    gui.Name = "FSSHUB_Loading"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 100 -- Ensure it's on top
    
    local parent = gethui and gethui() or game:GetService("CoreGui")
    pcall(function() gui.Parent = parent end)
    
    _G.FSSHUB_LOADING_GUI = gui
    
    -- Main Container (Bottom Center)
    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.fromOffset(300, 70)
    container.Position = UDim2.fromScale(0.5, 0.85) -- Bottom center
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    container.BackgroundTransparency = 0.1
    container.BorderSizePixel = 0
    container.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = container

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = container
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -20, 0, 20)
    title.Position = UDim2.new(0, 10, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "FSSHUB"
    title.TextColor3 = Color3.fromRGB(240, 240, 240)
    title.TextSize = 16
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = container

    -- Status Text (Dynamic)
    local status = Instance.new("TextLabel")
    status.Name = "Status"
    status.Size = UDim2.new(1, -20, 0, 15)
    status.Position = UDim2.new(0, 10, 0, 30)
    status.BackgroundTransparency = 1
    status.Text = "Initializing..."
    status.TextColor3 = Color3.fromRGB(160, 160, 160)
    status.TextSize = 12
    status.Font = Enum.Font.Gotham
    status.TextXAlignment = Enum.TextXAlignment.Left
    status.Parent = container
    
    -- Progress Bar Background
    local barBg = Instance.new("Frame")
    barBg.Name = "BarBackground"
    barBg.Size = UDim2.new(1, -20, 0, 4)
    barBg.Position = UDim2.new(0, 10, 0, 55)
    barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    barBg.BorderSizePixel = 0
    barBg.Parent = container
    
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(0, 2)
    barCorner.Parent = barBg
    
    -- Progress Bar Fill
    local barFill = Instance.new("Frame")
    barFill.Name = "BarFill"
    barFill.Size = UDim2.fromScale(0, 1) -- Start at 0 width
    barFill.BackgroundColor3 = Color3.fromRGB(0, 120, 215) -- Fluent Blue
    barFill.BorderSizePixel = 0
    barFill.Parent = barBg
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 2)
    fillCorner.Parent = barFill

    -- Gradient for extra polish
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 160, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 190))
    }
    gradient.Parent = barFill
    
    -- Animations
    container.GroupTransparency = 1
    TweenService:Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {GroupTransparency = 0}):Play()
    container.Position = UDim2.fromScale(0.5, 0.9)
    TweenService:Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.fromScale(0.5, 0.85)}):Play()
    
    return {
        Gui = gui,
        Update = function(progress, text)
            if not gui.Parent then return end
            status.Text = text or status.Text
            TweenService:Create(barFill, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.fromScale(math.clamp(progress, 0, 1), 1)}):Play()
        end,
        Destroy = function()
            TweenService:Create(container, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {GroupTransparency = 1, Position = UDim2.fromScale(0.5, 0.9)}):Play()
            task.delay(0.3, function()
                if gui and gui.Parent then gui:Destroy() end
                _G.FSSHUB_LOADING_GUI = nil
            end)
        end
    }
end

local Loading = CreateLoadingGui()

-- LOAD FLUENT RENEWED (v4.0.8 with FSSHUBLibrary workspace)
local Fluent
local loadStart = tick()

Loading.Update(0.1, "Checking resources...")

-- Check if Fluent was pre-loaded by payload (parallel loading optimization)
if getgenv().FSSHUB_GET_FLUENT then
    Loading.Update(0.2, "Syncing resources...")
    Log("Checking for pre-loaded Fluent...")
    Fluent = getgenv().FSSHUB_GET_FLUENT(8) -- Wait up to 8 seconds
    if Fluent then
        Loading.Update(0.8, "Resources synced (Instant)")
        Log("Using pre-loaded Fluent (instant!)")
    end
end

-- Fallback to normal loading if pre-load failed
if not Fluent then
    Loading.Update(0.3, "Downloading library...")
    Log("Fallback: Loading Fluent normally...")
    Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/fluent_loader.lua?v=4.0.8"))()
end

Loading.Update(0.9, "Initializing UI...")
Log("Fluent ready in " .. string.format("%.2f", tick() - loadStart) .. "s")

-- Remove Loading GUI
if _G.FSSHUB_LOADING_GUI then
    Loading.Update(1, "Launching...")
    task.delay(0.5, function()
        Loading.Destroy()
    end)
end

-- Event System
-- Event Bus (Centralized in Payload)
if not _G.FSSHUB_EVENTS then
    warn("[FSSHUB] Global Event Bus not found! Critical features may fail.")
    -- Fallback for testing/standalone
    _G.FSSHUB_EVENTS = {
        listeners = {},
        Emit = function(self, name, ...)
             if self.listeners[name] then
                for _, cb in ipairs(self.listeners[name]) do pcall(cb, ...) end
            end
        end,
        On = function(self, name, cb)
            self.listeners[name] = self.listeners[name] or {}
            table.insert(self.listeners[name], cb)
        end
    }
end

local Events = _G.FSSHUB_EVENTS
_G.FSSHUB_EVENTS = Events

-- Context
local rawPremium = Info.User.IsPremium
local isPremium = (rawPremium == true) or (rawPremium == 1) or (rawPremium == "true")
local username = Info.User.Username or "User"
local tier = Info.User.Tier or "Free"

local expiryTimestamp = Info.User.ExpiryTimestamp or 0
local gameName = Info.Game.Name or "Universal"
local version = Info.Version or "v3.5.0"

local function formatExpiry()
    if expiryTimestamp == 0 then return "Lifetime ∞" end
    local rem = expiryTimestamp - os.time()
    if rem <= 0 then return "Expired" end
    local d = math.floor(rem / 86400)
    local h = math.floor((rem % 86400) / 3600)
    local m = math.floor((rem % 3600) / 60)
    return d > 0 and string.format("%dd %02d:%02d", d, h, m) or string.format("%02d:%02d", h, m)
end

-- Window
local Window = Fluent:Window({
    Title = isPremium and "FSSHUB 👑 | " .. gameName or "FSSHUB | " .. gameName,
    SubTitle = version .. (isPremium and " Premium" or ""),
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Resize = false, -- Disabled for testing
    MinimizeKey = Enum.KeyCode.RightControl,
    Acrylic = false, -- Disabled for testing
    Theme = "Dark" -- Changed to a known working theme
})

local Tabs = {
    Home = Window:Tab({ Title = "Dashboard", Icon = "home" }),
    Movement = Window:Tab({ Title = "Movement", Icon = "footprints" }),
    Visual = Window:Tab({ Title = "Visual", Icon = "eye" }),
    Utility = Window:Tab({ Title = "Utility", Icon = "wrench" }),
    Player = Window:Tab({ Title = "Player", Icon = "user" }),
    Settings = Window:Tab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-- Helper for Toggles
local function Toggle(tab, id, title, default, callback, keybind)
    local config = {
        Title = title,
        Default = default,
        Callback = callback
    }
    local toggle = tab:Toggle(id, config)
    
    if keybind then
        toggle:Keybind("Key_"..id, {
            Title = "Keybind",
            Default = keybind,
            Mode = "Toggle"
        })
    end
    return toggle
end

-- ========== HOME TAB ==========
Tabs.Home:Paragraph("WelcomePara", {
    Title = isPremium and "Welcome, Premium User! 👑" or "Welcome to FSSHub",
    Content = "Hello, " .. username .. "\nTier: " .. tier
})

local ExpiryPara = Tabs.Home:Paragraph("ExpiryPara", {
    Title = "Subscription",
    Content = "Expires: " .. formatExpiry()
})

task.spawn(function()
    while _G.FSSHUB_WINDOW do
        task.wait(1)
        if ExpiryPara.SetValue then
             ExpiryPara:SetValue("Expires: " .. formatExpiry()) -- Fluent Renewed likely uses SetValue or direct prop update
        end
    end
end)

Tabs.Home:Button({
    Title = "Join Discord",
    Description = "Support & Premium",
    Callback = function()
        setclipboard("https://discord.gg/fsshub")
        Fluent:Notify({ Title = "Copied!", Content = "Discord link copied", Duration = 3 })
    end
})

-- ========== MOVEMENT TAB ==========
-- Free
local speedEnabled, speedValue = false, 16
Toggle(Tabs.Movement, "WalkSpeed", "Walk Speed", false, function(v)
    speedEnabled = v
    Events:Emit("toggle_speed", speedEnabled, speedValue)
end, Enum.KeyCode.LeftBracket)

Tabs.Movement:Slider("SpeedValue", {
    Title = "Speed", Default = 16, Min = 16, Max = 500, Rounding = 0,
    Callback = function(v) 
        speedValue = v
        if speedEnabled then Events:Emit("toggle_speed", true, v) end 
    end
})

local jumpEnabled, jumpValue = false, 50
Toggle(Tabs.Movement, "JumpPower", "Jump Power", false, function(v)
    jumpEnabled = v
    Events:Emit("toggle_jump", jumpEnabled, jumpValue)
end, Enum.KeyCode.RightBracket)

Tabs.Movement:Slider("JumpValue", {
    Title = "Jump", Default = 50, Min = 50, Max = 500, Rounding = 0,
    Callback = function(v) 
        jumpValue = v
        if jumpEnabled then Events:Emit("toggle_jump", true, v) end 
    end
})

Toggle(Tabs.Movement, "InfiniteJump", "Infinite Jump", false, function(v)
    Events:Emit("toggle_infinitejump", v)
end)

-- Premium
if isPremium then
    Tabs.Movement:Paragraph("PremiumHeader", { Title = "Premium Features", Content = "Exclusive movement controls" })
    
    local flySpeed = 50
    local FlyToggle = Toggle(Tabs.Movement, "Fly", "Fly Mode", false, function(v)
        Events:Emit("toggle_fly", v, flySpeed, false)
    end, Enum.KeyCode.F)
    
    Tabs.Movement:Slider("FlySpeed", {
        Title = "Fly Speed", Default = 50, Min = 10, Max = 200, Rounding = 0,
        Callback = function(v) 
            flySpeed = v
            if Options.Fly and Options.Fly.Value then Events:Emit("toggle_fly", true, v, false) end 
        end
    })
    
    Toggle(Tabs.Movement, "Noclip", "Noclip", false, function(v)
         Events:Emit("toggle_noclip", v)
    end, Enum.KeyCode.N)
end

-- ========== VISUAL TAB ==========
local function GetESPOptions()
    return {
        showChams = Options.ESPChams and Options.ESPChams.Value or false,
        showName = Options.ESPName and Options.ESPName.Value or true,
        showDistance = Options.ESPDistance and Options.ESPDistance.Value or true,
        showHealth = Options.ESPHealth and Options.ESPHealth.Value or true
    }
end

local function UpdateESP()
    if Options.ESPEnabled then
        Events:Emit("toggle_esp", Options.ESPEnabled.Value, GetESPOptions())
    end
end

Toggle(Tabs.Visual, "ESPEnabled", "Enable ESP", false, UpdateESP, Enum.KeyCode.E)
Tabs.Visual:Toggle("ESPChams", { Title = "Show Chams", Default = false, Callback = UpdateESP })
Tabs.Visual:Toggle("ESPName", { Title = "Show Names", Default = true, Callback = UpdateESP })
Tabs.Visual:Toggle("ESPDistance", { Title = "Show Distance", Default = true, Callback = UpdateESP })
Tabs.Visual:Toggle("ESPHealth", { Title = "Show Health", Default = true, Callback = UpdateESP })

Toggle(Tabs.Visual, "Fullbright", "Fullbright", false, function(v)
    Events:Emit("toggle_fullbright", v)
end, Enum.KeyCode.B)

-- ========== UTILITY & PLAYER TAB ==========
-- Simplified for brevity, similar structure...
Toggle(Tabs.Utility, "AntiAFK", "Anti AFK", false, function(v) Events:Emit("toggle_antiafk", v) end)

Tabs.Utility:Button({ Title = "Rejoin Server", Callback = function() Events:Emit("action_rejoin") end })
Tabs.Player:Button({ Title = "Reset Character", Callback = function() Events:Emit("action_reset") end })

-- ========== SETTINGS TAB ==========
local InterfaceSection = Tabs.Settings:Section("Interface")

InterfaceSection:Dropdown("InterfaceTheme", {
    Title = "Theme",
    Values = Fluent.Themes,
    Default = Fluent.Theme,
    Callback = function(Value)
        Fluent:SetTheme(Value)
    end
})

InterfaceSection:Toggle("Transparency", {
    Title = "Transparency",
    Default = Fluent.Transparency,
    Callback = function(Value) Fluent:ToggleTransparency(Value) end
})

InterfaceSection:Keybind("MenuKeybind", {
    Title = "Minimize Bind",
    Default = Fluent.MinimizeKey or Enum.KeyCode.RightControl,
    ChangedCallback = function(Value) Fluent.MinimizeKey = Value end
})

Window:SelectTab(1)

Fluent:Notify({
    Title = "FSSHUB Loaded",
    Content = "Welcome, " .. username,
    Duration = 5
})

_G.FSSHUB_WINDOW = Window
_G.FSSHUB_FLUENT = Fluent
_G.FSSHUB_OPTIONS = Options

print("[FSSHUB] Main Menu loaded with Fluent Renewed")
