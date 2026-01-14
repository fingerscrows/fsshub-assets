--[[
    Fluent Renewed Loader - V3.4 (Signal Wrapper + Ripple Fallback)
    Author: Antigravity
    
    This loader dynamically fetches Fluent Renewed modules from GitHub.
    It includes a robust mock file system with GetChildren support and URL encoding.
    - V3.4: Added SignalWrapper for uppercase method compatibility (Fire/Wait/Connect)
    - V3.4: Added Ripple fallback using Flipper.Spring when original URL returns 404
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
    
    -- Note: Packages/Signal uses a WRAPPER (see SignalWrapper below)
    -- Corrected Ripple URL (using a known mirror if original is down, or raw link)
    ["Packages/Ripple"] = "https://raw.githubusercontent.com/8ne/Ripple/main/src/init.lua" 
}

-- Signal Wrapper: The Flipper Signal module uses lowercase methods (fire, wait, connect)
-- but Fluent UI expects uppercase methods (Fire, Wait, Connect). This wrapper adapts the API.
local SignalWrapper = nil
local function GetSignalWrapper()
    if SignalWrapper then return SignalWrapper end
    
    -- Fetch the original Flipper Signal
    local url = PACKAGES_URL .. "Flipper/Signal.lua"
    local success, content = pcall(function() return game:HttpGet(url) end)
    if not success or not content or #content < 10 then
        warn("[Fluent Loader] Failed to fetch Signal module")
        return nil
    end
    
    local func, err = loadstring(content, "Packages/Flipper/Signal")
    if not func then
        warn("[Fluent Loader] Signal syntax error: " .. tostring(err))
        return nil
    end
    
    setfenv(func, getfenv())
    local OriginalSignal = func()
    
    -- Create wrapper that adds uppercase method aliases
    SignalWrapper = {}
    SignalWrapper.__index = SignalWrapper
    
    function SignalWrapper.new()
        local original = OriginalSignal.new()
        local wrapper = setmetatable({
            _original = original,
            _connections = original._connections,
            _threads = original._threads,
        }, SignalWrapper)
        
        return wrapper
    end
    
    -- Uppercase methods that Fluent expects
    function SignalWrapper:Fire(...)
        return self._original:fire(...)
    end
    
    function SignalWrapper:Wait()
        return self._original:wait()
    end
    
    function SignalWrapper:Connect(handler)
        local conn = self._original:connect(handler)
        -- Wrap connection to add uppercase Disconnect
        return {
            _original = conn,
            connected = conn.connected,
            Disconnect = function(self)
                return self._original:disconnect()
            end,
            disconnect = function(self)
                return self._original:disconnect()
            end
        }
    end
    
    -- Also support lowercase for compatibility
    SignalWrapper.fire = SignalWrapper.Fire
    SignalWrapper.wait = SignalWrapper.Wait
    SignalWrapper.connect = SignalWrapper.Connect
    
    return SignalWrapper
end

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
    
    -- 2.5. SPECIAL CASE: Signal module needs wrapper for uppercase methods
    if moduleName == "Packages/Signal" then
        local wrapper = GetSignalWrapper()
        if wrapper then
            ModuleCache[moduleName] = wrapper
            return wrapper
        end
    end
    
    -- 2.6. SPECIAL CASE: Ripple fallback - if URL fails, use Flipper.Spring as fallback
    if moduleName == "Packages/Ripple" then
        -- Try fetching first
        local url = PackagesMap[moduleName]
        local success, content = pcall(function() return game:HttpGet(url) end)
        if not success or not content or content == "404: Not Found" or #content < 10 then
            warn("[Fluent Loader] Ripple 404, using Flipper.Spring fallback")
            -- Create a simple Ripple-compatible wrapper using Flipper Spring
            local FlipperSpring = customRequire("Packages/Flipper/Spring")
            if FlipperSpring then
                local RippleFallback = {}
                RippleFallback.__index = RippleFallback
                function RippleFallback.new(target, options)
                    options = options or {}
                    -- Ripple uses frequency/dampingRatio, Flipper uses frequency/dampingRatio too
                    return FlipperSpring.new(target, {
                        frequency = options.frequency or 8,
                        dampingRatio = options.dampingRatio or 1
                    })
                end
                setmetatable(RippleFallback, {
                    __call = function(_, target, options)
                        return RippleFallback.new(target, options)
                    end
                })
                ModuleCache[moduleName] = RippleFallback
                return RippleFallback
            end
        end
    end
    
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
