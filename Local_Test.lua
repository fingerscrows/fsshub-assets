--[[
    Local Test Script
    Use this to verify your UI components locally BEFORE pushing to GitHub.
    Place this script in your Executor's autoexec or run it directly.
    
    REQUIRES: 'readfile' function (Standard on most executors like Synapse, ScriptWare, Solara)
    Ensure the 'packages/roblox' folder is reachable or copy 'lua/UI_Library.lua' to your workspace folder.
]]

local function safeRead(path)
    -- Try scanning common workspace paths
    local paths = {
        path,
        "FSScript/packages/roblox/" .. path,
        "roblox/" .. path
    }
    
    for _, p in ipairs(paths) do
        local success, result = pcall(readfile, p)
        if success then return result end
    end
    return nil
end

warn("[TEST] Starting Local System Test...")

-- 1. Test UI Library Loading
local uiCode = safeRead("lua/UI_Library.lua")
if not uiCode then
    -- Fallback for direct pasting if readfile fails
    warn("[TEST] Could not read file from disk. Please put UI_Library.lua in your workspace.")
    return
end

local UI = loadstring(uiCode)()
if not UI or not UI.CreateWindow then
    error("[TEST] UI Library failed to load or is invalid!")
end
print("[TEST] UI Library Loaded Successfully ✅")

-- 2. Test Window Creation
local window = UI.CreateWindow({
    Title = "Test Window",
    IsPremium = true
})
print("[TEST] Window Created ✅")

-- 3. Test Components
local section = window:AddSection("Test Section")
section:AddToggle("Test Toggle", false, false, function(s) 
    print("Toggle:", s) 
end)
section:AddSlider("Test Slider", 0, 100, 50, false, function(v) 
    print("Slider:", v) 
end)

print("[TEST] Components Rendered ✅")
warn("[TEST] System is READY. You can now push to GitHub.")
