--[[
    Fluent Renewed Loader - V3 (Debugged)
    Author: Antigravity
    
    This loader dynamically fetches Fluent Renewed modules from GitHub.
    It includes a robust mock file system to handle valid Luau 'script.Parent' traversal
    and 'require(script.Parent.Module)' patterns.
]]

local BASE_URL = "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/Fluent/Src/"
local PACKAGES_URL = "https://raw.githubusercontent.com/dawid-scripts/Fluent/master/src/Packages/" 

local ModuleCache = {}

-- Map of Logical Path -> Physical File Path
-- Keys MUST match what the code tries to access (e.g. "Modules/Creator")
local ModuleMap = {
    -- Core
    ["init"] = "init.luau",
    ["Root"] = "init.luau", -- Alias
    
    -- Modules
    ["Modules/Creator"] = "Modules/Creator.luau",
    ["Modules/Icons"] = "Modules/Icons.luau",
    ["Modules/Acrylic"] = "Modules/Acrylic/init.luau",
    ["Modules/Acrylic/Utils"] = "Modules/Acrylic/Utils.luau",
    ["Modules/Acrylic/AcrylicBlur"] = "Modules/Acrylic/AcrylicBlur.luau",
    ["Modules/Acrylic/AcrylicPaint"] = "Modules/Acrylic/AcrylicPaint.luau",
    ["Modules/Acrylic/CreateAcrylic"] = "Modules/Acrylic/CreateAcrylic.luau",

    -- Elements
    ["Elements"] = "Elements/init.luau",
    ["Elements/Button"] = "Elements/Button.luau",
    ["Elements/Colorpicker"] = "Elements/Colorpicker.luau",
    ["Elements/Dropdown"] = "Elements/Dropdown.luau",
    ["Elements/Input"] = "Elements/Input.luau",
    ["Elements/Keybind"] = "Elements/Keybind.luau",
    ["Elements/Paragraph"] = "Elements/Paragraph.luau",
    ["Elements/Slider"] = "Elements/Slider.luau",
    ["Elements/Toggle"] = "Elements/Toggle.luau",

    -- Components
    ["Components"] = "Components/init.luau", -- Some scripts might require folder
    ["Components/Assets"] = "Components/Assets.luau",
    ["Components/Button"] = "Components/Button.luau",
    ["Components/Dialog"] = "Components/Dialog.luau",
    ["Components/Element"] = "Components/Element.luau",
    ["Components/Notification"] = "Components/Notification.luau",
    ["Components/Section"] = "Components/Section.luau",
    ["Components/Tab"] = "Components/Tab.luau",
    ["Components/Textbox"] = "Components/Textbox.luau",
    ["Components/TitleBar"] = "Components/TitleBar.luau",
    ["Components/Window"] = "Components/Window.luau",
    
    -- Themes
    ["Themes"] = "Themes/init.luau",
    ["Themes/Dark"] = "Themes/Dark.luau",
    ["Themes/Light"] = "Themes/Light.luau",
    ["Themes/Amethyst"] = "Themes/Amethyst.luau",
    ["Themes/Vynixu"] = "Themes/Vynixu.luau",
}

local PackagesMap = {
    ["Packages/Flipper"] = PACKAGES_URL .. "Flipper/init.lua",
    ["Packages/Flipper/BaseMotor"] = PACKAGES_URL .. "Flipper/BaseMotor.lua",
    ["Packages/Flipper/GroupMotor"] = PACKAGES_URL .. "Flipper/GroupMotor.lua",
    ["Packages/Flipper/SingleMotor"] = PACKAGES_URL .. "Flipper/SingleMotor.lua",
    ["Packages/Flipper/Instant"] = PACKAGES_URL .. "Flipper/Instant.lua",
    ["Packages/Flipper/Linear"] = PACKAGES_URL .. "Flipper/Linear.lua",
    ["Packages/Flipper/Spring"] = PACKAGES_URL .. "Flipper/Spring.lua",
    ["Packages/Flipper/Signal"] = PACKAGES_URL .. "Flipper/Signal.lua",
    ["Packages/Flipper/isMotor"] = PACKAGES_URL .. "Flipper/isMotor.lua",
    
    ["Packages/Signal"] = PACKAGES_URL .. "Flipper/Signal.lua",
    ["Packages/Ripple"] = "https://raw.githubusercontent.com/dphfox/Ripple/main/src/init.lua"
}

