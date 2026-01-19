-- [[ FSSHUB V5 Menu Builder ]]
-- Architecture: Dual-Asset Lazy Cache
-- Updated: Added complete feature coverage for Free & Premium

return function(Fluent)
    local Info = getgenv().FSSHUB_INFO
    if not Info then
        warn("[FSSHUB] Info missing")
        return
    end

    -- 1. Inject Cyber Theme
    Fluent.Themes["Cyber"] = {
        Accent = Color3.fromRGB(138, 110, 215),
        AcrylicMain = Color3.fromRGB(25, 20, 35),
        AcrylicBorder = Color3.fromRGB(140, 120, 210),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(20, 20, 25), Color3.fromRGB(10, 10, 15)),
        AcrylicNoise = 1,
        TitleBarLine = Color3.fromRGB(140, 120, 210),
        Tab = Color3.fromRGB(180, 180, 200),
        Element = Color3.fromRGB(15, 12, 25),
        ElementBorder = Color3.fromRGB(40, 30, 60),
        InElementBorder = Color3.fromRGB(138, 110, 215),
        ElementTransparency = 0.5,
        ToggleSlider = Color3.fromRGB(138, 110, 215),
        ToggleToggled = Color3.fromRGB(20, 20, 25),
        SliderRail = Color3.fromRGB(40, 30, 60),
        DropdownFrame = Color3.fromRGB(15, 12, 25),
        DropdownHolder = Color3.fromRGB(15, 12, 25),
        DropdownBorder = Color3.fromRGB(40, 30, 60),
        DropdownOption = Color3.fromRGB(180, 180, 200),
        Keybind = Color3.fromRGB(180, 180, 200),
        Input = Color3.fromRGB(15, 12, 25),
        InputFocused = Color3.fromRGB(20, 20, 25),
        InputIndicator = Color3.fromRGB(170, 150, 240),
        Dialog = Color3.fromRGB(25, 20, 35),
        DialogHolder = Color3.fromRGB(15, 12, 25),
        DialogHolderLine = Color3.fromRGB(140, 120, 210),
        DialogButton = Color3.fromRGB(40, 30, 60),
        DialogButtonBorder = Color3.fromRGB(140, 120, 210),
        DialogBorder = Color3.fromRGB(140, 120, 210),
        DialogInput = Color3.fromRGB(15, 12, 25),
        DialogInputLine = Color3.fromRGB(138, 110, 215),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(180, 180, 200),
        Hover = Color3.fromRGB(170, 150, 240),
        HoverChange = 0.1
    }

    -- 2. Utilities
    local CONFIG_FOLDER = "FSSHUB/Config"
    local THEME_FILE = "FSSHUB/Config/theme.cfg"
    
    local function SaveTheme(themeName)
        if not isfolder("FSSHUB") then makefolder("FSSHUB") end
        if not isfolder(CONFIG_FOLDER) then makefolder(CONFIG_FOLDER) end
        if writefile then pcall(writefile, THEME_FILE, themeName) end
    end

    local function GetSavedTheme()
        if not readfile or not isfile(THEME_FILE) then return "Cyber" end
        local s, t = pcall(readfile, THEME_FILE)
        return s and t or "Cyber"
    end

    local function SaveConfig(name)
        if not isfolder("FSSHUB") then makefolder("FSSHUB") end
        if not isfolder(CONFIG_FOLDER) then makefolder(CONFIG_FOLDER) end
        
        local path = CONFIG_FOLDER .. "/" .. name .. ".json"
        local data = {}

        for key, option in pairs(Fluent.Options) do
            if option.Type == "Toggle" then
                data[key] = { Type = "Toggle", Value = option.Value, Key = option.Keybind and option.Keybind.Value.Name or "None" }
            elseif option.Type == "Slider" then
                 data[key] = { Type = "Slider", Value = option.Value }
            elseif option.Type == "Dropdown" then
                 data[key] = { Type = "Dropdown", Value = option.Value }
            end
        end
        
        if writefile then
            local success, encoded = pcall(game:GetService("HttpService").JSONEncode, game:GetService("HttpService"), data)
            if success then writefile(path, encoded) end
        end
        Fluent:Notify({ Title = "Config Saved", Content = "Saved config: " .. name, Duration = 3 })
    end

    local function LoadConfig(name)
        local path = CONFIG_FOLDER .. "/" .. name .. ".json"
        if not isfile(path) then
             Fluent:Notify({ Title = "Load Error", Content = "Config not found: " .. name, Duration = 3 })
             return
        end
        
        local success, decoded = pcall(game:GetService("HttpService").JSONDecode, game:GetService("HttpService"), readfile(path))
        if success and decoded then
            for key, setting in pairs(decoded) do
                local option = Fluent.Options[key]
                if option then
                    if setting.Type == "Toggle" then
                        option:SetValue(setting.Value)
                        if option.Keybind and setting.Key then
                             pcall(function() option.Keybind:SetValue(Enum.KeyCode[setting.Key]) end)
                        end
                    elseif setting.Type == "Slider" then
                        option:SetValue(setting.Value)
                    elseif setting.Type == "Dropdown" then
                        option:SetValue(setting.Value)
                    end
                end
            end
            Fluent:Notify({ Title = "Config Loaded", Content = "Loaded config: " .. name, Duration = 3 })
        end
    end

    -- 3. Cleanup Old UI
    if _G.FSSHUB_WINDOW and _G.FSSHUB_WINDOW.Destroy then
        pcall(function() _G.FSSHUB_WINDOW:Destroy() end)
    end

    -- Event Bus
    local Events = _G.FSSHUB_EVENTS or { listeners = {}, Emit = function() end, On = function() end }

    -- 4. Build Window
    local isPremium = (Info.User.IsPremium == true or Info.User.IsPremium == "true")
    local gameName = Info.Game.Name or "Universal"

    local Window = Fluent:Window({
        Title = isPremium and "FSSHUB 👑 | " .. gameName or "FSSHUB | " .. gameName,
        SubTitle = Info.Version or "v5.0",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Resize = false,
        MinimizeKey = Enum.KeyCode.RightControl,
        Acrylic = false,
        Theme = GetSavedTheme(),
        OnClose = function()
            if _G.FSSHUB_CLEANUP then _G.FSSHUB_CLEANUP() end
        end
    })

    if Fluent.ThemeChanged then Fluent.ThemeChanged:Connect(SaveTheme) end

    -- 5. Helper
    local function Toggle(tab, id, title, default, callback, keybind)
        local config = { Title = title, Default = default, Callback = callback or function() end }
        local toggle = tab:AddToggle(id, config)
        if isPremium then
            local kbind = keybind or Enum.KeyCode.Unknown
            toggle:Keybind("Key_" .. id, { Title = "Key", Default = kbind, Mode = "Toggle" })
        end
        return toggle
    end

    -- 6. Build Tabs
    local Tabs = {}

    -- [[ HOME TAB ]]
    Tabs.Home = Window:Tab({ Title = "Dashboard", Icon = "home" })
    Tabs.Home:AddParagraph("Welcome", {
        Title = isPremium and "Welcome, Premium Member 👑" or "Welcome to FSSHub",
        Content = "User: " ..
        (Info.User.Username or "Guest") ..
        "\nTier: " .. (Info.User.Tier or "Free") .. "\nExpires: " .. (Info.User.ExpiryText or "Never")
    })

    if isPremium then
        Tabs.Home:AddButton({ Title = "Server Hop", Description = "Find a better server", Callback = function() Events
                :Emit("action_serverhop") end })
        Tabs.Home:AddButton({ Title = "Auto Rejoin", Description = "Rejoin on kick", Callback = function() Events:Emit(
            "toggle_autorejoin", true) end })
    end

    Tabs.Home:AddButton({
        Title = "Join Discord",
        Description = "Get Support",
        Callback = function()
            if setclipboard then setclipboard("https://discord.gg/fsshub") end
            Fluent:Notify({ Title = "Link Copied!", Content = "Discord link copied.", Duration = 3 })
        end
    })

    -- [[ MOVEMENT TAB ]]
    Tabs.Movement = Window:Tab({ Title = "Movement", Icon = "footprints" })

    -- Speed
    Tabs.Movement:AddSlider("SpeedVal", {
        Title = "Walk Speed Value",
        Default = 16,
        Min = 16,
        Max = 500,
        Callback = function(v)
            local e = false
            if Fluent.Options.Speed and Fluent.Options.Speed.Value then e = Fluent.Options.Speed.Value end
            Events:Emit("toggle_speed", e, v)
        end
    })
    Toggle(Tabs.Movement, "Speed", "Enable Walk Speed", false, function(v)
        local val = 16
        if Fluent.Options.SpeedVal then val = Fluent.Options.SpeedVal.Value end
        Events:Emit("toggle_speed", v, val)
    end, Enum.KeyCode.B) -- Default: B

    -- Jump
    Tabs.Movement:AddSlider("JumpVal", {
        Title = "Jump Power Value",
        Default = 50,
        Min = 50,
        Max = 500,
        Callback = function(v)
            local e = false
            if Fluent.Options.Jump and Fluent.Options.Jump.Value then e = Fluent.Options.Jump.Value end
            Events:Emit("toggle_jump", e, v)
        end
    })
    Toggle(Tabs.Movement, "Jump", "Enable Jump Power", false, function(v)
        local val = 50
        if Fluent.Options.JumpVal then val = Fluent.Options.JumpVal.Value end
        Events:Emit("toggle_jump", v, val)
    end, Enum.KeyCode.V) -- Default: V

    Toggle(Tabs.Movement, "InfJump", "Infinite Jump", false, function(v) Events:Emit("toggle_infinitejump", v) end, Enum.KeyCode.G) -- Default: G

    if isPremium then
        Tabs.Movement:AddSection("Premium Movement")
        Toggle(Tabs.Movement, "Fly", "Fly Mode", false, function(v)
            local speed = Fluent.Options.FlySpeed and Fluent.Options.FlySpeed.Value or 50
            Events:Emit("toggle_fly", v, speed)
        end, Enum.KeyCode.H) -- Default: H
        
        Tabs.Movement:AddSlider("FlySpeed", { 
            Title = "Fly Speed",
            Default = 50,
            Min = 10,
            Max = 200,
            Callback = function(v)
                if Fluent.Options.Fly and Fluent.Options.Fly.Value then Events:Emit("toggle_fly", true, v) end
            end
        })

        Toggle(Tabs.Movement, "Noclip", "Noclip", false, function(v) Events:Emit("toggle_noclip", v) end, Enum.KeyCode.N) -- Default: N
        Toggle(Tabs.Movement, "NoClipPhys", "Platform Stand", false,
            function(v) Events:Emit("toggle_platformstand", v) end, Enum.KeyCode.RightAlt) -- Default: RightAlt

        Tabs.Movement:AddSlider("Gravity",
            { Title = "Gravity", Default = 196.2, Min = 0, Max = 200, Callback = function(v) Events:Emit("set_gravity", v) end })
    end

    -- [[ VISUAL TAB ]]
    Tabs.Visual = Window:Tab({ Title = "Visual", Icon = "eye" })
    Toggle(Tabs.Visual, "ESP", "Enable ESP", false, function(v)
        local opts = { showName = true, showDistance = true, showHealth = true, showChams = true }
        Events:Emit("toggle_esp", v, opts)
    end, Enum.KeyCode.Y) -- Default: Y

    Toggle(Tabs.Visual, "Fullbright", "Fullbright", false, function(v) Events:Emit("toggle_fullbright", v) end, Enum.KeyCode.U) -- Default: U

    if isPremium then
        Tabs.Visual:AddSection("Premium Visuals")
        Toggle(Tabs.Visual, "SkelESP", "Skeleton ESP", false, function(v) Events:Emit("toggle_skeleton", v) end, Enum.KeyCode.L) -- Default: L
        Toggle(Tabs.Visual, "Tracers", "Tracers", false, function(v) Events:Emit("toggle_tracers", v) end, Enum.KeyCode.K) -- Default: K
    end

    -- [[ PLAYER TAB ]]
    Tabs.Player = Window:Tab({ Title = "Player", Icon = "user" })
    Tabs.Player:AddButton({ Title = "Reset Character", Callback = function() Events:Emit("action_reset") end })
    Toggle(Tabs.Player, "AutoRespawn", "Fast Respawn", false, function(v) Events:Emit("toggle_autorespawn", v) end, Enum.KeyCode.RightBracket) -- Default: RightBracket
    Toggle(Tabs.Player, "NoCol", "Disable Collision", false, function(v) Events:Emit("toggle_nocollision", v) end)

    if isPremium then
        Tabs.Player:AddSection("Premium Player")
        Toggle(Tabs.Player, "GodMode", "God Mode", false, function(v) Events:Emit("toggle_godmode", v) end, Enum.KeyCode.Delete) -- Default: Delete
        Toggle(Tabs.Player, "NoFall", "No Fall Damage", false, function(v) Events:Emit("toggle_nofall", v) end, Enum.KeyCode.End) -- Default: End
        Toggle(Tabs.Player, "NoRagdoll", "Anti-Ragdoll", false, function(v) Events:Emit("toggle_noragdoll", v) end)
        Tabs.Player:AddSlider("AnimSpeed",
            { Title = "Animation Speed", Default = 1, Min = 0, Max = 5, Callback = function(v) Events:Emit(
                "toggle_animspeed", true, v) end })
    end

    -- [[ UTILITY TAB ]]
    Tabs.Utility = Window:Tab({ Title = "Utility", Icon = "wrench" })
    Tabs.Utility:AddButton({ Title = "Rejoin Server", Callback = function() Events:Emit("action_rejoin") end })
    Tabs.Utility:AddButton({ Title = "Unlock FPS", Description = "Boost FPS Cap", Callback = function() Events:Emit(
        "action_unlockfps") end })
    Toggle(Tabs.Utility, "AntiAFK", "Anti-AFK", false, function(v) Events:Emit("toggle_antiafk", v) end, Enum.KeyCode.P) -- Default: P
    Toggle(Tabs.Utility, "FPSBoost", "FPS Boost (Low Quality)", false, function(v) Events:Emit("toggle_fpsboost", v) end, Enum.KeyCode.O) -- Default: O

    if isPremium then
        Tabs.Utility:AddSection("Premium Utilities")
        Toggle(Tabs.Utility, "PerfMon", "Performance Monitor", false, function(v) Events:Emit("toggle_perfmon", v) end)
        Toggle(Tabs.Utility, "AntiLag", "Anti-Lag (Textures Off)", false,
            function(v) Events:Emit("toggle_antilag", v) end)
    end

    -- [[ SETTINGS TAB ]]
    Tabs.Settings = Window:Tab({ Title = "Settings", Icon = "settings" })
    
    local ThemeNames = {}
    for Name, _ in next, Fluent.Themes do
        table.insert(ThemeNames, Name)
    end
    
    Tabs.Settings:AddDropdown("Theme",
        { Title = "Interface Theme", Values = ThemeNames, Default = Fluent.Theme, Callback = function(v) Fluent
                :SetTheme(v) end })

    if isPremium then
        Tabs.Settings:AddSection("Config Manager")
        Tabs.Settings:AddInput("ConfName", { Title = "Config Name", Default = "default" })
        Tabs.Settings:AddButton({
            Title = "Save Config",
            Callback = function()
                local name = Fluent.Options.ConfName and Fluent.Options.ConfName.Value or "default"
                SaveConfig(name)
            end
        })
        Tabs.Settings:AddButton({
            Title = "Load Config",
            Callback = function()
                local name = Fluent.Options.ConfName and Fluent.Options.ConfName.Value or "default"
                LoadConfig(name)
            end
        })
    end

    -- Fix for empty tab on load: Yield briefly to ensure UI is ready
    task.spawn(function()
        task.wait(0.2)
        if Window then Window:SelectTab(1) end
    end)

    _G.FSSHUB_WINDOW = Window
    _G.FSSHUB_FLUENT = Fluent
    _G.FSSHUB_OPTIONS = Fluent.Options
    if getgenv then getgenv().FSSHUB_MAIN_MENU_READY = true end
    
    -- Auto Load 'default' config if it exists and user is Premium
    if isPremium then
        pcall(function()
            local path = CONFIG_FOLDER .. "/default.json"
            if isfile(path) then
                LoadConfig("default")
            end
        end)
    end
    
    print("[FSSHUB] UI Builder Completed.")
end
