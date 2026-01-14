--[[
    FSSHUB Bridge Module
    Connects Fluent UI with Worker-injected context (FSSHUB_INFO)
    
    This module:
    1. Reads FSSHUB_INFO from global environment
    2. Creates the main FSSHUB window using Fluent
    3. Exposes tabs to global for Worker to inject features
    4. Sets up event emitter for UI -> Logic communication
]]

local Root = script.Parent
local Fluent = require(Root)

local Bridge = {}
Bridge.Window = nil
Bridge.Tabs = {}

-- Event System for UI -> Logic communication
local Events = {
    listeners = {},
    Emit = function(self, eventName, ...)
        local callbacks = self.listeners[eventName]
        if callbacks then
            for _, callback in ipairs(callbacks) do
                local success, err = pcall(callback, ...)
                if not success then
                    warn("[FSSHUB Events] Callback error:", err)
                end
            end
        end
    end,
    On = function(self, eventName, callback)
        self.listeners[eventName] = self.listeners[eventName] or {}
        table.insert(self.listeners[eventName], callback)
    end,
    Off = function(self, eventName)
        self.listeners[eventName] = nil
    end
}

-- Expose event system globally
_G.FSSHUB_EVENTS = Events

function Bridge:Start(context)
    context = context or {}
    context.User = context.User or {}
    context.Game = context.Game or {}
    
    local isPremium = context.User.IsPremium or false
    local username = context.User.Username or "User"
    local tier = context.User.Tier or "Free"
    local expiryText = context.User.ExpiryText or "Never"
    local gameName = context.Game.Name or "Universal"
    local version = context.Version or "v1.0.0"
    
    -- Create main window with Amethyst theme for FSSHUB branding
    self.Window = Fluent:CreateWindow({
        Title = "FSSHUB | " .. gameName,
        SubTitle = version,
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Amethyst", -- Purple branding
        MinimizeKey = Enum.KeyCode.LeftControl
    })
    
    -- Create standard tabs
    self.Tabs = {
        Home = self.Window:AddTab({ Title = "Dashboard", Icon = "home" }),
        Universal = self.Window:AddTab({ Title = "Universal", Icon = "globe" }),
        Game = self.Window:AddTab({ Title = "Game Features", Icon = "gamepad-2" }),
        Settings = self.Window:AddTab({ Title = "Settings", Icon = "settings" })
    }
    
    -- ========== HOME TAB ==========
    -- User info display
    self.Tabs.Home:AddParagraph({
        Title = "Welcome, " .. username,
        Content = "Tier: " .. tier .. (isPremium and " 👑" or "") .. "\nExpires: " .. expiryText
    })
    
    -- Game info
    if context.Game.IsSupported then
        self.Tabs.Home:AddParagraph({
            Title = "Game Detected",
            Content = gameName .. " (" .. (context.Game.Slug or "unknown") .. ")"
        })
    else
        self.Tabs.Home:AddParagraph({
            Title = "Universal Mode",
            Content = "No game-specific features available"
        })
    end
    
    -- Version info
    self.Tabs.Home:AddParagraph({
        Title = "Version",
        Content = version
    })
    
    -- ========== UNIVERSAL TAB ==========
    -- Speed Walk (Free feature - available to all)
    local speedEnabled = false
    local speedValue = 16
    
    self.Tabs.Universal:AddToggle("SpeedWalk", {
        Title = "Walk Speed",
        Description = "Modify your character's walk speed",
        Default = false,
        Callback = function(value)
            speedEnabled = value
            Events:Emit("toggle_speed", value, speedValue)
        end
    })
    
    self.Tabs.Universal:AddSlider("SpeedValue", {
        Title = "Speed Value",
        Description = "Set the walk speed value (16-200)",
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
    
    -- Jump Power (Premium feature - conditionally rendered)
    if isPremium then
        local jumpEnabled = false
        local jumpValue = 50
        
        self.Tabs.Universal:AddToggle("JumpPower", {
            Title = "Jump Power 👑",
            Description = "Modify your character's jump power (Premium)",
            Default = false,
            Callback = function(value)
                jumpEnabled = value
                Events:Emit("toggle_jump", value, jumpValue)
            end
        })
        
        self.Tabs.Universal:AddSlider("JumpValue", {
            Title = "Jump Value 👑",
            Description = "Set the jump power value (50-300)",
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
        -- Show locked premium feature indicator
        self.Tabs.Universal:AddParagraph({
            Title = "🔒 Premium Features",
            Content = "Upgrade to Premium to unlock Jump Power and more!"
        })
    end
    
    -- ========== GAME TAB ==========
    -- This tab is populated dynamically by Worker based on game
    self.Tabs.Game:AddParagraph({
        Title = "Game Features",
        Content = "Features for " .. gameName .. " will appear here."
    })
    
    -- Expose tabs globally for Worker to add game-specific features
    _G.FSSHUB_TABS = self.Tabs
    _G.FSSHUB_WINDOW = self.Window
    _G.FSSHUB_FLUENT = Fluent
    
    -- Welcome notification
    Fluent:Notify({
        Title = "FSSHUB",
        Content = "Welcome, " .. username .. "! (" .. tier .. ")",
        SubContent = "Version " .. version,
        Duration = 5
    })
    
    print("[FSSHUB] Main Menu loaded successfully")
    print("[FSSHUB] Tier:", tier, "| Premium:", isPremium)
    
    return self
end

function Bridge:Destroy()
    if self.Window then
        Fluent:Destroy()
        self.Window = nil
        self.Tabs = {}
        _G.FSSHUB_TABS = nil
        _G.FSSHUB_WINDOW = nil
        _G.FSSHUB_EVENTS = nil
    end
end

-- Auto-start if context is already injected by Worker
if getgenv and getgenv().FSSHUB_INFO then
    Bridge:Start(getgenv().FSSHUB_INFO)
end

return Bridge
