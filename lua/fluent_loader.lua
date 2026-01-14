--[[
    Fluent Renewed Loader
    Author: Antigravity (Generated)
    
    This loader dynamically fetches Fluent Renewed modules from GitHub.
    It includes a package manager mock to handle missing dependencies in the repository.
]]

local BASE_URL = "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/Fluent/Src/"
local PACKAGES_URL = "https://raw.githubusercontent.com/dawid-scripts/Fluent/master/src/Packages/" -- Fallback for missing packages

local ModuleCache = {}
local ModuleMap = {
    -- Core
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
    
    -- Themes (Mapped dynamically in require if possible, but hardcoded here for safety)
    ["Themes"] = "Themes/init.luau",
    ["Themes/Dark"] = "Themes/Dark.luau",
    ["Themes/Light"] = "Themes/Light.luau",
    ["Themes/Vynixu"] = "Themes/Vynixu.luau",
    -- Add other themes as needed or load dynamically
}

-- Fallback for packages missing in the repo
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
    
    ["Packages/Signal"] = PACKAGES_URL .. "Flipper/Signal.lua", -- Use Flipper's Signal or separate
    ["Packages/Ripple"] = "https://raw.githubusercontent.com/dphfox/Ripple/main/src/init.lua" -- Ripple Source
}

local function customRequire(moduleName)
    if ModuleCache[moduleName] then return ModuleCache[moduleName] end

    local url
    if PackagesMap[moduleName] then
        url = PackagesMap[moduleName]
    else
        local path = ModuleMap[moduleName]
        if not path and moduleName:find("Themes/") then
            path = moduleName .. ".luau" -- Dynamic theme loading attempt
        end
        
        if path then
            url = BASE_URL .. path
        else
            warn("[Fluent Loader] Unknown module: " .. tostring(moduleName))
            return nil
        end
    end

    local success, content = pcall(function() return game:HttpGet(url) end)
    if not success or not content then
        warn("[Fluent Loader] Failed to fetch: " .. url)
        return nil
    end

    local func, err = loadstring(content, moduleName)
    if not func then
        warn("[Fluent Loader] Syntax error in " .. moduleName .. ": " .. tostring(err))
        return nil
    end

    local env = setmetatable({
        require = function(mod)
            -- Handle relative requires (simple approximation)
            local name = tostring(mod)
            
            -- Hook for Root.Packages...
            if name:find("Packages") then
                if name:find("Flipper") then
                     -- Handle Flipper submodules
                     if name:find("Spring") then return customRequire("Packages/Flipper/Spring") end
                     if name:find("Instant") then return customRequire("Packages/Flipper/Instant") end
                     if name:find("SingleMotor") then return customRequire("Packages/Flipper/SingleMotor") end
                     if name:find("GroupMotor") then return customRequire("Packages/Flipper/GroupMotor") end
                     return customRequire("Packages/Flipper")
                end
                if name:find("Signal") then return customRequire("Packages/Signal") end
                if name:find("Ripple") then return customRequire("Packages/Ripple") end
            end
            
            -- Normal modules
            if name == "Root" then return customRequire("Root") end
            
            -- Map typical instance requiring to our map
            if typeof(mod) == "Instance" then
                 if mod.Name == "Creator" then return customRequire("Modules/Creator") end
                 if mod.Name == "Icons" then return customRequire("Modules/Icons") end
                 if mod.Name == "Acrylic" then return customRequire("Modules/Acrylic") end
                 if mod.Name == "Elements" then return customRequire("Elements") end
                 if mod.Name == "Themes" then return customRequire("Themes") end
                 if mod.Name == "Components" then return {
                     Window = function(...) return customRequire("Components/Window")(...) end, -- Mock
                     -- This part is tricky because require(Components.Window) expects the module itself
                 } end
            end
            
            -- Direct internal requires in Fluent Renewed often use `require(Root.Modules.Creator)`
            -- We need to intercept these.
            -- Since we can't easily parse the table path passed to require,
            -- we rely on the fact that we replace `Root` with a table that has our structure.
            
            return customRequire(name) 
        end,
        script = { 
            Parent = { 
                Name = "Src", 
                Parent = { Name = "Fluent" } 
            } 
        } -- Mock script environment
    }, { __index = getfenv() })
    
    -- Mock the Root object structure for navigation
    local function makeProxy(path)
        return setmetatable({}, {
            __index = function(_, key)
                local newPath = path and (path .. "/" .. key) or key
                -- Check if this path maps to a module
                if ModuleMap[newPath] or PackagesMap[newPath] then
                    return customRequire(newPath)
                end
                return makeProxy(newPath)
            end,
            __tostring = function() return path end
        })
    end
    
    -- In init.luau: local Root = script
    -- We need script to behave like Root
    env.script = makeProxy("Root")
    -- Override Root if it's defined globally or locally? No, loadstring env handles it.
    
    setfenv(func, env)
    
    local result = func()
    ModuleCache[moduleName] = result
    return result
end

-- Fix circular or complex deps by pre-defining Root?
ModuleCache["Root"] = nil -- Will be loaded by customRequire

return customRequire("Root")
