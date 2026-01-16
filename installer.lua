-- Installer.lua
-- Entry point for FSSHUB
-- In production, the CF Worker Loader (source.ts) handles the complete flow.
-- This installer is a simplified loader that calls the worker's /loader endpoint.

--[[ 
    FSSHUB Local Workspace Structure:
    FSSHUB/
    ├── bin/              -- Cached loader bundle & scripts
    │   └── loader.luau
    ├── config/           -- User settings & preferences
    │   └── settings.json
    ├── data/             -- Key storage & user data
    │   └── key.txt
    └── assets/           -- Images & other assets (future use)
]]

local WORKSPACE = {
    Root = "FSSHUB",
    Bin = "FSSHUB/bin",
    Config = "FSSHUB/config",
    Data = "FSSHUB/data",
    Assets = "FSSHUB/assets",
    LoaderFile = "FSSHUB/bin/loader.luau",
    KeyFile = "FSSHUB/data/SavedkeyFSSHUB_KeyData.cfg",
    SettingsFile = "FSSHUB/config/settings.json"
}
getgenv().FSSHUB_WORKSPACE = WORKSPACE

local loaderUrl = "https://script.fsshub-services.workers.dev/loader"

-- Helper: Safe load & execute
local function safeLoad(code)
    local func, err = loadstring(code)
    if not func then return false, err end
    local s, r = pcall(func)
    return s, r
end

-- Helper: Ensure folder exists
local function ensureFolder(path)
    if makefolder and isfolder then
        if not isfolder(path) then makefolder(path) end
    end
end

-- Initialize Workspace Structure
ensureFolder(WORKSPACE.Root)
ensureFolder(WORKSPACE.Bin)
ensureFolder(WORKSPACE.Config)
ensureFolder(WORKSPACE.Data)
ensureFolder(WORKSPACE.Assets)

-- Try load from local cache first (instant feedback)
local cached = false
if isfile and isfile(WORKSPACE.LoaderFile) then
    cached = true
    task.spawn(function()
        local s, e = safeLoad(readfile(WORKSPACE.LoaderFile))
        if not s then warn("[FSSHUB] Cache Error:", e) end
    end)
end

-- Background Update / First Load
task.spawn(function()
    local success, result = pcall(game.HttpGet, game, loaderUrl)
    if success and result then
        if writefile then writefile(WORKSPACE.LoaderFile, result) end
        if not cached then
            safeLoad(result)
        end
    else
        if not cached then warn("[FSSHUB] Failed to load (No Cache & Net Error)") end
    end
end)

