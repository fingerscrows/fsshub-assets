--[[
    FSSHUB Dashboard UI Source
    Target: Junkie Dashboard -> "UI Source" Field
    Action: Obfuscate with Prometheus (free) before uploading.

    Generated: 2026-01-18T14:12:00Z (Fixed: TweenService error + Auto-close on ready)
]]

local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "FSSHUB Official"
Junkie.identifier = "1000139"
Junkie.provider = "FSSHUB - KEY SYSTEM"

-- [ CONFIG ]
local LogoAsset = "rbxthumb://type=Asset&id=120860566854298&w=420&h=420"
local LogoSize = UDim2.new(0, 80, 0, 80)

-- [ UI WRAPPER ]
local result = (function()
    -- =====================================================
    -- GLOBAL CLEANUP FUNCTION (for re-execution & close)
    -- =====================================================
    _G.FSSHUB_CLEANUP = function()
        pcall(function()
            local CoreGui = game:GetService("CoreGui")
            local Lighting = game:GetService("Lighting")

            -- Emit Cleanup Signal for Feature Scripts
            if _G.FSSHUB_EVENTS and _G.FSSHUB_EVENTS.Emit then
                pcall(function() _G.FSSHUB_EVENTS:Emit("cleanup") end)
            end

            -- Destroy UI elements
            local guiNames = { "FSSHUB_Cyber_Loader", "FSSHUB_Lazy_Loader", "Fluent", "FSSHUB" }
            for _, name in ipairs(guiNames) do
                local gui = CoreGui:FindFirstChild(name)
                if gui then gui:Destroy() end
                if gethui then
                    local hui = gethui():FindFirstChild(name)
                    if hui then hui:Destroy() end
                end
            end

            -- Destroy Fluent Window
            if _G.FSSHUB_WINDOW then
                pcall(function() _G.FSSHUB_WINDOW:Destroy() end)
            end

            -- Remove blur effects
            for _, effect in ipairs(Lighting:GetChildren()) do
                if effect:IsA("BlurEffect") then
                    effect:Destroy()
                end
            end

            -- Reset globals
            _G.FSSHUB_WINDOW = nil
            _G.FSSHUB_FLUENT = nil
            _G.FSSHUB_OPTIONS = nil
            _G.FSSHUB_STATUS = nil
            _G.FSSHUB_EXECUTE_UI = nil
            _G.FSSHUB_EVENTS = nil

            if getgenv then
                getgenv().FSSHUB_MAIN_MENU_READY = nil
                getgenv().SCRIPT_KEY = nil
                getgenv().UI_CLOSED = nil
                getgenv().FSSHUB_WORKSPACE = nil
                getgenv().FSSHUB_GET_FLUENT = nil
                getgenv().FSSHUB_UI_BUNDLE = nil -- Critical: Clear cached bundle to force reload
                getgenv().Junkie = nil           -- Reset Junkie SDK ref just in case
            end
        end)
    end

    -- AUTO-CLEANUP on re-execution (destroy old UI before creating new one)
    if _G.FSSHUB_WINDOW or _G.FSSHUB_CLEANUP then
        if _G.FSSHUB_CLEANUP then
            _G.FSSHUB_CLEANUP()
        end
    end

    getgenv().SCRIPT_KEY = nil
    getgenv().UI_CLOSED = false

    -- [ EXTRACTED KEY SYSTEM UI ]
    -- Using Split Architecture: Logic (Here) + Visuals (External Bundle)
    local KeySystemUI = (function()
        local AssetRepo = "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/dev/"
        local BundleURL = AssetRepo .. "uibundle.luau"
        
        -- Fallback for Local Testing
        if _G.FSSHUB_DEV_LOCAL_BUNDLE then
             BundleURL = "http://localhost:3000/uibundle.luau" -- Example
        end

        local success, result = pcall(function()
            return game:HttpGet(BundleURL)
        end)

        if not success or not result then
            if _G.FSSHUB_EVENTS then _G.FSSHUB_EVENTS:Emit("fatal_error", "Failed to fetch UI Bundle") end
            return nil
        end

        local bundleFn, err = loadstring(result)
        if not bundleFn then
            warn("UI Bundle Syntax Error:", err)
            return nil
        end
        
        -- Bundle returns: return function() return Fluent, Builder, LoginUI end
        local bundleFactory = bundleFn()
        if type(bundleFactory) ~= "function" then
             warn("UI Bundle did not return a factory function")
             return nil
        end

        -- Execute Factory to get components
        local Fluent, Builder, LoginUILib = bundleFactory()
        
        -- Cache Fluent/Builder for later use by Main Menu logic (Line 900+)
        -- We store them in getgenv() temporarily because the logic below expects to fetch them again
        -- directly or we can optimize it to reuse these.
        -- For now, let's keep it compatible.
        
        -- Wait, the logic below (Line 902+) RE-DOWNLOADS the bundle.
        -- We should OPTIMIZE this script to only download ONCE.
        -- But for this step, let's just get the LoginUI working.
        
        if not LoginUILib then
            warn("UI Bundle did not return LoginUI")
            return nil
        end

        -- Initialize the Login UI
        -- We need to pass the same config structure as before
        local KeySystemUI = LoginUILib
        
        return KeySystemUI
    end)()

    -- [ AUTO-LOGIN HANDLING ]
    if not KeySystemUI then return nil end -- Safety

    -- [ CONFIGURE UI ]
    KeySystemUI.Keys.MainTitle = "FSSHUB"
    KeySystemUI.Keys.MainDesc = "KeySystem Gateway"
    if KeySystemUI.Keys.Assets then
        KeySystemUI.Keys.Assets.Logo = { ID = LogoAsset, Size = LogoSize }
    end

    -- [ INITIALIZE LOGIC ]
    -- This connects the Visuals (KeySystemUI) to the Logic (Junkie SDK)
    KeySystemUI.Initialize({
        KeyLink = Junkie.get_key_link(),

        Function = function(userInput)
            local UI = KeySystemUI
            local saveFunc = UI and UI.SaveKey
            local uiAuthorize = UI and UI.Authorize
            local uiFail = UI and UI.Fail

            local res = Junkie.check_key(userInput)

            if res and (res.valid or res.message == "KEY_VALID" or res.message == "KEYLESS") then
                if uiAuthorize then
                    uiAuthorize() -- Show success animation
                end

                task.delay(2, function()
                    if saveFunc then
                        pcall(saveFunc, userInput)
                    end
                    getgenv().SCRIPT_KEY = userInput
                end)
            else
                if uiFail then
                    uiFail()
                end
            end
        end
    })

    -- [ WAIT LOOP ]
    while not getgenv().SCRIPT_KEY and not getgenv().UI_CLOSED do
        task.wait(0.1)
    end

    return getgenv().SCRIPT_KEY
end)()

    -- [ AUTO-LOGIN HANDLING ]
    -- (Handled internally in Initialize now)

    if not KeySystemUI then return nil end -- Safety

    -- [ CONFIGURE UI ]
    KeySystemUI.Keys.MainTitle = "FSSHUB"
    KeySystemUI.Keys.MainDesc = "KeySystem Gateway"
    if KeySystemUI.Keys.Assets then
        KeySystemUI.Keys.Assets.Logo = { ID = LogoAsset, Size = LogoSize }
    end

    -- [ INITIALIZE LOGIC ]
    KeySystemUI.Initialize({
        KeyLink = Junkie.get_key_link(),

        Function = function(userInput)
            -- Capture UI reference and function locally to prevent upvalue loss
            local UI = KeySystemUI
            local saveFunc = UI and UI.SaveKey
            local uiAuthorize = UI and UI.Authorize
            local uiFail = UI and UI.Fail

            local res = Junkie.check_key(userInput)

            if res and (res.valid or res.message == "KEY_VALID" or res.message == "KEYLESS") then
                if uiAuthorize then
                    uiAuthorize() -- Show success animation
                end

                -- Wait for animation then confirm
                task.delay(2, function()
                    if saveFunc then
                        pcall(saveFunc, userInput)
                    end
                    getgenv().SCRIPT_KEY = userInput
                end)
            else
                if uiFail then
                    uiFail()
                end
            end
        end
    })

    -- Handle Close
    -- (You might need to add a cleanup callback to KeySystemUI if not present)

    -- [ WAIT LOOP ]
    while not getgenv().SCRIPT_KEY and not getgenv().UI_CLOSED do
        task.wait(0.1)
    end

    return getgenv().SCRIPT_KEY
