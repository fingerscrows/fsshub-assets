--[[
    FSSHUB Inline UI Source - Junkie Dashboard Ready
    Target: UI-Source Field
    Architecture: Hosted Library (GitHub) + Inline Config
]]

-- 1. Initialize Junkie SDK
local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "FSSHUB Official"
Junkie.identifier = "1000139"
Junkie.provider = "FSSHUB - KEY SYSTEM"

getgenv().SCRIPT_KEY = nil

-- 2. Configuration
local Config = {
    Title = "FSSHUB - AUTHENTICATION",
    Desc = "KeySystem Gateway",
    Colors = {
        Background = Color3.fromRGB(25, 20, 35),
        MainStroke = Color3.fromRGB(140, 120, 210),
        Accent = Color3.fromRGB(138, 110, 215),
        Secondary = Color3.fromRGB(170, 150, 240),
        Error = Color3.fromRGB(255, 80, 100),
        Success = Color3.fromRGB(50, 255, 120),
        Info = Color3.fromRGB(0, 200, 255),
        TextHigh = Color3.fromRGB(255, 255, 255),
        TextLow = Color3.fromRGB(180, 180, 200),
        InputBg = Color3.fromRGB(15, 12, 25),
        ButtonBg = Color3.fromRGB(40, 30, 60),
        TextDim = Color3.fromRGB(180, 180, 200)
    },
    Assets = {
        Logo = {
            ID = "rbxthumb://type=Asset&id=120860566854298&w=420&h=420",
            Size = UDim2.new(0, 80, 0, 80)
        }
    },
    Settings = {
        AutoSaveKey = true,
        FileName = "FSSHUB_Verified_Key.txt"
    }
}

-- 3. Validation Logic
Config.Function = function(input)
    local result = Junkie.check_key(input)
    if result and (result.valid or result.message == "KEY_VALID" or result.message == "KEYLESS") then
        return true
    else
        return false
    end
end

-- 4. Success Callback
Config.OnSuccess = function()
    -- Key is already saved by Lib if AutoSaveKey is true
    -- We just need to set the global for the bridge
    -- The Library GetKey() might return the file content, but we have the input in scope if needed
    -- However, let's rely on the library or just re-read
    -- Actually, simpler: The library doesn't pass the key to OnSuccess, but we can read it.

    -- Wait, we need to pass the key to getgenv().SCRIPT_KEY
    -- Let's make sure the Lib saves it first.
    -- Or, better, we can just grab it from the file since strict security loop checks getgenv().SCRIPT_KEY

    local Lib = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/fsshub_ui_lib.lua"))()
    local savedKey = Lib.GetKey()
    if savedKey then
        getgenv().SCRIPT_KEY = savedKey
    end
end

-- 5. Load & Initialize Library
local Library = loadstring(game:HttpGet(
"https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/fsshub_ui_lib.lua"))()
Library.Initialize(Config)

-- 6. Security Loop
while not getgenv().SCRIPT_KEY do
    task.wait(0.1)
end
