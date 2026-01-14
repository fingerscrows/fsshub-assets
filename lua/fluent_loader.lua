--[[
    Fluent UI Loader for FSSHUB
    Version: 1.0.0
    
    This loader fetches the Fluent UI library from your GitHub fork
    and handles module resolution without bundling.
]]

local BASE_URL = "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/ui_source/main_menu/src/"

-- Module cache to avoid redundant HTTP requests
local ModuleCache = {}

-- Module name to file path mapping
local ModuleMap = {
    -- Core
    ["Root"] = "init.lua",
    ["Creator"] = "Creator.lua",
    ["Icons"] = "Icons.lua",
    ["Bridge"] = "FSSHUB_Bridge.lua",
    
    -- Acrylic
    ["Acrylic"] = "Acrylic/init.lua",
    ["Acrylic/Utils"] = "Acrylic/Utils.lua",
    ["Acrylic/AcrylicBlur"] = "Acrylic/AcrylicBlur.lua",
    ["Acrylic/AcrylicPaint"] = "Acrylic/AcrylicPaint.lua",
    ["Acrylic/CreateAcrylic"] = "Acrylic/CreateAcrylic.lua",
    
    -- Themes
    ["Themes"] = "Themes/init.lua",
    ["Themes/Amethyst"] = "Themes/Amethyst.lua",
    ["Themes/Aqua"] = "Themes/Aqua.lua",
    ["Themes/Dark"] = "Themes/Dark.lua",
    ["Themes/Darker"] = "Themes/Darker.lua",
    ["Themes/Light"] = "Themes/Light.lua",
    ["Themes/Rose"] = "Themes/Rose.lua",
    
    -- Flipper (Animation Library)
    ["Flipper"] = "Packages/Flipper/init.lua",
    ["Flipper/BaseMotor"] = "Packages/Flipper/BaseMotor.lua",
    ["Flipper/GroupMotor"] = "Packages/Flipper/GroupMotor.lua",
    ["Flipper/SingleMotor"] = "Packages/Flipper/SingleMotor.lua",
    ["Flipper/Instant"] = "Packages/Flipper/Instant.lua",
    ["Flipper/Linear"] = "Packages/Flipper/Linear.lua",
    ["Flipper/Spring"] = "Packages/Flipper/Spring.lua",
    ["Flipper/Signal"] = "Packages/Flipper/Signal.lua",
    ["Flipper/isMotor"] = "Packages/Flipper/isMotor.lua",
    
    -- Elements (UI Components)
    ["Elements"] = "Elements/init.lua",
    ["Elements/Button"] = "Elements/Button.lua",
    ["Elements/Colorpicker"] = "Elements/Colorpicker.lua",
    ["Elements/Dropdown"] = "Elements/Dropdown.lua",
    ["Elements/Input"] = "Elements/Input.lua",
    ["Elements/Keybind"] = "Elements/Keybind.lua",
    ["Elements/Paragraph"] = "Elements/Paragraph.lua",
    ["Elements/Slider"] = "Elements/Slider.lua",
    ["Elements/Toggle"] = "Elements/Toggle.lua",
    
    -- Components (Higher-level UI)
    ["Components/Assets"] = "Components/Assets.lua",
    ["Components/Button"] = "Components/Button.lua",
    ["Components/Dialog"] = "Components/Dialog.lua",
    ["Components/Element"] = "Components/Element.lua",
    ["Components/Notification"] = "Components/Notification.lua",
    ["Components/Section"] = "Components/Section.lua",
    ["Components/Tab"] = "Components/Tab.lua",
    ["Components/Textbox"] = "Components/Textbox.lua",
    ["Components/TitleBar"] = "Components/TitleBar.lua",
    ["Components/Window"] = "Components/Window.lua",
}

-- Custom require function
local function customRequire(moduleName)
    -- Check cache first
    if ModuleCache[moduleName] then
        return ModuleCache[moduleName]
    end
    
    -- Get file path from map
    local filePath = ModuleMap[moduleName]
    if not filePath then
        warn("[Fluent Loader] Module not mapped: " .. tostring(moduleName))
        return nil
    end
    
    -- Fetch from GitHub
    local url = BASE_URL .. filePath
    local success, source = pcall(function()
        return game:HttpGet(url)
    end)
    
    if not success or not source or source == "" then
        warn("[Fluent Loader] Failed to fetch: " .. url)
        return nil
    end
    
    -- Compile and execute
    local compiled, err = loadstring(source, moduleName)
    if not compiled then
        warn("[Fluent Loader] Syntax error in " .. moduleName .. ": " .. tostring(err))
        return nil
    end
    
    -- Set up environment with custom require
    local env = setmetatable({
        require = customRequire,
        script = { Parent = {} }, -- Mock script object
    }, { __index = getfenv() })
    setfenv(compiled, env)
    
    -- Execute and cache
    local result = compiled()
    ModuleCache[moduleName] = result
    
    print("[Fluent Loader] Loaded: " .. moduleName)
    return result
end

-- Load and return the Root module (main library entry point)
return customRequire("Root")
