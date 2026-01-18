--[[
    FSSHUB Main Menu - Fluent Renewed (v4.0.8)
    Architecture: Async Background Execution + Time Slicing
    Mode: Headless (Visuals handled by Junkie Loader)
    Workspace: FSSHUB/
]]

-- 1. UTILITIES & CONFIG
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

-- Cleanup Old UI AND cached references (Critical for re-run stability)
if _G.FSSHUB_FLUENT then
    pcall(function() _G.FSSHUB_FLUENT:Destroy() end)
    -- Clear Options cache to prevent stale references
    pcall(function()
        if _G.FSSHUB_FLUENT.Options then
            _G.FSSHUB_FLUENT.Options = {}
        end
    end)
end
_G.FSSHUB_WINDOW = nil
_G.FSSHUB_OPTIONS = nil

-- CRITICAL: Use the bundled Fluent instance for optimal performance
-- Do NOT clear FSSHUB_GET_FLUENT here, as it is set by the bundle loader wrapper.


local Info = getgenv().FSSHUB_INFO

-- Theme System
local THEME_FILE = "FSSHUB/Config/theme.cfg"
if makefolder then
    pcall(function()
        if not isfolder("FSSHUB") then makefolder("FSSHUB") end
        if not isfolder("FSSHUB/Config") then makefolder("FSSHUB/Config") end
    end)
end

local function SaveTheme(themeName)
    if writefile then pcall(writefile, THEME_FILE, themeName) end
end

local function GetSavedTheme()
    if not readfile then return "Cyber" end
    local success, themeName = pcall(readfile, THEME_FILE)
    return success and themeName or "Cyber"
end

