local Root = script.Parent.Parent
local Fluent = require(Root)
local SaveManager = require(Root.Addons.SaveManager)
local InterfaceManager = require(Root.Addons.InterfaceManager)

local Window = Fluent:Window({
    Title = "FSSHUB",
    SubTitle = "Key System",
    TabWidth = 100,
    Size = UDim2.fromOffset(480, 250),
    Resize = false,
    MinimizeKey = Enum.KeyCode.RightControl,
    Acrylic = true,
    Theme = "Cyber", -- Force Cyber theme for key system
    Optimize = true
})

local Tabs = {
    Key = Window:Tab({ Title = "Verification", Icon = "key" })
}

local Validated = false
local Callback = nil

function Window.SetCallback(fn)
    Callback = fn
end

Tabs.Key:Paragraph("Welcome", {
    Title = "Welcome to FSSHUB",
    Content = "Please enter your license key to continue.\nGet your key from our Discord server or website."
})

local KeyInput = Tabs.Key:Input("KeyInput", {
    Title = "License Key",
    Default = "",
    Placeholder = "Paste your key here...",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        -- Optional: Auto-submit on enter if needed
    end
})

local function VerifyKey()
    local key = KeyInput.Value
    if not key or key == "" then
        Fluent:Notify({
            Title = "Error",
            Content = "Please enter a key!",
            Duration = 3
        })
        return
    end

    Window:Dialog({
        Title = "Verifying",
        Content = "Checking key...",
        Buttons = {}, -- No buttons while checking
        Yield = false
    })

    task.spawn(function()
        local success = false
        if Callback then
            success = Callback(key)
        end
        
        -- Close dialog (hacky way since Fluent doesn't expose Dialog close easily from outside)
        -- In real implementation, Dialog should return a controller handles close.
        -- Use Notify for result
        
        if success then
            Fluent:Notify({
                Title = "Success",
                Content = "Key validated! Loading FSSHUB...",
                Duration = 3
            })
            Validated = true
            task.wait(1)
            Window:Destroy()
        else
            Fluent:Notify({
                Title = "Failed",
                Content = "Invalid key. Please try again.",
                Duration = 3
            })
        end
    end)
end

Tabs.Key:Button({
    Title = "Redeem Key",
    Description = "Verify and load FSSHUB",
    Callback = VerifyKey
})

Tabs.Key:Button({
    Title = "Get Key",
    Description = "Copy key link to clipboard",
    Callback = function()
        setclipboard("https://discord.gg/fsshub") -- Replace with actual link variable if dynamic
        Fluent:Notify({
            Title = "Copied",
            Content = "Link copied to clipboard!",
            Duration = 3
        })
    end
})

Window:SelectTab(1)

return Window
