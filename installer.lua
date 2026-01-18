--[[
    FSSHUB Installer & Bootstrapper (Unified)
    Version: 2.1.0

    This script handles the entire lifecycle:
    1. Workspace Initialization (FSSHUB/)
    2. Version Validation & Health Check
    3. Bundle Downloading & Caching (loader.luau)
    4. Execution of the UI Bundle
]]

local INSTALLER_VERSION = "2.1.0"

-- ===== AUTO-CLEANUP ON RE-EXECUTION =====
-- Destroy any existing FSSHUB UI before starting fresh
if _G.FSSHUB_CLEANUP then
    _G.FSSHUB_CLEANUP()
    task.wait(0.1) -- Brief pause to ensure cleanup completes
end

local CONFIG = {
    -- Worker Endpoints
    HealthUrl = "https://script.fsshub-services.workers.dev/health",
    BundleUrl = "https://script.fsshub-services.workers.dev/bundle",

    -- Local Workspace Paths
    Workspace = {
        Root = "FSSHUB",
        Cache = "FSSHUB/Cache",
        Assets = "FSSHUB/Assets",
        Config = "FSSHUB/Config",
        Data = "FSSHUB/Data",

        -- Files
        BundleFile = "FSSHUB/Cache/loader.bin",
        VersionFile = "FSSHUB/Cache/version.txt",
        ThemeFile = "FSSHUB/Config/theme.cfg",
        KeyFile = "FSSHUB/Data/key.cfg",

        -- Legacy (for migration)
        LegacyBin = "FSSHUB/Bin",
        LegacyLoader = "FSSHUB/Bin/loader.luau",
        LegacyKey = "FSSHUB/Data/SavedkeyFSSHUB_KeyData.cfg",
    },

    -- Retry Config
    MaxRetries = 2,
    RetryDelay = 1,

    Debug = true
}

-- ===== UTILITIES =====
local function Log(msg)
    if _G.FSSHUB_STATUS then
        _G.FSSHUB_STATUS = tostring(msg) -- Broadcast to UI
    end
    if CONFIG.Debug then
        print("[FSSHUB Installer]: " .. tostring(msg))
    end
end

local function ensureFolder(path)
    if makefolder and isfolder then
        if not isfolder(path) then
            pcall(makefolder, path)
        end
    end
end

local function fileExists(path)
    return isfile and isfile(path)
end

local function readFile(path)
    if not fileExists(path) then return nil end
    local ok, content = pcall(readfile, path)
    return ok and content or nil
end

local function writeFile(path, content)
    if not writefile then return false end
    local ok = pcall(writefile, path, content)
    return ok
end

local function deleteFile(path)
    if not delfile then return false end
    if not fileExists(path) then return true end
    local ok = pcall(delfile, path)
    return ok
end

local function deleteFolder(path)
    if not delfolder or not isfolder then return false end
    if not isfolder(path) then return true end
    local ok = pcall(delfolder, path)
    return ok
end

-- ===== HTTP WITH RETRY =====
local function httpGet(url, maxRetries, retryDelay)
    maxRetries = maxRetries or CONFIG.MaxRetries
    retryDelay = retryDelay or CONFIG.RetryDelay

    for attempt = 1, maxRetries do
        local ok, result = pcall(function()
            return game:HttpGet(url)
        end)

        if ok and result then
            return true, result
        end

        Log("HTTP attempt " .. attempt .. " failed")
        if attempt < maxRetries then
            task.wait(retryDelay)
        end
    end

    return false, "Network error after " .. maxRetries .. " attempts"
end

-- ===== MIGRATION LOGIC =====
local function performMigration()
    local WS = CONFIG.Workspace
    local migrated = false

    -- Check for legacy bin folder
    if isfolder and isfolder(WS.LegacyBin) then
        Log("Detected legacy structure, performing migration...")

        -- Migrate key file if exists in old location
        if fileExists(WS.LegacyKey) then
            local keyContent = readFile(WS.LegacyKey)
            if keyContent then
                writeFile(WS.KeyFile, keyContent)
                Log("Migrated key file to new location")
            end
        end

        -- Delete legacy bin folder (clean migration)
        deleteFolder(WS.LegacyBin)
        Log("Removed legacy bin folder")
        migrated = true
    end

    return migrated
end

-- ===== WORKSPACE INITIALIZATION =====
local function initWorkspace()
    local WS = CONFIG.Workspace

    -- Create folder structure
    ensureFolder(WS.Root)
    ensureFolder(WS.Cache)
    ensureFolder(WS.Assets)
    ensureFolder(WS.Config)
    ensureFolder(WS.Data)

    -- Perform migration from legacy structure
    performMigration()

    Log("Workspace initialized")
end

-- ===== VERSION CHECK =====
local function getServerVersion()
    local ok, response = httpGet(CONFIG.HealthUrl, 2, 1)

    if not ok then
        Log("Failed to reach health endpoint")
        return nil, nil
    end

    -- Parse JSON response
    local success, data = pcall(function()
        return game:GetService("HttpService"):JSONDecode(response)
    end)

    if not success or not data then
        Log("Failed to parse health response")
        return nil, nil
    end

    -- Check minimum installer version
    if data.minInstallerVersion then
        local minParts = string.split(data.minInstallerVersion, ".")
        local currentParts = string.split(INSTALLER_VERSION, ".")

        local minMajor = tonumber(minParts[1]) or 0
        local minMinor = tonumber(minParts[2]) or 0
        local curMajor = tonumber(currentParts[1]) or 0
        local curMinor = tonumber(currentParts[2]) or 0

        if minMajor > curMajor or (minMajor == curMajor and minMinor > curMinor) then
            warn("[FSSHUB] Installer outdated! Please update to v" .. data.minInstallerVersion)
            -- Continue anyway, but warn user
        end
    end

    -- Check maintenance status
    if data.status == "maintenance" then
        Log("Server is under maintenance")
        return "maintenance", data.maintenance and data.maintenance.message
    end

    return data.bundleHash, data.minInstallerVersion
