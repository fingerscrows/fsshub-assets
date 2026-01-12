# FSSHUB Assets

UI components and themes for FSSHUB Roblox script system.

## Usage

### Via jsDelivr CDN (Recommended)

```lua
local UI = loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/fingerscrows/fsshub-assets@main/lua/UI_Library.lua"))()
```

### Via GitHub Raw

```lua
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/UI_Library.lua"))()
```

## Structure

```
/lua
  ├── UI_Library.lua   -- Core UI framework
  └── Themes.lua       -- Color themes
/docs
  └── (documentation)
```

## UI Library Quick Start

```lua
local UI = loadstring(game:HttpGet("URL_HERE"))()

local window = UI.CreateWindow({
    Title = "My Script",
    IsPremium = true
})

local section = window:AddSection("Features")

section:AddToggle("Speed Hack", false, true, function(state)
    print("Speed:", state)
end)

section:AddSlider("Walk Speed", 16, 200, 16, true, function(val)
    print("Value:", val)
end)
```

## Themes

- Dark (default)
- Light
- Midnight
- Rose
