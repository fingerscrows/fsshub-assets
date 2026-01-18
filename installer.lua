--[[
    FSSHUB Installer (Smart Kernel)
    Version: 3.0.0 (The Three Pillars)

    This script is the public entry point. It acts as the "Kernel":
    1. Prepares the environment (Cleanup, Folders).
    2. Checks for local assets (Hash).
    3. Requests instructions from the Cloudflare Worker Gateway.
]]

-- HWID Helper
local function getReferenceHWID()
    local hwid = nil
    pcall(function()
        if gethwid then
            hwid = gethwid()
        elseif get_hwid then
            hwid = get_hwid()
        end
    end)
    return hwid or game:GetService("RbxAnalyticsService"):GetClientId()
end

local function run()
    -- 1. Pre-Initialize Environment
    if _G.FSSHUB_CLEANUP then _G.FSSHUB_CLEANUP() end
    if not isfolder("FSSHUB") then pcall(makefolder, "FSSHUB") end
    if not isfolder("FSSHUB/Cache") then pcall(makefolder, "FSSHUB/Cache") end

    -- 2. Read Local Hash (Optimized T-Flow)
    local localHash = "none"
    local hashFile = "FSSHUB/Cache/loader.hash"
    if isfile and isfile(hashFile) then
        local s, content = pcall(readfile, hashFile)
        if s and content then localHash = content:gsub("%s+", "") end
    end

    -- 3. Contact Gateway
    local key = getgenv().SCRIPT_KEY
    local hwid = getReferenceHWID()
    local url = "https://script.fsshub-services.workers.dev/load"
        .. "?key=" .. (key or "installer_public")
        .. "&hwid=" .. (hwid or "unknown")
        .. "&placeId=" .. game.PlaceId
        .. "&hash=" .. localHash -- [CRITICAL] Send Hash for Decision

    local success, payload = pcall(game.HttpGet, game, url)

    if success and payload then
        -- 4. Execute Decision (Payload contains the logic)
        local chunk, compileErr = loadstring(payload)
        if chunk then
            task.defer(chunk)
        else
            if payload:sub(1, 1) == "{" or payload:find("Error") then
                warn("[FSSHUB] Backend Error: " .. payload)
            else
                warn("[FSSHUB] Compile Error: " .. tostring(compileErr))
            end
        end
    else
        warn("[FSSHUB] Network Failed: " .. tostring(payload))
    end
end

run()
