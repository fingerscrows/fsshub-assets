/**
 * FSSHUB UI Bundle Generator (Two-File Architecture)
 * 
 * Creates a standalone UI_Bundle.lua that contains:
 * - Fluent UI library (bundled)
 * - Main_Menu.lua (with Pattern Registry)
 * - Base64 encoded assets (for instant loading)
 * 
 * Output: UI_Bundle.lua (for development) and generates SHA256 hash
 */

const fs = require("fs");
const path = require("path");
const crypto = require("crypto");

// Configuration
const CONFIG = {
  fluentSrc: path.join(__dirname, "../Fluent/Src"),
  mainMenu: path.join(__dirname, "Main_Menu.lua"),
  assetDir: path.join(__dirname, "../asset"),
  output: path.join(__dirname, "UI_Bundle.lua"),
  hashOutput: path.join(__dirname, "UI_Bundle.hash"),
};

// Helper: Recursively get all .lua and .luau files
function getFiles(dir, fileList = []) {
  if (!fs.existsSync(dir)) return fileList;
  const files = fs.readdirSync(dir);
  files.forEach((file) => {
    const filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);
    if (stat.isDirectory()) {
      getFiles(filePath, fileList);
    } else {
      if (filePath.endsWith(".luau") || filePath.endsWith(".lua")) {
        fileList.push(filePath);
      }
    }
  });
  return fileList;
}

// Helper: Base64 encode a file
function encodeAssetBase64(filePath) {
  if (!fs.existsSync(filePath)) return null;
  const buffer = fs.readFileSync(filePath);
  return buffer.toString("base64");
}

// Helper: Calculate SHA256 hash
function calculateSHA256(content) {
  return crypto.createHash("sha256").update(content).digest("hex");
}

