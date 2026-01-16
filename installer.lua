--[[
    FSSHUB Installer v2.0 (Two-File Architecture)
    Entry point for FSSHUB execution

    Flow:
    1. Initialize workspace structure
    2. Perform clean migration from legacy structure
    3. Load Main_Entry bootstrapper from Worker
    4. Main_Entry handles caching and UI loading

    Local Workspace Structure:
    FSSHUB/
    ├── cache/              -- Cached UI bundle & version
    │   ├── UI_Bundle.bin
    │   └── version.txt
    ├── config/             -- User settings & preferences
    │   └── theme.cfg
    ├── data/               -- Key storage & user data
    │   └── key.cfg
    └── assets/             -- Images & other assets
]]

local INSTALLER_VERSION = "2.0.0"

local WORKSPACE = {
    Root = "FSSHUB",
    Cache = "FSSHUB/cache",
    Config = "FSSHUB/config",
    Data = "FSSHUB/data",
    Assets = "FSSHUB/assets",

    -- Files
    BundleFile = "FSSHUB/cache/UI_Bundle.bin",
    VersionFile = "FSSHUB/cache/version.txt",
    KeyFile = "FSSHUB/data/key.cfg",
    ThemeFile = "FSSHUB/config/theme.cfg",

    -- Legacy paths (for migration)
    LegacyBin = "FSSHUB/bin",
    LegacyLoader = "FSSHUB/bin/loader.luau",
    LegacyKey = "FSSHUB/data/SavedkeyFSSHUB_KeyData.cfg",
}

-- Store globally for other scripts
getgenv().FSSHUB_WORKSPACE = WORKSPACE
getgenv().FSSHUB_INSTALLER_VERSION = INSTALLER_VERSION

-- ===== UTILITIES =====
local function Log(msg)
    print("[FSSHUB Installer]: " .. tostring(msg))
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

local function folderExists(path)
    return isfolder and isfolder(path)
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

local function safeLoad(code)
    local func, err = loadstring(code)
    if not func then return false, err end
    local s, r = pcall(func)
    return s, r
end

-- ===== CLEAN MIGRATION =====
-- Migrate from legacy structure (v1.x) to new structure (v2.0)
local function performCleanMigration()
    Log("Checking for legacy structure...")
    local migrated = false

    -- Check for legacy bin folder
    if folderExists(WORKSPACE.LegacyBin) then
        Log("Legacy structure detected. Performing migration...")

        -- 1. Migrate key file (old location to new)
        if fileExists(WORKSPACE.LegacyKey) then
            local keyContent = readFile(WORKSPACE.LegacyKey)
            if keyContent then
                writeFile(WORKSPACE.KeyFile, keyContent)
                deleteFile(WORKSPACE.LegacyKey)
                Log("✓ Key file migrated")
            end
        end

        -- 2. Delete legacy loader.luau (will be replaced by Main_Entry)
        if fileExists(WORKSPACE.LegacyLoader) then
            deleteFile(WORKSPACE.LegacyLoader)
            Log("✓ Legacy loader removed")
        end

        -- 3. Remove legacy bin folder entirely
        deleteFolder(WORKSPACE.LegacyBin)
        Log("✓ Legacy bin folder removed")

        migrated = true
        Log("Migration complete!")
    end

    return migrated
end

-- ===== WORKSPACE INITIALIZATION =====
local function initWorkspace()
    Log("Initializing workspace...")

    -- Create folder structure
    ensureFolder(WORKSPACE.Root)
    ensureFolder(WORKSPACE.Cache)
    ensureFolder(WORKSPACE.Config)
    ensureFolder(WORKSPACE.Data)
    ensureFolder(WORKSPACE.Assets)

    -- Perform migration
    performCleanMigration()

    Log("Workspace ready")
end

-- ===== LOADER ENDPOINTS =====
local ENDPOINTS = {
    -- Main Entry bootstrapper (lightweight)
    Entry = "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/Main_Entry.lua",

    -- Fallback: Direct worker loader (legacy compatibility)
    WorkerLoader = "https://script.fsshub-services.workers.dev/loader",
}

-- ===== MAIN EXECUTION =====
Log("FSSHUB Installer v" .. INSTALLER_VERSION)

-- 1. Initialize workspace
initWorkspace()

-- 2. Try to load Main_Entry bootstrapper
Log("Loading Main Entry...")
local cached = false
local entryFile = WORKSPACE.Cache .. "/Main_Entry.lua"

-- Check for cached entry (instant feedback)
if fileExists(entryFile) then
    cached = true
    Log("Using cached Main Entry")
    task.spawn(function()
        local content = readFile(entryFile)
        if content then
            local s, e = safeLoad(content)
            if not s then
                warn("[FSSHUB] Cached Entry Error: " .. tostring(e))
                -- Clear corrupted cache
                deleteFile(entryFile)
            end
        end
    end)
end

-- 3. Background update / First load
task.spawn(function()
    local success, result = pcall(game.HttpGet, game, ENDPOINTS.Entry)

    if success and result and #result > 100 then
        -- Cache the entry script
        writeFile(entryFile, result)

        if not cached then
            -- First run or cache miss - execute
            Log("Executing fresh Main Entry")
            local s, e = safeLoad(result)
            if not s then
                warn("[FSSHUB] Entry Error: " .. tostring(e))

                -- Fallback to worker loader
                Log("Falling back to Worker Loader...")
                local fallbackOk, fallbackResult = pcall(game.HttpGet, game, ENDPOINTS.WorkerLoader)
                if fallbackOk and fallbackResult then
                    safeLoad(fallbackResult)
                else
                    warn("[FSSHUB] All load methods failed!")
                end
            end
        else
            Log("Entry updated in background")
        end
    else
        -- Network failed
        if not cached then
            warn("[FSSHUB] Network error and no cache available!")

            -- Last resort: Try direct worker loader
            Log("Attempting direct Worker Loader...")
            local fallbackOk, fallbackResult = pcall(game.HttpGet, game, ENDPOINTS.WorkerLoader)
            if fallbackOk and fallbackResult then
                safeLoad(fallbackResult)
            else
                warn("[FSSHUB] Complete load failure. Please check your connection.")
            end
        else
            Log("Network error but cached version running")
        end
    end
end)

Log("Installer complete")
