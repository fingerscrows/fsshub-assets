/**
 * Bundle Junkie CDN Loader
 * 
 * Generates a single file ready for:
 * 1. Obfuscation
 * 2. Upload to Junkie Dev CDN (UI-Source field)
 * 
 * Output: junkie_loader.lua
 */

const fs = require("fs");
const path = require("path");

const CONFIG = {
    keySystemUI: path.join(__dirname, "KeySystemUI.lua"),
    output: path.join(__dirname, "../junkie_loader.lua"),
    
    // FSSHUB Configuration
    service: "FSSHUB Official",
    identifier: "1000139",
    provider: "FSSHUB - KEY SYSTEM",
    
    // Worker endpoint for script payload
    workerUrl: "https://script.fsshub-services.workers.dev",
    
    // Logo Asset (user needs to upload to Roblox and replace this)
    logoAssetId: "rbxassetid://120860566854298", // FSS Logo
    logoSize: "UDim2.new(0, 80, 0, 80)"
};

function escapeForLuaString(content) {
    // Double brackets escape for multi-line string
    return content
        .replace(/\\/g, "\\\\")
        .replace(/"/g, '\\"');
}

function bundle() {
    console.log("Starting Junkie CDN Loader Bundle...");
    
    // Read KeySystemUI
    const keySystemUI = fs.readFileSync(CONFIG.keySystemUI, "utf8");
    
    const output = `--[[
    FSSHUB Loader - Junkie CDN Ready
    
    This file is designed to be:
    1. Obfuscated with Luraph/Prometheus
    2. Uploaded to Junkie Dev Dashboard (UI-Source field)
    
    Flow:
    1. Load Junkie SDK (external - required)
    2. Show KeySystem UI (bundled inline)
    3. Validate key with Junkie SDK
    4. On success -> Fetch payload from Worker
    
    Generated: ${new Date().toISOString()}
]]

-- =====================================================
-- JUNKIE SDK LOADER (External - Cannot Bundle)
-- =====================================================
local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "${CONFIG.service}"
Junkie.identifier = "${CONFIG.identifier}"
Junkie.provider = "${CONFIG.provider}"

-- =====================================================
-- HWID GENERATION
-- =====================================================
local function generateHWID()
    local hardwareId = nil
    pcall(function()
        if gethwid then
            hardwareId = gethwid()
        elseif get_hwid then
            hardwareId = get_hwid()
        end
    end)
    
    if hardwareId and #hardwareId > 0 then
        return hardwareId
    end
    
    -- Fallback
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local userId = tostring(LocalPlayer and LocalPlayer.UserId or "0")
    local executorName = "unknown"
    
    pcall(function()
        if getexecutorname then
            executorName = getexecutorname()
        elseif identifyexecutor then
            executorName = identifyexecutor()
        end
    end)
    
    return executorName .. "_" .. userId
end

local HWID = generateHWID()

-- =====================================================
-- CONFIGURATION
-- =====================================================
local WorkerUrl = "${CONFIG.workerUrl}"
local LogoAsset = "${CONFIG.logoAssetId}"
local LogoSize = ${CONFIG.logoSize}

-- =====================================================
-- KEY SYSTEM UI (Bundled Inline)
-- =====================================================
local KeySystemUI = (function()
${keySystemUI}
end)()

-- =====================================================
-- CONFIGURE UI
-- =====================================================
KeySystemUI.Keys.MainTitle = "FSSHUB"
KeySystemUI.Keys.MainDesc = "Powered by Junkie SDK"

-- Logo Configuration (if UI supports it)
if KeySystemUI.Keys.Assets then
    KeySystemUI.Keys.Assets.Logo = {
        ID = LogoAsset,
        Size = LogoSize
    }
end

-- =====================================================
-- WORKER PAYLOAD FETCHER
-- =====================================================
local function fetchAndExecutePayload(key)
    local placeId = tostring(game.PlaceId)
    local HttpService = game:GetService("HttpService")
    
    local requestUrl = WorkerUrl .. "/load"
        .. "?key=" .. HttpService:UrlEncode(key)
        .. "&placeId=" .. placeId
        .. "&hwid=" .. HttpService:UrlEncode(HWID)
    
    print("[FSSHUB] Fetching payload...")
    
    local success, content = pcall(function()
        return game:HttpGet(requestUrl)
    end)
    
    if success and content then
        local chunk, err = loadstring(content)
        if chunk then
            local execSuccess, execErr = pcall(chunk)
            if not execSuccess then
                warn("[FSSHUB] Payload Error: " .. tostring(execErr))
            else
                print("[FSSHUB] Payload executed successfully!")
            end
        else
            warn("[FSSHUB] Compile Error: " .. tostring(err))
        end
    else
        warn("[FSSHUB] Network Error: " .. tostring(content))
    end
end

-- =====================================================
-- INITIALIZE KEY SYSTEM
-- =====================================================
KeySystemUI.Initialize({
    KeyLink = Junkie.get_key_link(),
    
    Function = function(userInput)
        getgenv().SCRIPT_KEY = userInput
        
        local result = Junkie.check_key(userInput)
        
        if result and (result.valid or result.message == "KEY_VALID" or result.message == "KEYLESS") then
            KeySystemUI.Authorize()
            
            -- Fetch payload after UI closes
            task.spawn(function()
                task.wait(2) -- Wait for authorize animation
                fetchAndExecutePayload(userInput)
            end)
        else
            KeySystemUI.Fail()
            
            -- Handle specific errors
            local errorMsg = result and result.message or "Unknown error"
            if errorMsg == "HWID_BANNED" then
                game.Players.LocalPlayer:Kick("Hardware ID banned")
            end
        end
    end
})

-- =====================================================
-- WAIT FOR KEY (Required by Junkie)
-- =====================================================
while not getgenv().SCRIPT_KEY do
    task.wait(0.1)
end
`;

    fs.writeFileSync(CONFIG.output, output);
    console.log(`Junkie CDN Loader written to: ${CONFIG.output}`);
    console.log("\nNext steps:");
    console.log("1. Upload your logo to Roblox and get the asset ID");
    console.log("2. Replace 'rbxassetid://YOUR_LOGO_ASSET_ID' with actual ID");
    console.log("3. Obfuscate with Luraph or Prometheus");
    console.log("4. Upload to Junkie Dev Dashboard -> UI-Source");
}

bundle();
