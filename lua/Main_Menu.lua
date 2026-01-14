--[[
    FSSHUB Main Menu - v3.3.0
    Universal FREE + PREMIUM Features
    
    Premium features only render when isPremium = true
    Premium includes keybinds for all toggle features
]]

if not getgenv().FSSHUB_INFO then
    warn("[FSSHUB] Error: FSSHUB_INFO not found.")
    return
end

-- Cleanup
if _G.FSSHUB_FLUENT then pcall(function() _G.FSSHUB_FLUENT:Destroy() end) end
_G.FSSHUB_WINDOW = nil

local Info = getgenv().FSSHUB_INFO

-- LOAD MODIFIED FLUENT LIBRARY
-- User clarified that local folder maps to this GitHub repo
-- WARNING: This requires the repo content to be loadable via loadstring (bundled or custom loader)
-- Direct 'init.lua' loading via standard loadstring usually fails if it uses 'require(script.Child)'
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/Fluent_Bundled.lua"))()

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
local rawPremium = Info.User.IsPremium
local isPremium = (rawPremium == true) or (rawPremium == 1) or (rawPremium == "true")
local username = Info.User.Username or "User"
local tier = Info.User.Tier or "Free"

print("[FSSHUB] isPremium:", isPremium, "| Tier:", tier)

local expiryTimestamp = Info.User.ExpiryTimestamp or 0
local gameName = Info.Game.Name or "Universal"
local gameSlug = Info.Game.Slug or "unknown"
local version = Info.Version or "v3.3.0"

local function formatExpiry()
    if expiryTimestamp == 0 then return "Lifetime ∞" end
    local rem = expiryTimestamp - os.time()
    if rem <= 0 then return "Expired" end
    local d = math.floor(rem / 86400)
    local h = math.floor((rem % 86400) / 3600)
    local m = math.floor((rem % 3600) / 60)
    return d > 0 and string.format("%dd %02d:%02d", d, h, m) or string.format("%02d:%02d", h, m)
end

