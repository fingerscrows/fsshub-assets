--[[
    FSSHUB Main Menu
    Monolithic UI Entry Point
    
    This file is the PUBLIC entry point loaded via loadstring from GitHub.
    It expects FSSHUB_INFO to be injected by the Worker before execution.
    
    GitHub: https://github.com/fingerscrows/fsshub-assets
]]

-- Ensure context exists
if not getgenv().FSSHUB_INFO then
    warn("[FSSHUB] Error: FSSHUB_INFO not found. This script must be loaded via FSSHUB Worker.")
    return
end

-- ========== CLEANUP OLD MENU ==========
if _G.FSSHUB_FLUENT then
    pcall(function()
        _G.FSSHUB_FLUENT:Destroy()
    end)
end
if _G.FSSHUB_WINDOW then
    pcall(function()
        _G.FSSHUB_WINDOW = nil
    end)
end

local Info = getgenv().FSSHUB_INFO
print("[FSSHUB] Main Menu initializing...")
print("[FSSHUB] User:", Info.User.Username, "| Tier:", Info.User.Tier)

-- Load bundled Fluent library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- ========== CONFIGURATION ==========
local DISCORD_INVITE = "https://discord.gg/fsshub" -- Replace with actual invite

-- ========== EVENT SYSTEM ==========
local Events = {
    listeners = {},
    Emit = function(self, eventName, ...)
        local callbacks = self.listeners[eventName]
        if callbacks then
            for _, callback in ipairs(callbacks) do
                local success, err = pcall(callback, ...)
                if not success then
                    warn("[FSSHUB Events] Error:", err)
                end
            end
        end
    end,
    On = function(self, eventName, callback)
        self.listeners[eventName] = self.listeners[eventName] or {}
        table.insert(self.listeners[eventName], callback)
    end
}
_G.FSSHUB_EVENTS = Events

-- ========== CONTEXT PARSING ==========
local isPremium = Info.User.IsPremium or false
local username = Info.User.Username or "User"
local tier = Info.User.Tier or "Free"
local expiryTimestamp = Info.User.ExpiryTimestamp or 0
local gameName = Info.Game.Name or "Universal"
local gameSlug = Info.Game.Slug or "unknown"
local isSupported = Info.Game.IsSupported or false
local version = Info.Version or "v1.0.0"

-- ========== EXPIRY TIME FORMATTER ==========
local function formatExpiry()
    if expiryTimestamp == 0 then
        return "Lifetime ∞"
    end
    
    local currentTime = os.time()
    local remaining = expiryTimestamp - currentTime
    
    if remaining <= 0 then
        return "Expired"
    end
    
    local days = math.floor(remaining / 86400)
    local hours = math.floor((remaining % 86400) / 3600)
    local minutes = math.floor((remaining % 3600) / 60)
    local seconds = math.floor(remaining % 60)
    
    if days > 0 then
        return string.format("%dd %02d:%02d:%02d", days, hours, minutes, seconds)
    else
        return string.format("%02d:%02d:%02d", hours, minutes, seconds)
    end
end