-- 2. MAIN UI LOGIC (InitUI)
-- Defined as a standalone function to be called asynchronously
local function InitUI(Fluent)
    Log("Starting UI Build Phase...")

    -- Event Bus initialization
    -- Event Bus initialization
    local Events = _G.FSSHUB_EVENTS
    if not Events and getgenv then
        Events = getgenv().FSSHUB_EVENTS
    end

    -- Fallback with Warning
    if not Events then
        warn("[FSSHUB] CRITICAL: Event Bus NOT Connected. Features will not work.")
        Events = { listeners = {}, Emit = function() warn("[FSSHUB] Attempted to emit event on disconnected bus") end, On = function() end }
    end

    if not _G.FSSHUB_EVENTS then
        _G.FSSHUB_EVENTS = Events
    end

    -- Window Setup
    local isPremium = (Info.User.IsPremium == true or Info.User.IsPremium == "true")
    local gameName = Info.Game.Name or "Universal"

    -- Cleanup Old UI (Robust)
    if _G.FSSHUB_WINDOW and _G.FSSHUB_WINDOW.Destroy then
        pcall(function() _G.FSSHUB_WINDOW:Destroy() end)
    end
    -- Fallback: Search CoreGui manually
    if game:GetService("CoreGui"):FindFirstChild("FSSHUB") then
        pcall(function() game:GetService("CoreGui").FSSHUB:Destroy() end)
    elseif game:GetService("CoreGui"):FindFirstChild("ScreenGui") then
        -- Fluent sometimes names it "ScreenGui" if not set?
        -- Safer not to blindly destroy "ScreenGui", rely on Window:Destroy
    end

    local Window = Fluent:Window({
        Title = isPremium and "FSSHUB 👑 | " .. gameName or "FSSHUB | " .. gameName,
        SubTitle = Info.Version or "v2.0",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Resize = false,
        MinimizeKey = Enum.KeyCode.RightControl,
        Acrylic = false,
        Theme = GetSavedTheme(),
        -- CLEANUP: Reset everything when Main Menu is closed
        OnClose = function()
            -- Unified Janitor Cleanup (Covers UI, Logic, Visuals)
            if _G.FSSHUB_CLEANUP then
                _G.FSSHUB_CLEANUP()
            end
        end
    })

    -- Register Window Cleanup to Janitor (Double Safety)
    if getgenv().FSSHUB_JANITOR then
        getgenv().FSSHUB_JANITOR.TrackInstance(Window)
        -- Also register cache saving if needed
        getgenv().FSSHUB_JANITOR.Register(function()
            -- Save theme/config before death if needed?
            -- already saved on change.
            _G.FSSHUB_WINDOW = nil
            _G.FSSHUB_FLUENT = nil
        end)
    end

    -- Theme Saving Hook
    if Fluent.ThemeChanged then
        Fluent.ThemeChanged:Connect(SaveTheme)
    end

    -- Helper Function
    local function Toggle(tab, id, title, default, callback, keybind)
        local config = { Title = title, Default = default, Callback = callback or function() end }
        local toggle = tab:AddToggle(id, config)

        -- Feature: Keybinds only for Premium
        if isPremium then
            -- Default keybind (None if not provided)
            local kbind = keybind or Enum.KeyCode.Unknown
            toggle:Keybind("Key_" .. id,
                { Title = "Key", Default = kbind, Mode = "Toggle", Callback = function() end, ChangedCallback = function() end })
        end
        return toggle
    end

    -- TABS (Time Sliced for Anti-Freeze)
    task.wait(0.05) -- Yield to main thread
    local Tabs = {}

    Tabs.Home = Window:Tab({ Title = "Dashboard", Icon = "home" })

    -- Home Content
    Tabs.Home:AddParagraph("Welcome", {
        Title = isPremium and "Welcome, Premium User! 👑" or "Welcome to FSSHub",
        Content = "User: " .. (Info.User.Username or "Guest") .. "\nTier: " .. (Info.User.Tier or "Free")
    })
    Tabs.Home:AddButton({
        Title = "Join Discord",
        Description = "Get Support & Premium",
        Callback = function()
            if setclipboard then setclipboard("https://discord.gg/fsshub") end
            Fluent:Notify({ Title = "Link Copied!", Content = "Discord link copied to clipboard.", Duration = 3 })
        end
    })

    task.wait(0.02)

    Tabs.Movement = Window:Tab({ Title = "Movement", Icon = "footprints" })

    -- Movement Content
    -- FIX: Reordered to ensure Sliders exist, but more importantly, added safe checks in callbacks

    Tabs.Movement:AddSlider("SpeedVal",
        {
            Title = "Value",
            Default = 16,
            Min = 16,
            Max = 500,
            Callback = function(v)
                local enabled = false
                if Fluent.Options.Speed and Fluent.Options.Speed.Value then enabled = Fluent.Options.Speed.Value end
                Events:Emit("toggle_speed", enabled, v)
            end
        })

    Toggle(Tabs.Movement, "Speed", "Walk Speed", false,
        function(v)
            local val = 16
            if Fluent.Options.SpeedVal and Fluent.Options.SpeedVal.Value then val = Fluent.Options.SpeedVal.Value end
            Events:Emit("toggle_speed", v, val)
        end)

    Tabs.Movement:AddSlider("JumpVal",
        {
            Title = "Value",
            Default = 50,
            Min = 50,
            Max = 500,
            Callback = function(v)
                local enabled = false
                if Fluent.Options.Jump and Fluent.Options.Jump.Value then enabled = Fluent.Options.Jump.Value end
                Events:Emit("toggle_jump", enabled, v)
            end
        })

    Toggle(Tabs.Movement, "Jump", "Jump Power", false,
        function(v)
            local val = 50
            if Fluent.Options.JumpVal and Fluent.Options.JumpVal.Value then val = Fluent.Options.JumpVal.Value end
            Events:Emit("toggle_jump", v, val)
        end)

    if isPremium then
        Tabs.Movement:AddParagraph("Prem", { Title = "Premium", Content = "Fly & Noclip unlocked" })
        Toggle(Tabs.Movement, "Fly", "Fly Mode", false, function(v) Events:Emit("toggle_fly", v) end, Enum.KeyCode.F)
        Toggle(Tabs.Movement, "Noclip", "Noclip", false, function(v) Events:Emit("toggle_noclip", v) end)
    end

    task.wait(0.02)

    Tabs.Visual = Window:Tab({ Title = "Visual", Icon = "eye" })
    -- Visual Content
    Toggle(Tabs.Visual, "ESP", "Enable ESP", false, function(v) Events:Emit("toggle_esp", v) end, Enum.KeyCode.E)
    Toggle(Tabs.Visual, "Fullbright", "Fullbright", false, function(v) Events:Emit("toggle_fullbright", v) end)

    task.wait(0.02)

    Tabs.Utility = Window:Tab({ Title = "Utility", Icon = "wrench" })
    Tabs.Utility:AddButton({ Title = "Rejoin Server", Callback = function() Events:Emit("action_rejoin") end })

    Tabs.Player = Window:Tab({ Title = "Player", Icon = "user" })
    Tabs.Player:AddButton({ Title = "Reset Character", Callback = function() Events:Emit("action_reset") end })

    task.wait(0.02)

    Tabs.Settings = Window:Tab({ Title = "Settings", Icon = "settings" })
    Tabs.Settings:AddDropdown("Theme",
        { Title = "Theme", Values = Fluent.Themes, Default = Fluent.Theme, Callback = function(v) Fluent:SetTheme(v) end })

    Window:SelectTab(1)

    -- Finalize
    _G.FSSHUB_WINDOW = Window
    _G.FSSHUB_FLUENT = Fluent
    _G.FSSHUB_OPTIONS = Fluent.Options

    Log("UI Built. Signaling Loader...")

    -- SIGNAL READY to close Junkie Loading Screen
    if getgenv then getgenv().FSSHUB_MAIN_MENU_READY = true end
    print("[FSSHUB] UI Fully Loaded.")