end)()

if not result then
    return -- User closed UI or failed
end

-- =====================================================
-- V6.3 SMART CACHING UI LOADING (Versioned)
-- =====================================================
do
    local function Notify(title, text, duration)
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = title, Text = text, Duration = duration or 5
            })
        end)
    end

    local FOLDER = "FSSHUB_DEV"
    local ASSETS = FOLDER .. "/assets"
    local BUNDLE_PATH = ASSETS .. "/uibundle.luau"
    local VERSION_PATH = ASSETS .. "/version.txt"

    local function SafeWrite(path, content)
        if not isfolder(FOLDER) then makefolder(FOLDER) end
        if not isfolder(ASSETS) then makefolder(ASSETS) end
        writefile(path, content)
    end

    _G.FSSHUB_STATUS = "CHECKING UPDATES..."

    -- URLs
    local versionUrl = "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/dev/VERSION"
    local bundleUrls = {
        "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/dev/uibundle.luau",
        "https://cdn.jsdelivr.net/gh/fingerscrows/fsshub-assets@dev/uibundle.luau"
    }

    local targetBundle = nil

    -- 1. Get Remote Version
    local remoteVer = nil
    local s, v = pcall(game.HttpGet, game, versionUrl)
    if s and v then remoteVer = v:gsub("%s+", "") end -- clean whitespace

    -- 2. Check Local Version
    local localVer = nil
    if isfile(VERSION_PATH) then
        localVer = readfile(VERSION_PATH):gsub("%s+", "")
    end

    -- 3. Compare & Decide
    local useCache = false
    if remoteVer and localVer and remoteVer == localVer and isfile(BUNDLE_PATH) then
        useCache = true
    elseif not remoteVer and isfile(BUNDLE_PATH) then
        -- Fallback: Remote failed, but we have cache
        useCache = true
        Notify("FSSHUB Warning", "Update check failed, using cached UI.", 5)
    end

    -- 4. Load or Download
    if useCache then
        _G.FSSHUB_STATUS = "LOADING CACHED UI..."
        targetBundle = readfile(BUNDLE_PATH)
    else
        _G.FSSHUB_STATUS = "DOWNLOADING UI..."
        -- Download new bundle
        for _, url in ipairs(bundleUrls) do
            local s, content = pcall(game.HttpGet, game, url)
            if s and content and #content > 1000 then
                targetBundle = content
                break
            end
        end

        if targetBundle then
            -- Cache it
            pcall(SafeWrite, BUNDLE_PATH, targetBundle)
            if remoteVer then pcall(SafeWrite, VERSION_PATH, remoteVer) end
        else
            Notify("FSSHUB Error", "Failed to download UI.", 8)
            return
        end
    end

    _G.FSSHUB_STATUS = "INITIALIZING..."

    -- Strip BOM if present (UTF-8 Byte Order Mark: EF BB BF)
    if targetBundle:sub(1, 3) == string.char(239, 187, 191) then
        targetBundle = targetBundle:sub(4)
    end

    -- Execute
    local BundleChunk, BundleErr = loadstring(targetBundle)
    if not BundleChunk then
        warn("[FSSHUB] Bundle compile error: " .. tostring(BundleErr))
        return
    end

    -- Execute Chunk to get Factory -> Execute Factory to get Instances
    local success, Fluent, Builder = pcall(function()
        local Factory = BundleChunk()
        if type(Factory) ~= "function" then
            error("Invalid bundle format (not a factory)")
        end
        return Factory()
    end)

    if success and Fluent and Builder then
        -- V6.9: FETCH PAYLOAD FIRST (to set FSSHUB_INFO before UI builds)
        getgenv().FSSHUB_FLUENT = Fluent

        -- Fetch and Execute Payload (SYNCHRONOUSLY - UI needs FSSHUB_INFO)
        print("[FSSHUB] Fetching Payload...")

        -- Get Key & HWID
        local key = getgenv().SCRIPT_KEY
        local hwid
        pcall(function()
            hwid = (gethwid and gethwid()) or (get_hwid and get_hwid())
        end)
        if not hwid then
            pcall(function()
                hwid = game:GetService("RbxAnalyticsService"):GetClientId()
            end)
        end
        hwid = hwid or "unknown"

        -- Build URL (Dynamic Env Support)
        local baseUrl = getgenv().FSSHUB_LOADER_BASE_URL or "https://script.fsshub-services.workers.dev"

        -- Load dev token from local file (if exists)
        local devToken = ""
        pcall(function()
            if isfile and isfile("FSSHUB/bin/.dev_token") then
                devToken = readfile("FSSHUB/bin/.dev_token"):gsub("%s+", "")
            end
        end)

        local url = baseUrl .. "/load"
            .. "?key=" .. tostring(key or "unknown")
            .. "&hwid=" .. tostring(hwid)
            .. "&placeId=" .. tostring(game.PlaceId)

        -- LOGGING: Print FULL URL to verify Cache Buster
        print("[FSSHUB DEBUG] Full Payload URL: " .. url)
        task.wait(0.01)

        -- Fetch Payload
        -- Fetch Payload (Simplification to match Production)
        print("[FSSHUB DEBUG] Fetching with simple game:HttpGet...")
        local fetchSuccess, payload = pcall(game.HttpGet, game, url)
        if fetchSuccess and payload then
            print("[FSSHUB] Payload received, length = " .. #payload)
            task.wait(0.01)

            -- Compile Payload
            local chunk, err = loadstring(payload)
            if chunk then
                print("[FSSHUB] Executing Payload (sync for info, async for features)...")

                -- Execute payload SYNCHRONOUSLY
                -- The payload structure is:
                -- 1. Security Header (sync, fast) - Sets Event Bus
                -- 2. Context Header (sync, fast) - Sets FSSHUB_INFO
                -- 3. Orchestrator (has internal task.spawn) - Features load async
                local execSuccess, execErr = pcall(chunk)
                if execSuccess then
                    print("[FSSHUB] Payload Executed!")
                    -- Check both getgenv and _G for FSSHUB_INFO (V7 redundancy)
                    local hasInfo = (getgenv().FSSHUB_INFO ~= nil) or (_G.FSSHUB_INFO ~= nil)
                    print("[FSSHUB] FSSHUB_INFO check: " .. tostring(hasInfo))
                else
                    warn("[FSSHUB] Payload Exec Error: " .. tostring(execErr))
                end
            else
                warn("[FSSHUB] Payload Compile Error: " .. tostring(err))
                Notify("FSSHUB Critical", "Payload Compile Failed. Check console.", 10)
                return -- ABORT
            end
        else
            warn("[FSSHUB] Payload Fetch Error: " .. tostring(payload))
            Notify("FSSHUB Critical", "Failed to fetch payload from server.", 10)
            return -- ABORT
        end

        task.wait(0.05) -- Short yield after payload

        -- NOW build UI (FSSHUB_INFO is available!)
        print("[FSSHUB] Building UI (with context data)...")
        task.spawn(function()
            local buildSuccess, buildErr = pcall(Builder, Fluent)
            if buildSuccess then
                print("[FSSHUB] UI Builder Completed.")
                getgenv().FSSHUB_MAIN_MENU_READY = true
            else
                warn("[FSSHUB] UI Build Error: " .. tostring(buildErr))
                Notify("FSSHUB Error", "UI Build Failed: " .. tostring(buildErr), 10)
            end
            print("[FSSHUB] All Systems Ready!")
        end)
    else
        warn("[FSSHUB] Bundle Init Failed: " .. tostring(Fluent))
        -- Invalidate potentially corrupted/outdated cache
        if useCache then
            pcall(function()
                if isfile(BUNDLE_PATH) then delfile(BUNDLE_PATH) end
                if isfile(VERSION_PATH) then delfile(VERSION_PATH) end
            end)
            Notify("FSSHUB", "Cache invalidated. Please re-run the script.", 5)
        end
    end

    _G.FSSHUB_STATUS = nil
end