-- ========== CREATE WINDOW ==========
local Window = Fluent:CreateWindow({
    Title = "FSSHUB | " .. gameName,
    SubTitle = version,
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- ========== TABS (Category-based) ==========
local Tabs = {
    Home = Window:AddTab({ Title = "Dashboard", Icon = "home" }),
    Movement = Window:AddTab({ Title = "Movement", Icon = "footprints" }),
    Combat = Window:AddTab({ Title = "Combat", Icon = "swords" }),
    Visual = Window:AddTab({ Title = "Visual", Icon = "eye" }),
    Utility = Window:AddTab({ Title = "Utility", Icon = "wrench" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-- ========== LOCKED FEATURE HANDLER ==========
local function showLockedNotification()
    Fluent:Notify({
        Title = "🔒 Premium Feature",
        Content = "This feature requires Premium access.",
        SubContent = "Join our Discord to upgrade!",
        Duration = 5
    })
    
    -- Copy Discord link to clipboard
    if setclipboard then
        setclipboard(DISCORD_INVITE)
        Fluent:Notify({
            Title = "Discord Link Copied",
            Content = "Paste in your browser to join!",
            Duration = 3
        })
    end
end

-- ========== HOME TAB ==========
Tabs.Home:AddParagraph({
    Title = "Welcome to FSSHub",
    Content = "Hello, " .. username .. (isPremium and " 👑" or "") .. "\nTier: " .. tier
})

-- Dynamic expiry display
local expiryParagraph = Tabs.Home:AddParagraph({
    Title = "Subscription Status",
    Content = "Expires: " .. formatExpiry()
})

-- Update expiry countdown every second
task.spawn(function()
    while _G.FSSHUB_WINDOW do
        task.wait(1)
        if expiryParagraph and expiryParagraph.SetDesc then
            pcall(function()
                expiryParagraph:SetDesc("Expires: " .. formatExpiry())
            end)
        end
    end
end)

if isSupported then
    Tabs.Home:AddParagraph({
        Title = "Game Detected",
        Content = gameName .. " (" .. gameSlug .. ")"
    })
else
    Tabs.Home:AddParagraph({
        Title = "Universal Mode",
        Content = "Universal features only"
    })
end

Tabs.Home:AddParagraph({
    Title = "Script Info",
    Content = "Version: " .. version .. "\nPowered by Fluent UI"
})

-- Discord button on Home
Tabs.Home:AddButton({
    Title = "Join Discord",
    Description = "Get support and premium access",
    Callback = function()
        if setclipboard then
            setclipboard(DISCORD_INVITE)
            Fluent:Notify({
                Title = "Discord Link Copied!",
                Content = DISCORD_INVITE,
                Duration = 3
            })
        end
    end
})

-- ========== MOVEMENT TAB ==========
local speedEnabled = false
local speedValue = 16

Tabs.Movement:AddToggle("SpeedWalk", {
    Title = "Walk Speed",
    Description = "Modify character walk speed (Free)",
    Default = false
})

Options.SpeedWalk:OnChanged(function()
    speedEnabled = Options.SpeedWalk.Value
    Events:Emit("toggle_speed", speedEnabled, speedValue)
end)

Tabs.Movement:AddSlider("SpeedValue", {
    Title = "Speed Value",
    Description = "16 - 200",
    Default = 16,
    Min = 16,
    Max = 200,
    Rounding = 0,
    Callback = function(value)
        speedValue = value
        if speedEnabled then
            Events:Emit("toggle_speed", true, value)
        end
    end
})

-- Jump Power (Premium or Locked)
if isPremium then
    local jumpEnabled = false
    local jumpValue = 50
    
    Tabs.Movement:AddToggle("JumpPower", {
        Title = "Jump Power 👑",
        Description = "Modify character jump power (Premium)",
        Default = false
    })
    
    Options.JumpPower:OnChanged(function()
        jumpEnabled = Options.JumpPower.Value
        Events:Emit("toggle_jump", jumpEnabled, jumpValue)
    end)
    
    Tabs.Movement:AddSlider("JumpValue", {
        Title = "Jump Value 👑",
        Description = "50 - 300",
        Default = 50,
        Min = 50,
        Max = 300,
        Rounding = 0,
        Callback = function(value)
            jumpValue = value
            if jumpEnabled then
                Events:Emit("toggle_jump", true, value)
            end
        end
    })
else
    -- LOCKED Premium Feature
    Tabs.Movement:AddButton({
        Title = "🔒 Jump Power (Premium)",
        Description = "Click to unlock via Discord",
        Callback = showLockedNotification
    })
end

-- ========== COMBAT TAB ==========
if isPremium then
    Tabs.Combat:AddParagraph({
        Title = "Combat Features 👑",
        Content = "Premium combat features coming soon!"
    })
    
    -- Placeholder for future combat features
    Tabs.Combat:AddToggle("AutoParry", {
        Title = "Auto Parry 👑 (Coming Soon)",
        Description = "Automatically parry attacks",
        Default = false,
        Callback = function()
            -- Future implementation
        end
    })
else
    Tabs.Combat:AddParagraph({
        Title = "Combat Features",
        Content = "Premium features available in this category"
    })
    
    Tabs.Combat:AddButton({
        Title = "🔒 Auto Parry (Premium)",
        Description = "Click to unlock via Discord",
        Callback = showLockedNotification
    })
end

-- ========== VISUAL TAB ==========
Tabs.Visual:AddParagraph({
    Title = "Visual Features",
    Content = "Customize your visual experience"
})

-- ESP (Example - could be Free or Premium)
Tabs.Visual:AddToggle("PlayerESP", {
    Title = "Player ESP",
    Description = "Highlight players through walls (Free)",
    Default = false,
    Callback = function(value)
        Events:Emit("toggle_esp", value)
    end
})

if isPremium then
    Tabs.Visual:AddToggle("ItemESP", {
        Title = "Item ESP 👑",
        Description = "Highlight valuable items (Premium)",
        Default = false,
        Callback = function(value)
            Events:Emit("toggle_item_esp", value)
        end
    })
else
    Tabs.Visual:AddButton({
        Title = "🔒 Item ESP (Premium)",
        Description = "Click to unlock via Discord",
        Callback = showLockedNotification
    })
end

-- ========== UTILITY TAB ==========
Tabs.Utility:AddParagraph({
    Title = "Utility Features",
    Content = "Helpful tools and utilities"
})

Tabs.Utility:AddToggle("AntiAFK", {
    Title = "Anti AFK",
    Description = "Prevents being kicked for inactivity (Free)",
    Default = false,
    Callback = function(value)
        Events:Emit("toggle_antiafk", value)
    end
})

if isPremium then
    Tabs.Utility:AddToggle("AutoFarm", {
        Title = "Auto Farm 👑",
        Description = "Automatically farm resources (Premium)",
        Default = false,
        Callback = function(value)
            Events:Emit("toggle_autofarm", value)
        end
    })
else
    Tabs.Utility:AddButton({
        Title = "🔒 Auto Farm (Premium)",
        Description = "Click to unlock via Discord",
        Callback = showLockedNotification
    })
end

-- ========== SETTINGS TAB ==========
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FSSHUB")
SaveManager:SetFolder("FSSHUB/" .. gameSlug)

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

-- ========== EXPOSE GLOBALS ==========
_G.FSSHUB_TABS = Tabs
_G.FSSHUB_WINDOW = Window
_G.FSSHUB_FLUENT = Fluent
_G.FSSHUB_OPTIONS = Options

-- ========== SELECT DEFAULT TAB ==========
Window:SelectTab(1)

-- ========== WELCOME NOTIFICATION ==========
Fluent:Notify({
    Title = "FSSHUB",
    Content = "Welcome to FSSHub!",
    SubContent = tier .. " | " .. version,
    Duration = 5
})

print("[FSSHUB] Main Menu loaded successfully")
print("[FSSHUB] Tabs and Events exposed to global scope")

-- Load saved config
SaveManager:LoadAutoloadConfig()