end

-- 3. EXECUTION CHAIN (Async)
-- 3. EXECUTION CHAIN (Official Fluent Loader)
task.spawn(function()
    Log("Initializing Official Fluent Library...")

    local success, result = pcall(function()
        return game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua")
    end)

    if not success or not result then
        warn("[FSSHUB] Critical: Failed to load Fluent Library from GitHub.")
        return
    end

    local loaderFunc, err = loadstring(result)
    if not loaderFunc then
        warn("[FSSHUB] Critical: Failed to compile Fluent Library. Error: " .. tostring(err))
        return
    end

    local Fluent = loaderFunc()

    if not Fluent then
        warn("[FSSHUB] Critical: Fluent Library failed to initialize.")
        return
    end

    -- Inject Custom 'Cyber' Theme
    Fluent.Themes["Cyber"] = {
        Accent = Color3.fromRGB(138, 110, 215),                                                      -- Vibrant Purple (Junkie Accent)

        AcrylicMain = Color3.fromRGB(25, 20, 35),                                                    -- Dark Purple Glass Tint (Junkie Bg)
        AcrylicBorder = Color3.fromRGB(140, 120, 210),                                               -- Lighter Purple Stroke
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(20, 20, 25), Color3.fromRGB(10, 10, 15)), -- Gradient from Junkie UI
        AcrylicNoise = 1,

        TitleBarLine = Color3.fromRGB(140, 120, 210),
        Tab = Color3.fromRGB(180, 180, 200),             -- TextDim

        Element = Color3.fromRGB(15, 12, 25),            -- InputBg
        ElementBorder = Color3.fromRGB(40, 30, 60),      -- ButtonBg as border
        InElementBorder = Color3.fromRGB(138, 110, 215), -- Accent
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
        InputIndicator = Color3.fromRGB(170, 150, 240), -- Secondary Purple

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
        Hover = Color3.fromRGB(170, 150, 240), -- Secondary Purple
        HoverChange = 0.1
    }

    Log("Fluent Loaded & Cyber Theme Injected. Initializing UI...")

    -- Start UI Build
    task.defer(function()
        InitUI(Fluent)
    end)
end)
