--[[
    Fluent Renewed Loader - V4.0.5 (Optimized Bundle + Local Cache + Pre-load Support)
    
    This loader fetches the pre-bundled Fluent UI library from GitHub.
    It also caches the bundle locally on the executor for instant subsequent loads.
    
    V4.0.5 Changes:
    - Support for payload pre-loading (parallel download optimization)
    - Uses pre-bundled fluent_bundle.lua (all 97 modules in one file)
    - Local file caching for instant subsequent loads
    - ~90% faster than dynamic module loading
]]

local CACHE_VERSION = "v4.0.5"
local BUNDLE_URL = "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/fluent_bundle.lua?v=" .. CACHE_VERSION
local CACHE_FILE = "fsshub_cache/fluent_" .. CACHE_VERSION .. ".lua"

local function Log(msg)
    print("[Fluent Loader] " .. tostring(msg))
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
        if makefolder then
            makefolder("fsshub_cache")
        end
        writefile(CACHE_FILE, content)
        Log("Saved to local cache (" .. math.floor(#content / 1024) .. " KB)")
    end)
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
