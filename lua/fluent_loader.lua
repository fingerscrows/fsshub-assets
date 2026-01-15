--[[
    Fluent Renewed Loader - V4.0.7 (Xeno Workspace Cache + Performance)
    
    This loader fetches the pre-bundled Fluent UI library from GitHub.
    It caches the bundle in Xeno workspace for instant subsequent loads.
    
    V4.0.7 Changes:
    - Cache path moved to FSSHUB/cache/ (Xeno workspace)
    - Force refresh support: getgenv().FSSHUB_FORCE_REFRESH = true
    - Production mode: getgenv().FSSHUB_PRODUCTION = true (disables verbose logs)
    - Prometheus obfuscation compatible patterns
]]

local CACHE_VERSION = "v4.0.7"
local BUNDLE_URL = "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/fluent_bundle.lua?v=" .. CACHE_VERSION
local CACHE_DIR = "FSSHUB/cache"
local CACHE_FILE = CACHE_DIR .. "/fluent_" .. CACHE_VERSION .. ".lua"

-- Production mode: disable verbose logging
local PRODUCTION = getgenv().FSSHUB_PRODUCTION or false

local function Log(msg)
    if not PRODUCTION then
        print("[Fluent Loader] " .. tostring(msg))
    end
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
        Log("Loaded from local cache (" .. math.floor(#content / 1024) .. " KB)")
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
    
    pcall(function()
        -- Create FSSHUB directory structure
        if makefolder then
            makefolder("FSSHUB")
            makefolder(CACHE_DIR)
        end
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
