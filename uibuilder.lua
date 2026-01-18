-- [[ FSSHUB V5 Menu Builder ]]
-- Architecture: Dual-Asset Lazy Cache
-- This script replaces the old Main_Menu.lua logic

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
    local THEME_FILE = "FSSHUB/Config/theme.cfg"
    local function SaveTheme(themeName)
        if writefile then pcall(writefile, THEME_FILE, themeName) end
    end
    local function GetSavedTheme()
        if not readfile then return "Cyber" end
        local s, t = pcall(readfile, THEME_FILE)
        return s and t or "Cyber"
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
    Tabs.Home = Window:Tab({ Title = "Dashboard", Icon = "home" })
    Tabs.Home:AddParagraph("Welcome", {
        Title = isPremium and "Welcome, Premium User! 👑" or "Welcome to FSSHub",
        Content = "User: " .. (Info.User.Username or "Guest") .. "\nTier: " .. (Info.User.Tier or "Free")
    })
    Tabs.Home:AddButton({
        Title = "Join Discord",
        Description = "Get Support",
        Callback = function()
            if setclipboard then setclipboard("https://discord.gg/fsshub") end
            Fluent:Notify({ Title = "Link Copied!", Content = "Discord link copied.", Duration = 3 })
        end
    })

    Tabs.Movement = Window:Tab({ Title = "Movement", Icon = "footprints" })
    Tabs.Movement:AddSlider("SpeedVal", {
        Title = "Value",
        Default = 16,
        Min = 16,
        Max = 500,
        Callback = function(v)
            local e = false
            if Fluent.Options.Speed and Fluent.Options.Speed.Value then e = Fluent.Options.Speed.Value end
            Events:Emit("toggle_speed", e, v)
        end
    })
    Toggle(Tabs.Movement, "Speed", "Walk Speed", false, function(v)
        local val = 16
        if Fluent.Options.SpeedVal then val = Fluent.Options.SpeedVal.Value end
        Events:Emit("toggle_speed", v, val)
    end)

    Tabs.Movement:AddSlider("JumpVal", {
        Title = "Value",
        Default = 50,
        Min = 50,
        Max = 500,
        Callback = function(v)
            local e = false
            if Fluent.Options.Jump and Fluent.Options.Jump.Value then e = Fluent.Options.Jump.Value end
            Events:Emit("toggle_jump", e, v)
        end
    })
    Toggle(Tabs.Movement, "Jump", "Jump Power", false, function(v)
        local val = 50
        if Fluent.Options.JumpVal then val = Fluent.Options.JumpVal.Value end
        Events:Emit("toggle_jump", v, val)
    end)

    if isPremium then
        Tabs.Movement:AddParagraph("Prem", { Title = "Premium", Content = "Fly & Noclip unlocked" })
        Toggle(Tabs.Movement, "Fly", "Fly Mode", false, function(v) Events:Emit("toggle_fly", v) end, Enum.KeyCode.F)
        Toggle(Tabs.Movement, "Noclip", "Noclip", false, function(v) Events:Emit("toggle_noclip", v) end)
    end

    Tabs.Visual = Window:Tab({ Title = "Visual", Icon = "eye" })
    Toggle(Tabs.Visual, "ESP", "Enable ESP", false, function(v) Events:Emit("toggle_esp", v) end, Enum.KeyCode.E)
    Toggle(Tabs.Visual, "Fullbright", "Fullbright", false, function(v) Events:Emit("toggle_fullbright", v) end)

    Tabs.Utility = Window:Tab({ Title = "Utility", Icon = "wrench" })
    Tabs.Utility:AddButton({ Title = "Rejoin Server", Callback = function() Events:Emit("action_rejoin") end })

    Tabs.Player = Window:Tab({ Title = "Player", Icon = "user" })
    Tabs.Player:AddButton({ Title = "Reset Character", Callback = function() Events:Emit("action_reset") end })

    Tabs.Settings = Window:Tab({ Title = "Settings", Icon = "settings" })
    Tabs.Settings:AddDropdown("Theme",
        { Title = "Theme", Values = Fluent.Themes, Default = Fluent.Theme, Callback = function(v) Fluent:SetTheme(v) end })

    Window:SelectTab(1)

    _G.FSSHUB_WINDOW = Window
    _G.FSSHUB_FLUENT = Fluent
    _G.FSSHUB_OPTIONS = Fluent.Options
    if getgenv then getgenv().FSSHUB_MAIN_MENU_READY = true end
    print("[FSSHUB] UI Builder Completed.")
end
