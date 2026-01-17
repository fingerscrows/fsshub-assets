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

-- Loading GUI completely removed - handled by junkie_loader.lua
-- This stub ensures backward compatibility if anything still calls Loading.Update/Destroy
-- Loading GUI (Restored & Modernized)
local Loading = {}
Loading.Gui = nil
Loading.Bar = nil
Loading.Status = nil

function Loading.Create()
    if Loading.Gui then return end

    local gui = Instance.new("ScreenGui")
    gui.Name = "FSSHUB_Loading"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false

    -- Protect GUI
    if gethui then
        gui.Parent = gethui()
    elseif game:GetService("CoreGui") then
        gui.Parent = game:GetService("CoreGui")
    else
        gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    end

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.fromOffset(250, 70)
    mainFrame.Position = UDim2.fromScale(0.5, 0.5)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = gui

    -- Rounded Corners
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 8)
    uiCorner.Parent = mainFrame

    -- Glow/Stroke
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Color = Color3.fromRGB(50, 50, 50)
    uiStroke.Thickness = 1
    uiStroke.Parent = mainFrame

    -- Title
    local title = Instance.new("TextLabel")
    title.Text = "FSSHUB"
    title.Size = UDim2.new(1, -20, 0, 20)
    title.Position = UDim2.new(0, 10, 0, 10)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 16
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = mainFrame

    -- Version
    local ver = Instance.new("TextLabel")
    ver.Text = getgenv().FSSHUB_INFO and getgenv().FSSHUB_INFO.Version or "v2.0"
    ver.Size = UDim2.new(1, -20, 0, 20)
    ver.Position = UDim2.new(0, 10, 0, 10)
    ver.BackgroundTransparency = 1
    ver.TextColor3 = Color3.fromRGB(100, 100, 100)
    ver.TextSize = 12
    ver.Font = Enum.Font.Gotham
    ver.TextXAlignment = Enum.TextXAlignment.Right
    ver.Parent = mainFrame

    -- Status
    local status = Instance.new("TextLabel")
    status.Text = "Initializing..."
    status.Size = UDim2.new(1, -20, 0, 15)
    status.Position = UDim2.new(0, 10, 0, 35)
    status.BackgroundTransparency = 1
    status.TextColor3 = Color3.fromRGB(180, 180, 180)
    status.TextSize = 12
    status.Font = Enum.Font.Gotham
    status.TextXAlignment = Enum.TextXAlignment.Left
    status.Parent = mainFrame
    Loading.Status = status

    -- Progress Bar BG
    local barBg = Instance.new("Frame")
    barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    barBg.Size = UDim2.new(1, -20, 0, 4)
    barBg.Position = UDim2.new(0, 10, 0, 55)
    barBg.BorderSizePixel = 0
    barBg.Parent = mainFrame

    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(1, 0)
    barCorner.Parent = barBg

    -- Progress Bar Fill
    local barFill = Instance.new("Frame")
    barFill.BackgroundColor3 = Color3.fromRGB(96, 205, 255) -- Accent
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.BorderSizePixel = 0
    barFill.Parent = barBg
    Loading.Bar = barFill

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = barFill

    Loading.Gui = gui
end

function Loading.Update(progress, text)
    if not Loading.Gui then Loading.Create() end
    if Loading.Status then Loading.Status.Text = text or "Loading..." end
    if Loading.Bar then
        -- Smooth tween
        local TS = game:GetService("TweenService")
        TS:Create(Loading.Bar, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(math.clamp(progress, 0, 1), 0, 1, 0)
        }):Play()
    end
end

function Loading.Destroy()
    if Loading.Gui then
        local TS = game:GetService("TweenService")
        local frame = Loading.Gui:FindFirstChild("MainFrame")
        if frame then
            TS:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1
            }):Play()
            task.wait(0.5)
        end
        Loading.Gui:Destroy()
        Loading.Gui = nil
    end
end

-- LOAD FLUENT RENEWED (v4.0.8 with FSSHUBLibrary workspace)
local Fluent
local loadStart = tick()

Loading.Create()
Loading.Update(0.1, "Checking resources...")
task.wait(0.1)

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
        task.wait(0.1) -- Yield
        return loadstring(game:HttpGet(
            "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/fluent_loader.lua?v=4.0.8"))()
    end)

    if success and result then
        task.wait(0.1) -- Yield
        Fluent = result
        Loading.Update(0.6, "Library Loaded")
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

Loading.Update(0.9, "Initializing Interface...")
Log("Fluent ready in " .. string.format("%.2f", tick() - loadStart) .. "s")

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
local gameName = Info.Game.Name or "Blox Fruits"
local version = Info.Version or "v2.0.0"

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
    Resize = false,  -- Disabled for testing
    MinimizeKey = Enum.KeyCode.RightControl,
    Acrylic = false, -- Disabled for testing
    Theme = "Dark"   -- Changed to a known working theme
})

task.wait(0.05) -- Yield before creating tabs
Loading.Update(0.92, "Building Dashboard...")
local Tabs = {}

Tabs.Home = Window:Tab({ Title = "Dashboard", Icon = "home" })
task.wait(0.02) -- Micro-yield

Loading.Update(0.94, "Building Features...")
Tabs.Movement = Window:Tab({ Title = "Movement", Icon = "footprints" })
task.wait(0.02)

Tabs.Visual = Window:Tab({ Title = "Visual", Icon = "eye" })
task.wait(0.02)

Tabs.Utility = Window:Tab({ Title = "Utility", Icon = "wrench" })
task.wait(0.02)

Tabs.Player = Window:Tab({ Title = "Player", Icon = "user" })
task.wait(0.02)

Tabs.Settings = Window:Tab({ Title = "Settings", Icon = "settings" })
task.wait(0.05) -- Yield after tabs created

local Options = Fluent.Options

-- Helper for Toggles
local function Toggle(tab, id, title, default, callback, keybind)
    local config = {
        Title = title,
        Default = default,
        Callback = callback or function() end
    }
    local toggle = tab:AddToggle(id, config)

    if keybind then
        toggle:Keybind("Key_" .. id, {
            Title = "Keybind",
            Default = keybind,
            Mode = "Toggle",
            Callback = function() end,       -- Fix: Ensure Callback exists
            ChangedCallback = function() end -- Fix: Ensure ChangedCallback exists
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

-- Loading GUI is handled by junkie_loader.lua - no action needed here

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

-- Signal that Main Menu is ready (used by junkie_loader.lua to close loading screen)
if getgenv then
    getgenv().FSSHUB_MAIN_MENU_READY = true
end
