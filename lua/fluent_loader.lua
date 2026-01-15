--[[
    Fluent Renewed Loader - V4.0.8 (FSSHUBLibrary Workspace)
    
    This loader fetches the pre-bundled Fluent UI library from GitHub.
    It caches the bundle in FSSHUBLibrary workspace for instant subsequent loads.
    
    V4.0.8 Changes:
    - Workspace renamed to FSSHUBLibrary (like SentinelLibrary)
    - Folder structure: Bin/, Configs/, Assets/
    - Bundle cached in Bin/ folder
    - Force refresh: getgenv().FSSHUB_FORCE_REFRESH = true
    - Production mode: getgenv().FSSHUB_PRODUCTION = true
]]

local CACHE_VERSION = "v4.0.8"
local BUNDLE_URL = "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/fluent_bundle.lua?v=" .. CACHE_VERSION

-- Workspace paths (like SentinelLibrary structure)
local WORKSPACE = "FSSHUBLibrary"
local BIN_DIR = WORKSPACE .. "/Bin"
local CONFIGS_DIR = WORKSPACE .. "/Configs"
local ASSETS_DIR = WORKSPACE .. "/Assets"

-- Cache file in Bin folder (not nested cache subfolder)
local CACHE_FILE = BIN_DIR .. "/fluent_bundle_" .. CACHE_VERSION .. ".lua"

-- Production mode: disable verbose logging
local PRODUCTION = getgenv().FSSHUB_PRODUCTION or false

local function Log(msg)
    if not PRODUCTION then
        print("[Fluent Loader] " .. tostring(msg))
    end
end

-- Create FSSHUBLibrary directory structure
local function ensureDirectories()
    if not makefolder then return end
    
    pcall(function()
        makefolder(WORKSPACE)
        makefolder(BIN_DIR)
        makefolder(CONFIGS_DIR)
        makefolder(ASSETS_DIR)
    end)
end

-- Check if local cache exists and is valid
local function loadFromCache()
    if not readfile then 
        Log("Cache not supported (no readfile)")
        return nil 
    end
    
    local ok, content = pcall(function()
        return readfile(CACHE_FILE)
    end)
    
    if ok and content and #content > 10000 then -- Bundle should be >1MB
        Log("Loaded from cache (" .. math.floor(#content / 1024) .. " KB)")
        return content
    end
    
    Log("Cache miss or invalid")
    return nil
end

-- Save bundle to local cache
local function saveToCache(content)
    if not writefile then 
        Log("Cache save not supported (no writefile)")
        return 
    end
    
    ensureDirectories()
    
    pcall(function()
        writefile(CACHE_FILE, content)
        Log("Saved to cache (" .. math.floor(#content / 1024) .. " KB)")
    end)
end

-- Force refresh support: clear cache if requested
if getgenv().FSSHUB_FORCE_REFRESH then
    Log("Force refresh requested, clearing cache...")
    pcall(function()
        if delfile then delfile(CACHE_FILE) end
    end)
    getgenv().FSSHUB_FORCE_REFRESH = nil -- Reset flag
end

-- Main loading logic
local startTime = tick()
Log("Starting Fluent UI load...")

-- Try cache first
local content = loadFromCache()

if not content then
    -- Download from GitHub
    Log("Downloading bundle from GitHub...")
    local downloadStart = tick()
    
    local success, result = pcall(function()
        return game:HttpGet(BUNDLE_URL)
    end)
    
    if not success or not result or #result < 10000 then
        error("[Fluent Loader] Failed to download bundle: " .. tostring(result))
    end
    
    content = result
    Log("Downloaded in " .. string.format("%.2f", tick() - downloadStart) .. "s")
    
    -- Save to cache for next time
    saveToCache(content)
end

-- Load the bundle
Log("Executing bundle...")
local loadStart = tick()

local chunk, err = loadstring(content, "FluentBundle")
if not chunk then
    error("[Fluent Loader] Bundle compile error: " .. tostring(err))
end

local Fluent = chunk()

Log("Fluent UI loaded in " .. string.format("%.2f", tick() - startTime) .. "s total")

return Fluent