-- Forward declaration
local customRequire 

-- Helper to normalize paths
local function NormalizePath(path)
    -- Remove "Root/" prefix if present, as our map keys typically don't include it (except "Root" itself)
    if path:sub(1, 5) == "Root/" then
        return path:sub(6)
    end
    return path
end

-- Helper to resolve URLs
local function GetDownloadURL(path)
    local cleanPath = NormalizePath(path)
    
    if PackagesMap[cleanPath] then
        return PackagesMap[cleanPath]
    end
    
    local fileMap = ModuleMap[cleanPath]
    if not fileMap and cleanPath:find("Themes/") then
         fileMap = cleanPath .. ".luau"
    end
    
    if fileMap then
        return BASE_URL .. fileMap
    end
    return nil
end

customRequire = function(moduleIdentity)
    -- 1. Handle String Paths (most common from our mock system)
    local moduleName = tostring(moduleIdentity)
    moduleName = NormalizePath(moduleName)
    
    -- 2. Check Cache
    if ModuleCache[moduleName] then return ModuleCache[moduleName] end
    
    -- 3. Resolve URL
    local url = GetDownloadURL(moduleName)
    if not url then
        warn("[Fluent Loader] Unknown module path: " .. moduleName .. " (Original: " .. tostring(moduleIdentity) .. ")")
        return nil
    end
    
    -- 4. Fetch
    local success, content = pcall(function() return game:HttpGet(url) end)
    if not success or not content then
        warn("[Fluent Loader] Failed to fetch: " .. url)
        return nil
    end
    
    -- 5. Compile
    local func, err = loadstring(content, moduleName)
    if not func then
        warn("[Fluent Loader] Syntax error in " .. moduleName .. ": " .. tostring(err))
        return nil
    end
    
    -- 6. Environment Setup
    -- We need a robust 'script' object that allows .Parent traversal and indexing
    -- 'Root' is the top level. 'Root/Modules/Creator' is a child.
    
    local function makeProxy(currentPath)
         local proxy = newproxy(true)
         local meta = getmetatable(proxy)
         
         meta.__index = function(_, key)
            if key == "Parent" then
                -- Determine parent path
                -- If path is "Modules/Creator", Parent is "Modules"
                -- If path is "Modules", Parent is "Root"
                if currentPath == "Root" then return nil end -- Top level
                
                local lastSep = currentPath:match("^.*()/")
                if lastSep then
                    return makeProxy(currentPath:sub(1, lastSep - 1))
                else
                    return makeProxy("Root")
                end
            end
            
            -- Normal indexing = accessing child
            local childPath = (currentPath == "Root") and key or (currentPath .. "/" .. key)
            
            -- If the child matches a known module, we want to be able to require it
            -- BUT, 'require' takes the proxy object.
            return makeProxy(childPath)
         end
         
         meta.__tostring = function() return currentPath end
         
         return proxy
    end
    
    -- Current script path creation
    -- If moduleName is "Modules/Creator", current script path is "Modules/Creator"
    -- If moduleName is "Root", current is "Root"
    local scriptProxy = makeProxy(moduleName == "init.luau" and "Root" or (moduleName == "init" and "Root" or moduleName))

    local env = setmetatable({
        script = scriptProxy,
        require = function(mod)
            -- If mod is our proxy, tostring(mod) gives the path
            return customRequire(tostring(mod))
        end,
    }, { __index = getfenv() })
    
    setfenv(func, env)
    
    -- 7. Execute
    local result = func()
    ModuleCache[moduleName] = result
    
    print("[Fluent Loader] Loaded: " .. moduleName)
    return result
end

return customRequire("Root")
