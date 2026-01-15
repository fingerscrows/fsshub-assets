-- Installer.lua
-- Entry point for FSSHUB
-- In production, the CF Worker Loader (source.ts) handles the complete flow.
-- This installer is a simplified loader that calls the worker's /loader endpoint.

local FSSHUB_INFO = {
    Version = "1.0.0",
    Status = "Stable",
    Updated = "2024-01-16"
}
getgenv().FSSHUB_INFO = FSSHUB_INFO

-- Load the worker loader script
-- This script contains the Junkie SDK integration and UI binding logic
local loaderUrl = "https://script.fsshub-services.workers.dev/loader"

local success, result = pcall(function()
    return game:HttpGet(loaderUrl)
end)

if not success then
    warn("[FSSHUB] Failed to fetch loader: " .. tostring(result))
    return
end

local chunk, err = loadstring(result)
if not chunk then
    warn("[FSSHUB] Failed to compile loader: " .. tostring(err))
    return
end

local execSuccess, execErr = pcall(chunk)
if not execSuccess then
    warn("[FSSHUB] Failed to execute loader: " .. tostring(execErr))
end
