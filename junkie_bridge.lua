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
    if payload:find("^Error:") then
        warn("[FSSHUB] Backend Error: " .. payload)
        return
    end

    task.wait(0.05) -- Anti-Timeout: Yield before compiling large payload
    local chunk, err = loadstring(payload)
    if chunk then
        -- Detach completely from the current thread
        task.defer(function()
            task.wait(0.1) -- Force yield to ensure main thread allows overhead
            local ok, execErr = pcall(chunk)
            if not ok then
                warn("[FSSHUB] Runtime Error: " .. tostring(execErr))
            end
        end)
    else
        warn("[FSSHUB] Compile error: " .. tostring(err))
    end
else
    warn("[FSSHUB] Network error: " .. tostring(payload))
end
