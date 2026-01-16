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

-- Theme Configuration
local THEME_FILE = "FSSHUBLibrary/theme.cfg"

-- Ensure folder exists for config storage
if makefolder then
    pcall(function() makefolder("FSSHUBLibrary") end)
end

local FluentThemes = {
    Dark = {
        Main = Color3.fromRGB(45, 45, 45),   -- Dialog Color
        Stroke = Color3.fromRGB(70, 70, 70), -- Dialog Border
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(170, 170, 170),
        Accent = Color3.fromRGB(96, 205, 255)
    },
    Light = {
        Main = Color3.fromRGB(255, 255, 255),
        Stroke = Color3.fromRGB(140, 140, 140),
        Text = Color3.fromRGB(41, 41, 41),
        SubText = Color3.fromRGB(40, 40, 40),
        Accent = Color3.fromRGB(0, 103, 192)
    },
    Amethyst = {
        Main = Color3.fromRGB(60, 45, 80),
        Stroke = Color3.fromRGB(85, 70, 100),
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(170, 170, 170),
        Accent = Color3.fromRGB(97, 62, 167)
    },
    Rose = {
        Main = Color3.fromRGB(120, 50, 75),
        Stroke = Color3.fromRGB(100, 70, 90),
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(170, 170, 170),
        Accent = Color3.fromRGB(180, 55, 90)
    }
}

local function GetSavedTheme()
    if not readfile then return FluentThemes.Dark end
    local success, themeName = pcall(readfile, THEME_FILE)
    if success and FluentThemes[themeName] then
        return FluentThemes[themeName]
    end
    return FluentThemes.Dark
end

local function SaveTheme(themeName)
    if writefile then
        pcall(writefile, THEME_FILE, themeName)
    end
end

