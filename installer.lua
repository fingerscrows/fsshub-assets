-- Installer.lua
-- Entry point that loads the bundle and acts as the Logic Controller for the Key System.
local FSSHUB_INFO = {
    Version = "1.0.0",
    Status = "Stable",
    Updated = "2024-01-16",
    LoaderVersion = "2.0.0"
}

getgenv().FSSHUB_INFO = FSSHUB_INFO

local function LoadBundle()
    -- In production, this would be game:HttpGet("...")
    -- For local dev, we assume the user has the file or uses a localized loader
    -- We will simulate loading the bundle returned by bundle.js
    
    local success, result = pcall(function()
        -- User should replace this with actual URL in production
        -- For now we simulate that 'loader.luau' content is executed
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/loader.luau"))()
    end)
    
    if not success then
        warn("Failed to load bundle:", result)
        return nil
    end
    return result
end

local Bundle = LoadBundle()
if not Bundle then return end

local KeySystemUI = Bundle.KeySystem
local MainMenu = Bundle.MainMenu

-- LOGIC IMPLEMENTATION --
local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "FSSHUB Official"
Junkie.identifier = "1000139"
Junkie.provider = "FSSHUB - KEY SYSTEM"

-- File Helpers
local function hasFileSystem()
    return type(writefile) == "function" and type(readfile) == "function" and type(isfile) == "function"
end

local function saveKey(key)
    if hasFileSystem() then
        pcall(writefile, "verified_key.txt", key)
    end
end

local function loadKey()
    if hasFileSystem() and isfile("verified_key.txt") then
        local s, k = pcall(readfile, "verified_key.txt")
        if s then return k end
    end
    return nil
end

local function clearKey()
    if hasFileSystem() and isfile("verified_key.txt") then
        pcall(delfile, "verified_key.txt")
    end
end

-- Initialize UI
local AuthWindow = KeySystemUI.new({
    title = Junkie.service,
    subtitle = "SECURITY GATEWAY"
})

-- Define Callbacks
AuthWindow.Events.OnVerify = function(key, controls)
    if key == "" then
        controls.UpdateStatus("Please enter a key", Color3.fromRGB(248, 81, 73), 3)
        controls.ShakeInput()
        return
    end

    controls.SetButtonLoading(true)
    controls.UpdateStatus("Verifying...", Color3.fromRGB(88, 166, 255), 0)
    
    task.spawn(function()
        local result = Junkie.check_key(key)
        controls.SetButtonLoading(false)
        
        if result and result.valid then
            saveKey(key)
            controls.UpdateStatus("Key Verified!", Color3.fromRGB(47, 183, 117), 0)
            controls.AnimateSuccess()
            task.wait(1.5)
            controls.Close()
            
            -- Launch Main Menu
            task.defer(function()
                MainMenu()
            end)
        else
            controls.UpdateStatus("Invalid Key", Color3.fromRGB(248, 81, 73), 3)
            controls.ShakeInput()
        end
    end)
end

AuthWindow.Events.OnGetLink = function(controls)
    local link = Junkie.get_key_link()
    if link then
        if setclipboard then
            setclipboard(link)
            controls.UpdateStatus("Link copied!", Color3.fromRGB(47, 183, 117), 3)
        else
            controls.UpdateStatus("Link: " .. link, Color3.fromRGB(88, 166, 255), 10)
        end
    else
        controls.UpdateStatus("Failed to get link", Color3.fromRGB(248, 81, 73), 3)
    end
end

-- Check Saved Key
local savedKey = loadKey()
if savedKey then
    local result = Junkie.check_key(savedKey)
    if result and result.valid then
        -- Quick start
        MainMenu()
        return
    else
        clearKey()
    end
end

-- Show Window if no valid saved key
AuthWindow:Create()
