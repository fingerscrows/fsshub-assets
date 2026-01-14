--[[
    Fluent Renewed Loader - V3.3 (GetChildren Support)
    Author: Antigravity
    
    This loader dynamically fetches Fluent Renewed modules from GitHub.
    It includes a robust mock file system with GetChildren support and URL encoding.
]]

local BASE_URL = "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/Fluent/Src/"
local PACKAGES_URL = "https://raw.githubusercontent.com/dawid-scripts/Fluent/master/src/Packages/" 

local ModuleCache = {}

-- Map of Logical Path -> Physical File Path
local ModuleMap = {
    -- Core
    ["init"] = "init.luau",
    ["Root"] = "init.luau",
    
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
    ["Components"] = "Components/init.luau",
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
    -- Corrected Ripple URL (using a known mirror if original is down, or raw link)
    -- Trying a different source or keeping it if it works now. 
    -- If 404, we can fallback to Flipper Spring which is similar, but for now let's try this:
    ["Packages/Ripple"] = "https://raw.githubusercontent.com/8ne/Ripple/main/src/init.lua" 
}

-- Forward declaration
local customRequire 

-- Helper: Simple URL Encoder
local function UrlEncode(str)
    if not str then return "" end
    return (str:gsub("([^A-Za-z0-9%_%.%-%/])", function(c)
        return string.format("%%%02X", string.byte(c))
    end))
end

local function NormalizePath(path)
    if path:sub(1, 5) == "Root/" then
        return path:sub(6)
    end
    return path
end

local function GetDownloadURL(path)
    local cleanPath = NormalizePath(path)
    
    if PackagesMap[cleanPath] then
        return PackagesMap[cleanPath]
    end
    
    local relativePath = ModuleMap[cleanPath]
    
    if not relativePath then
        if cleanPath:find("Themes/") then
             relativePath = cleanPath .. ".luau"
        end
    end
    
    if relativePath then
        local encodedPath = relativePath:gsub("([^/]+)", function(s) return UrlEncode(s) end)
        return BASE_URL .. encodedPath
    end
    return nil
end

customRequire = function(moduleIdentity)
    -- 1. Handle String Paths
    local moduleName = tostring(moduleIdentity)
    moduleName = NormalizePath(moduleName)
    
    -- 2. Check Cache
    if ModuleCache[moduleName] then return ModuleCache[moduleName] end
    
    -- 3. Resolve URL
    local url = GetDownloadURL(moduleName)
    if not url then
        warn("[Fluent Loader] Unknown module path: " .. moduleName)
        return nil
    end
    
    -- 4. Fetch
    local success, content = pcall(function() return game:HttpGet(url) end)
    
    if not success or not content or content == "404: Not Found" or #content < 10 then
        warn("[Fluent Loader] Failed to fetch (or 404): " .. url)
        
        -- SAFETY FALLBACK FOR THEMES
        if moduleName:find("Themes/") then
             warn("[Fluent Loader] Returning Dummy Theme for: " .. moduleName)
             local dummyTheme = { Properties = {} }
             ModuleCache[moduleName] = dummyTheme
             return dummyTheme
        end
        return nil
    end
    
    -- 5. Compile
    local func, err = loadstring(content, moduleName)
    if not func then
        warn("[Fluent Loader] Syntax error in " .. moduleName .. ": " .. tostring(err))
        if moduleName:find("Themes/") then
             warn("[Fluent Loader] Returning Dummy Theme (Syntax Error Recovery) for: " .. moduleName)
             local dummyTheme = { Properties = {} }
             ModuleCache[moduleName] = dummyTheme
             return dummyTheme
        end
        return nil
    end
    
    -- 6. Environment Setup
    local function makeProxy(currentPath)
         local proxy = newproxy(true)
         local meta = getmetatable(proxy)
         
         meta.__index = function(_, key)
            if key == "GetChildren" then
                return function()
                    local children = {}
                    local prefix = (currentPath == "Root") and "" or (currentPath .. "/")
                    
                    -- Iterate ModuleMap to find children
                    for path, _ in pairs(ModuleMap) do
                         if path:sub(1, #prefix) == prefix then
                             local relative = path:sub(#prefix + 1)
                             -- If it doesn't contain another slash, it's a direct child
                             if relative ~= "" and not relative:find("/") then
                                 table.insert(children, makeProxy(path))
                             end
                         end
                    end
                    return children
                end
            end
            
            if key == "Parent" then
                if currentPath == "Root" then return nil end
                local lastSep = currentPath:match("^.*()/")
                if lastSep then
                    return makeProxy(currentPath:sub(1, lastSep - 1))
                else
                    return makeProxy("Root")
                end
            end
            
            local childPath = (currentPath == "Root") and key or (currentPath .. "/" .. key)
            return makeProxy(childPath)
         end
         
         meta.__tostring = function() return currentPath end
         
         return proxy
    end
    
    local scriptProxy = makeProxy(moduleName == "init.luau" and "Root" or (moduleName == "init" and "Root" or moduleName))

    local env = setmetatable({
        script = scriptProxy,
        require = function(mod)
            return customRequire(tostring(mod))
        end,
    }, { __index = getfenv() })
    
    setfenv(func, env)
    
    -- 7. Execute
    local result = func()
    ModuleCache[moduleName] = result
    
    -- Debug
    -- print("[Fluent Loader] Loaded: " .. moduleName)
    return result
end

return customRequire("Root")
