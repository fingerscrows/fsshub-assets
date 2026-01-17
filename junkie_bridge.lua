-- FSSHUB Bridge Loader (Auto-obfuscated by Junkie/Luraph)
-- This script runs ONLY after UI-Source has successfully validated the key
-- and set getgenv().SCRIPT_KEY

local key = getgenv().SCRIPT_KEY
local hwid = getgenv().SCRIPT_HWID or game:GetService("RbxAnalyticsService"):GetClientId()
local url = "https://script.fsshub-services.workers.dev/load"
    .. "?key=" .. (key or "unknown")
    .. "&hwid=" .. (hwid or "unknown")
    .. "&placeId=" .. game.PlaceId

local success, payload = pcall(game.HttpGet, game, url)

if success and payload then
    -- Check for server-side errors returned as text
    if payload:sub(1, 2) == "--" or payload:find("Error:") then
        warn("[FSSHUB] Backend Error: " .. payload)
        return
    end

    local chunk, err = loadstring(payload)
    if chunk then
        chunk()
    else
        warn("[FSSHUB] Compile error: " .. tostring(err))
    end
else
    warn("[FSSHUB] Network error: " .. tostring(payload))
end