end

local function getLocalVersion()
    return readFile(CONFIG.Workspace.VersionFile)
end

-- ===== BUNDLE LOADING =====
local function downloadBundle()
    Log("Downloading UI Bundle from server...")

    local ok, bundleContent = httpGet(CONFIG.BundleUrl, 3, 2)

    if not ok then
        Log("Failed to download bundle: " .. tostring(bundleContent))
        return nil
    end

    -- Validate bundle - reject only if it's clearly an error response
    -- Valid bundle should be > 1000 bytes (actual bundle is ~1.5MB)
    if #bundleContent < 1000 then
        -- Check if it's a JSON error response
        if string.sub(bundleContent, 1, 1) == "{" then
            Log("Bundle download returned JSON error: " .. string.sub(bundleContent, 1, 200))
            return nil
        end
        Log("Bundle too small, may be invalid: " .. #bundleContent .. " bytes")
        return nil
    end

    Log("Bundle downloaded: " .. #bundleContent .. " bytes")
    return bundleContent
end

local function loadBundle()
    local WS = CONFIG.Workspace
    local serverVersion, _ = getServerVersion()

    -- Handle maintenance mode
    if serverVersion == "maintenance" then
        warn("[FSSHUB] Server is under maintenance. Please try again later.")
        return false
    end

    local localVersion = getLocalVersion()
    local bundleContent = nil
    local needsUpdate = false

    -- Determine if update is needed
    if not serverVersion then
        -- Offline mode - use cache if available
        Log("Offline mode - checking local cache")
        if fileExists(WS.BundleFile) then
            bundleContent = readFile(WS.BundleFile)
            Log("Using cached bundle (offline fallback)")
        else
            warn("[FSSHUB] No network and no cache available!")
            return false
        end
    elseif not localVersion or localVersion ~= serverVersion then
        -- First run or version mismatch
        needsUpdate = true
        Log("Update needed: local=" .. tostring(localVersion) .. " server=" .. tostring(serverVersion))
    else
        -- Version match - check if bundle actually exists
        if fileExists(WS.BundleFile) then
            Log("Version match - using cached bundle")
            bundleContent = readFile(WS.BundleFile)
        else
            Log("Version match but bundle file missing - forcing update")
            needsUpdate = true
        end
    end

    -- Download new bundle if needed
    if needsUpdate then
        bundleContent = downloadBundle()

        if bundleContent then
            -- Save to cache
            if writeFile(WS.BundleFile, bundleContent) then
                Log("Bundle cached successfully")
            end

            -- Update version file
            if serverVersion then
                writeFile(WS.VersionFile, serverVersion)
                Log("Version file updated: " .. serverVersion)
            end
        else
            -- Download failed - try fallback to existing cache
            Log("Download failed, attempting cache fallback")
            if fileExists(WS.BundleFile) then
                bundleContent = readFile(WS.BundleFile)
                Log("Using stale cache as fallback")
            else
                warn("[FSSHUB] No bundle available!")
                return false
            end
        end
    end

    -- Execute bundle
    if not bundleContent then
        warn("[FSSHUB] No bundle content to execute!")
        return false
    end

    Log("Executing bundle (" .. #bundleContent .. " bytes)")

    local chunk, compileErr = loadstring(bundleContent)
    if not chunk then
        warn("[FSSHUB] Bundle compile error: " .. tostring(compileErr))
        return false
    end

    local execOk, result = pcall(chunk)
    if not execOk then
        warn("[FSSHUB] Bundle execution error: " .. tostring(result))
        return false
    end

    -- Run the UI (Robust Method: Return Value -> getgenv -> _G)
    local ExecuteUI = nil

    -- 1. Check Return Value
    if type(result) == "table" and result.Execute then
        ExecuteUI = result.Execute
        Log("Using Bundle Return Value")
    end

    -- 2. Check getgenv
    if not ExecuteUI and getgenv and getgenv().FSSHUB_UI_BUNDLE and getgenv().FSSHUB_UI_BUNDLE.Execute then
        ExecuteUI = getgenv().FSSHUB_UI_BUNDLE.Execute
        Log("Using getgenv().FSSHUB_UI_BUNDLE")
    end

    -- 3. Check _G (Legacy)
    if not ExecuteUI and _G.FSSHUB_EXECUTE_UI then
        ExecuteUI = _G.FSSHUB_EXECUTE_UI
        Log("Using _G.FSSHUB_EXECUTE_UI")
    end

    if ExecuteUI then
        Log("Executing UI...")
        task.spawn(function()
            local uiSuccess, uiErr = pcall(ExecuteUI)
            if not uiSuccess then
                warn("UI Execution Error: " .. tostring(uiErr))
            end
        end)
    else
        warn("[FSSHUB] CRITICAL: Could not find ExecuteUI function in Bundle!")
    end

    Log("Bundle executed successfully!")
    return true
end

-- ===== MAIN ENTRY POINT =====
Log("FSSHUB Entry v" .. INSTALLER_VERSION)

-- Initialize workspace
initWorkspace()

-- Store workspace config globally for other scripts
getgenv().FSSHUB_WORKSPACE = CONFIG.Workspace

-- Load and execute bundle
local success = loadBundle()

if not success then
    warn("[FSSHUB] Failed to load UI. Please check your connection and try again.")
end

return success
