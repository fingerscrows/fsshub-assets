-- Installer.lua
-- Thin loader that fetches loader.luau from Junkie CDN

local FSSHUB_INFO = {
    Version = "1.0.0",
    Status = "Stable",
    Updated = "2024-01-16",
    LoaderVersion = "2.0.0"
}
getgenv().FSSHUB_INFO = FSSHUB_INFO

-- Load the consolidated bundle from Junkie CDN
-- Note: Replace this URL with the actual Junkie CDN URL when deployed
local Bundle = loadstring(game:HttpGet("https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/loader.luau"))()

if not Bundle then
    warn("[FSSHUB] Failed to load bundle")
    return
end

local KeySystem = Bundle.KeySystem
local MainMenu = Bundle.MainMenu

-- Start Key System, it will handle showing UI and validating keys
-- When a valid key is found (saved or entered), onSuccess is called
KeySystem.Start(function(key)
    -- Key is valid, launch main menu
    MainMenu()
end)