// Main Bundling Logic
function bundle() {
  console.log("=== FSSHUB UI Bundle Generator ===");
  console.log("Target: Two-File Architecture");
  console.log("");

  let modules = {};
  const fluentFiles = getFiles(CONFIG.fluentSrc);

  console.log(`Found ${fluentFiles.length} Fluent modules.`);

  // 1. Bundle Fluent UI Modules
  fluentFiles.forEach((filepath) => {
    let relPath = path.relative(CONFIG.fluentSrc, filepath);
    let moduleName = relPath
      .replace(/\\/g, "/")
      .replace(/\.luau$/, "")
      .replace(/\.lua$/, "");

    // Handle init.luau files
    if (moduleName.endsWith("/init")) {
      moduleName = moduleName.substring(0, moduleName.length - 5);
    } else if (moduleName === "init") {
      moduleName = "Root";
    }

    let content = fs.readFileSync(filepath, "utf8");
    modules[moduleName] = content;
  });

  // 2. Read Main Menu
  let mainMenuContent = "";
  if (fs.existsSync(CONFIG.mainMenu)) {
    mainMenuContent = fs.readFileSync(CONFIG.mainMenu, "utf8");
    console.log("Main Menu loaded.");
  } else {
    console.warn("WARNING: Main_Menu.lua not found!");
  }

  // 3. Encode Assets (if any PNG files exist)
  const assets = {};
  if (fs.existsSync(CONFIG.assetDir)) {
    const assetFiles = fs.readdirSync(CONFIG.assetDir);
    assetFiles.forEach((file) => {
      if (file.endsWith(".png") || file.endsWith(".jpg")) {
        const assetPath = path.join(CONFIG.assetDir, file);
        const b64 = encodeAssetBase64(assetPath);
        if (b64) {
          const assetName = file.replace(/\.(png|jpg)$/, "");
          assets[assetName] = b64;
          console.log(`Asset encoded: ${file} (${Math.round(b64.length / 1024)}KB)`);
        }
      }
    });
  }

  // 4. Generate Output
  let output = `--[[ 
    FSSHUB UI Bundle (Two-File Architecture)
    Generated: ${new Date().toISOString()}
    
    This bundle contains:
    - Fluent UI Library (${Object.keys(modules).length} modules)
    - Main Menu UI
    - Base64 Encoded Assets (${Object.keys(assets).length} assets)
    
    Execute via: loadstring(content)()
]]

-- ===== PERFORMANCE TRACKING =====
local __BUNDLE_START = os.clock()
local function _log(msg)
    if getgenv and getgenv().FSSHUB_DEBUG then
        print("[UI_Bundle] " .. msg .. string.format(" (%.3fs)", os.clock() - __BUNDLE_START))
    end
end

-- ===== EMBEDDED ASSETS =====
local __ASSETS = {
${Object.entries(assets)
  .map(([name, b64]) => `    ["${name}"] = "${b64}"`)
  .join(",\n")}
}

-- Asset decoder utility
local function decodeAsset(name)
    local b64 = __ASSETS[name]
    if not b64 then return nil end
    -- Roblox doesn't have native base64 decode for images,
    -- but we can use HttpService if needed or just store URLs
    return b64
end

-- ===== MODULE SYSTEM =====
local __MODULES = {}
local __CACHE = {}

-- Create script proxy for Roblox-style requires
local function createScriptProxy(path)
    local function getChildrenForPath()
        local children = {}
        local prefix = path == "Root" and "" or (path .. "/")
        local seenChildren = {}
        
        for key, _ in pairs(__MODULES) do
            local childName = nil
            
            if prefix == "" then
                local firstSlash = key:find("/")
                if firstSlash then
                    childName = key:sub(1, firstSlash - 1)
                elseif key ~= "Root" then
                    childName = key
                end
            else
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
        if key == "GetChildren" then
            return function() return getChildrenForPath() end
        end
        
        if key == "FindFirstChild" then
            return function(_, childName)
                local childPath = (path == "Root") and childName or (path .. "/" .. childName)
                if __MODULES[childPath] then return createScriptProxy(childPath) end
                for k, _ in pairs(__MODULES) do
                    if k:sub(1, #childPath + 1) == childPath .. "/" then return createScriptProxy(childPath) end
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

_log("Module system initialized")

-- ===== MODULE DEFINITIONS =====
`;

  // Write Fluent modules
  for (const [name, content] of Object.entries(modules)) {
    output += `
__MODULES["${name}"] = function()
    local script = createScriptProxy("Root/${name}")
    local function require(p) 
        local target = tostring(p)
        target = target:gsub("Root/", "")
        return __REQUIRE(target)
    end
    
    return (function()
${content}
    end)()
end
`;
  }

  // 5. Add Main Menu with Pattern Registry wrapper
  output += `
_log("Fluent modules defined (${Object.keys(modules).length} total)")

-- ===== INITIALIZE FLUENT =====
local Fluent = __REQUIRE("Root")
_log("Fluent UI initialized")

-- Store globally for pre-load optimization
getgenv().FSSHUB_FLUENT = Fluent
getgenv().FSSHUB_GET_FLUENT = function(timeout)
    -- Instant return since already loaded
    return Fluent
end

-- ===== MAIN MENU =====
-- Pattern Registry: Virtual modules for organized code
local App = { Modules = {} }

-- Main Menu Executor (called after key validation)
local function ExecuteMainMenu()
${mainMenuContent}
end

-- Export for Worker payload invocation
_G.FSSHUB_EXECUTE_UI = ExecuteMainMenu
getgenv().FSSHUB_UI_BUNDLE = {
    Fluent = Fluent,
    Execute = ExecuteMainMenu,
    Assets = __ASSETS,
    DecodeAsset = decodeAsset,
}

_log("UI Bundle ready")

-- Return for direct loadstring execution
return getgenv().FSSHUB_UI_BUNDLE
`;

  // 6. Write output file
  fs.writeFileSync(CONFIG.output, output);
  const fileSize = fs.statSync(CONFIG.output).size;
  console.log(`\nBundle written to ${CONFIG.output}`);
  console.log(`Bundle size: ${(fileSize / 1024).toFixed(2)} KB`);

  // 7. Calculate and write hash
  const hash = calculateSHA256(output);
  fs.writeFileSync(CONFIG.hashOutput, hash);
  console.log(`SHA256 Hash: ${hash}`);
  console.log(`Hash written to ${CONFIG.hashOutput}`);

  console.log("\n=== Bundle Complete ===");
  console.log(`Use this hash in KV: ${hash}`);
}

bundle();