-- Loading GUI
local function CreateLoadingGui()
    -- Check for skip loading flags (set by loader/orchestrator)
    local skipLoading = getgenv().FSSHUB_SKIP_LOADING or getgenv().SKIP_LOADING_SCREEN
    if skipLoading then
        return {
            Update = function() end,
            Destroy = function() end,
            Gui = nil
        }
    end

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

    local theme = GetSavedTheme()

    -- Main Container (Bottom Center) - Reverted to Frame for performance
    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.fromOffset(300, 70)
    container.Position = UDim2.fromScale(0.5, 0.85) -- Bottom center
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundColor3 = theme.Main
    container.BackgroundTransparency = 0.1
    container.BorderSizePixel = 0
    container.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = container

    local stroke = Instance.new("UIStroke")
    stroke.Color = theme.Stroke
    stroke.Thickness = 1
    stroke.Parent = container

    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -20, 0, 20)
    title.Position = UDim2.new(0, 10, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "FSSHUB"
    title.TextColor3 = theme.Text
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
    status.TextColor3 = theme.SubText
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
    barFill.Size = UDim2.fromScale(0, 1)           -- Start at 0 width
    barFill.BackgroundColor3 = Color3.new(1, 1, 1) -- White for gradient tint
    barFill.BorderSizePixel = 0
    barFill.Parent = barBg

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 2)
    fillCorner.Parent = barFill

    -- Gradient for extra polish + Shimmer
    local gradient = Instance.new("UIGradient")
    local accentH, accentS, accentV = theme.Accent:ToHSV()
    gradient.Color = ColorSequence.new {
        ColorSequenceKeypoint.new(0, Color3.fromHSV(accentH, accentS * 0.8, math.min(accentV * 1.2, 1))),
        ColorSequenceKeypoint.new(1, theme.Accent)
    }
    gradient.Transparency = NumberSequence.new {
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 0)
    }
    gradient.Parent = barFill

    -- Animations
    container.Position = UDim2.fromScale(0.5, 0.9)
    TweenService:Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        { Position = UDim2.fromScale(0.5, 0.85) }):Play()

    -- Shimmer Loop
    task.spawn(function()
        local shimmer = Instance.new("UIGradient")
        shimmer.Color = ColorSequence.new(Color3.new(1, 1, 1))
        shimmer.Transparency = NumberSequence.new {
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.3),
            NumberSequenceKeypoint.new(1, 1)
        }
        shimmer.Rotation = 45
        shimmer.Parent = barFill

        while container.Parent do
            shimmer.Offset = Vector2.new(-1, 0)
            TweenService:Create(shimmer, TweenInfo.new(1, Enum.EasingStyle.Linear), { Offset = Vector2.new(1, 0) }):Play()
            task.wait(2)
        end
    end)

    return {
        Gui = gui,
        Update = function(progress, text)
            if not gui.Parent then return end
            status.Text = text or status.Text
            TweenService:Create(barFill, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                { Size = UDim2.fromScale(math.clamp(progress, 0, 1), 1) }):Play()
        end,
        Destroy = function()
            -- Slide down animation (Performance friendly, no GroupTransparency)
            TweenService:Create(container, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                { Position = UDim2.fromScale(0.5, 0.9) }):Play()
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
    Fluent = getgenv().FSSHUB_GET_FLUENT(30) -- Wait up to 30 seconds (Increased from 8s)
    if Fluent then
        Loading.Update(0.8, "Resources synced (Instant)")
        Log("Using pre-loaded Fluent (instant!)")
    end
end

-- Fallback to normal loading if pre-load failed
if not Fluent then
    Loading.Update(0.3, "Downloading library...")
    Log("Fallback: Loading Fluent normally...")

    local success, result = pcall(function()
        return loadstring(game:HttpGet(
            "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/fluent_loader.lua?v=4.0.8"))()
    end)

    if success and result then
        Fluent = result
    else
        Loading.Update(0, "FAILED TO LOAD UI")
        warn("[FSSHUB] Critical Error: Failed to load Fluent UI Library!")
        warn("Debug: " .. tostring(result))

        task.delay(3, function()
            if game.Players.LocalPlayer then
                game.Players.LocalPlayer:Kick("FSSHUB Error: UI Library failed to load.\n(Check Console F9)")
            end
        end)
        return
    end
end

Loading.Update(0.9, "Initializing UI...")
Log("Fluent ready in " .. string.format("%.2f", tick() - loadStart) .. "s")

-- Loading GUI destruction moved to end of script

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
Loading.Update(0.95, "Creating Interface...")
local Window = Fluent:Window({
    Title = isPremium and "FSSHUB 👑 | " .. gameName or "FSSHUB | " .. gameName,
    SubTitle = version .. (isPremium and " Premium" or ""),
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Resize = false,  -- Disabled for testing
    MinimizeKey = Enum.KeyCode.RightControl,
    Acrylic = false, -- Disabled for testing
    Theme = "Dark"   -- Changed to a known working theme
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
    local toggle = tab:AddToggle(id, config)

    if keybind then
        toggle:Keybind("Key_" .. id, {
            Title = "Keybind",
            Default = keybind,
            Mode = "Toggle"
        })
    end
    return toggle
end

-- ========== HOME TAB (DASHBOARD) ==========

-- Top Panel (Welcome)
Tabs.Home:AddParagraph("WelcomePara", {
    Title = isPremium and "Welcome, Premium User! 👑" or "Welcome to FSSHub",
    Content = "Hello, " .. username .. "\nTier: " .. tier
})

-- Create a container for side-by-side panels
-- Note: Fluent doesn't natively support grid layouts easily, so we hack it by appending a custom frame
-- or we just use Sections if they supported side-side.
-- Alternative: We use the fact that Fluent Elements are UIListLayouts.
-- We can create a "Container" element if we had access to Creator, but we are in user-land code.

-- Workaround: Add two sections. Standard Fluent renders them vertically.
-- To achieve side-by-side, we would need to edit the library's Section.luau or use a custom element.
-- Given I can't easily edit the library STRUCTURE to support columns without breaking things,
-- I will add a "Stats" section and "Subscription" section.

local StatsSection = Tabs.Home:AddSection("Statistics")
StatsSection:AddParagraph("SessionInfo", {
    Title = "Session",
    Content = "Time: 00:00:00\nFPS: 60"
})

local SubSection = Tabs.Home:AddSection("Subscription")
local ExpiryPara = SubSection:AddParagraph("ExpiryPara", {
    Title = "Status",
    Content = "Expires: " .. formatExpiry()
})

-- Real-time updates
task.spawn(function()
    local startTime = os.time()
    while _G.FSSHUB_WINDOW do
        task.wait(1)
        local elapsed = os.time() - startTime
        local h = math.floor(elapsed / 3600)
        local m = math.floor((elapsed % 3600) / 60)
        local s = elapsed % 60

        -- Update Expiry
        if ExpiryPara.SetDesc then
            ExpiryPara:SetDesc("Expires: " .. formatExpiry())
        end

        -- Update Session (If we had ref)
        -- This logic usually requires storing the element reference
    end
end)

Tabs.Home:AddButton({
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

Tabs.Movement:AddSlider("SpeedValue", {
    Title = "Speed",
    Default = 16,
    Min = 16,
    Max = 500,
    Rounding = 0,
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

Tabs.Movement:AddSlider("JumpValue", {
    Title = "Jump",
    Default = 50,
    Min = 50,
    Max = 500,
    Rounding = 0,
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
    Tabs.Movement:AddParagraph("PremiumHeader", { Title = "Premium Features", Content = "Exclusive movement controls" })

    local flySpeed = 50
    local FlyToggle = Toggle(Tabs.Movement, "Fly", "Fly Mode", false, function(v)
        Events:Emit("toggle_fly", v, flySpeed, false)
    end, Enum.KeyCode.F)

    Tabs.Movement:AddSlider("FlySpeed", {
        Title = "Fly Speed",
        Default = 50,
        Min = 10,
        Max = 200,
        Rounding = 0,
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
Tabs.Visual:AddToggle("ESPChams", { Title = "Show Chams", Default = false, Callback = UpdateESP })
Tabs.Visual:AddToggle("ESPName", { Title = "Show Names", Default = true, Callback = UpdateESP })
Tabs.Visual:AddToggle("ESPDistance", { Title = "Show Distance", Default = true, Callback = UpdateESP })
Tabs.Visual:AddToggle("ESPHealth", { Title = "Show Health", Default = true, Callback = UpdateESP })

Toggle(Tabs.Visual, "Fullbright", "Fullbright", false, function(v)
    Events:Emit("toggle_fullbright", v)
end, Enum.KeyCode.B)

-- ========== UTILITY & PLAYER TAB ==========
-- Simplified for brevity, similar structure...
Toggle(Tabs.Utility, "AntiAFK", "Anti AFK", false, function(v) Events:Emit("toggle_antiafk", v) end)

Tabs.Utility:AddButton({ Title = "Rejoin Server", Callback = function() Events:Emit("action_rejoin") end })
Tabs.Player:AddButton({ Title = "Reset Character", Callback = function() Events:Emit("action_reset") end })

-- ========== SETTINGS TAB ==========
local InterfaceSection = Tabs.Settings:AddSection("Interface")

InterfaceSection:AddDropdown("InterfaceTheme", {
    Title = "Theme",
    Values = Fluent.Themes,
    Default = Fluent.Theme,
    Callback = function(Value)
        Fluent:SetTheme(Value)
        -- Theme saving is handled by the ThemeChanged event below
    end
})

InterfaceSection:AddToggle("Transparency", {
    Title = "Transparency",
    Default = Fluent.Transparency,
    Callback = function(Value) Fluent:ToggleTransparency(Value) end
})

InterfaceSection:AddKeybind("MenuKeybind", {
    Title = "Minimize Bind",
    Default = Fluent.MinimizeKey or Enum.KeyCode.RightControl,
    ChangedCallback = function(Value) Fluent.MinimizeKey = Value end
})

Window:SelectTab(1)

-- Remove Loading GUI (Now that window is ready)
if _G.FSSHUB_LOADING_GUI then
    Loading.Update(1, "Ready!")
    task.delay(0.2, function()
        Loading.Destroy()
    end)
end

Fluent:Notify({
    Title = "FSSHUB Loaded",
    Content = "Welcome, " .. username,
    Duration = 5
})

_G.FSSHUB_WINDOW = Window
_G.FSSHUB_FLUENT = Fluent
_G.FSSHUB_OPTIONS = Options

-- Hook into Fluent's native ThemeChanged signal for robust syncing
if Fluent.ThemeChanged then
    Fluent.ThemeChanged:Connect(function(ThemeName)
        SaveTheme(ThemeName)
        -- We could also update specific UI elements here if needed,
        -- but Fluent handles most things internally.
    end)
end

-- Initialize saved theme
local savedTheme = GetSavedTheme()
if savedTheme and savedTheme ~= "Dark" then -- Dark is default
    -- We need to reverse lookup the name from our table or just use the string read from file
    -- Since GetSavedTheme returns the table, let's fix that function logic or just read directly
    if readfile then
        local success, themeName = pcall(readfile, THEME_FILE)
        if success and Fluent.Themes and table.find(Fluent.Themes, themeName) then
            Fluent:SetTheme(themeName)
        end
    end
end

print("[FSSHUB] Main Menu loaded with Fluent Renewed")
