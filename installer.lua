-- Installer.lua
-- Entry point for FSSHUB
-- In production, the CF Worker Loader (source.ts) handles the complete flow.
-- This installer is a simplified loader that calls the worker's /loader endpoint.

local folderName = "FSSHUB_Cache"
local fileName = "loader_bundle.luau"
local filePath = folderName .. "/" .. fileName
local loaderUrl = "https://script.fsshub-services.workers.dev/loader" -- or raw github url if preferred
local function safeLoad(code)
    local func, err = loadstring(code)
    if not func then return nil, err end
    local s, r = pcall(func)
    return s, r
end

-- Ensure folder exists
if makefolder and not isfolder(folderName) then makefolder(folderName) end

local cached = false
if isfile and isfile(filePath) then
    cached = true
    task.spawn(function()
        local s, e = safeLoad(readfile(filePath))
        if not s then warn("[FSSHUB] Cache Error:", e) end
    end)
end

-- Background Update / First Load
task.spawn(function()
    local success, result = pcall(game.HttpGet, game, loaderUrl)
    if success and result then
        if writefile then writefile(filePath, result) end
        if not cached then
            -- If we didn't run cache, run the fetch result
            safeLoad(result)
        end
    else
        if not cached then warn("[FSSHUB] Failed to load (No Cache & Net Error)") end
    end
end)
