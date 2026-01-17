--[[
    FSSHUB Main Menu - Fluent Renewed (v4.0.8)
    Architecture: Async Background Execution + Time Slicing
    Mode: Headless (Visuals handled by Junkie Loader)
    Workspace: FSSHUBLibrary/
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

-- Cleanup Old UI
if _G.FSSHUB_FLUENT then
    pcall(function() _G.FSSHUB_FLUENT:Destroy() end)
end
_G.FSSHUB_WINDOW = nil

local Info = getgenv().FSSHUB_INFO

-- Theme System
local THEME_FILE = "FSSHUBLibrary/theme.cfg"
if makefolder then pcall(function() makefolder("FSSHUBLibrary") end) end

local function SaveTheme(themeName)
    if writefile then pcall(writefile, THEME_FILE, themeName) end
end

local function GetSavedTheme()
    if not readfile then return "Dark" end
    local success, themeName = pcall(readfile, THEME_FILE)
    return success and themeName or "Dark"
end

-- 2. MAIN UI LOGIC (InitUI)
-- Defined as a standalone function to be called asynchronously
local function InitUI(Fluent)
    Log("Starting UI Build Phase...")

    -- Event Bus initialization
    local Events = _G.FSSHUB_EVENTS or { listeners = {}, Emit = function() end, On = function() end }
    if not _G.FSSHUB_EVENTS then
        _G.FSSHUB_EVENTS = Events
    end

    -- Window Setup
    local isPremium = (Info.User.IsPremium == true or Info.User.IsPremium == "true")
    local gameName = Info.Game.Name or "Universal"

    local Window = Fluent:Window({
        Title = isPremium and "FSSHUB 👑 | " .. gameName or "FSSHUB | " .. gameName,
        SubTitle = Info.Version or "v2.0",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Resize = false,
        MinimizeKey = Enum.KeyCode.RightControl,
        Acrylic = false,
        Theme = GetSavedTheme()
    })

    -- Theme Saving Hook
    if Fluent.ThemeChanged then
        Fluent.ThemeChanged:Connect(SaveTheme)
    end

    -- Helper Function
    local function Toggle(tab, id, title, default, callback, keybind)
        local config = { Title = title, Default = default, Callback = callback or function() end }
        local toggle = tab:AddToggle(id, config)
        if keybind then
            toggle:Keybind("Key_" .. id,
                { Title = "Key", Default = keybind, Mode = "Toggle", Callback = function() end, ChangedCallback = function() end })
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
    Toggle(Tabs.Movement, "Speed", "Walk Speed", false,
        function(v) Events:Emit("toggle_speed", v, Fluent.Options.SpeedVal.Value) end)
    Tabs.Movement:AddSlider("SpeedVal",
        { Title = "Value", Default = 16, Min = 16, Max = 500, Callback = function(v) Events:Emit("toggle_speed",
                Fluent.Options.Speed.Value, v) end })

    Toggle(Tabs.Movement, "Jump", "Jump Power", false,
        function(v) Events:Emit("toggle_jump", v, Fluent.Options.JumpVal.Value) end)
    Tabs.Movement:AddSlider("JumpVal",
        { Title = "Value", Default = 50, Min = 50, Max = 500, Callback = function(v) Events:Emit("toggle_jump",
                Fluent.Options.Jump.Value, v) end })

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
task.spawn(function()
    -- Check Pre-load
    if getgenv().FSSHUB_GET_FLUENT then
        Log("Checking pre-load cache...")
        local lib = getgenv().FSSHUB_GET_FLUENT(10)
        if lib then
            Log("Using Cached Fluent")
            task.defer(function() InitUI(lib) end)
            return
        end
    end

    -- Download Fallback
    Log("Downloading Fluent Library...")
    local success, result = pcall(function()
        task.wait(0.1) -- Non-blocking yield
        return loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/fluent_loader.lua?v=4.0.8"))()
    end)

    if success and result then
        Log("Fluent Loaded. Initializing UI...")
        task.wait(0.05) -- Reset script timer

        -- Start UI Build in fresh thread
        task.defer(function()
            InitUI(result)
        end)
    else
        warn("Fluent Load Error: " .. tostring(result))
        -- In case of error, we should arguably notify the user,
        -- but since we removed the loading screen, we relay on console.
        -- Or we could signal FSSHUB_MAIN_MENU_READY = true anyway to close the loader loop?
        -- No, let it hang or timeout in the loader so user sees "TIMEOUT".
    end
end)
