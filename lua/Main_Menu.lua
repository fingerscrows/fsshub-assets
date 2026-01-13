--[[
    FSSHUB Main Menu - Universal FREE Features
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
local DISCORD_INVITE = "https://discord.gg/fsshub"

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
    Size = UDim2.fromOffset(580, 480),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.RightControl
})

-- ========== TABS (Category-based) ==========
local Tabs = {
    Home = Window:AddTab({ Title = "Dashboard", Icon = "home" }),
    Movement = Window:AddTab({ Title = "Movement", Icon = "footprints" }),
    Visual = Window:AddTab({ Title = "Visual", Icon = "eye" }),
    Utility = Window:AddTab({ Title = "Utility", Icon = "wrench" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Combat = Window:AddTab({ Title = "Combat", Icon = "swords" }),
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

local expiryParagraph = Tabs.Home:AddParagraph({
    Title = "Subscription Status",
    Content = "Expires: " .. formatExpiry()
})

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

Tabs.Home:AddParagraph({
    Title = "Game Info",
    Content = (isSupported and gameName or "Universal Mode") .. "\nPlace ID: " .. game.PlaceId
})

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

-- ==========================================================================
-- MOVEMENT TAB (FREE FEATURES)
-- ==========================================================================

Tabs.Movement:AddParagraph({
    Title = "🏃 Movement Features",
    Content = "All movement features are FREE!"
})

-- Walk Speed
local speedEnabled = false
local speedValue = 16

Tabs.Movement:AddToggle("SpeedWalk", {
    Title = "Walk Speed",
    Description = "Modify character walk speed",
    Default = false
})

Options.SpeedWalk:OnChanged(function()
    speedEnabled = Options.SpeedWalk.Value
    Events:Emit("toggle_speed", speedEnabled, speedValue)
end)

Tabs.Movement:AddSlider("SpeedValue", {
    Title = "Speed Value",
    Description = "16 - 500",
    Default = 16,
    Min = 16,
    Max = 500,
    Rounding = 0,
    Callback = function(value)
        speedValue = value
        if speedEnabled then
            Events:Emit("toggle_speed", true, value)
        end
    end
})

-- Jump Power
local jumpEnabled = false
local jumpValue = 50

Tabs.Movement:AddToggle("JumpPower", {
    Title = "Jump Power",
    Description = "Modify character jump power",
    Default = false
})

Options.JumpPower:OnChanged(function()
    jumpEnabled = Options.JumpPower.Value
    Events:Emit("toggle_jump", jumpEnabled, jumpValue)
end)

Tabs.Movement:AddSlider("JumpValue", {
    Title = "Jump Value",
    Description = "50 - 500",
    Default = 50,
    Min = 50,
    Max = 500,
    Rounding = 0,
    Callback = function(value)
        jumpValue = value
        if jumpEnabled then
            Events:Emit("toggle_jump", true, value)
        end
    end
})

-- Infinite Jump
Tabs.Movement:AddToggle("InfiniteJump", {
    Title = "Infinite Jump",
    Description = "Jump in mid-air infinitely",
    Default = false,
    Callback = function(value)
        Events:Emit("toggle_infinitejump", value)
    end
})

-- ==========================================================================
-- VISUAL TAB (FREE - ESP FEATURES)
-- ==========================================================================

Tabs.Visual:AddParagraph({
    Title = "👁️ Visual / ESP Features",
    Content = "See players through walls and more"
})

-- Player ESP Main Toggle
Tabs.Visual:AddToggle("PlayerESP", {
    Title = "Player ESP",
    Description = "Show box ESP on all players",
    Default = false,
    Callback = function(value)
        Events:Emit("toggle_esp", value, {
            showName = Options.ESPShowName and Options.ESPShowName.Value or true,
            showDistance = Options.ESPShowDistance and Options.ESPShowDistance.Value or true,
            showHealth = Options.ESPShowHealth and Options.ESPShowHealth.Value or true,
            teamCheck = Options.ESPTeamCheck and Options.ESPTeamCheck.Value or false
        })
    end
})

Tabs.Visual:AddToggle("ESPShowName", {
    Title = "Show Names",
    Description = "Display player names above ESP box",
    Default = true
})

Tabs.Visual:AddToggle("ESPShowDistance", {
    Title = "Show Distance",
    Description = "Display distance to players",
    Default = true
})

Tabs.Visual:AddToggle("ESPShowHealth", {
    Title = "Show Health",
    Description = "Display health bar on ESP",
    Default = true
})

Tabs.Visual:AddToggle("ESPTeamCheck", {
    Title = "Team Check",
    Description = "Hide ESP on teammates",
    Default = false
})

-- Fullbright
Tabs.Visual:AddToggle("Fullbright", {
    Title = "Fullbright",
    Description = "Remove darkness and shadows",
    Default = false,
    Callback = function(value)
        Events:Emit("toggle_fullbright", value)
    end
})

-- ==========================================================================
-- UTILITY TAB (FREE FEATURES)
-- ==========================================================================

Tabs.Utility:AddParagraph({
    Title = "🔧 Utility Features",
    Content = "Helpful tools and system utilities"
})

-- Anti AFK
Tabs.Utility:AddToggle("AntiAFK", {
    Title = "Anti AFK",
    Description = "Prevents being kicked for inactivity",
    Default = false,
    Callback = function(value)
        Events:Emit("toggle_antiafk", value)
    end
})

-- FPS Booster
Tabs.Utility:AddToggle("FPSBooster", {
    Title = "FPS Booster (Low Graphics)",
    Description = "Disable effects for better performance",
    Default = false,
    Callback = function(value)
        Events:Emit("toggle_fpsboost", value)
    end
})

-- Unlock FPS Button
Tabs.Utility:AddButton({
    Title = "Unlock FPS",
    Description = "Remove FPS cap (executor-dependent)",
    Callback = function()
        Events:Emit("action_unlockfps")
    end
})

-- Rejoin Server
Tabs.Utility:AddButton({
    Title = "Rejoin Server",
    Description = "Rejoin the current server",
    Callback = function()
        Events:Emit("action_rejoin")
    end
})

-- Copy Place ID
Tabs.Utility:AddButton({
    Title = "Copy Place ID",
    Description = "Copy current game's Place ID",
    Callback = function()
        Events:Emit("action_copyplaceid")
    end
})

-- Copy Job ID
Tabs.Utility:AddButton({
    Title = "Copy Job ID",
    Description = "Copy current server's Job ID",
    Callback = function()
        Events:Emit("action_copyjobid")
    end
})

-- UI Toggle Info
Tabs.Utility:AddParagraph({
    Title = "Hide UI Keybind",
    Content = "Press RightCtrl to toggle menu visibility"
})

-- Destroy GUI (Emergency)
Tabs.Utility:AddButton({
    Title = "🚨 Destroy GUI (Emergency)",
    Description = "Completely remove FSSHUB UI",
    Callback = function()
        Fluent:Notify({
            Title = "GUI Destroyed",
            Content = "FSSHUB has been removed",
            Duration = 2
        })
        task.wait(0.5)
        Events:Emit("action_destroygui")
    end
})

-- ==========================================================================
-- PLAYER TAB (FREE FEATURES)
-- ==========================================================================

Tabs.Player:AddParagraph({
    Title = "🎮 Player Features",
    Content = "Character manipulation tools"
})

-- Auto Respawn
Tabs.Player:AddToggle("AutoRespawn", {
    Title = "Auto Respawn",
    Description = "Automatically respawn when you die",
    Default = false,
    Callback = function(value)
        Events:Emit("toggle_autorespawn", value)
    end
})

-- Reset Character
Tabs.Player:AddButton({
    Title = "Reset Character",
    Description = "Kill your character instantly",
    Callback = function()
        Events:Emit("action_reset")
    end
})

-- Collision Toggle
Tabs.Player:AddToggle("NoCollision", {
    Title = "No Player Collision",
    Description = "Walk through other players",
    Default = false,
    Callback = function(value)
        Events:Emit("toggle_nocollision", value)
    end
})

-- ==========================================================================
-- COMBAT TAB (PREMIUM PLACEHOLDERS)
-- ==========================================================================

if isPremium then
    Tabs.Combat:AddParagraph({
        Title = "⚔️ Combat Features 👑",
        Content = "Premium combat features"
    })
    
    Tabs.Combat:AddToggle("AutoParry", {
        Title = "Auto Parry 👑",
        Description = "Automatically parry attacks (Coming Soon)",
        Default = false,
        Callback = function(value)
            Events:Emit("toggle_autoparry", value)
        end
    })
    
    Tabs.Combat:AddSlider("HitboxSize", {
        Title = "Hitbox Expander 👑",
        Description = "Increase enemy hitbox size",
        Default = 1,
        Min = 1,
        Max = 10,
        Rounding = 1,
        Callback = function(value)
            Events:Emit("set_hitbox", value)
        end
    })
else
    Tabs.Combat:AddParagraph({
        Title = "⚔️ Combat Features",
        Content = "Premium combat features are locked"
    })
    
    Tabs.Combat:AddButton({
        Title = "🔒 Auto Parry (Premium)",
        Description = "Click to unlock via Discord",
        Callback = showLockedNotification
    })
    
    Tabs.Combat:AddButton({
        Title = "🔒 Hitbox Expander (Premium)",
        Description = "Click to unlock via Discord",
        Callback = showLockedNotification
    })
end

-- ==========================================================================
-- SETTINGS TAB
-- ==========================================================================

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FSSHUB")
SaveManager:SetFolder("FSSHUB/" .. gameSlug)

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

-- ==========================================================================
-- EXPOSE GLOBALS
-- ==========================================================================

_G.FSSHUB_TABS = Tabs
_G.FSSHUB_WINDOW = Window
_G.FSSHUB_FLUENT = Fluent
_G.FSSHUB_OPTIONS = Options

-- ==========================================================================
-- SELECT DEFAULT TAB & NOTIFICATIONS
-- ==========================================================================

Window:SelectTab(1)

Fluent:Notify({
    Title = "FSSHUB",
    Content = "Welcome to FSSHub!",
    SubContent = tier .. " | " .. version,
    Duration = 5
})

if not isPremium then
    task.delay(2, function()
        Fluent:Notify({
            Title = "💎 Upgrade to Premium",
            Content = "Unlock Combat features and more!",
            SubContent = "Join Discord for details",
            Duration = 6
        })
    end)
end

print("[FSSHUB] Main Menu loaded successfully")
print("[FSSHUB] Free Features: Movement (3) | Visual (5) | Utility (9) | Player (3)")

-- Load saved config
SaveManager:LoadAutoloadConfig()