-- Window - PREMIUM indicator in title
local windowTitle = isPremium and "FSSHUB 👑 | " .. gameName or "FSSHUB | " .. gameName
local Window = Fluent:CreateWindow({
    Title = windowTitle,
    SubTitle = version .. (isPremium and " Premium" or ""),
    TabWidth = 160,
    Size = UDim2.fromOffset(620, 520),
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

-- Helper Config Builder
local function ToggleConfig(title, default, callback, keybind)
    local config = {
        Title = title,
        Default = default,
        Callback = callback
    }
    if isPremium and keybind then
        config.Keybind = keybind
    end
    return config
end

-- ========== HOME TAB ==========
Tabs.Home:AddParagraph({
    Title = isPremium and "Welcome, Premium User! 👑" or "Welcome to FSSHub",
    Content = "Hello, " .. username .. "\nTier: " .. tier
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

if isPremium then
    Tabs.Home:AddParagraph({
        Title = "⌨️ Keybinds",
        Content = "All toggles have customizable inline keybinds!\nClick the keybind text (e.g. 'F') to rebind. Right-click or press X to clear."
    })
end

-- ========== MOVEMENT TAB ==========
Tabs.Movement:AddParagraph({ Title = "🏃 Movement", Content = "Character movement controls" })

-- FREE: WalkSpeed
local speedEnabled, speedValue = false, 16
Tabs.Movement:AddToggle("WalkSpeed", ToggleConfig("Walk Speed", false, function(v)
    speedEnabled = v
    Events:Emit("toggle_speed", speedEnabled, speedValue)
end, "LeftBracket"))

Tabs.Movement:AddSlider("SpeedValue", { Title = "Speed", Default = 16, Min = 16, Max = 500, Rounding = 0,
    Callback = function(v) speedValue = v; if speedEnabled then Events:Emit("toggle_speed", true, v) end end
})

-- FREE: JumpPower
local jumpEnabled, jumpValue = false, 50
Tabs.Movement:AddToggle("JumpPower", ToggleConfig("Jump Power", false, function(v)
    jumpEnabled = v
    Events:Emit("toggle_jump", jumpEnabled, jumpValue)
end, "RightBracket"))

Tabs.Movement:AddSlider("JumpValue", { Title = "Jump", Default = 50, Min = 50, Max = 500, Rounding = 0,
    Callback = function(v) jumpValue = v; if jumpEnabled then Events:Emit("toggle_jump", true, v) end end
})

-- FREE: Infinite Jump
Tabs.Movement:AddToggle("InfiniteJump", ToggleConfig("Infinite Jump", false, function(v) 
    Events:Emit("toggle_infinitejump", v) 
end, "J"))

-- PREMIUM Movement
if isPremium then
    local flySpeed = 50
    Tabs.Movement:AddToggle("Fly", ToggleConfig("Fly (WASD + Space/Shift)", false, function(v) 
        Events:Emit("toggle_fly", v, flySpeed, false) 
    end, "F"))
    
    Tabs.Movement:AddSlider("FlySpeed", { Title = "Fly Speed", Default = 50, Min = 10, Max = 200, Rounding = 0,
        Callback = function(v) flySpeed = v; if Options.Fly.Value then Events:Emit("toggle_fly", true, v, false) end end
    })
    
    Tabs.Movement:AddToggle("Noclip", ToggleConfig("Noclip", false, function(v) 
        Events:Emit("toggle_noclip", v) 
    end, "N"))
    
    Tabs.Movement:AddSlider("Gravity", { Title = "Gravity", Default = 196, Min = 0, Max = 500, Rounding = 0,
        Callback = function(v) Events:Emit("set_gravity", v) end
    })
    
    Tabs.Movement:AddToggle("PlatformStand", ToggleConfig("Platform Stand", false, function(v) 
        Events:Emit("toggle_platformstand", v) 
    end, "P"))
end

-- ========== VISUAL TAB ==========
Tabs.Visual:AddParagraph({ Title = "👁️ Visual", Content = "ESP and visual enhancements" })

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
Tabs.Visual:AddToggle("ESPEnabled", ToggleConfig("Enable ESP", false, UpdateESP, "E"))

Tabs.Visual:AddToggle("ESPChams", { Title = "Show Chams", Default = false, Callback = UpdateESP })
Tabs.Visual:AddToggle("ESPName", { Title = "Show Names", Default = true, Callback = UpdateESP })
Tabs.Visual:AddToggle("ESPDistance", { Title = "Show Distance", Default = true, Callback = UpdateESP })
Tabs.Visual:AddToggle("ESPHealth", { Title = "Show Health", Default = true, Callback = UpdateESP })

-- FREE Fullbright
Tabs.Visual:AddToggle("Fullbright", ToggleConfig("Fullbright", false, function(v) 
    Events:Emit("toggle_fullbright", v) 
end, "B"))

-- PREMIUM Visual
if isPremium then
    Tabs.Visual:AddToggle("SkeletonESP", ToggleConfig("Skeleton ESP", false, function(v) 
        Events:Emit("toggle_skeleton", v) 
    end, "K"))
    
    Tabs.Visual:AddToggle("Tracers", ToggleConfig("Tracers", false, function(v) 
        Events:Emit("toggle_tracers", v) 
    end, "T"))
    
    Tabs.Visual:AddSlider("ESPFilterDist", { Title = "Max Distance", Default = 1000, Min = 50, Max = 2000, Rounding = 0,
        Callback = function(v) Events:Emit("set_esp_filter", v, Options.ESPFilterTeam and Options.ESPFilterTeam.Value, 0) end
    })
    Tabs.Visual:AddToggle("ESPFilterTeam", { Title = "Hide Teammates", Default = false,
        Callback = function(v) Events:Emit("set_esp_filter", Options.ESPFilterDist.Value, v, 0) end
    })
    
    Tabs.Visual:AddColorpicker("ESPColor", { Title = "ESP Color", Default = Color3.fromRGB(255, 0, 0),
        Callback = function(c) Events:Emit("set_esp_color", c) end
    })
end

-- ========== UTILITY TAB ==========
Tabs.Utility:AddParagraph({ Title = "🔧 Utility", Content = "System utilities" })

-- FREE
Tabs.Utility:AddToggle("AntiAFK", ToggleConfig("Anti AFK", false, function(v) 
    Events:Emit("toggle_antiafk", v) 
end, "A"))

Tabs.Utility:AddToggle("FPSBoost", ToggleConfig("FPS Boost", false, function(v) 
    Events:Emit("toggle_fpsboost", v) 
end, nil))

Tabs.Utility:AddButton({ Title = "Unlock FPS", Callback = function() Events:Emit("action_unlockfps") end })
Tabs.Utility:AddButton({ Title = "Rejoin Server", Callback = function() Events:Emit("action_rejoin") end })

-- PREMIUM Utility
if isPremium then
    Tabs.Utility:AddToggle("AutoRejoin", ToggleConfig("Auto Rejoin on Kick", false, function(v) 
        Events:Emit("toggle_autorejoin", v) 
    end, nil))
    
    Tabs.Utility:AddButton({ Title = "Server Hop", Callback = function() Events:Emit("action_serverhop") end })
    
    Tabs.Utility:AddToggle("PerfMonitor", ToggleConfig("Performance Monitor", false, function(v) 
        Events:Emit("toggle_perfmon", v) 
    end, "M"))
    
    Tabs.Utility:AddToggle("AntiLag", ToggleConfig("Anti Lag (Remove Textures)", false, function(v) 
        Events:Emit("toggle_antilag", v) 
    end, nil))
end

-- ========== PLAYER TAB ==========
Tabs.Player:AddParagraph({ Title = "🎮 Player", Content = "Character controls" })

-- FREE
Tabs.Player:AddToggle("AutoRespawn", ToggleConfig("Auto Respawn", false, function(v) 
    Events:Emit("toggle_autorespawn", v) 
end, nil))

Tabs.Player:AddButton({ Title = "Reset Character", Callback = function() Events:Emit("action_reset") end })

Tabs.Player:AddToggle("NoCollision", ToggleConfig("No Player Collision", false, function(v) 
    Events:Emit("toggle_nocollision", v) 
end, "C"))

-- PREMIUM Player
if isPremium then
    Tabs.Player:AddToggle("GodMode", ToggleConfig("God Mode (Soft)", false, function(v) 
        Events:Emit("toggle_godmode", v) 
    end, "G"))
    
    Tabs.Player:AddToggle("NoFallDamage", ToggleConfig("No Fall Damage", false, function(v) 
        Events:Emit("toggle_nofall", v) 
    end, nil))
    
    Tabs.Player:AddToggle("NoRagdoll", ToggleConfig("No Ragdoll", false, function(v) 
        Events:Emit("toggle_noragdoll", v) 
    end, "R"))
    
    local animSpeed = 1
    Tabs.Player:AddToggle("AnimSpeed", ToggleConfig("Animation Speed", false, function(v) 
        Events:Emit("toggle_animspeed", v, animSpeed) 
    end, nil))
    
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

-- Globals
_G.FSSHUB_TABS = Tabs
_G.FSSHUB_WINDOW = Window
_G.FSSHUB_FLUENT = Fluent
_G.FSSHUB_OPTIONS = Options

Window:SelectTab(1)

Fluent:Notify({
    Title = isPremium and "FSSHUB 👑" or "FSSHUB",
    Content = "Welcome, " .. username .. "!",
    SubContent = tier .. " | " .. version,
    Duration = 5
})

print("[FSSHUB] Main Menu v" .. version .. " loaded")
SaveManager:LoadAutoloadConfig()
