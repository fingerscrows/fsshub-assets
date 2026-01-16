const fs = require("fs");
const path = require("path");

// Configuration
const CONFIG = {
  fluentSrc: path.join(__dirname, "../Fluent/Src"),
  keySystem: path.join(__dirname, "KeySystemUI.lua"),
  mainMenu: path.join(__dirname, "Main_Menu.lua"),
  output: path.join(__dirname, "../loader.luau"), // Output to root
};

// Helper: Recursively get all .lua and .luau files
function getFiles(dir, fileList = []) {
  const files = fs.readdirSync(dir);
  files.forEach((file) => {
    const filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);
    if (stat.isDirectory()) {
      getFiles(filePath, fileList);
    } else {
      // Include both .lua and .luau files
      if (filePath.endsWith(".luau") || filePath.endsWith(".lua")) {
        fileList.push(filePath);
      }
    }
  });
  return fileList;
}

// Helper: Escape Lua string
function escapeLuaString(str) {
  return str
    .replace(/\\/g, "\\\\")
    .replace(/"/g, '\\"')
    .replace(/\n/g, "\\n")
    .replace(/\r/g, "\\r");
}

// Main Bundling Logic
function bundle() {
  console.log("Starting Bundle Process...");

  let modules = {};
  const fluentFiles = getFiles(CONFIG.fluentSrc);

  console.log(`Found ${fluentFiles.length} Fluent modules.`);

  // 1. Bundle Fluent UI Modules
  fluentFiles.forEach((filepath) => {
    // Calculate module path relative to Src root
    // e.g. "Components/Button.luau" -> "Components/Button"
    // "init.luau" -> "Root" ??

    let relPath = path.relative(CONFIG.fluentSrc, filepath);
    let moduleName = relPath
      .replace(/\\/g, "/")
      .replace(/\.luau$/, "")
      .replace(/\.lua$/, "");

    // Handle init.luau files (e.g. "Components/init" -> "Components")
    if (moduleName.endsWith("/init")) {
      moduleName = moduleName.substring(0, moduleName.length - 5);
    } else if (moduleName === "init") {
      moduleName = "Root";
    }

    let content = fs.readFileSync(filepath, "utf8");
    modules[moduleName] = content;
  });

  // 2. Generate Output Content
  // Prepare Lazy Loader Script
  const lazyLoaderScript = \`
-- FSSHUB Lazy Loader (Visual Feedback Immediate)
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local overlay = Instance.new("ScreenGui")
overlay.Name = "FSSHUB_Lazy_Loader"
overlay.IgnoreGuiInset = true
overlay.DisplayOrder = 9999
if syn and syn.protect_gui then syn.protect_gui(overlay) overlay.Parent = CoreGui
elseif gethui then overlay.Parent = gethui()
else overlay.Parent = CoreGui end

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1,0,1,0)
frame.BackgroundColor3 = Color3.new(0,0,0)
frame.BackgroundTransparency = 1
frame.Parent = overlay

local text = Instance.new("TextLabel")
text.Text = "FSSHUB LOADING..."
text.Font = Enum.Font.Code
text.TextSize = 24
text.TextColor3 = Color3.fromRGB(0, 255, 255)
text.Size = UDim2.new(0, 200, 0, 50)
text.Position = UDim2.new(0.5, 0, 0.5, 0)
text.AnchorPoint = Vector2.new(0.5, 0.5)
text.BackgroundTransparency = 1
text.Parent = frame

-- Fade In
TweenService:Create(frame, TweenInfo.new(0.5), {BackgroundTransparency=0.3}):Play()

-- Pulse Text
task.spawn(function()
    while overlay.Parent do
        TweenService:Create(text, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {TextTransparency=0.5}):Play()
        task.wait(1.6)
    end
end)
\`;

  let output = \`--[[ 
    FSSHUB Loader Bundle
    Generated: \${new Date().toISOString()}
]]
\${lazyLoaderScript}

local __MODULES = {}
local __CACHE = {}

-- Create script proxy for Roblox-style requires (script.Parent, script.Components, etc.)
-- Enhanced to support :GetChildren(), :FindFirstChild(), and .Name
local function createScriptProxy(path)
    -- Helper function to get children for this script path
    local function getChildrenForPath()
        local children = {}
        local prefix = path == "Root" and "" or (path .. "/")
        local seenChildren = {}
        
        for key, _ in pairs(__MODULES) do
            local childName = nil
            
            if prefix == "" then
                -- Root level: match keys that are direct children
                local firstSlash = key:find("/")
                if firstSlash then
                    childName = key:sub(1, firstSlash - 1)
                elseif key ~= "Root" then
                    childName = key
                end
            else
                -- Match keys that start with our prefix
                if key:sub(1, #prefix) == prefix then
                    local remaining = key:sub(#prefix + 1)
                    local firstSlash = remaining:find("/")
                    if firstSlash then
                        childName = remaining:sub(1, firstSlash - 1)
                    else
                        childName = remaining
                    end
                end
            end
            
            if childName and not seenChildren[childName] then
                seenChildren[childName] = true
                local childPath = prefix == "" and childName or (path .. "/" .. childName)
                children[#children + 1] = createScriptProxy(childPath)
            end
        end
        return children
    end
    
    local proxy = newproxy(true)
    local meta = getmetatable(proxy)
    
    meta.__index = function(_, key)
        -- Handle Roblox Instance methods
        if key == "GetChildren" then
            return function() return getChildrenForPath() end
        end
        
        if key == "FindFirstChild" then
            return function(_, childName)
                local childPath = (path == "Root") and childName or (path .. "/" .. childName)
                if __MODULES[childPath] then return createScriptProxy(childPath) end
                for key, _ in pairs(__MODULES) do
                    if key:sub(1, #childPath + 1) == childPath .. "/" then return createScriptProxy(childPath) end
                end
                return nil
            end
        end
        
        if key == "Name" then
            return path:match("([^/]+)$") or path
        end
        
        if key == "Parent" then
            if path == "Root" then return nil end
            local lastSep = path:match("^.*()/")
            if lastSep then return createScriptProxy(path:sub(1, lastSep - 1)) else return createScriptProxy("Root") end
        end
        
        -- Return a new proxy for the child, blindly assuming it might exist
        local childPath = (path == "Root") and key or (path .. "/" .. key)
        return createScriptProxy(childPath)
    end
    
    meta.__tostring = function() return path end
    return proxy
end

local function __REQUIRE(modulePath)
    local key = tostring(modulePath)
    key = key:gsub("^Root/", ""):gsub("^Root$", "Root")
    
    if type(modulePath) == "userdata" then
        key = tostring(modulePath):gsub("Root%.", ""):gsub("Root/", "")
        if key == "Root" then key = "Root" end
    end
    
    if __CACHE[key] then return __CACHE[key] end
    
    local loader = __MODULES[key]
    if not loader then
        error("Module not found: " .. tostring(modulePath))
    end
    
    local result = loader()
    __CACHE[key] = result
    return result
end

-- MODULE DEFINITIONS
\`;

  // Write modules
  for (const [name, content] of Object.entries(modules)) {
    output += \`
__MODULES["\${name}"] = function()
    local script = createScriptProxy("Root/\${name}")
    local function require(p) 
        -- Normalize path requires here (simplified for POC)
        -- In robust bundler, we need to handle relative paths
        local target = tostring(p)
        target = target:gsub("Root/", "")
        return __REQUIRE(target)
    end
    
    return (function()
\${content}
    end)()
end
\`;
  }

  // 3. Append Entry Logic
  output += \`
-- MAIN LOGIC
local FSSHUB_UI = __REQUIRE("Root") -- Load init.luau (stored as Root)

-- Load KeySystem
local KeySystem = (function()
    local Fluent = FSSHUB_UI
    \${fs.readFileSync(CONFIG.keySystem, "utf8")}
end)()

-- Load Main Menu (only if validated, but for bundle we define it)
local MainMenu = function()
    local Fluent = FSSHUB_UI
    \${fs.readFileSync(CONFIG.mainMenu, "utf8")}
end

-- AUTO EXECUTE KEY SYSTEM (For Testing/Dev)
if KeySystem and KeySystem.Initialize then
    task.defer(function()
        KeySystem.Initialize({
            validateCallback = function(key) 
                print("[FSSHUB] Key Submitted:", key)
                -- Here you would validate with Junkie SDK
                -- For now, simulate success:
                task.spawn(function()
                    -- Show success animation
                    if KeySystem.Authorize then
                        KeySystem.Authorize()
                    end
                    -- Wait for UI to close, then launch Main Menu
                    task.wait(2)
                    if MainMenu then 
                        print("[FSSHUB] Launching Main Menu...")
                        MainMenu() 
                    end
                end)
            end,
            keyLink = "https://fsshub.com/getkey"
        })
    end)
end

-- Export
return {
    UI = FSSHUB_UI,
    KeySystem = KeySystem,
    MainMenu = MainMenu
}
\`;

  fs.writeFileSync(CONFIG.output, output);
  console.log(`Bundle written to ${CONFIG.output}`);
}

bundle();
