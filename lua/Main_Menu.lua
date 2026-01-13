--[[
    FSSHUB Main Menu - v3.0.0
    Universal FREE + PREMIUM Features
    
    IMPORTANT: Premium features only render when isPremium = true
    FREE users do NOT see Premium features (clean UI)
]]

if not getgenv().FSSHUB_INFO then
    warn("[FSSHUB] Error: FSSHUB_INFO not found.")
    return
end

-- Cleanup
if _G.FSSHUB_FLUENT then pcall(function() _G.FSSHUB_FLUENT:Destroy() end) end
_G.FSSHUB_WINDOW = nil

local Info = getgenv().FSSHUB_INFO
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local DISCORD = "https://discord.gg/fsshub"

-- Event System
local Events = {
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
_G.FSSHUB_EVENTS = Events

-- Context
-- Check for boolean true OR truthy value (1, "true", etc)
local rawPremium = Info.User.IsPremium
local isPremium = (rawPremium == true) or (rawPremium == 1) or (rawPremium == "true")
local username = Info.User.Username or "User"
local tier = Info.User.Tier or "Free"

-- DEBUG
print("[FSSHUB] isPremium raw:", rawPremium, "type:", type(rawPremium), "-> result:", isPremium)
print("[FSSHUB] Tier:", tier)
local expiryTimestamp = Info.User.ExpiryTimestamp or 0
local gameName = Info.Game.Name or "Universal"
local gameSlug = Info.Game.Slug or "unknown"
local version = Info.Version or "v3.0.0"

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
local Window = Fluent:CreateWindow({
    Title = "FSSHUB | " .. gameName,
    SubTitle = version,
    TabWidth = 160,
    Size = UDim2.fromOffset(600, 500),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.RightControl
})

local Tabs = {
    Home = Window:AddTab({ Title = "Dashboard", Icon = "home" }),
    Movement = Window:AddTab({ Title = "Movement", Icon = "footprints" }),
    Visual = Window:AddTab({ Title = "Visual", Icon = "eye" }),
    Utility = Window:AddTab({ Title = "Utility", Icon = "wrench" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-- ========== HOME TAB ==========
Tabs.Home:AddParagraph({
    Title = "Welcome to FSSHub",
    Content = "Hello, " .. username .. (isPremium and " 👑" or "") .. "\nTier: " .. tier
})

local expiryPara = Tabs.Home:AddParagraph({
    Title = "Subscription",
    Content = "Expires: " .. formatExpiry()
})

task.spawn(function()
    while _G.FSSHUB_WINDOW do
        task.wait(1)
        pcall(function() expiryPara:SetDesc("Expires: " .. formatExpiry()) end)
    end
end)

Tabs.Home:AddButton({
    Title = "Join Discord",
    Description = "Support & Premium",
    Callback = function()
        if setclipboard then setclipboard(DISCORD) end
        Fluent:Notify({ Title = "Copied!", Content = DISCORD, Duration = 3 })
    end
})

-- ========== MOVEMENT TAB ==========
Tabs.Movement:AddParagraph({ Title = "🏃 Movement", Content = "Character movement controls" })

-- FREE: WalkSpeed
local speedEnabled, speedValue = false, 16
Tabs.Movement:AddToggle("WalkSpeed", { Title = "Walk Speed", Default = false })
Options.WalkSpeed:OnChanged(function()
    speedEnabled = Options.WalkSpeed.Value
    Events:Emit("toggle_speed", speedEnabled, speedValue)
end)
Tabs.Movement:AddSlider("SpeedValue", { Title = "Speed", Default = 16, Min = 16, Max = 500, Rounding = 0,
    Callback = function(v) speedValue = v; if speedEnabled then Events:Emit("toggle_speed", true, v) end end
})

-- FREE: JumpPower
local jumpEnabled, jumpValue = false, 50
Tabs.Movement:AddToggle("JumpPower", { Title = "Jump Power", Default = false })
Options.JumpPower:OnChanged(function()
    jumpEnabled = Options.JumpPower.Value
    Events:Emit("toggle_jump", jumpEnabled, jumpValue)
end)
Tabs.Movement:AddSlider("JumpValue", { Title = "Jump", Default = 50, Min = 50, Max = 500, Rounding = 0,
    Callback = function(v) jumpValue = v; if jumpEnabled then Events:Emit("toggle_jump", true, v) end end
})

-- FREE: Infinite Jump
Tabs.Movement:AddToggle("InfiniteJump", { Title = "Infinite Jump", Default = false,
    Callback = function(v) Events:Emit("toggle_infinitejump", v) end
})

-- PREMIUM ONLY
if isPremium then
    Tabs.Movement:AddParagraph({ Title = "✨ Premium Movement", Content = "Advanced movement controls" })
    
    -- Fly
    local flySpeed = 50
    Tabs.Movement:AddToggle("Fly", { Title = "Fly (WASD + Space/Shift)", Default = false,
        Callback = function(v) Events:Emit("toggle_fly", v, flySpeed, false) end
    })
    Tabs.Movement:AddSlider("FlySpeed", { Title = "Fly Speed", Default = 50, Min = 10, Max = 200, Rounding = 0,
        Callback = function(v) flySpeed = v; if Options.Fly.Value then Events:Emit("toggle_fly", true, v, false) end end
    })
    
    -- Noclip
    Tabs.Movement:AddToggle("Noclip", { Title = "Noclip", Default = false,
        Callback = function(v) Events:Emit("toggle_noclip", v) end
    })
    
    -- Gravity
    Tabs.Movement:AddSlider("Gravity", { Title = "Gravity", Default = 196, Min = 0, Max = 500, Rounding = 0,
        Callback = function(v) Events:Emit("set_gravity", v) end
    })
    
    -- Platform Stand
    Tabs.Movement:AddToggle("PlatformStand", { Title = "Platform Stand", Default = false,
        Callback = function(v) Events:Emit("toggle_platformstand", v) end
    })
end

-- ========== VISUAL TAB ==========
Tabs.Visual:AddParagraph({ Title = "👁️ Visual", Content = "ESP and visual enhancements" })

-- ESP Config Helper
local function GetESPOptions()
    return {
        showChams = Options.ESPChams and Options.ESPChams.Value or false,
        showName = Options.ESPName and Options.ESPName.Value or true,
        showDistance = Options.ESPDistance and Options.ESPDistance.Value or true,
        showHealth = Options.ESPHealth and Options.ESPHealth.Value or true
    }
end

local function UpdateESP()
    Events:Emit("toggle_esp", Options.ESPEnabled.Value, GetESPOptions())
end

-- FREE ESP
Tabs.Visual:AddToggle("ESPEnabled", { Title = "Enable ESP", Default = false, Callback = UpdateESP })
Tabs.Visual:AddToggle("ESPChams", { Title = "Show Chams", Default = false, Callback = UpdateESP })
Tabs.Visual:AddToggle("ESPName", { Title = "Show Names", Default = true, Callback = UpdateESP })
Tabs.Visual:AddToggle("ESPDistance", { Title = "Show Distance", Default = true, Callback = UpdateESP })
Tabs.Visual:AddToggle("ESPHealth", { Title = "Show Health", Default = true, Callback = UpdateESP })

-- FREE Fullbright
Tabs.Visual:AddToggle("Fullbright", { Title = "Fullbright", Default = false,
    Callback = function(v) Events:Emit("toggle_fullbright", v) end
})

-- PREMIUM ONLY
if isPremium then
    Tabs.Visual:AddParagraph({ Title = "✨ Premium Visual", Content = "Advanced ESP features" })
    
    -- Skeleton
    Tabs.Visual:AddToggle("SkeletonESP", { Title = "Skeleton ESP", Default = false,
        Callback = function(v) Events:Emit("toggle_skeleton", v) end
    })
    
    -- Tracers
    Tabs.Visual:AddToggle("Tracers", { Title = "Tracers", Default = false,
        Callback = function(v) Events:Emit("toggle_tracers", v) end
    })
    
    -- ESP Filter
    Tabs.Visual:AddSlider("ESPFilterDist", { Title = "Max Distance", Default = 1000, Min = 50, Max = 2000, Rounding = 0,
        Callback = function(v) Events:Emit("set_esp_filter", v, Options.ESPFilterTeam and Options.ESPFilterTeam.Value, 0) end
    })
    Tabs.Visual:AddToggle("ESPFilterTeam", { Title = "Hide Teammates", Default = false,
        Callback = function(v) Events:Emit("set_esp_filter", Options.ESPFilterDist.Value, v, 0) end
    })
    
    -- Custom Color
    Tabs.Visual:AddColorpicker("ESPColor", { Title = "ESP Color", Default = Color3.fromRGB(255, 0, 0),
        Callback = function(c) Events:Emit("set_esp_color", c) end
    })
end

-- ========== UTILITY TAB ==========
Tabs.Utility:AddParagraph({ Title = "🔧 Utility", Content = "System utilities" })

-- FREE
Tabs.Utility:AddToggle("AntiAFK", { Title = "Anti AFK", Default = false,
    Callback = function(v) Events:Emit("toggle_antiafk", v) end
})
Tabs.Utility:AddToggle("FPSBoost", { Title = "FPS Boost", Default = false,
    Callback = function(v) Events:Emit("toggle_fpsboost", v) end
})
Tabs.Utility:AddButton({ Title = "Unlock FPS", Callback = function() Events:Emit("action_unlockfps") end })
Tabs.Utility:AddButton({ Title = "Rejoin Server", Callback = function() Events:Emit("action_rejoin") end })

-- PREMIUM ONLY
if isPremium then
    Tabs.Utility:AddParagraph({ Title = "✨ Premium Utility", Content = "Advanced utilities" })
    
    Tabs.Utility:AddToggle("AutoRejoin", { Title = "Auto Rejoin on Kick", Default = false,
        Callback = function(v) Events:Emit("toggle_autorejoin", v) end
    })
    Tabs.Utility:AddButton({ Title = "Server Hop", Callback = function() Events:Emit("action_serverhop") end })
    Tabs.Utility:AddToggle("PerfMonitor", { Title = "Performance Monitor", Default = false,
        Callback = function(v) Events:Emit("toggle_perfmon", v) end
    })
    Tabs.Utility:AddToggle("AntiLag", { Title = "Anti Lag (Remove Textures)", Default = false,
        Callback = function(v) Events:Emit("toggle_antilag", v) end
    })
    
    -- Config
    local configName = "default"
    Tabs.Utility:AddInput("ConfigName", { Title = "Config Name", Default = "default", Placeholder = "Enter name",
        Callback = function(v) configName = v end
    })
    Tabs.Utility:AddButton({ Title = "Save Config", Callback = function() Events:Emit("action_saveconfig", configName) end })
    Tabs.Utility:AddButton({ Title = "Load Config", Callback = function() Events:Emit("action_loadconfig", configName) end })
end

-- ========== PLAYER TAB ==========
Tabs.Player:AddParagraph({ Title = "🎮 Player", Content = "Character controls" })

-- FREE
Tabs.Player:AddToggle("AutoRespawn", { Title = "Auto Respawn", Default = false,
    Callback = function(v) Events:Emit("toggle_autorespawn", v) end
})
Tabs.Player:AddButton({ Title = "Reset Character", Callback = function() Events:Emit("action_reset") end })
Tabs.Player:AddToggle("NoCollision", { Title = "No Player Collision", Default = false,
    Callback = function(v) Events:Emit("toggle_nocollision", v) end
})

-- PREMIUM ONLY
if isPremium then
    Tabs.Player:AddParagraph({ Title = "✨ Premium Player", Content = "Advanced player controls" })
    
    Tabs.Player:AddToggle("GodMode", { Title = "God Mode (Soft)", Default = false,
        Callback = function(v) Events:Emit("toggle_godmode", v) end
    })
    Tabs.Player:AddToggle("NoFallDamage", { Title = "No Fall Damage", Default = false,
        Callback = function(v) Events:Emit("toggle_nofall", v) end
    })
    Tabs.Player:AddToggle("NoRagdoll", { Title = "No Ragdoll", Default = false,
        Callback = function(v) Events:Emit("toggle_noragdoll", v) end
    })
    
    local animSpeed = 1
    Tabs.Player:AddToggle("AnimSpeed", { Title = "Animation Speed", Default = false,
        Callback = function(v) Events:Emit("toggle_animspeed", v, animSpeed) end
    })
    Tabs.Player:AddSlider("AnimSpeedValue", { Title = "Speed Multiplier", Default = 1, Min = 0.1, Max = 3, Rounding = 1,
        Callback = function(v) animSpeed = v; if Options.AnimSpeed.Value then Events:Emit("toggle_animspeed", true, v) end end
    })
end

-- ========== SETTINGS TAB ==========
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
InterfaceManager:SetFolder("FSSHUB")
SaveManager:SetFolder("FSSHUB/" .. gameSlug)
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

-- Keybind Manager (Premium)
if isPremium then
    Tabs.Settings:AddParagraph({ Title = "✨ Keybinds", Content = "Customize keybinds" })
    Tabs.Settings:AddKeybind("FlyKey", { Title = "Fly Toggle", Default = Enum.KeyCode.F,
        Callback = function() Options.Fly:SetValue(not Options.Fly.Value) end
    })
    Tabs.Settings:AddKeybind("NoclipKey", { Title = "Noclip Toggle", Default = Enum.KeyCode.N,
        Callback = function() Options.Noclip:SetValue(not Options.Noclip.Value) end
    })
end

-- Globals
_G.FSSHUB_TABS = Tabs
_G.FSSHUB_WINDOW = Window
_G.FSSHUB_FLUENT = Fluent
_G.FSSHUB_OPTIONS = Options

Window:SelectTab(1)

Fluent:Notify({
    Title = "FSSHUB",
    Content = "Welcome, " .. username .. "!",
    SubContent = tier .. " | " .. version,
    Duration = 5
})

print("[FSSHUB] Main Menu v" .. version .. " loaded")
SaveManager:LoadAutoloadConfig()
