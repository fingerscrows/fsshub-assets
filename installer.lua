--[[
    FSSHUB Installer v5.0.0
    Entry Point
]]

local LOADER_URL = "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/loader.luau"
local FORCE_UPDATE = false -- Set to true to bypass cache

-- Load Bundle (Cached)
local function LoadBundle()
    -- Initialize Environment
    getgenv().FSSHUB_INFO = {
        Version = "5.0.0",
        Script = "FSSHUB Installer",
        User = game.Players.LocalPlayer.Name,
        PlaceId = game.PlaceId,
        JobId = game.JobId
    }

    if not FORCE_UPDATE and isfile and isfile("FSSHUBLibrary/Bin/loader.luau") then
        local success, result = pcall(readfile, "FSSHUBLibrary/Bin/loader.luau")
        if success and #result > 1000 then
            return loadstring(result)()
        end
    end

    -- Download
    local bundle = game:HttpGet(LOADER_URL)
    
    -- Cache it
    if writefile and makefolder then
        pcall(makefolder, "FSSHUBLibrary")
        pcall(makefolder, "FSSHUBLibrary/Bin")
        pcall(writefile, "FSSHUBLibrary/Bin/loader.luau", bundle)
    end
    
    return loadstring(bundle)()
end

local Bundle = LoadBundle()
local FSSHUB = Bundle.FSSHUB
local KeySystem = Bundle.KeySystem
local MainMenu = Bundle.MainMenu

-- Start Key System
local key = KeySystem.Start()

if key then
    task.defer(function()
        MainMenu()
    end)
end
