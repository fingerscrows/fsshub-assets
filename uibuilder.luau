-- [[ FSSHUB V5 Menu Builder ]]
-- Architecture: Dual-Asset Lazy Cache
-- Updated: Added complete feature coverage for Free & Premium

return function(Fluent)
    local Info = getgenv().FSSHUB_INFO
    task.wait() -- Yield to prevent timeout
    if not Info then
        warn("[FSSHUB] Info missing")
        return
    end

    -- 1. Inject Default Theme
    Fluent.Themes["Default"] = {
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
        task.spawn(function()
            if not isfolder("FSSHUB") then makefolder("FSSHUB") end
            if not isfolder(CONFIG_FOLDER) then makefolder(CONFIG_FOLDER) end
            if writefile then pcall(writefile, THEME_FILE, themeName) end
        end)
    end

    local function GetSavedTheme()
        if not readfile or not isfile(THEME_FILE) then return "FSSvs" end
        local s, t = pcall(readfile, THEME_FILE)
        return s and t or "FSSvs"
    end

    local function GetConfigList()
        if not isfolder(CONFIG_FOLDER) then return {} end
        local files = listfiles(CONFIG_FOLDER)
        local names = {}
        for _, file in ipairs(files) do
            if file:match("%.json$") then
                local name = file:match("([^/\\]+)%.json$")
                if name then table.insert(names, name) end
            end
        end
        return names
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
            elseif option.Type == "Keybind" then
                 data[key] = { Type = "Keybind", Value = option.Value.Name }
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
                    elseif setting.Type == "Keybind" then
                        pcall(function() option:SetValue(Enum.KeyCode[setting.Value]) end)
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



    Tabs.Home:AddButton({
        Title = "Join Discord",
        Description = "Get Support",
        Icon = "gamepad-2",
        Callback = function()
            if setclipboard then setclipboard("https://discord.gg/fsshub") end
            Fluent:Notify({ Title = "Link Copied!", Content = "Discord link copied.", Duration = 3 })
        end
    })

    task.wait() -- Yield after Home tab

    -- [[ MOVEMENT TAB ]]
    Tabs.Movement = Window:Tab({ Title = "Movement", Icon = "run" })

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

    task.wait() -- Yield after Movement tab

    -- [[ VISUAL TAB ]]
    Tabs.Visual = Window:Tab({ Title = "Visual", Icon = "eye" })
    Toggle(Tabs.Visual, "ESP", "Enable ESP", false, function(v)
        local opts = { showName = true, showDistance = true, showHealth = true, showChams = true }
        Events:Emit("toggle_esp", v, opts)
    end, Enum.KeyCode.Y) -- Default: Y

    Toggle(Tabs.Visual, "Fullbright", "Fullbright", false, function(v) Events:Emit("toggle_fullbright", v) end, Enum.KeyCode.U) -- Default: U

    if isPremium then

        Toggle(Tabs.Visual, "SkelESP", "Skeleton ESP", false, function(v) Events:Emit("toggle_skeleton", v) end, Enum.KeyCode.L) -- Default: L
        Toggle(Tabs.Visual, "Tracers", "Tracers", false, function(v) Events:Emit("toggle_tracers", v) end, Enum.KeyCode.K) -- Default: K
    end

    task.wait() -- Yield after Visual tab

    -- [[ PLAYER TAB ]]
    Tabs.Player = Window:Tab({ Title = "Player", Icon = "user" })
    Tabs.Player:AddButton({ Title = "Reset Character", Icon = "skull", Callback = function() Events:Emit("action_reset") end })
    Toggle(Tabs.Player, "AutoRespawn", "Fast Respawn", false, function(v) Events:Emit("toggle_autorespawn", v) end, Enum.KeyCode.RightBracket) -- Default: RightBracket
    Toggle(Tabs.Player, "NoCol", "Disable Collision", false, function(v) Events:Emit("toggle_nocollision", v) end)

    if isPremium then

        Toggle(Tabs.Player, "GodMode", "God Mode", false, function(v) Events:Emit("toggle_godmode", v) end, Enum.KeyCode.Delete) -- Default: Delete
        Toggle(Tabs.Player, "NoFall", "No Fall Damage", false, function(v) Events:Emit("toggle_nofall", v) end, Enum.KeyCode.End) -- Default: End
        Toggle(Tabs.Player, "NoRagdoll", "Anti-Ragdoll", false, function(v) Events:Emit("toggle_noragdoll", v) end)
        Tabs.Player:AddSlider("AnimSpeed",
            { Title = "Animation Speed", Default = 1, Min = 0, Max = 5, Callback = function(v) Events:Emit(
                "toggle_animspeed", true, v) end })
    end

    task.wait() -- Yield after Player tab

    -- [[ UTILITY TAB ]]
    Tabs.Utility = Window:Tab({ Title = "Utility", Icon = "wrench" })
    Tabs.Utility:AddButton({ Title = "Rejoin Server", Icon = "refresh-cw", Callback = function() Events:Emit("action_rejoin") end })
    Tabs.Utility:AddButton({ Title = "Unlock FPS", Description = "Boost FPS Cap", Icon = "unlock", Callback = function() Events:Emit(
        "action_unlockfps") end })
    Toggle(Tabs.Utility, "AntiAFK", "Anti-AFK", false, function(v) Events:Emit("toggle_antiafk", v) end, Enum.KeyCode.P) -- Default: P
    Toggle(Tabs.Utility, "FPSBoost", "FPS Boost (Low Quality)", false, function(v) Events:Emit("toggle_fpsboost", v) end, Enum.KeyCode.O) -- Default: O

    if isPremium then
        Tabs.Utility:AddButton({ Title = "Server Hop", Description = "Find a better server", Icon = "server", Callback = function() Events
                :Emit("action_serverhop") end })
        Tabs.Utility:AddButton({ Title = "Auto Rejoin", Description = "Rejoin on kick", Icon = "repeat", Callback = function() Events:Emit(
            "toggle_autorejoin", true) end })
        Toggle(Tabs.Utility, "PerfMon", "Performance Monitor", false, function(v) Events:Emit("toggle_perfmon", v) end)
        Toggle(Tabs.Utility, "AntiLag", "Anti-Lag (Textures Off)", false,
            function(v) Events:Emit("toggle_antilag", v) end)
    end

    task.wait() -- Yield after Utility tab

    -- [[ SETTINGS TAB ]]
    Tabs.Settings = Window:Tab({ Title = "Settings", Icon = "settings" })
    
    local ThemeNames = {}
    for key, val in pairs(Fluent.Themes) do
        local name = val
        if type(key) == "string" then
            name = key
        elseif type(val) == "string" then
            name = val
        end
        
        if name == "Cyber" then
             table.insert(ThemeNames, "FSSvs")
        elseif name ~= "Default" then -- Ensure Default is skipped if implicitly present
             table.insert(ThemeNames, name)
        end
    end
    
    Tabs.Settings:AddDropdown("Theme",
        { Title = "Interface Theme", Values = ThemeNames, Default = "FSSvs", Callback = function(v)
            local real = v
            if v == "FSSvs" then real = "Cyber" end
            Fluent:SetTheme(real)
            Events:Emit("theme_changed", real)
        end })

    Tabs.Settings:AddKeybind("CloseUI", {
        Title = "Hide Menu Keybind",
        Description = "Key to toggle the main menu visibility",
        Default = Enum.KeyCode.RightControl,
        ChangedCallback = function(New)
            Fluent.MinimizeKey = New
        end
    })



    if isPremium then
        Tabs.Settings:AddSection("Config Manager")
        
        local Configs = GetConfigList()
        
        local ConfDropdown = Tabs.Settings:AddDropdown("ConfSelect", {
            Title = "Select Config",
            Values = Configs,
            Multi = false,
            Default = nil,
            Callback = function(v)
                if Tabs.Settings.Options.ConfName then
                   Tabs.Settings.Options.ConfName:SetValue(v)
                end
            end
        })

        Tabs.Settings:AddInput("ConfName", { Title = "Config Name", Default = "default" })

        Tabs.Settings:AddButton({
            Title = "Refresh List",
            Icon = "refresh-cw",
            Callback = function()
                ConfDropdown:SetValues(GetConfigList())
                Fluent:Notify({ Title = "Refreshed", Content = "Config list updated.", Duration = 2 })
            end
        })

        Tabs.Settings:AddButton({
            Title = "Save Config",
            Icon = "save",
            Callback = function()
                local name = Fluent.Options.ConfName and Fluent.Options.ConfName.Value or "default"
                SaveConfig(name)
                ConfDropdown:SetValues(GetConfigList())
            end
        })
        Tabs.Settings:AddButton({
            Title = "Load Config",
            Icon = "file-output",
            Callback = function()
                local name = Fluent.Options.ConfName and Fluent.Options.ConfName.Value or "default"
                LoadConfig(name)
            end
        })
        
        Tabs.Settings:AddButton({
            Title = "Reset Defaults",
            Description = "Reset all settings to default values",
            Icon = "rotate-ccw",
            Callback = function()
                Window:Dialog({
                    Title = "Reset Settings?",
                    Content = "Are you sure you want to reset all settings to their default values?",
                    Buttons = {
                        {
                            Title = "Yes, Reset",
                            Callback = function()
                                for key, option in pairs(Fluent.Options) do
                                    if option.Type == "Toggle" then
                                        option:SetValue(option.Default ~= nil and option.Default or false)
                                    elseif option.Type == "Slider" then
                                        option:SetValue(option.Default or option.Min or 0)
                                    elseif option.Type == "Dropdown" then
                                        option:SetValue(option.Default or option.Values[1])
                                    elseif option.Type == "Colorpicker" then
                                        option:SetValue(option.Default or Color3.new(1,1,1))
                                    elseif option.Type == "Keybind" then
                                        option:SetValue(option.Default or "None")
                                    end
                                end
                                Fluent:SetTheme("FSSvs")
                                Fluent:Notify({ Title = "Reset Complete", Content = "Settings have been reset.", Duration = 3 })
                            end
                        },
                        {
                            Title = "Cancel",
                            Callback = function() end
                        }
                    }
                })
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
