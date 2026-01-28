-- FSSHUB UI Bundle (v1.2.47) [dev]
local LibChunk = (function()


task.wait()

local a={}

local b={}
local c={}
local d={}
local e=0
local f=tick()


local function __SAFE_YIELD()
f=tick()
e=0
task.wait()
end

local function __REQUIRE(g)
if c[g]then return c[g]end
if d[g]then error("Cyclic dependency detected: "..tostring(g))end
if not b[g]then error("Mod 404: "..tostring(g))end




e=e+1
local h=tick()-f
if e>=2 or h>5 then
__SAFE_YIELD()
end

d[g]=true
local i=b[g]()
d[g]=nil
c[g]=i


if(tick()-f)>3 then
__SAFE_YIELD()
end

return i
end
local function createProxy(g)
local h={}
h.__index=function(i,j)

if j=="Name"then
return g:match"([^/]+)$"or g
elseif j=="Parent"then
local k=g:match"^(.*)/[^/]+$"
if k then
return createProxy(k)
elseif g~="Root"then
return createProxy"Root"
end
return nil
end
return createProxy(g=="Root"and j or(g.."/"..j))
end
h.__tostring=function()return g end
return setmetatable({},h)
end
b["Components/Assets"]=function()
local g=createProxy"Root/Components/Assets"
local function require(h)
local i=tostring(h):gsub("Root/","")
return __REQUIRE(i)
end
return(function()
return{
Close="rbxassetid://9886659671",
Min="rbxassetid://9886659276",
Max="rbxassetid://9886659406",
Restore="rbxassetid://9886659001",
}

end)()
end
b["Components/Button"]=function()
local g=createProxy"Root/Components/Button"
local function require(h)
local i=tostring(h):gsub("Root/","")
return __REQUIRE(i)
end
return(function()
local h=g.Parent.Parent
local i=require(h.Packages.Flipper)
local j=require(h.Modules.Creator)
local k=j.New

local l=i.Spring.new

return function(m,n,o)
local p={}

o=o or false

p.Title=k("TextLabel",{
FontFace=Font.new"rbxasset://fonts/families/GothamSSm.json",
TextColor3=Color3.fromRGB(200,200,200),
TextSize=14,
TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Center,
TextYAlignment=Enum.TextYAlignment.Center,
BackgroundColor3=Color3.fromRGB(255,255,255),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
ThemeTag={
TextColor3="Text",
},
})

p.HoverFrame=k("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
ThemeTag={
BackgroundColor3="Hover",
},
},{
k("UICorner",{
CornerRadius=UDim.new(0,4),
}),
})

p.Frame=k("TextButton",{
Size=UDim2.new(0,0,0,32),
Parent=n,
ThemeTag={
BackgroundColor3="DialogButton",
},
},{
k("UICorner",{
CornerRadius=UDim.new(0,4),
}),
k("UIStroke",{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Transparency=0.65,
ThemeTag={
Color="DialogButtonBorder",
},
}),
p.HoverFrame,
p.Title,
})

local q,r=j.SpringMotor(1,p.HoverFrame,"BackgroundTransparency",o)
j.AddSignal(p.Frame.MouseEnter,function()
r(0.97)
end)
j.AddSignal(p.Frame.MouseLeave,function()
r(1)
end)
j.AddSignal(p.Frame.MouseButton1Down,function()
r(1)
end)
j.AddSignal(p.Frame.MouseButton1Up,function()
r(0.97)
end)

return p
end

end)()
end
b["Components/Dialog"]=function()
local g=createProxy"Root/Components/Dialog"
local function require(h)
local i=tostring(h):gsub("Root/","")
return __REQUIRE(i)
end
return(function()
local h=g.Parent.Parent
local i=require(h.Modules.Creator)
local j=require(h.Components.Button)
local k=require(h.Packages.Signal)

local l=i.New

local m={
Window=nil,
}

function m.Init(n,o)
m.Window=o
return m
end

function m.Create(n)
local o,p={
Buttons=0,
Closing=k.new(),
Closed=k.new()
},require(h)

o.TintFrame=l("TextButton",{
Text="",
Size=UDim2.fromScale(1,1),
BackgroundColor3=Color3.fromRGB(0,0,0),
BackgroundTransparency=1,
Parent=m.Window.Root,
},{
l("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

local q,r=i.SpringMotor(1,o.TintFrame,"BackgroundTransparency",true)

o.ButtonHolder=l("Frame",{
Size=UDim2.new(1,-40,1,-40),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),
BackgroundTransparency=1,
},{
l("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection=Enum.FillDirection.Horizontal,
HorizontalAlignment=Enum.HorizontalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,
}),
})

o.ButtonHolderFrame=l("Frame",{
Size=UDim2.new(1,0,0,70),
Position=UDim2.new(0,0,1,-70),
ThemeTag={
BackgroundColor3="DialogHolder",
},
},{
l("Frame",{
Size=UDim2.new(1,0,0,1),
ThemeTag={
BackgroundColor3="DialogHolderLine",
},
}),
o.ButtonHolder,
})

o.Title=l("TextLabel",{
FontFace=Font.new(
"rbxasset://fonts/families/GothamSSm.json",
Enum.FontWeight.SemiBold,
Enum.FontStyle.Normal
),
Text="Dialog",
TextColor3=Color3.fromRGB(240,240,240),
TextSize=22,
TextXAlignment=Enum.TextXAlignment.Left,
Size=UDim2.new(1,0,0,22),
Position=UDim2.fromOffset(20,25),
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
ThemeTag={
TextColor3="Text",
},
})

o.Scale=l("UIScale",{
Scale=1,
})

local s,t=i.SpringMotor(1.1,o.Scale,"Scale")

o.Root=l("CanvasGroup",{
Size=UDim2.fromOffset(300,165),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),
GroupTransparency=1,
Parent=o.TintFrame,
ThemeTag={
BackgroundColor3="Dialog",
},
},{
l("UICorner",{
CornerRadius=UDim.new(0,8),
}),
l("UIStroke",{
Transparency=0.5,
ThemeTag={
Color="DialogBorder",
},
}),
o.Scale,
o.Title,
o.ButtonHolderFrame,
})

local u,v=i.SpringMotor(1,o.Root,"GroupTransparency")

function o.Open(w)
p.DialogOpen=true
o.Scale.Scale=1.1
r(0.75)
v(0)
t(1)
end

function o.Close(w)
o.Closing:Fire()
p.DialogOpen=false
r(1)
v(1)
t(1.1)
o.Root.UIStroke:Destroy()
task.wait(0.15)
o.TintFrame:Destroy()
o.Closed:Fire()
end

function o.Button(w,x,y)
o.Buttons=o.Buttons+1
x=x or"Button"
y=y or function()end

local z=j("",o.ButtonHolder,true)
z.Title.Text=x

for A,B in next,o.ButtonHolder:GetChildren()do
if B:IsA"TextButton"then
B.Size=UDim2.new(1/o.Buttons,-((o.Buttons-1)*10/o.Buttons),0,32)
end
end

i.AddSignal(z.Frame.MouseButton1Click,function()
p:SafeCallback(y)
pcall(function()
o:Close()
end)
end)

return z
end

return o
end

return m

end)()
end
b["Components/Element"]=function()
local g=createProxy"Root/Components/Element"
local function require(h)
local i=tostring(h):gsub("Root/","")
return __REQUIRE(i)
end
return(function()
local h=g.Parent.Parent
local i=require(h.Modules.Creator)
local j=i.New

return function(k,l,m,n,o)
local p={
CreatedAt=tick()
}

o=typeof(o)=="table"and o or{}

p.TitleLabel=(j("TextLabel",{
FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Medium,Enum.FontStyle.Normal),
Text=k,
TextColor3=Color3.fromRGB(240,240,240),
TextSize=13,
TextXAlignment=o.TitleAlignment or Enum.TextXAlignment.Left,
Size=UDim2.new(1,0,0,14),
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
ThemeTag={
TextColor3="Text",
},
}))

p.DescLabel=(j("TextLabel",{
FontFace=Font.new"rbxasset://fonts/families/GothamSSm.json",
Text=l,
TextColor3=Color3.fromRGB(200,200,200),
TextSize=12,
TextWrapped=true,
TextXAlignment=o.DescriptionAlignment or Enum.TextXAlignment.Left,
BackgroundColor3=Color3.fromRGB(255,255,255),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,14),
ThemeTag={
TextColor3="SubText",
},
}))

p.LabelHolder=(j("Frame",{
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Position=UDim2.fromOffset(10,0),
Size=UDim2.new(1,-28,0,0),
},{
j("UIListLayout",{
SortOrder=Enum.SortOrder.LayoutOrder,
VerticalAlignment=Enum.VerticalAlignment.Center,
}),
j("UIPadding",{
PaddingBottom=UDim.new(0,13),
PaddingTop=UDim.new(0,13),
}),
p.TitleLabel,
p.DescLabel,
}))

p.Border=(j("UIStroke",{
Transparency=0.5,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Color=Color3.fromRGB(0,0,0),
ThemeTag={
Color="ElementBorder",
},
}))

p.Frame=(j("TextButton",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=0.89,
BackgroundColor3=Color3.fromRGB(130,130,130),
Parent=m,
AutomaticSize=Enum.AutomaticSize.Y,
Text="",
LayoutOrder=7,
ThemeTag={
BackgroundColor3="Element",
BackgroundTransparency="ElementTransparency",
},
},{
j("UICorner",{
CornerRadius=UDim.new(0,4),
}),
p.Border,
p.LabelHolder,
}))

function p.SetTitle(q,r)
p.TitleLabel.Text=r
end

function p.SetDesc(q,r)
if r==nil then
r=""
end
if r==""then
p.DescLabel.Visible=false
else
p.DescLabel.Visible=true
end
p.DescLabel.Text=r
end

function p.Destroy(q)
p.Frame:Destroy()
end

p:SetTitle(k)
p:SetDesc(l)

if n then
local q=h.Themes
local r,s=i.SpringMotor(
i.GetThemeProperty"ElementTransparency",
p.Frame,
"BackgroundTransparency",
false,
true
)

i.AddSignal(p.Frame.MouseEnter,function()
s(i.GetThemeProperty"ElementTransparency"-i.GetThemeProperty"HoverChange")
end)
i.AddSignal(p.Frame.MouseLeave,function()
s(i.GetThemeProperty"ElementTransparency")
end)
i.AddSignal(p.Frame.MouseButton1Down,function()
s(i.GetThemeProperty"ElementTransparency"+i.GetThemeProperty"HoverChange")
end)
i.AddSignal(p.Frame.MouseButton1Up,function()
s(i.GetThemeProperty"ElementTransparency"-i.GetThemeProperty"HoverChange")
end)
end

return setmetatable(p,{
__newindex=function(q,r,s)
if r=="Title"then
p:SetTitle(s)
elseif r=="Description"or r=="Desc"then
p:SetDesc(s)
end
return rawset(q,r,s)
end
})
end

end)()
end
b["Components/Notification"]=function()
local g=createProxy"Root/Components/Notification"
local function require(h)
local i=tostring(h):gsub("Root/","")
return __REQUIRE(i)
end
return(function()
local h=g.Parent.Parent

local i=require(h.Packages.Flipper)
local j=require(h.Modules.Creator)
local k=require(h.Modules.Acrylic)

local l=i.Spring.new
local m=i.Instant.new
local n=j.New

local o=game:GetService"SoundService"

local p={}

function p.Init(q,r)
p.Holder=n("Frame",{
Position=UDim2.new(1,-30,1,-30),
Size=UDim2.new(0,310,1,-30),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
Parent=r,
},{
n("UIListLayout",{
HorizontalAlignment=Enum.HorizontalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,
VerticalAlignment=Enum.VerticalAlignment.Bottom,
Padding=UDim.new(0,20),
}),
})
end

function p.New(q,r)
local s={
Closed=false,
}

r.Title=r.Title or"Title"
r.Content=r.Content or"Content"
r.SubContent=r.SubContent or""
r.Duration=r.Duration or nil
r.Buttons=r.Buttons or{}
r.Sound=r.Sound or{}

r.Sound.Parent=o
r.Sound.PlayOnRemove=true

s.AcrylicPaint=k.AcrylicPaint()

s.Title=n("TextLabel",{
Position=UDim2.new(0,14,0,17),
Text=r.Title,
RichText=true,
TextColor3=Color3.fromRGB(255,255,255),
TextTransparency=0,
FontFace=Font.new"rbxasset://fonts/families/GothamSSm.json",
TextSize=13,
TextXAlignment="Left",
TextYAlignment="Center",
Size=UDim2.new(1,-12,0,12),
TextWrapped=true,
BackgroundTransparency=1,
ThemeTag={
TextColor3="Text",
},
})

s.ContentLabel=n("TextLabel",{
FontFace=Font.new"rbxasset://fonts/families/GothamSSm.json",
Text=r.Content,
TextColor3=Color3.fromRGB(240,240,240),
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.new(1,0,0,14),
BackgroundTransparency=1,
TextWrapped=true,
ThemeTag={
TextColor3="Text",
},
})

s.SubContentLabel=n("TextLabel",{
FontFace=Font.new"rbxasset://fonts/families/GothamSSm.json",
Text=r.SubContent,
TextColor3=Color3.fromRGB(240,240,240),
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.new(1,0,0,14),
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
TextWrapped=true,
ThemeTag={
TextColor3="SubText",
},
})

s.LabelHolder=n("Frame",{
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Position=UDim2.fromOffset(14,40),
Size=UDim2.new(1,-28,0,0),
},{
n("UIListLayout",{
SortOrder=Enum.SortOrder.LayoutOrder,
VerticalAlignment=Enum.VerticalAlignment.Center,
Padding=UDim.new(0,3),
}),
s.ContentLabel,
s.SubContentLabel,
})

s.CloseButton=n("TextButton",{
Text="",
Position=UDim2.new(1,-14,0,13),
Size=UDim2.fromOffset(20,20),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
},{
n("ImageLabel",{
Image=require(g.Parent.Assets).Close,
Size=UDim2.fromOffset(16,16),
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
}),
})

s.Root=n("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromScale(1,0),
},{
s.AcrylicPaint.Frame,
s.Title,
s.CloseButton,
s.LabelHolder,
})

if r.Content==""then
s.ContentLabel.Visible=false
end

if r.SubContent==""then
s.SubContentLabel.Visible=false
end

s.Holder=n("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,200),
Parent=p.Holder,
},{
s.Root,
})

local t=i.GroupMotor.new{
Scale=1,
Offset=60,
}

t:onStep(function(u)
s.Root.Position=UDim2.new(u.Scale,u.Offset,0,0)
end)

j.AddSignal(s.CloseButton.MouseButton1Click,function()
s:Close()
end)

function s.Open(u)
local v=s.LabelHolder.AbsoluteSize.Y
s.Holder.Size=UDim2.new(1,0,0,58+v)

if r.Sound.SoundId then
s.Sound=n("Sound",r.Sound)

if not s.Sound.IsLoaded then
s.Sound.Loaded:Wait()
end

s.Sound:Destroy()
s.Sound=nil
end

t:setGoal{
Scale=l(0,{frequency=5}),
Offset=l(0,{frequency=5}),
}
end

function s.Close(u)
if not s.Closed then
s.Closed=true
task.spawn(function()
t:setGoal{
Scale=l(1,{frequency=5}),
Offset=l(60,{frequency=5}),
}
task.wait(0.4)
if require(h).UseAcrylic then
s.AcrylicPaint.Model:Destroy()
end
s.Holder:Destroy()
end)
end
end

s:Open()
if r.Duration then
task.delay(r.Duration,function()
s:Close()
end)
end
return s
end

return p

end)()
end
b["Components/Section"]=function()
local g=createProxy"Root/Components/Section"
local function require(h)
local i=tostring(h):gsub("Root/","")
return __REQUIRE(i)
end
return(function()
local h=g.Parent.Parent
local i=require(h.Modules.Creator)

local j=i.New

return function(k,l)
local m={}

m.Layout=j("UIListLayout",{
Padding=UDim.new(0,5),
})

m.Container=j("Frame",{
Size=UDim2.new(1,0,0,26),
Position=UDim2.fromOffset(0,24),
BackgroundTransparency=1,
},{
m.Layout,
})

m.Root=j("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,26),
LayoutOrder=7,
Parent=l,
},{
j("TextLabel",{
RichText=true,
Text=k,
TextTransparency=0,
FontFace=Font.new("rbxassetid://12187365364",Enum.FontWeight.SemiBold,Enum.FontStyle.Normal),
TextSize=18,
TextXAlignment="Left",
TextYAlignment="Center",
Size=UDim2.new(1,-16,0,18),
Position=UDim2.fromOffset(0,2),
ThemeTag={
TextColor3="Text",
},
}),
m.Container,
})

i.AddSignal(m.Layout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if m.Container.Size~=UDim2.new(1,0,0,m.Layout.AbsoluteContentSize.Y)or m.Root.Size~=UDim2.new(1,0,0,m.Layout.AbsoluteContentSize.Y+25)then
m.Container.Size=UDim2.new(1,0,0,m.Layout.AbsoluteContentSize.Y)
m.Root.Size=UDim2.new(1,0,0,m.Layout.AbsoluteContentSize.Y+25)
end
end)

return m
end

end)()
end
b["Components/Tab"]=function()
local g=createProxy"Root/Components/Tab"
local function require(h)
local i=tostring(h):gsub("Root/","")
return __REQUIRE(i)
end
return(function()
local h=g.Parent.Parent
local i=require(h.Packages.Flipper)
local j=require(h.Modules.Creator)

local k=j.New
local l=i.Spring.new
local m=i.Instant.new
local n=h.Components

local o={
Window=nil,
Tabs={},
Containers={},
SelectedTab=0,
TabCount=0,
}

function o.Init(p,q)
o.Window=q
return o
end

function o.GetCurrentTabPos(p)
local q=o.Window.TabHolder.AbsolutePosition.Y
local r=o.Tabs[o.SelectedTab].Frame.AbsolutePosition.Y

return r-q
end

function o.New(p,q,r,s)
local t=require(h)
local u=o.Window
local v=t.Elements

o.TabCount=o.TabCount+1
local w=o.TabCount

local x={
Selected=false,
Name=q,
Type="Tab",
}

r=r:find"^rbxasset[://|id://]"==nil and t.Utilities:GetIcon(r)or{
Image=r,
ImageRectOffset=Vector2.zero,
ImageRectSize=Vector2.zero
}

x.Frame=k("TextButton",{
Size=UDim2.new(1,0,0,34),
BackgroundTransparency=1,
Parent=s,
ThemeTag={
BackgroundColor3="Tab",
},
},{
k("UICorner",{
CornerRadius=UDim.new(0,6),
}),
k("TextLabel",{
AnchorPoint=Vector2.new(0,0.5),
Position=r~=nil and UDim2.new(0,30,0.5,0)or UDim2.new(0,12,0.5,0),
Text=q,
RichText=true,
TextColor3=Color3.fromRGB(255,255,255),
TextTransparency=0,
FontFace=Font.new(
"rbxasset://fonts/families/GothamSSm.json",
Enum.FontWeight.Regular,
Enum.FontStyle.Normal
),
TextSize=12,
TextXAlignment="Left",
TextYAlignment="Center",
Size=UDim2.new(1,-12,1,0),
BackgroundTransparency=1,
ThemeTag={
TextColor3="Text",
},
}),
k("ImageLabel",{
AnchorPoint=Vector2.new(0,0.5),
Size=UDim2.fromOffset(16,16),
Position=UDim2.new(0,8,0.5,0),
BackgroundTransparency=1,
ImageRectOffset=r and r.ImageRectOffset or Vector2.zero,
ImageRectSize=r and r.ImageRectSize or Vector2.zero,
Image=r and r.Image or nil,
ThemeTag={
ImageColor3="Text",
},
}),
})

local y=k("UIListLayout",{
Padding=UDim.new(0,5),
SortOrder=Enum.SortOrder.LayoutOrder,
})

x.ContainerFrame=k("ScrollingFrame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
Parent=u.ContainerHolder,
Visible=false,
BottomImage="rbxassetid://6889812791",
MidImage="rbxassetid://6889812721",
TopImage="rbxassetid://6276641225",
ScrollBarImageColor3=Color3.fromRGB(255,255,255),
ScrollBarImageTransparency=0.95,
ScrollBarThickness=3,
BorderSizePixel=0,
CanvasSize=UDim2.fromScale(0,0),
ScrollingDirection=Enum.ScrollingDirection.Y,
},{
y,
k("UIPadding",{
PaddingRight=UDim.new(0,10),
PaddingLeft=UDim.new(0,1),
PaddingTop=UDim.new(0,1),
PaddingBottom=UDim.new(0,1),
}),
})

j.AddSignal(y:GetPropertyChangedSignal"AbsoluteContentSize",function()
if x.ContainerFrame.CanvasSize~=UDim2.fromOffset(0,y.AbsoluteContentSize.Y+2)then
x.ContainerFrame.CanvasSize=UDim2.fromOffset(0,y.AbsoluteContentSize.Y+2)
end
end)

x.Motor,x.SetTransparency=j.SpringMotor(1,x.Frame,"BackgroundTransparency")

j.AddSignal(x.Frame.MouseEnter,function()
x.SetTransparency(x.Selected and 0.85 or 0.89)
end)
j.AddSignal(x.Frame.MouseLeave,function()
x.SetTransparency(x.Selected and 0.89 or 1)
end)
j.AddSignal(x.Frame.MouseButton1Down,function()
x.SetTransparency(0.92)
end)
j.AddSignal(x.Frame.MouseButton1Up,function()
x.SetTransparency(x.Selected and 0.85 or 0.89)
end)
j.AddSignal(x.Frame.MouseButton1Click,function()
o:SelectTab(w)
end)

o.Containers[w]=x.ContainerFrame
o.Tabs[w]=x

x.Container=x.ContainerFrame
x.ScrollFrame=x.Container

function x.Section(z,A)
local B={
Type="Section"
}

local C=require(n.Section)(A,x.Container)
B.Container=C.Container
B.ScrollFrame=x.Container

setmetatable(B,v)
return B
end

x.CreateSection=x.Section
x.AddSection=x.Section

setmetatable(x,v)
return x
end

function o.SelectTab(p,q)
local r=o.Window

o.SelectedTab=q

for s,t in next,o.Tabs do
t.SetTransparency(1)
t.Selected=false
end

o.Tabs[q].SetTransparency(0.89)
o.Tabs[q].Selected=true

r.TabDisplay.Text=o.Tabs[q].Name
r.SelectorPosMotor:setGoal(l(o:GetCurrentTabPos(),{frequency=6}))

task.spawn(function()
r.ContainerHolder.Parent=r.ContainerAnim

r.ContainerPosMotor:setGoal(l(15,{frequency=10}))
r.ContainerBackMotor:setGoal(l(1,{frequency=10}))

task.wait(0.12)

for s,t in next,o.Containers do
t.Visible=false
end

o.Containers[q].Visible=true
r.ContainerPosMotor:setGoal(l(0,{frequency=5}))
r.ContainerBackMotor:setGoal(l(0,{frequency=8}))

task.wait(0.12)

r.ContainerHolder.Parent=r.ContainerCanvas
end)
end

return o

end)()
end
b["Components/Textbox"]=function()
local g=createProxy"Root/Components/Textbox"
local function require(h)
local i=tostring(h):gsub("Root/","")
return __REQUIRE(i)
end
return(function()
local h=game:GetService"TextService"
local i=g.Parent.Parent
local j=require(i.Packages.Flipper)
local k=require(i.Modules.Creator)
local l=k.New

return function(m,n)
local o={}

n=n or false

o.Input=l("TextBox",{
FontFace=Font.new"rbxasset://fonts/families/GothamSSm.json",
TextColor3=Color3.fromRGB(200,200,200),
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Center,
BackgroundColor3=Color3.fromRGB(255,255,255),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Position=UDim2.fromOffset(10,0),
ThemeTag={
TextColor3="Text",
PlaceholderColor3="SubText",
},
})

o.Container=l("Frame",{
BackgroundTransparency=1,
ClipsDescendants=true,
Position=UDim2.new(0,6,0,0),
Size=UDim2.new(1,-12,1,0),
},{
o.Input,
})

o.Indicator=l("Frame",{
Size=UDim2.new(1,-4,0,1),
Position=UDim2.new(0,2,1,0),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=n and 0.5 or 0,
ThemeTag={
BackgroundColor3=n and"InputIndicator"or"DialogInputLine",
},
})

o.Frame=l("Frame",{
Size=UDim2.new(0,0,0,30),
BackgroundTransparency=n and 0.9 or 0,
Parent=m,
ThemeTag={
BackgroundColor3=n and"Input"or"DialogInput",
},
},{
l("UICorner",{
CornerRadius=UDim.new(0,4),
}),
l("UIStroke",{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Transparency=n and 0.5 or 0.65,
ThemeTag={
Color=n and"InElementBorder"or"DialogButtonBorder",
},
}),
o.Indicator,
o.Container,
})

local function Update()
local p=2
local q=o.Container.AbsoluteSize.X

if not o.Input:IsFocused()or o.Input.TextBounds.X<=q-2*p then
o.Input.Position=UDim2.new(0,p,0,0)
else
local r=o.Input.CursorPosition
if r~=-1 then
local s=string.sub(o.Input.Text,1,r-1)
local t=h:GetTextSize(
s,
o.Input.TextSize,
o.Input.Font,
Vector2.new(math.huge,math.huge)
).X

local u=o.Input.Position.X.Offset+t
if u<p then
o.Input.Position=UDim2.fromOffset(p-t,0)
elseif u>q-p-1 then
o.Input.Position=UDim2.fromOffset(q-t-p-1,0)
end
end
end
end

task.spawn(Update)

k.AddSignal(o.Input:GetPropertyChangedSignal"Text",Update)
k.AddSignal(o.Input:GetPropertyChangedSignal"CursorPosition",Update)

k.AddSignal(o.Input.Focused,function()
Update()
o.Indicator.Size=UDim2.new(1,-2,0,2)
o.Indicator.Position=UDim2.new(0,1,1,0)
o.Indicator.BackgroundTransparency=0
k.OverrideTag(o.Frame,{BackgroundColor3=n and"InputFocused"or"DialogHolder"})
k.OverrideTag(o.Indicator,{BackgroundColor3="Accent"})
end)

k.AddSignal(o.Input.FocusLost,function()
Update()
o.Indicator.Size=UDim2.new(1,-4,0,1)
o.Indicator.Position=UDim2.new(0,2,1,0)
o.Indicator.BackgroundTransparency=0.5
k.OverrideTag(o.Frame,{BackgroundColor3=n and"Input"or"DialogInput"})
k.OverrideTag(o.Indicator,{BackgroundColor3=n and"InputIndicator"or"DialogInputLine"})
end)

return o
end

end)()
end
b["Components/TitleBar"]=function()
local g=createProxy"Root/Components/TitleBar"
local function require(h)
local i=tostring(h):gsub("Root/","")
return __REQUIRE(i)
end
return(function()
local h=g.Parent.Parent
local i=require(h.Modules.Creator)

local j=i.New
local k=i.AddSignal

return function(l)
local m={}

local n=require(h)

local function BarButton(o,p,q,r,s)
local t={
Callback=s or function()end,
OnDebounce=false
}

t.Frame=j("TextButton",{
Size=UDim2.new(0,34,1,-8),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
Parent=q,
Position=p,
Text="",
ThemeTag={
BackgroundColor3="Text",
},
},{
j("UICorner",{
CornerRadius=UDim.new(0,7),
}),
j("ImageLabel",{
Image=o,
Size=UDim2.fromOffset(16,16),
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Name="Icon",
ThemeTag={
ImageColor3="Text",
},
}),
})

local u,v=i.SpringMotor(1,t.Frame,"BackgroundTransparency")

k(t.Frame.MouseEnter,function()
v(0.94)
end)

k(t.Frame.MouseLeave,function()
v(1,true)
end)

k(t.Frame.MouseButton1Down,function()
v(0.96)
end)

k(t.Frame.MouseButton1Up,function()
v(0.94)
end)

k(t.Frame.MouseButton1Click,function(...)
if not t.OnDebounce then
t.OnDebounce=true
task.delay(r,rawset,t,"OnDebounce",false)
t.Callback(...)
end
end)

return t
end

m.Frame=j("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
Parent=l.Parent
},{
j("Frame",{
BackgroundTransparency=0.5,
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0,0,1,0),
ThemeTag={
BackgroundColor3="TitleBarLine",
}
})
})

m.TitleHolder=j("Frame",{
Size=UDim2.new(1,-16,1,0),
Parent=m.Frame,
Position=UDim2.new(0,16,0,0),
BackgroundTransparency=1,
},{
j("UIListLayout",{
Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal,
SortOrder=Enum.SortOrder.LayoutOrder,
})
})

m.Title=j("TextLabel",{
RichText=true,
Text=l.Title or"FSSHUB",
Parent=m.TitleHolder,
FontFace=Font.new(
"rbxasset://fonts/families/GothamSSm.json",
Enum.FontWeight.Bold,
Enum.FontStyle.Normal
),
TextSize=16,
TextXAlignment="Left",
TextYAlignment="Center",
Size=UDim2.fromScale(0,1),
AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,
ThemeTag={
TextColor3="Accent",
}
})

m.SubTitle=j("TextLabel",{
RichText=true,
Text=l.SubTitle,
Parent=m.TitleHolder,
TextTransparency=0.4,
FontFace=Font.new(
"rbxasset://fonts/families/GothamSSm.json",
Enum.FontWeight.Regular,
Enum.FontStyle.Normal
),
TextSize=13,
TextXAlignment="Left",
TextYAlignment="Center",
Size=UDim2.fromScale(0,1),
AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,
ThemeTag={
TextColor3="Text",
}
})

m.CloseButton=BarButton(n.Utilities:GetIcon"Close",UDim2.new(1,-4,0,4),m.Frame,0,function()
n.CreatedWindow:Dialog{
Title="Close",
Content="Are you sure you want to unload the interface?",
Buttons={
{
Title="Yes",
Callback=n.Destroy,
},
{
Title="No",
}
}
}
end)

m.MaxButton=BarButton(n.Utilities:GetIcon"Max",UDim2.new(1,-40,0,4),m.Frame,0,function()
l.Window.Maximize(not l.Window.Maximized)
end)

m.MinButton=BarButton(n.Utilities:GetIcon"Min",UDim2.new(1,-80,0,4),m.Frame,0,function()
l.Window:Minimize()
end)









































































return m
end

end)()
end
b["Components/Window"]=function()
local g=createProxy"Root/Components/Window"
local function require(h)
local i=tostring(h):gsub("Root/","")
return __REQUIRE(i)
end
return(function()


local h=g.Parent.Parent
local i=require(h.Packages.Flipper)
local j=require(h.Modules.Creator)
local k=require(h.Modules.Acrylic)
local l=require(h.Packages.Signal)
local m=require(g.Parent.Assets)
local n=g.Parent

local o=require(h)

local p=o.Utilities:Clone(game:GetService"UserInputService")
local q=o.Utilities:Clone(game:GetService"Players").LocalPlayer:GetMouse()
local r=o.Utilities:Clone(game:GetService"Workspace").CurrentCamera

local s=i.Spring.new
local t=i.Instant.new
local u=j.New

return function(v)
assert(typeof(v.Mobile)=="table","Config key 'Mobile' must be a table!")
assert(typeof(v.Mobile.GetIcon)=="function","Mobile Config key 'GetIcon' must be a function!")
assert(typeof(v.Mobile.Size)=="UDim2","Mobile Config key 'Size' must be a UDim2!")

local w={
Minimized=false,
OnMinimized=l.new(),
PostMinimized=l.new(),
Maximized=false,
OnMaximized=l.new(),
PostMaximized=l.new(),
Size=v.Size,
MinSize=v.MinSize,
CurrentPos=0,
TabWidth=0,
Position=UDim2.fromOffset(
r.ViewportSize.X/2-v.Size.X.Offset/2,
r.ViewportSize.Y/2-v.Size.Y.Offset/2
),
}

local x,y,z,A=false
local B,C=false
local D=false
local E,F,G,H=false

w.AcrylicPaint=k.AcrylicPaint()
w.TabWidth=v.TabWidth

local I=u("Frame",{
Size=UDim2.fromOffset(4,0),
BackgroundColor3=Color3.fromRGB(76,194,255),
Position=UDim2.fromOffset(0,17),
AnchorPoint=Vector2.new(0,0.5),
ThemeTag={
BackgroundColor3="Accent",
},
},{
u("UICorner",{
CornerRadius=UDim.new(0,2),
}),
})

local J=u("Frame",{
Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,
Position=UDim2.new(1,-20,1,-20),
})

w.TabHolder=u("ScrollingFrame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
ScrollBarImageTransparency=1,
ScrollBarThickness=0,
BorderSizePixel=0,
CanvasSize=UDim2.fromScale(0,0),
ScrollingDirection=Enum.ScrollingDirection.Y,
},{
u("UIListLayout",{
Padding=UDim.new(0,4),
}),
})

local K=u("Frame",{
Size=UDim2.new(0,w.TabWidth,1,-66),
Position=UDim2.new(0,12,0,54),
BackgroundTransparency=1,
ClipsDescendants=true,
},{
w.TabHolder,
I,
})

w.TabDisplay=u("TextLabel",{
RichText=true,
Text="Tab",
TextTransparency=0,
FontFace=Font.new("rbxassetid://12187365364",Enum.FontWeight.SemiBold,Enum.FontStyle.Normal),
TextSize=28,
TextXAlignment="Left",
TextYAlignment="Center",
Size=UDim2.new(1,-16,0,28),
Position=UDim2.fromOffset(w.TabWidth+26,56),
BackgroundTransparency=1,
ThemeTag={
TextColor3="Text",
},
})

w.ContainerHolder=u("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
})

w.ContainerAnim=u("CanvasGroup",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
})

w.ContainerCanvas=u("Frame",{
Size=UDim2.new(1,-w.TabWidth-32,1,-102),
Position=UDim2.fromOffset(w.TabWidth+26,90),
BackgroundTransparency=1,
},{
w.ContainerAnim,
w.ContainerHolder
})

w.Root=u("Frame",{
BackgroundTransparency=1,
Size=w.Size,
Position=w.Position,
Parent=v.Parent,
},{
w.AcrylicPaint.Frame,
w.TabDisplay,
w.ContainerCanvas,
K,
J,
})

w.HideButton=u("ImageButton",{
Visible=o.Utilities:GetOS()=="Mobile",
Size=v.Mobile.Size,
BackgroundTransparency=1,
Position=UDim2.new(1,-v.Mobile.Size.X.Offset-25,0.5,-v.Mobile.Size.Y.Offset/2),
Parent=v.Parent,
Image=v.Mobile.GetIcon(false).Image,
ImageRectOffset=v.Mobile.GetIcon(false).ImageRectOffset,
ImageRectSize=v.Mobile.GetIcon(false).ImageRectSize
})

w.TitleBar=require(g.Parent.TitleBar){
Title=v.Title,
SubTitle=v.SubTitle,
Parent=w.Root,
Window=w,
}

if o.UseAcrylic then
w.AcrylicPaint.AddParent(w.Root)
end

local L=i.GroupMotor.new{
X=w.Size.X.Offset,
Y=w.Size.Y.Offset,
}

local M=i.GroupMotor.new{
X=w.Position.X.Offset,
Y=w.Position.Y.Offset,
}

w.SelectorPosMotor=i.SingleMotor.new(17)
w.SelectorSizeMotor=i.SingleMotor.new(0)
w.ContainerBackMotor=i.SingleMotor.new(0)
w.ContainerPosMotor=i.SingleMotor.new(94)

L:onStep(function(N)
w.Root.Size=UDim2.new(0,N.X,0,N.Y)
end)

M:onStep(function(N)
w.Root.Position=UDim2.new(0,N.X,0,N.Y)
end)

local N=0
local O=0
w.SelectorPosMotor:onStep(function(P)
I.Position=UDim2.new(0,0,0,P+17)
local Q=tick()
local R=Q-O

if N~=nil then
w.SelectorSizeMotor:setGoal(s((math.abs(P-N)/(R*60))+16))
N=P
end
O=Q
end)

w.SelectorSizeMotor:onStep(function(P)
I.Size=UDim2.new(0,4,0,P)
end)

w.ContainerBackMotor:onStep(function(P)
w.ContainerAnim.GroupTransparency=P
end)

w.ContainerPosMotor:onStep(function(P)
w.ContainerAnim.Position=UDim2.fromOffset(0,P)
end)

local P
local Q
w.Maximize=function(R,S,T)
w.OnMaximized:Fire(tick())

w.Maximized=R
w.TitleBar.MaxButton.Frame.Icon.Image=R and m.Restore or m.Max

if R then
P=w.Size.X.Offset
Q=w.Size.Y.Offset
end
local U=R and r.ViewportSize.X or P
local V=R and r.ViewportSize.Y or Q
L:setGoal{
X=i[T and"Instant"or"Spring"].new(U,{frequency=6}),
Y=i[T and"Instant"or"Spring"].new(V,{frequency=6}),
}
w.Size=UDim2.fromOffset(U,V)

if not S then
M:setGoal{
X=s(R and 0 or w.Position.X.Offset,{frequency=6}),
Y=s(R and 0 or w.Position.Y.Offset,{frequency=6}),
}
end

w.PostMaximized:Fire(tick())
end

j.AddSignal(w.TitleBar.Frame.InputBegan,function(R)
if
R.UserInputType==Enum.UserInputType.MouseButton1
or R.UserInputType==Enum.UserInputType.Touch
then
x=true
z=R.Position
A=w.Root.Position

if w.Maximized then
A=UDim2.fromOffset(
q.X-(q.X*((P-100)/w.Root.AbsoluteSize.X)),
q.Y-(q.Y*(Q/w.Root.AbsoluteSize.Y))
)
end

R.Changed:Connect(function()
if R.UserInputState==Enum.UserInputState.End then
x=false
end
end)
end
end)

j.AddSignal(w.TitleBar.Frame.InputChanged,function(R)
if
R.UserInputType==Enum.UserInputType.MouseMovement
or R.UserInputType==Enum.UserInputType.Touch
then
y=R
end
end)

j.AddSignal(J.InputBegan,function(R)
if
R.UserInputType==Enum.UserInputType.MouseButton1
or R.UserInputType==Enum.UserInputType.Touch
then
B=true
C=R.Position
end
end)

j.AddSignal(p.InputChanged,function(R)
if R==y and x then
local S=R.Position-z
w.Position=UDim2.fromOffset(A.X.Offset+S.X,A.Y.Offset+S.Y)
M:setGoal{
X=t(w.Position.X.Offset),
Y=t(w.Position.Y.Offset),
}

if w.Maximized then
w.Maximize(false,true,true)
end
end

if
(R.UserInputType==Enum.UserInputType.MouseMovement or R.UserInputType==Enum.UserInputType.Touch)
and B
then
local S=R.Position-C
local T=w.Size

local U=Vector3.new(T.X.Offset,T.Y.Offset,0)+Vector3.new(1,1,0)*S
local V=
Vector2.new(math.clamp(U.X,w.MinSize.X,2048),math.clamp(U.Y,w.MinSize.Y,2048))

L:setGoal{
X=i.Instant.new(V.X),
Y=i.Instant.new(V.Y),
}
end
end)

j.AddSignal(p.InputEnded,function(R)
if B==true or R.UserInputType==Enum.UserInputType.Touch then
B=false
w.Size=UDim2.fromOffset(L:getValue().X,L:getValue().Y)
end
end)

j.AddSignal(w.TabHolder.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if w.TabHolder.CanvasSize~=UDim2.fromOffset(0,w.TabHolder.UIListLayout.AbsoluteContentSize.Y)then
w.TabHolder.CanvasSize=UDim2.fromOffset(0,w.TabHolder.UIListLayout.AbsoluteContentSize.Y)
end
end)

function w.Minimize(R)
w.Minimized=not w.Minimized
w.Root.Visible=not w.Minimized

w.OnMinimized:Fire(tick(),w.Root.Visible)

if not D then
local S=o.MinimizeKeybind and o.MinimizeKeybind.Value or typeof(o.MinimizeKey)=="string"and o.MinimizeKey or o.MinimizeKey.Name

D=true

o:Notify{
Title="Interface",
Content=string.format('Press %s to toggle the interface.', tostring(o.Utilities:Prettify(S))),
Duration=6
}
end
if o.Utilities:GetOS()=="Mobile"then
local S=v.Mobile.GetIcon(w.Minimized)
w.HideButton.Image=S.Image
w.HideButton.ImageRectOffset=S.ImageRectOffset
w.HideButton.ImageRectSize=S.ImageRectSiz
end
w.PostMinimized:Fire(tick(),w.Root.Visible)
end

j.AddSignal(p.InputBegan,function(R)
if
type(o.MinimizeKeybind)=="table"
and o.MinimizeKeybind.Type=="Keybind"
and not p:GetFocusedTextBox()
then
if R.KeyCode.Name==o.MinimizeKeybind.Value or R.KeyCode.Name==o.MinimizeKeybind.Value.Name then
w:Minimize()
end
elseif(R.KeyCode==o.MinimizeKey or R.KeyCode.Name==o.MinimizeKey)and not p:GetFocusedTextBox()then
w:Minimize()
end
end)

j.AddSignal(w.HideButton.InputBegan,function(R)
if
R.UserInputType==Enum.UserInputType.MouseButton1
or R.UserInputType==Enum.UserInputType.Touch
then
E=true
G=R.Position
H=w.HideButton.Position

R.Changed:Connect(function()
if R.UserInputState==Enum.UserInputState.End then
E=false
end
end)
end
end)

j.AddSignal(w.HideButton.InputChanged,function(R)
if
R.UserInputType==Enum.UserInputType.MouseMovement
or R.UserInputType==Enum.UserInputType.Touch
then
F=R
end
end)

j.AddSignal(p.InputChanged,function(R)
if R==F and E then
local S=R.Position-G
w.HideButton.Position=UDim2.new(H.X.Scale,H.X.Offset+S.X,H.Y.Scale,H.Y.Offset+S.Y)
end
end)

if o.Utilities:GetOS()=="Mobile"then
j.AddSignal(w.HideButton.TouchTap,function()
w.Minimized=not w.Minimized
w.Root.Visible=not w.Minimized
local R=v.Mobile.GetIcon(w.Minimized)
w.HideButton.Image=R.Image
w.HideButton.ImageRectOffset=R.ImageRectOffset
w.HideButton.ImageRectSize=R.ImageRectSize
end)
else
j.AddSignal(w.HideButton.MouseButton1Click,function()
w.Minimized=not w.Minimized
w.Root.Visible=not w.Minimized
end)
end

function w.Destroy(R)
if v.OnClose then
task.spawn(v.OnClose)
end
if o.UseAcrylic then
w.AcrylicPaint.Model:Destroy()
end
w.Root:Destroy()
end

local R=require(n.Dialog):Init(w)
function w.Dialog(S,T)
local U=R:Create()
U.Title.Text=T.Title

local V=u("TextLabel",{
FontFace=Font.new"rbxasset://fonts/families/GothamSSm.json",
Text=T.Content,
TextColor3=Color3.fromRGB(240,240,240),
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,
Size=UDim2.new(1,-40,1,0),
Position=UDim2.fromOffset(20,60),
BackgroundTransparency=1,
Parent=U.Root,
ClipsDescendants=false,
ThemeTag={
TextColor3="Text",
},
})

u("UISizeConstraint",{
MinSize=Vector2.new(300,165),
MaxSize=Vector2.new(620,math.huge),
Parent=U.Root,
})

U.Root.Size=UDim2.fromOffset(V.TextBounds.X+40,165)
if V.TextBounds.X+40>w.Size.X.Offset-120 then
U.Root.Size=UDim2.fromOffset(w.Size.X.Offset-120,165)
V.TextWrapped=true
U.Root.Size=UDim2.fromOffset(w.Size.X.Offset-120,V.TextBounds.Y+150)
end

for W,X in next,T.Buttons do
U:Button(X.Title,X.Callback)
end

U:Open()

if T.Yield then
U.Closed:Wait()
end

return U
end

local S=require(n.Tab):Init(w)

function w.Tab(T,U)
return S:New(U.Title,U.Icon,w.TabHolder)
end

function w.AddTab(T,U)
return w:Tab(U)
end

function w.CreateTab(T,U)
return w:Tab(U)
end

function w.SelectTab(T,U)
S:SelectTab(U)
end

j.AddSignal(w.TabHolder:GetPropertyChangedSignal"CanvasPosition",function()
N=S:GetCurrentTabPos()+16
O=0
w.SelectorPosMotor:setGoal(t(S:GetCurrentTabPos()))
end)

return w
end

end)()
end
b["Elements/Button"]=function()
local g=createProxy"Root/Elements/Button"
local function require(h)
local i=tostring(h):gsub("Root/","")
return __REQUIRE(i)
end
return(function()
local h=g.Parent.Parent
local i=require(h.Modules.Creator)

local j=i.New
local k=h.Components

local l={}
l.__index=l
l.__type="Button"

function l.New(m,n)
assert(n.Title,"Button - Missing Title")
n.Callback=n.Callback or function()end

local o=require(k.Element)(n.Title,n.Description,m.Container,true)

local p=(j("ImageLabel",{
Size=UDim2.fromOffset(16,16),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-10,0.5,0),
BackgroundTransparency=1,
Parent=o.Frame,
ThemeTag={
ImageColor3="Text",
}
}))

m.Library.Utilities.Icons:SetIcon(p,"chevron-right")

i.AddSignal(o.Frame.MouseButton1Click,function()
if typeof(n.Callback)=="function"then
m.Library:SafeCallback(n.Callback,n.Value)
end
end)

o.Instance=o

return o
end

return l

end)()
end
b["Elements/Colorpicker"]=function()
local g=createProxy"Root/Elements/Colorpicker"
local function require(h)
local i=tostring(h):gsub("Root/","")
return __REQUIRE(i)
end
return(function()
local h=game:GetService"Players"

local i=h.LocalPlayer
local j=i:GetMouse()

local k=g.Parent.Parent
local l=require(k.Modules.Creator)

local m=l.New
local n=k.Components

local o={}
o.__index=o
o.__type="Colorpicker"

function o.New(p,q,r)
local s=p.Library
assert(r.Title,"Colorpicker - Missing Title")
assert(r.Default,"AddColorPicker: Missing default value.")

local t={
Value=r.Default or r.Value,
Transparency=r.Transparency or 0,
UpdateOnChange=r.UpdateOnChange or r.UpdateWhileSliding or false,
Type="Colorpicker",
Title=type(r.Title)=="string"and r.Title or"Colorpicker",
Callback=r.Callback or function(t)end,
}

function t.SetHSVFromRGB(u,v)
local w,x,y=Color3.toHSV(v)
t.Hue=w
t.Sat=x
t.Vib=y
end

t:SetHSVFromRGB(t.Value)

local u=require(n.Element)(r.Title,r.Description,p.Container,true)

t.SetTitle=u.SetTitle
t.SetDesc=u.SetDesc

local v=(m("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundColor3=t.Value,
Parent=u.Frame,
},{
m("UICorner",{
CornerRadius=UDim.new(0,4),
}),
}))

local w=(m("ImageLabel",{
Size=UDim2.fromOffset(26,26),
Position=UDim2.new(1,-10,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
Parent=u.Frame,
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
},{
m("UICorner",{
CornerRadius=UDim.new(0,4),
}),
v,
}))

local function CreateColorDialog()
local x=require(n.Dialog):Create()
x.Title.Text=t.Title
x.Root.Size=UDim2.fromOffset(430,330)

local y,z,A=t.Hue,t.Sat,t.Vib
local B=t.Transparency

local C,D,E,F=t.Hue,t.Sat,t.Vib,t.Transparency

local function CreateInput()
local G=require(n.Textbox)()
G.Frame.Parent=x.Root
G.Frame.Size=UDim2.new(0,90,0,32)

return G
end

local function CreateInputLabel(G,H)
return(m("TextLabel",{
FontFace=Font.new(
"rbxasset://fonts/families/GothamSSm.json",
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
),
Text=G,
TextColor3=Color3.fromRGB(240,240,240),
TextSize=13,
TextXAlignment=Enum.TextXAlignment.Left,
Size=UDim2.new(1,0,0,32),
Position=H,
BackgroundTransparency=1,
Parent=x.Root,
ThemeTag={
TextColor3="Text",
},
}))
end

local function GetRGB()
local G=Color3.fromHSV(y,z,A)
return{R=math.floor(G.R*255),G=math.floor(G.G*255),B=math.floor(G.B*255)}
end

local G=(m("ImageLabel",{
Size=UDim2.new(0,18,0,18),
ScaleType=Enum.ScaleType.Fit,
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Image="http://www.roblox.com/asset/?id=4805639000",
}))

local H=(m("ImageLabel",{
Size=UDim2.fromOffset(180,160),
Position=UDim2.fromOffset(20,55),
Image="rbxassetid://4155801252",
BackgroundColor3=t.Value,
BackgroundTransparency=0,
Parent=x.Root,
},{
m("UICorner",{
CornerRadius=UDim.new(0,4),
}),
G,
}))

local I=(m("Frame",{
BackgroundColor3=t.Value,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=t.Transparency,
},{
m("UICorner",{
CornerRadius=UDim.new(0,4),
}),
}))

local J=(m("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(112,220),
Size=UDim2.fromOffset(88,24),
Parent=x.Root,
},{
m("UICorner",{
CornerRadius=UDim.new(0,4),
}),
m("UIStroke",{
Thickness=2,
Transparency=0.75,
}),
I,
}))

local K=(m("Frame",{
BackgroundColor3=t.Value,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
},{
m("UICorner",{
CornerRadius=UDim.new(0,4),
}),
}))

local L=(m("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(20,220),
Size=UDim2.fromOffset(88,24),
Parent=x.Root,
},{
m("UICorner",{
CornerRadius=UDim.new(0,4),
}),
m("UIStroke",{
Thickness=2,
Transparency=0.75,
}),
K,
}))

local M={}

for N=0,1,0.1 do
M[#M+1]=ColorSequenceKeypoint.new(N,Color3.fromHSV(N,1,1))
end

local N=(m("UIGradient",{
Color=ColorSequence.new(M),
Rotation=90,
}))

local O=(m("Frame",{
Size=UDim2.new(1,0,1,-10),
Position=UDim2.fromOffset(0,5),
BackgroundTransparency=1,
}))

local P=(m("ImageLabel",{
Size=UDim2.fromOffset(14,14),
Image="http://www.roblox.com/asset/?id=12266946128",
Parent=O,
ThemeTag={
ImageColor3="DialogInput",
},
}))

local Q=(m("Frame",{
Size=UDim2.fromOffset(12,190),
Position=UDim2.fromOffset(210,55),
Parent=x.Root,
},{
m("UICorner",{
CornerRadius=UDim.new(1,0),
}),
N,
O,
}))

local R=CreateInput()
R.Frame.Position=UDim2.fromOffset(r.Transparency and 260 or 240,55)
CreateInputLabel("Hex",UDim2.fromOffset(r.Transparency and 360 or 340,55))

local S=CreateInput()
S.Frame.Position=UDim2.fromOffset(r.Transparency and 260 or 240,95)
CreateInputLabel("Red",UDim2.fromOffset(r.Transparency and 360 or 340,95))

local T=CreateInput()
T.Frame.Position=UDim2.fromOffset(r.Transparency and 260 or 240,135)
CreateInputLabel("Green",UDim2.fromOffset(r.Transparency and 360 or 340,135))

local U=CreateInput()
U.Frame.Position=UDim2.fromOffset(r.Transparency and 260 or 240,175)
CreateInputLabel("Blue",UDim2.fromOffset(r.Transparency and 360 or 340,175))

local V
if r.Transparency then
V=CreateInput()
V.Frame.Position=UDim2.fromOffset(260,215)
CreateInputLabel("Alpha",UDim2.fromOffset(360,215))
end

local W,X,Y
if r.Transparency then
local Z=(m("Frame",{
Size=UDim2.new(1,0,1,-10),
Position=UDim2.fromOffset(0,5),
BackgroundTransparency=1,
}))

X=(m("ImageLabel",{
Size=UDim2.fromOffset(14,14),
Image="http://www.roblox.com/asset/?id=12266946128",
Parent=Z,
ThemeTag={
ImageColor3="DialogInput",
},
}))

Y=(m("Frame",{
Size=UDim2.fromScale(1,1),
},{
m("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Rotation=270,
}),
m("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}))

W=(m("Frame",{
Size=UDim2.fromOffset(12,190),
Position=UDim2.fromOffset(230,55),
Parent=x.Root,
BackgroundTransparency=1,
},{
m("UICorner",{
CornerRadius=UDim.new(1,0),
}),
m("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Parent=x.Root,
},{
m("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
Y,
Z,
}))
end

local function Display()
H.BackgroundColor3=Color3.fromHSV(y,1,1)
P.Position=UDim2.new(0,-1,y,-6)
G.Position=UDim2.new(z,0,1-A,0)
K.BackgroundColor3=Color3.fromHSV(y,z,A)

R.Input.Text=string.format('#%s', tostring(Color3.fromHSV(y,z,A):ToHex()))
S.Input.Text=GetRGB().R
T.Input.Text=GetRGB().G
U.Input.Text=GetRGB().B

if r.Transparency then
Y.BackgroundColor3=Color3.fromHSV(y,z,A)
K.BackgroundTransparency=B
X.Position=UDim2.new(0,-1,1-B,-6)
V.Input.Text=string.format('%s%%', tostring(s.Utilities:Round((1-B)*100,0)))
end

if t.UpdateOnChange then
t:SetValue({y,z,A},B)
end
end

l.AddSignal(R.Input.FocusLost,function(Z)
if Z then
local _,aa=pcall(Color3.fromHex,R.Input.Text)
if _ and typeof(aa)=="Color3"then
y,z,A=Color3.toHSV(aa)
end
end
Display()
end)

l.AddSignal(S.Input.FocusLost,function(aa)
if aa then
local Z=GetRGB()
local _,ab=pcall(Color3.fromRGB,S.Input.Text,Z.G,Z.B)
if _ and typeof(ab)=="Color3"then
if tonumber(S.Input.Text)<=255 then
y,z,A=Color3.toHSV(ab)
end
end
end
Display()
end)

l.AddSignal(T.Input.FocusLost,function(aa)
if aa then
local ab=GetRGB()
local Z,_=
pcall(Color3.fromRGB,ab.R,T.Input.Text,ab.B)
if Z and typeof(_)=="Color3"then
if tonumber(T.Input.Text)<=255 then
y,z,A=Color3.toHSV(_)
end
end
end
Display()
end)

l.AddSignal(U.Input.FocusLost,function(aa)
if aa then
local ab=GetRGB()
local Z,_=
pcall(Color3.fromRGB,ab.R,ab.G,U.Input.Text)
if Z and typeof(_)=="Color3"then
if tonumber(U.Input.Text)<=255 then
y,z,A=Color3.toHSV(_)
end
end
end
Display()
end)

if r.Transparency then
l.AddSignal(V.Input.FocusLost,function(aa)
if aa then
pcall(function()
local ab=tonumber(V.Input.Text)
B=ab>=0 and ab<=100 and 1-ab*0.01 or B
end)
end
Display()
end)
end

local function UpdateSatVib()
local aa=H.AbsolutePosition.X
local ab=aa+H.AbsoluteSize.X
local Z=math.clamp(j.X,aa,ab)

local _=H.AbsolutePosition.Y
local ac=_+H.AbsoluteSize.Y
local ad=math.clamp(j.Y,_,ac)

z=(Z-aa)/(ab-aa)
A=1-((ad-_)/(ac-_))
Display()
end

local function UpdateHue()
local aa=Q.AbsolutePosition.Y
local ab=aa+Q.AbsoluteSize.Y
local ac=math.clamp(j.Y,aa,ab)

y=((ac-aa)/(ab-aa))
Display()
end

local function UpdateTransparency()
local aa=W.AbsolutePosition.Y
local ab=aa+W.AbsoluteSize.Y
local ac=math.clamp(j.Y,aa,ab)

B=1-((ac-aa)/(ab-aa))
Display()
end

local aa
l.AddSignal(H.InputBegan,function(ab)
if ab.UserInputType==Enum.UserInputType.MouseButton1
or ab.UserInputType==Enum.UserInputType.Touch then

aa=j.Move:Connect(UpdateSatVib)
UpdateSatVib()
end
end)

l.AddSignal(H.InputEnded,function(ab)
if ab.UserInputType==Enum.UserInputType.MouseButton1
or ab.UserInputType==Enum.UserInputType.Touch then

if aa then
aa:Disconnect()
aa=nil
end
end
end)

l.AddSignal(Q.InputBegan,function(ab)
if ab.UserInputType==Enum.UserInputType.MouseButton1
or ab.UserInputType==Enum.UserInputType.Touch then

aa=j.Move:Connect(UpdateHue)
UpdateHue()
end
end)

l.AddSignal(Q.InputEnded,function(ab)
if ab.UserInputType==Enum.UserInputType.MouseButton1
or ab.UserInputType==Enum.UserInputType.Touch then

if aa then
aa:Disconnect()
aa=nil
end
end
end)

if r.Transparency then
l.AddSignal(W.InputBegan,function(ab)
if ab.UserInputType==Enum.UserInputType.MouseButton1
or ab.UserInputType==Enum.UserInputType.Touch then

aa=j.Move:Connect(UpdateTransparency)
UpdateTransparency()
end
end)

l.AddSignal(W.InputEnded,function(ab)
if ab.UserInputType==Enum.UserInputType.MouseButton1
or ab.UserInputType==Enum.UserInputType.Touch then

if aa then
aa:Disconnect()
aa=nil
end
end
end)
end

Display()

x:Button("Done",function()
t:SetValue({y,z,A},B)
end)

x:Button("Cancel",function()
t:SetValue({C,D,E},F)
end)

x:Open()
end

function t.Display(aa)
rawset(t,"Value",Color3.fromHSV(t.Hue,t.Sat,t.Vib))

v.BackgroundColor3=t.Value
v.BackgroundTransparency=t.Transparency

if typeof(t.Callback)=="function"then
s:SafeCallback(t.Callback,t.Value)
end
if typeof(t.Changed)=="function"then
s:SafeCallback(t.Changed,t.Value)
end
end

function t.SetValue(aa,ab,ac)
local ad=Color3.fromHSV(ab[1],ab[2],ab[3])

rawset(t,"Transparency",ac or 0)
t:SetHSVFromRGB(ad)
t:Display()
end

function t.SetValueRGB(aa,ab,ac)
rawset(t,"Transparency",ac or 0)
t:SetHSVFromRGB(ab)
t:Display()
end

function t.OnChanged(aa,ab)
t.Changed=ab
s:SafeCallback(ab,t.Value,t.Value)
end

function t.Destroy(aa)
u:Destroy()
s.Options[q]=nil
end

l.AddSignal(u.Frame.MouseButton1Click,function()
CreateColorDialog()
end)

t:Display()

s.Options[q]=t

t.Instance=u

return setmetatable(t,{
__newindex=function(aa,ab,ac)
local ad=typeof(ac)
if ab=="Value"then
if ad=="table"then
task.spawn(t.SetValue,t,ac,t.Transparency)
else
task.spawn(t.SetValueRGB,t,ac,t.Transparency)
end
elseif ab=="Transparency"and ad=="number"then
task.spawn(t.SetValueRGB,t,t.Value,ac)
else
rawset(aa,ab,ac)
end
end
})
end

return o
end)()
end
b["Elements/Dropdown"]=function()
local aa=createProxy"Root/Elements/Dropdown"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab=game:GetService"UserInputService"
local ac=game:GetService"Players".LocalPlayer:GetMouse()
local ad=game:GetService"Workspace".CurrentCamera

local g=aa.Parent.Parent
local h=require(g.Modules.Creator)
local i=require(g.Packages.Flipper)

local j=h.New
local k=g.Components

local l={}
l.__index=l
l.__type="Dropdown"

function l.New(m,n,o)
local p=m.Library

local q={
Values=(function()
local q={}

for r,s in next,o.Values or{}do
q[#q+1]=s
end

return q
end)(),
Value=o.Default or o.Value,
Multi=o.Multi or false,
AutoDeselect=o.AutoDeselect or false,
Searchable=o.Searchable or false,
FocusSearch=o.FocusSearch or true,
SearchPlaceholder=o.SearchPlaceholder or"Search...",
Displayer=typeof(o.Displayer)=="function"and o.Displayer or function(q)
return typeof(q)~="number"and tostring(p.Utilities:Prettify(q))or q
end,
CustomDisplayer=(typeof(o.Displayer)=="function"and o.Displayer and true)or false,
Buttons={},
Opened=false,
Type="Dropdown",
Callback=o.Callback or function()end,
Changed=o.Changed or function()end,
AllowCustomInput=o.AllowCustomInput or false,
}

local r=require(k.Element)(o.Title,o.Description,m.Container,false)
r.DescLabel.Size=UDim2.new(1,-170,0,14)

q.SetTitle=r.SetTitle
q.SetDesc=r.SetDesc

local s=j("TextLabel",{
FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal),
Text="Value",
TextColor3=Color3.fromRGB(240,240,240),
TextSize=13,
TextXAlignment=Enum.TextXAlignment.Left,
Size=UDim2.new(1,-30,0,14),
Position=UDim2.new(0,8,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
TextTruncate=Enum.TextTruncate.AtEnd,
ThemeTag={
TextColor3="Text",
},
})

local t=j("ImageLabel",{
Image="rbxassetid://10709790948",
Size=UDim2.fromOffset(16,16),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-8,0.5,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="SubText",
}
})

local u=j("TextButton",{
Size=UDim2.fromOffset(160,30),
Position=UDim2.new(1,-10,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=0.9,
Parent=r.Frame,
ThemeTag={
BackgroundColor3="DropdownFrame"
}
},{
j("UICorner",{
CornerRadius=UDim.new(0,5),
}),
j("UIStroke",{
Transparency=0.5,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
ThemeTag={
Color="InElementBorder",
},
}),
t,
s,
})

local v=j("UIListLayout",{
Padding=UDim.new(0,3),
})

local w=j("ScrollingFrame",{
Size=UDim2.new(1,-5,1,q.Searchable and-40 or-10),
Position=UDim2.fromOffset(5,q.Searchable and 40 or 5),
BackgroundTransparency=1,
BottomImage="rbxassetid://6889812791",
MidImage="rbxassetid://6889812721",
TopImage="rbxassetid://6276641225",
ScrollBarImageColor3=Color3.fromRGB(255,255,255),
ScrollBarImageTransparency=0.95,
ScrollBarThickness=4,
BorderSizePixel=0,
CanvasSize=UDim2.fromScale(0,0),
},{
v,
})

local x=(j("Frame",{
Size=UDim2.fromScale(1,0.6),
ThemeTag={
BackgroundColor3="DropdownHolder",
},
},{
w,
j("UICorner",{
CornerRadius=UDim.new(0,7),
}),
j("UIStroke",{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
ThemeTag={
Color="DropdownBorder",
},
}),
j("ImageLabel",{
BackgroundTransparency=1,
Image="http://www.roblox.com/asset/?id=5554236805",
ScaleType=Enum.ScaleType.Slice,
SliceCenter=Rect.new(23,23,277,277),
Size=UDim2.fromScale(1,1)+UDim2.fromOffset(30,30),
Position=UDim2.fromOffset(-15,-15),
ImageColor3=Color3.fromRGB(0,0,0),
ImageTransparency=0.1,
}),
}))

local y=require(k.Textbox)(x,true)
y.Frame.Visible=q.Searchable
y.Frame.AnchorPoint=Vector2.new(0.5,0)
y.Frame.Position=UDim2.new(0.5,0,0,5)
y.Frame.Size=UDim2.new(1,-5,0,32)
y.Input.PlaceholderText=q.SearchPlaceholder
y.Input.Text=""

local z=y.Input
q.SearchBox=z

local A=(j("Frame",{
Size=UDim2.fromOffset(4,14),
BackgroundColor3=Color3.fromRGB(76,194,255),
Position=UDim2.fromOffset(-1,16),
AnchorPoint=Vector2.new(0,0.5),
ThemeTag={
BackgroundColor3="Accent",
}
},{
j("UICorner",{
CornerRadius=UDim.new(0,2),
}),
}))

local B=(j("TextLabel",{
FontFace=Font.new"rbxasset://fonts/families/GothamSSm.json",
TextColor3=Color3.fromRGB(200,200,200),
TextSize=13,
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundColor3=Color3.fromRGB(255,255,255),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Position=UDim2.fromOffset(10,0),
Name="ButtonLabel",
ThemeTag={
TextColor3="Text"
}
}))

local C=(j("TextButton",{
Size=UDim2.new(1,-5,0,32),
BackgroundTransparency=1,
ZIndex=23,
Text="",
ThemeTag={
BackgroundColor3="DropdownOption"
}
},{
A,
B,
j("UICorner",{
CornerRadius=UDim.new(0,6),
})
}))

local D=j("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromOffset(170,300),
Parent=m.Library.GUI,
Visible=false,
},{
x,
j("UISizeConstraint",{
MinSize=Vector2.new(170,0),
}),
})

p.OpenFrames[#p.OpenFrames+1]=D

local function RecalculateListPosition()
local E=0
if ad.ViewportSize.Y-u.AbsolutePosition.Y<D.AbsoluteSize.Y-5 then
E=D.AbsoluteSize.Y
-5
-(ad.ViewportSize.Y-u.AbsolutePosition.Y)
+40
end
D.Position=
UDim2.fromOffset(u.AbsolutePosition.X-1,u.AbsolutePosition.Y-5-E)
end

local E=0
local function RecalculateListSize()
local F=q.Searchable and 42 or 0
local G=q.Searchable and 35 or 0

D.Size=UDim2.fromOffset(E,math.min(392-F,v.AbsoluteContentSize.Y+10+G))
end

local function RecalculateCanvasSize()
w.CanvasSize=UDim2.fromOffset(0,v.AbsoluteContentSize.Y)
end

local function RepopulateDropdownList()
q:BuildDropdownList()
end

RecalculateListPosition()
RecalculateListSize()

h.AddSignal(u:GetPropertyChangedSignal"AbsolutePosition",RecalculateListPosition)
h.AddSignal(z:GetPropertyChangedSignal"Text",RepopulateDropdownList)

local F=m.ScrollFrame
function q.Open(G)
q.Opened=true
F.ScrollingEnabled=false
D.Visible=true
x:TweenSize(
UDim2.fromScale(1,1),
Enum.EasingDirection.Out,
Enum.EasingStyle.Quart,
.2
)

if q.Searchable then
if not q.AllowCustomInput then
z.Text=""
end

if q.FocusSearch then
z:CaptureFocus()
end
end
end

function q.Close(G)
q.Opened=false
F.ScrollingEnabled=true
x.Size=UDim2.fromScale(1,0.6)
D.Visible=false

if q.Searchable then
if not q.AllowCustomInput then
z.Text=""
end
z:ReleaseFocus()
end
end

h.AddSignal(u.MouseButton1Click,function()
q:Open()
end)

h.AddSignal(ab.InputBegan,function(G)
if
G.UserInputType==Enum.UserInputType.MouseButton1
or G.UserInputType==Enum.UserInputType.Touch
then
local H,I=x.AbsolutePosition,x.AbsoluteSize
if
ac.X<H.X
or ac.X>H.X+I.X
or ac.Y<(H.Y-20-1)
or ac.Y>H.Y+I.Y
then
q:Close()
end
end
end)

function q.Display(G)
local H=q.Values
local I=""

if o.Multi then
for J,K in next,H do
if q.Value[K]then
I=string.format('%s%s, ', tostring(I), tostring(q.Displayer(K)))
end
end
I=I:sub(1,#I-2)
else
I=q.Value and q.Displayer(q.Value)or""
end

s.Text=(I==""and"--"or I)
end

function q.GetActiveValues(G)
if o.Multi then
local H={}

for I,J in next,q.Value do
H[#H+1]=I
end

return H
else
return q.Value and 1 or 0
end
end

function q.BuildDropdownList(G)
local H=q.Values
local I={}

for J,K in next,w:GetChildren()do
if not K:IsA"UIListLayout"then
K:Destroy()
end
end

local J=0

for K,L in next,H do local __DARKLUA_CONTINUE_10=false repeat
J=J+1

if J%30==0 then
task.wait()
end

if q.Searchable and z.Text~=""and not string.lower(q.Displayer(L)):match(string.lower(z.Text))then __DARKLUA_CONTINUE_10=true
break
end

local M={}
local N

local O=C:Clone()
local P,Q=O.Frame,O.ButtonLabel





h.AddThemeObject(O,{
BackgroundColor3="DropdownOption"
})

h.AddThemeObject(P,{
BackgroundColor3="Accent",
})

h.AddThemeObject(Q,{
TextColor3="Text"
})

if o.Multi then
N=q.Value[L]
else
N=q.Value==L
end

local R,S=h.SpringMotor(1,O,"BackgroundTransparency")
local T,U=h.SpringMotor(1,P,"BackgroundTransparency")
local V=i.SingleMotor.new(6)

V:onStep(function(W)
P.Size=UDim2.new(0,4,0,W)
end)

h.AddSignal(O.MouseEnter,function()
S(N and 0.85 or 0.89)
end)

h.AddSignal(O.MouseLeave,function()
S(N and 0.89 or 1)
end)

h.AddSignal(O.MouseButton1Down,function()
S(0.92)
end)

h.AddSignal(O.MouseButton1Up,function()
S(N and 0.85 or 0.89)
end)

function M.UpdateButton(W)
if o.Multi then
N=q.Value[L]
if N then
S(0.89)
end
else
N=q.Value==L
S(N and 0.89 or 1)
end

V:setGoal(i.Spring.new(N and 14 or 6,{frequency=6}))
U(N and 0 or 1)
end

Q.InputBegan:Connect(function(W)
if
W.UserInputType==Enum.UserInputType.MouseButton1
or W.UserInputType==Enum.UserInputType.Touch
then
local X=not N

if q:GetActiveValues()==1 and not X and not o.AllowNull then
else
if o.Multi then
N=X
q.Value[L]=N and true or nil

if typeof(q.Callback)=="function"then
p:SafeCallback(q.Callback,q.Value)
end
if typeof(q.Changed)=="function"then
p:SafeCallback(q.Changed,q.Value)
end
else
N=X
q:SetValue(N and L or nil)

for Y,Z in next,I do
Z:UpdateButton()
end
end

M:UpdateButton()
q:Display()
end
end
end)

Q.Text=q.Displayer(L)
O.Parent=w

M:UpdateButton()
q:Display()

I[O]=M __DARKLUA_CONTINUE_10=true until true if not __DARKLUA_CONTINUE_10 then break end
end

E=0

for K,L in next,I do
if K.ButtonLabel then
if K.ButtonLabel.TextBounds.X>E then
E=K.ButtonLabel.TextBounds.X
end
end
end

E=E+30

RecalculateCanvasSize()
RecalculateListSize()
end

function q.SetValues(G,H)
if H then
rawset(q,"Values",H)
end

q:BuildDropdownList()
end

function q.OnChanged(G,H)
q.Changed=H
p:SafeCallback(H,q.Value,q.Value)
end

function q.SetValue(G,H)
if q.Multi then
local I={}

for J,K in next,H do
if table.find(q.Values,J)then
I[J]=true
end
end

rawset(q,"Value",I)
else
if not H then
rawset(q,"Value",nil)
elseif table.find(q.Values,H)then
rawset(q,"Value",H)
end
end

task.spawn(function()
q:BuildDropdownList()
end)

if typeof(q.Callback)=="function"then
p:SafeCallback(q.Callback,q.Value)
end
if typeof(q.Changed)=="function"then
p:SafeCallback(q.Changed,q.Value)
end
end

function q.Destroy(G)
r:Destroy()
p.Options[n]=nil
end

q:BuildDropdownList()
q:Display()

local G={}

if type(o.Default)=="table"then
for H,I in next,o.Default do
local J=table.find(q.Values,I)

if J then
G[#G+1]=J
end
end
table.clear(o.Default)
elseif type(o.Default)=="number"and q.Values[o.Default]~=nil then
G[#G+1]=o.Default
else
local H=table.find(q.Values,o.Default)
if H then
G[#G+1]=H
end
end

if next(G)then
for H=1,#G do
local I=G[H]

if o.Multi then
q.Value[q.Values[I] ]=true
else
q.Value=q.Values[I]
break
end
end

q:BuildDropdownList()
q:Display()
end

p.Options[n]=q

q.Instance=r

return setmetatable(q,{
__newindex=function(H,I,J)
if I=="Value"then
task.spawn(q.SetValue,q,J)
elseif I=="Values"or I=="List"then
task.spawn(q.SetValues,q,J)
end
rawset(H,I,J)
end
})
end

return l

end)()
end
b.Elements=function()
local aa=createProxy"Root/Elements"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()

local ab={
require(aa.Button),
require(aa.Colorpicker),
require(aa.Dropdown),
require(aa.Input),
require(aa.Keybind),
require(aa.Paragraph),
require(aa.Slider),
require(aa.Toggle)
}
return ab

end)()
end
b["Elements/Input"]=function()
local aa=createProxy"Root/Elements/Input"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab=aa.Parent.Parent
local ac=require(ab.Modules.Creator)

local ad=ac.AddSignal
local g=ab.Components

local h={}
h.__index=h
h.__type="Input"

function h.New(i,j,k)
local l=i.Library
assert(k.Title,"Input - Missing Title")
k.Callback=k.Callback or function()end

local m={
Value=k.Default or k.Value or"",
Numeric=k.Numeric or false,
Finished=k.Finished or false,
Callback=k.Callback or function(m)end,
ClearOnFocusLost=k.ClearOnFocusLost or false,
Type="Input",
}

local n=require(g.Element)(k.Title,k.Description,i.Container,false)

m.SetTitle=n.SetTitle
m.SetDesc=n.SetDesc

local o=require(g.Textbox)(n.Frame,true)
o.Frame.Position=UDim2.new(1,-10,0.5,0)
o.Frame.AnchorPoint=Vector2.new(1,0.5)
o.Frame.Size=UDim2.fromOffset(160,30)
o.Input.Text=k.Default or""
o.Input.PlaceholderText=k.Placeholder or""

local p=o.Input

function m.SetValue(q,r)
if k.MaxLength and#r>k.MaxLength then
r=r:sub(1,k.MaxLength)
end

if m.Numeric then
if(not tonumber(r))and r:len()>0 then
r=m.Value
end
end

rawset(m,"Value",r)
p.Text=r

if typeof(m.Callback)=="function"then
l:SafeCallback(m.Callback,m.Value)
end
if typeof(m.Changed)=="function"then
l:SafeCallback(m.Changed,m.Value)
end
end

if m.Finished then
ad(p.FocusLost,function(q,r)
if not q then
return
end

m:SetValue(p.Text)

if k.ClearOnFocusLost then
p.Text=""
end
end)
else
ad(p:GetPropertyChangedSignal"Text",function()
m:SetValue(p.Text)
end)
end

function m.OnChanged(q,r)
m.Changed=r
l:SafeCallback(r,m.Value,m.Value)
end

function m.Destroy(q)
n:Destroy()
l.Options[j]=nil
end

l.Options[j]=m

m.Instance=n

return setmetatable(m,{
__newindex=function(q,r,s)
if r=="Value"then
task.spawn(m.SetValue,m,s)
end
rawset(q,r,s)
end
})
end

return h

end)()
end
b["Elements/Keybind"]=function()
local aa=createProxy"Root/Elements/Keybind"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab=game:GetService"UserInputService"

local ac=aa.Parent.Parent
local ad=require(ac.Modules.Creator)

local g=ad.New
local h=ac.Components

local i={}
i.__index=i
i.__type="Keybind"

function i.New(j,k,l)
local m=j.Library

local n={
Value=l.Default or l.Value or Enum.KeyCode.Unknown,
Toggled=false,
Mode=l.Mode or"Toggle",
Type="Keybind",
Callback=l.Callback or function(n)end,
ChangedCallback=l.ChangedCallback or function(n)end,
}

local o=false

local p=require(h.Element)(l.Title or"Keybind",l.Description,j.Container,true)

n.SetTitle=p.SetTitle
n.SetDesc=p.SetDesc

local q=g("TextLabel",{
FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal),
Text=m.Utilities:Prettify(n.Value),
TextColor3=Color3.fromRGB(240,240,240),
TextSize=13,
TextXAlignment=Enum.TextXAlignment.Center,
Size=UDim2.new(0,0,0,14),
Position=UDim2.new(0,0,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=Color3.fromRGB(255,255,255),
AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,
ThemeTag={
TextColor3="Text",
},
})


local r=g("TextButton",{
Size=UDim2.fromOffset(20,30),
Position=UDim2.new(1,-10,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
Text="X",
TextColor3=Color3.fromRGB(150,150,150),
TextSize=14,
FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Bold),
Parent=p.Frame,
ThemeTag={
TextColor3="SubText"
},
Visible=false
})

local s=(g("TextButton",{
Size=UDim2.fromOffset(0,30),
Position=UDim2.new(1,-30,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=0.9,
Parent=p.Frame,
AutomaticSize=Enum.AutomaticSize.X,
ThemeTag={
BackgroundColor3="Keybind",
},
},{
g("UICorner",{
CornerRadius=UDim.new(0,5),
}),
g("UIPadding",{
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
}),
g("UIStroke",{
Transparency=0.5,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
ThemeTag={
Color="InElementBorder",
},
}),
q,
}))

local function UpdateClearButton()
local t=n.Value
if t==Enum.KeyCode.Unknown or t=="None"or t==nil then
r.Visible=false
s.Position=UDim2.new(1,-10,0.5,0)
else
r.Visible=true
s.Position=UDim2.new(1,-30,0.5,0)
end
end


r.MouseButton1Click:Connect(function()
n:SetValue("None",n.Mode)
end)

function n.GetState(t)
if ab:GetFocusedTextBox()and n.Mode~="Always"then
return false
end

if n.Mode=="Always"then
return true
elseif n.Mode=="Hold"then
if n.Value=="None"then
return false
end

local u=n.Value

if u=="LeftMousebutton"or u=="RightMousebutton"then
return u=="LeftMousebutton"and ab:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
or u=="RightMousebutton"
and ab:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
else
return ab:IsKeyDown(Enum.KeyCode[n.Value])
end
else
return n.Toggled
end
end

function n.SetValue(t,u,v)
u=u or n.Value
v=v or n.Mode

rawset(n,"Value",u)
n.Mode=v

q.Text=m.Utilities:Prettify(n.Value)
UpdateClearButton()

if typeof(n.ChangedCallback)=="function"then
m:SafeCallback(n.ChangedCallback,u)
end
if typeof(n.Changed)=="function"then
m:SafeCallback(n.Changed,u)
end
end

function n.OnClick(t,u)
n.Clicked=u
end

function n.OnChanged(t,u)
n.Changed=u
m:SafeCallback(u,n.Value,n.Value)
end

function n.DoClick(t)
if typeof(n.Callback)=="function"then
m:SafeCallback(n.Callback,n.Toggled)
end
if typeof(n.Clicked)=="function"then
m:SafeCallback(n.Clicked,n.Toggled)
end
end

function n.Destroy(t)
p:Destroy()
m.Options[k]=nil
end

ad.AddSignal(s.InputBegan,function(t)
if t.UserInputType==Enum.UserInputType.MouseButton2 then
n:SetValue"None"
return
end

if
t.UserInputType==Enum.UserInputType.MouseButton1
or t.UserInputType==Enum.UserInputType.Touch
then
o=true
q.Text="..."

wait(0.2)

ab.InputBegan:Once(function(u)
local v

if u.UserInputType==Enum.UserInputType.Keyboard then
v=u.KeyCode.Name
elseif u.UserInputType==Enum.UserInputType.MouseButton1 then
v="LeftMousebutton"
elseif u.UserInputType==Enum.UserInputType.MouseButton2 then
v="RightMousebutton"
end

ab.InputEnded:Once(function(w)
if(w.KeyCode.Name==v
or v=="LeftMousebutton"and w.UserInputType==Enum.UserInputType.MouseButton1
or v=="RightMousebutton"and w.UserInputType==Enum.UserInputType.MouseButton2)
and not m.Unloaded
then
o=false

n.Value=v

q.Text=m.Utilities:Prettify(n.Value)
UpdateClearButton()

if typeof(n.ChangedCallback)=="function"then
m:SafeCallback(n.ChangedCallback,w.KeyCode or w.UserInputType)
end
if typeof(n.Changed)=="function"then
m:SafeCallback(n.Changed,w.KeyCode or w.UserInputType)
end
end
end)
end)
end
end)

ad.AddSignal(ab.InputBegan,function(t)
if not o and not ab:GetFocusedTextBox()then
if n.Mode=="Toggle"then
local u=n.Value

if u=="LeftMousebutton"or u=="RightMousebutton"then
if
u=="LeftMousebutton"and t.UserInputType==Enum.UserInputType.MouseButton1
or u=="RightMousebutton"and t.UserInputType==Enum.UserInputType.MouseButton2
then
n.Toggled=not n.Toggled
n:DoClick()
end
elseif t.UserInputType==Enum.UserInputType.Keyboard then
if t.KeyCode.Name==u or t.KeyCode==u then
n.Toggled=not n.Toggled
n:DoClick()
end
end
end
end
end)

n:SetValue(n.Value)

m.Options[k]=n

n.Instance=p

return setmetatable(n,{
__newindex=function(t,u,v)
if u=="Value"then
task.spawn(n.SetValue,n,v)
end
rawset(t,u,v)
end
})
end

return i

end)()
end
b["Elements/Paragraph"]=function()
local aa=createProxy"Root/Elements/Paragraph"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab=aa.Parent.Parent
local ac=ab.Components

local ad={}
ad.__index=ad
ad.__type="Paragraph"

function ad.New(g,h,i)
local j=g.Library
assert(i.Title,"Paragraph - Missing Title")
i.Content=i.Content or""

local k={
Value=i.Content,
Callback=i.Callback or function(k)end,
Type="Paragraph",
}

local l=require(ac.Element)(i.Title,k.Value,g.Container,false,{
TitleAlignment=i.TitleAlignment=="Middle"and"Center"or i.TitleAlignment,
DescriptionAlignment=i.ContentAlignment=="Middle"and"Center"or i.ContentAlignment
})

l.Frame.BackgroundTransparency=0.92
l.Border.Transparency=0.6


function k.OnChanged(m,n)
k.Changed=n
j:SafeCallback(n,k.Value,k.Value)
end

function k.SetContent(m,n)
n=n or""
rawset(k,"Value",n)

l:SetDesc(n)

l.Frame.BackgroundTransparency=0.92
l.Border.Transparency=0.6

if typeof(k.Callback)=="function"then
j:SafeCallback(k.Callback,k.Value)
end
if typeof(k.Changed)=="function"then
j:SafeCallback(k.Changed,k.Value)
end
end

function k.SetValue(m,n)
k:SetContent(n)
end

function k.Destroy(m)
l:Destroy()
j.Options[h]=nil
end

k:SetValue(k.Value)

j.Options[h]=k

k.Instance=l

return setmetatable(k,{
__newindex=function(m,n,o)
if n=="Value"then
task.spawn(k.SetValue,k,o)
end
rawset(m,n,o)
end
})

end

return ad

end)()
end
b["Elements/Slider"]=function()
local aa=createProxy"Root/Elements/Slider"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab=game:GetService"UserInputService"
local ac=aa.Parent.Parent
local ad=require(ac.Modules.Creator)

local g=ad.New
local h=ac.Components

local i={}
i.__index=i
i.__type="Slider"

function i.New(j,k,l)
local m=j.Library
assert(l.Max,"Slider - Missing maximum value.")

local n={
Value=nil,
Min=typeof(l.Min)=="number"and l.Min or 0,
Max=l.Max,
Rounding=typeof(l.Rounding)=="number"and l.Rounding or 0,
Callback=typeof(l.Callback)=="function"and l.Callback or function(n,o)end,
Changed=l.Changed or function()end,
Type="Slider"
}

local o=false

local p=require(h.Element)(l.Title or"Slider",l.Description,j.Container,false)
p.DescLabel.Size=UDim2.new(1,-170,0,14)

n.SetTitle=p.SetTitle
n.SetDesc=p.SetDesc

local q=g("ImageLabel",{
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,-7,0.5,0),
Size=UDim2.fromOffset(14,14),
Image="http://www.roblox.com/asset/?id=12266946128",
ThemeTag={
ImageColor3="Accent",
}
})

local r=g("Frame",{
BackgroundTransparency=1,
Position=UDim2.fromOffset(7,0),
Size=UDim2.new(1,-14,1,0)
},{
q,
})

local s=g("Frame",{
Size=UDim2.new(0,0,1,0),
ThemeTag={
BackgroundColor3="Accent",
}
},{
g("UICorner",{
CornerRadius=UDim.new(1,0),
})
})

local t=g("TextBox",{
FontFace=Font.new"rbxasset://fonts/families/GothamSSm.json",
Text="Value",
ClearTextOnFocus=true,
TextSize=12,
TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Right,
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Size=UDim2.new(0,100,0,14),
Position=UDim2.new(0,-4,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
ThemeTag={
TextColor3="SubText",
}
})

local u=g("Frame",{
Size=UDim2.new(1,0,0,4),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-10,0.5,0),
BackgroundTransparency=0.4,
Parent=p.Frame,
ThemeTag={
BackgroundColor3="SliderRail",
}
},{
g("UICorner",{
CornerRadius=UDim.new(1,0),
}),
g("UISizeConstraint",{
MaxSize=Vector2.new(150,math.huge),
}),
t,
s,
r
})

ad.AddSignal(q.InputBegan,function(v)
if
v.UserInputType==Enum.UserInputType.MouseButton1
or v.UserInputType==Enum.UserInputType.Touch
then
o=true
end
end)

ad.AddSignal(q.InputEnded,function(v)
if
v.UserInputType==Enum.UserInputType.MouseButton1
or v.UserInputType==Enum.UserInputType.Touch
then
o=false
end
end)

function n.OnChanged(v,w)
n.Changed=w
m:SafeCallback(w,n.Value,n.Value)
end

function n.SetValue(v,w)
local x=v.Value or w

rawset(v,"Value",m.Utilities:Round(math.clamp(w,n.Min,n.Max),n.Rounding))

q.Position=UDim2.new((v.Value-n.Min)/(n.Max-n.Min),-7,0.5,0)
s.Size=UDim2.fromScale((v.Value-n.Min)/(n.Max-n.Min),1)
t.Text=tostring(v.Value)

if typeof(n.Callback)=="function"then
m:SafeCallback(n.Callback,v.Value,x)
end
if typeof(n.Changed)=="function"then
m:SafeCallback(n.Changed,v.Value,x)
end
end

ad.AddSignal(ab.InputChanged,function(v)
if
o
and(
v.UserInputType==Enum.UserInputType.MouseMovement
or v.UserInputType==Enum.UserInputType.Touch
)
then
local w=
math.clamp((v.Position.X-r.AbsolutePosition.X)/r.AbsoluteSize.X,0,1)
n:SetValue(n.Min+((n.Max-n.Min)*w))
end
end)

ad.AddSignal(t.FocusLost,function()
n:SetValue(tonumber(t.Text)or n.Value)
end)

function n.Destroy(v)
p:Destroy()
m.Options[k]=nil
end

n:SetValue(typeof(l.Default)=="number"and l.Default or n.Min)

m.Options[k]=n

n.Instance=p

return setmetatable(n,{
__newindex=function(v,w,x)
if w=="Value"then
task.spawn(n.SetValue,n,x)
end
rawset(v,w,x)
end
})
end

return i

end)()
end
b["Elements/Toggle"]=function()
local aa=createProxy"Root/Elements/Toggle"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()

local ab,ac=game:GetService"TweenService",game:GetService"UserInputService"
local ad=aa.Parent.Parent
local g=require(ad.Modules.Creator)

local h=g.New
local i=ad.Components


local j=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
local k=UDim2.new(0,19,0.5,0)
local l=UDim2.new(0,2,0.5,0)

local m={}
m.__index=m
m.__type="Toggle"

function m.New(n,o,p)
local q=n.Library
assert(p.Title,"Toggle - Missing Title")

local r={
Value=p.Default or p.Value or false,
Callback=p.Callback or function(r)end,
Type="Toggle",
}

local s=require(i.Element)(p.Title,p.Description,n.Container,true)
s.DescLabel.Size=UDim2.new(1,-54,0,14)

r.SetTitle=s.SetTitle
r.SetDesc=s.SetDesc

local t=(h("ImageLabel",{
AnchorPoint=Vector2.new(0,0.5),
Size=UDim2.fromOffset(14,14),
Position=UDim2.new(0,2,0.5,0),
Image="http://www.roblox.com/asset/?id=12266946128",
ImageTransparency=0.5,
ThemeTag={
ImageColor3="ToggleSlider",
},
}))

local u=h("UIStroke",{
Transparency=0.5,
ThemeTag={
Color="ToggleSlider",
},
})

local v=(h("Frame",{
Size=UDim2.fromOffset(36,18),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-10,0.5,0),
Parent=s.Frame,
BackgroundTransparency=1,
ThemeTag={
BackgroundColor3="Accent",
},
},{
h("UICorner",{
CornerRadius=UDim.new(0,9),
}),
u,
t,
}))

function r.OnChanged(w,x)
r.Changed=x
q:SafeCallback(x,r.Value,r.Value)
end

function r.SetValue(w,x)
x=not not x

rawset(r,"Value",x)

g.OverrideTag(u,{Color=r.Value and"Accent"or"ToggleSlider"})
g.OverrideTag(t,{ImageColor3=r.Value and"ToggleToggled"or"ToggleSlider"})

t:TweenPosition(
r.Value and k or l,
Enum.EasingDirection.Out,
Enum.EasingStyle.Quint,
0.25,
true
)

ab:Create(
v,
j,
{BackgroundTransparency=r.Value and 0 or 1}
):Play()

t.ImageTransparency=r.Value and 0 or 0.5

if typeof(r.Callback)=="function"then
q:SafeCallback(r.Callback,r.Value)
end
if typeof(r.Changed)=="function"then
q:SafeCallback(r.Changed,r.Value)
end
end

function r.Destroy(w)
s:Destroy()
q.Options[o]=nil
end

g.AddSignal(s.Frame.MouseButton1Click,function()
r:SetValue(not r.Value)
end)

r.Keybind=setmetatable({},{
__call=function(w,x,y,z)
local A={
Value=z.Default or z.Value or Enum.KeyCode.Unknown,
Toggled=false,
Mode=z.Mode or"Toggle",
Type="Keybind",
Callback=z.Callback or function(A)end,
ChangedCallback=z.ChangedCallback or function(A)end,
Instance=nil
}

local B=false

local C=h("TextLabel",{
FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal),
Text=q.Utilities:Prettify(A.Value),
TextColor3=Color3.fromRGB(240,240,240),
TextSize=13,
TextXAlignment=Enum.TextXAlignment.Center,
Size=UDim2.new(0,0,0,14),
Position=UDim2.new(0,0,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=Color3.fromRGB(255,255,255),
AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,
ThemeTag={
TextColor3="Text",
},
})


local D=h("TextButton",{
Size=UDim2.fromOffset(20,20),
Position=UDim2.new(1,-55,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
Text="X",
TextColor3=Color3.fromRGB(100,100,100),
TextSize=12,
FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Bold),
Parent=s.Frame,
ThemeTag={
TextColor3="SubText"
},
Visible=false
})

local E=(h("TextButton",{
Size=UDim2.fromOffset(0,30),
Position=UDim2.new(1,-55,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=0.9,
Parent=s.Frame,
AutomaticSize=Enum.AutomaticSize.X,
ThemeTag={
BackgroundColor3="Keybind",
},
},{
h("UICorner",{
CornerRadius=UDim.new(0,5),
}),
h("UIPadding",{
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
}),
h("UIStroke",{
Transparency=0.5,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
ThemeTag={
Color="InElementBorder",
},
}),
C
}))

local function UpdateClearButton()
local F=A.Value
if F==Enum.KeyCode.Unknown or F=="None"or F==nil then
D.Visible=false
E.Position=UDim2.new(1,-55,0.5,0)
else
D.Visible=true
E.Position=UDim2.new(1,-75,0.5,0)
end
end


D.MouseButton1Click:Connect(function()
A:SetValue"None"
end)

A.Instance=setmetatable({
CreatedAt=tick()
},{
__index=function(F,G)
if rawget(F,G)then
return rawget(F,G)
else
return E[G]
end
end
})

function A.GetState(F)
if ac:GetFocusedTextBox()and F.Mode~="Always"then
return false
end

if F.Mode=="Always"then
return true
elseif F.Mode=="Hold"then
if F.Value=="None"then
return false
end

local G=F.Value

if G=="LeftMousebutton"or G=="RightMousebutton"then
return G=="LeftMousebutton"and ac:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
or G=="RightMousebutton"
and ac:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
else
return ac:IsKeyDown(Enum.KeyCode[F.Value])
end
else
return F.Toggled
end
end

function A.SetValue(F,G,H)
G=G or F.Value
H=H or F.Mode

F.Value=G
F.Mode=H

C.Text=q.Utilities:Prettify(F.Value)
UpdateClearButton()

if typeof(F.ChangedCallback)=="function"then
q:SafeCallback(F.ChangedCallback,G)
end
if typeof(F.Changed)=="function"then
q:SafeCallback(F.Changed,G)
end
end

function A.OnClick(F,G)
F.Clicked=G
end

function A.OnChanged(F,G)
F.Changed=G
q:SafeCallback(G,F.Value,F.Value)
end

function A.DoClick(F)
r:SetValue(not r.Value)

if typeof(F.Callback)=="function"then
q:SafeCallback(F.Callback,F.Value)
end
if typeof(F.Clicked)=="function"then
q:SafeCallback(F.Clicked,F.Value)
end
end

function A.Destroy(F)
E:Destroy()
D:Destroy()
q.Options[y]=nil
end

g.AddSignal(E.InputBegan,function(F)

if F.UserInputType==Enum.UserInputType.MouseButton2 then
A:SetValue"None"
return
end

if
F.UserInputType==Enum.UserInputType.MouseButton1
or F.UserInputType==Enum.UserInputType.Touch
then
B=true
C.Text="..."

wait(0.2)

ac.InputBegan:Once(function(G)
local H

if G.UserInputType==Enum.UserInputType.Keyboard then
H=G.KeyCode.Name
elseif G.UserInputType==Enum.UserInputType.MouseButton1 then
H="LeftMousebutton"
elseif G.UserInputType==Enum.UserInputType.MouseButton2 then
H="RightMousebutton"
end

ac.InputEnded:Once(function(I)
if(I.KeyCode.Name==H
or H=="LeftMousebutton"and I.UserInputType==Enum.UserInputType.MouseButton1
or H=="RightMousebutton"and I.UserInputType==Enum.UserInputType.MouseButton2)
and not q.Unloaded
then
B=false

A:SetValue(H)

if x.ChangedCallback then
q:SafeCallback(x.ChangedCallback,I.KeyCode or I.UserInputType)
end
if x.Changed then
q:SafeCallback(x.Changed,I.KeyCode or I.UserInputType)
end
end
end)
end)
end
end)

g.AddSignal(ac.InputBegan,function(F)
if not B and not ac:GetFocusedTextBox()then
if A.Mode=="Toggle"then
local G=A.Value

if G=="LeftMousebutton"or G=="RightMousebutton"then
if
G=="LeftMousebutton"and F.UserInputType==Enum.UserInputType.MouseButton1
or G=="RightMousebutton"and F.UserInputType==Enum.UserInputType.MouseButton2
then
A.Toggled=not A.Toggled
A:DoClick()
end
elseif F.UserInputType==Enum.UserInputType.Keyboard then
if F.KeyCode.Name==G or F.KeyCode==G then
A.Toggled=not A.Toggled
A:DoClick()
end
end
end
end
end)






UpdateClearButton()

q.Options[y]=A

r.Keybind=A

return setmetatable(r.Keybind,{
__newindex=function(F,G,H)
if G=="Value"then
task.spawn(A.SetValue,A,H)
end
rawset(F,G,H)
end
})
end
})

r:SetValue(r.Value)

q.Options[o]=r

r.Instance=s



return setmetatable(r,{
__newindex=function(w,x,y)
if x=="Value"then
task.spawn(r.SetValue,r,y)
end
rawset(w,x,y)
end
})
end

return m

end)()
end
b.Root=function()
local aa=createProxy"Root/Root"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()

local function Clone(ab)
local ac=typeof(ab)

if ac=="function"and(clonefunc or clonefunction)then
return(clonefunc or clonefunction)(ab),true
elseif ac=="Instance"and(cloneref or clonereference)then
return(cloneref or clonereference)(ab),true
elseif ac=="table"then
local function deepcopy(ad,g)
local h=g or{}
local i,j=(typeof(ad))

if i=='table'then
if h[ad]then
j=h[ad]
else
j={}

h[ad]=j

for k,l in next,ad,nil do
j[deepcopy(k,h)]=deepcopy(l,h)
end

(setrawmetatable or setmetatable)(j,deepcopy((getrawmetatable or getmetatable)(ad),h))
end
elseif i=='Instance'or i=='function'then
j=Clone(ad)
else
j=ad
end

return j
end

return deepcopy(ab),true
else
return ab,false
end
end


local ab={}
local function GetService(ac)
if not ab[ac]then
ab[ac]=Clone(game:GetService(ac))
end
return ab[ac]
end

local ac=GetService"MarketplaceService"
local ad=GetService"TweenService"
local g=GetService"Workspace".CurrentCamera
local h=GetService"UserInputService"
local i=GetService"GuiService"

local j=aa
local k=j.Components

local l=require(j.Modules.Creator)
local m=require(j.Elements)
local n=require(j.Modules.Acrylic)
local o=require(j.Modules.Icons)
local p=require(j.Themes)
local q=require(j.Packages.Signal)

local r=shared or _G or(getgenv and getgenv())or getfenv(1)

local s={
Version="1.0.5",

OpenFrames={},
Options={},
Themes={},

OnUnload=q.new(),
PostUnload=q.new(),
ThemeChanged=q.new(),
CreatedWindow=nil,
WindowFrame=nil,
UIContainer=nil,
Utilities={},
Connections={},
Unloaded=false,
Loaded=true,

Theme="Dark",
DialogOpen=false,
UseAcrylic=false,
Acrylic=false,
Transparency=true,
MinimizeKey=Enum.KeyCode.LeftControl,

GUI=nil
}

s.Utilities={
Themes=nil,
Shared=r,
Creator=nil,
Icons=nil,

Resize=function(t,u,v)
local w,x,y=u/1920,v/1080,g.ViewportSize
return y.X*w,y.Y*x
end,

Truncate=function(t,u,v,w)
local x=10^(typeof(v)=="number"and math.max(v,0)or 0)
if w then
return math.floor((u*x)+0.5)/x
else
return math.floor(u*x)/x
end
end,

Round=function(t,u,v)
return t:Truncate(u,v,true)
end,

GetIcon=function(t,u)
local v=s.Utilities.Icons
return u~="SetIcon"and v and v[u]or nil
end,

Prettify=function(t,u)
local v=tostring(u)
if v=="Enum.KeyCode.Unknown"or v=="Unknown"or v=="None"then
return"None"
end
return v:gsub("Enum.KeyCode.","")
end,

Clone=function(t,u)
return Clone(u)
end,

GetOS=function(t)
local u="Unknown"
if i:IsTenFootInterface()then
local v=h:GetStringForKeyCode(Enum.KeyCode.ButtonL2)
if v=="ButtonLT"then
u="Xbox"
elseif v=="ButtonL2"then
u="PlayStation"
else
u="Console"
end
elseif i.IsWindows then
u="Windows"
elseif version():find"^0."==1 then
u="macOS"
elseif version():find"^2."==1 then
u=(h.VREnabled and"MetaHorizon")or"Mobile"
end
return u
end
}

local t=require(k.Notification)

local u=l.New

local v=u("ScreenGui",{
Name="Fluent Renewed Base GUI"
})

v.Parent=(function()
local w,x=pcall(function()
return(gethui or get_hidden_ui)()
end)

if w and x then
return x
end

w,x=pcall(function()
local y=game:GetService"CoreGui"

y:GetFullName()

return y
end)

if w and x then
return x
end

w,x=pcall(function()
return(game:IsLoaded()or game.Loaded:Wait()or true)and game:GetService"Players".LocalPlayer:WaitForChild("PlayerGui",10)
end)

if w and x then
return x
end

w,x=pcall(function()
local y=game:GetService"StarterGui"

y:GetFullName()

return y
end)

if w and x then
return x
end

return error("Seriously bad engine. Can't find a place to store the GUI. Robust code can't help this much incompetence.",0)
end)()

r.FluentRenewed=r.FluentRenewed or{}

s.Utilities.Themes=p
s.Utilities.Creator=l
s.Utilities.Icons=o
s.Themes=p.Names
s.Connections=l.Signals
s.GUI=v
s.UIContainer=v.Parent

t:Init(v)


task.spawn(function()
p:PreloadAll()
end)

function s.SafeCallback(w,x,...)
assert(typeof(x)=="function",debug.traceback(string.format([[Library:SafeCallback expects type 'function' at Argument #1, got '%s']], tostring(typeof(x))),2))

task.spawn(function(...)
local y,z=pcall(x,...)

if not y then
local A,B=z:find":%d+: "

task.defer(error,debug.traceback(z,2))

s:Notify{
Title="Interface",
Content="Callback error",
SubContent=(typeof(B)=="number"and{(z:sub(B+1))}or{z})[1],
Duration=5,
}
end
end,...)
end



local w={}
w.__index=w
w.__namecall=function(x,y,...)
return w[y](...)
end


for x=1,#m do
local y=m[x]
local z=function(z,A,B)
y.Container=z.Container
y.Type=z.Type
y.ScrollFrame=z.ScrollFrame
y.Library=s

return y:New(A,B)
end


if y.__type then

else
warn"Fluent: Element missing __type"
end

w["Create"..y.__type]=z
w["Add"..y.__type]=z
w[y.__type]=z
end

s.Elements=w

function s.Window(x,y













)
assert(s.CreatedWindow==nil,debug.traceback("You cannot create more than one window.",2))

if not y.Title then
local z,A=pcall(ac.GetProductInfo,ac,game.PlaceId)

y.Title=z and A.Name or"Fluent Renewed"
end

y.MinSize=(typeof(y.MinSize)=="Vector2"and{(y.MinSize)}or{(Vector2.new(470,380))})[1]

if y.Resize==true then
y.Size=UDim2.fromOffset(s.Utilities:Resize((y.Size and y.Size.X.Offset)or 470,(y.Size and y.Size.Y.Offset)or 380))
end
if y.Resize==true then
y.MinSize=Vector2.new(s.Utilities:Resize((y.MinSize and y.MinSize.X)or 470,(y.MinSize and y.MinSize.Y)or 380))
end

if typeof(y.MinimizeKey)=="string"or typeof(y.MinimizeKey)=="EnumItem"and y.MinimizeKey.EnumType==Enum.KeyCode then
s.MinimizeKey=y.MinimizeKey
else
s.MinimizeKey=Enum.KeyCode.LeftControl
end

s.UseAcrylic=(typeof(y.Acrylic)=="boolean"and y.Acrylic)or false
s.Acrylic=(typeof(y.Acrylic)=="boolean"and y.Acrylic)or false
s.Theme=(typeof(y.Theme)=="string"and{(y.Theme)}or{"Vynixu"})[1]

if y.Acrylic then
n.init()
end

local z=require(k.Window){
Config=y,
Parent=v,

Size=y.Size,
MinSize=y.MinSize,

Title=y.Title,
SubTitle=y.SubTitle or"Made with Fluent Renewed",

TabWidth=y.TabWidth or 160,
Mobile=y.Mobile or{
GetIcon=function(z)
return s.Utilities:GetIcon(z and"phosphor-eye"or"phosphor-eye-slash")
end,
Size=UDim2.fromOffset(30,30)
}
}

v.Name=string.format('FluentRenewed_%s', tostring(y.Title))

s.CreatedWindow=z
s:SetTheme(s.Theme)

return z
end

function s.AddWindow(x,y)
return s:Window(y)
end

function s.CreateWindow(x,y)
return s:Window(y)
end

function s.SetTheme(x,y)
if s.CreatedWindow and table.find(s.Themes,y)then
s.Theme=y
task.spawn(function()
l.UpdateTheme()
end)
s.ThemeChanged:Fire(y)
end
end

function s.Destroy(x)
if s.CreatedWindow then
s.Unloaded=true
s.Loaded=false

s.OnUnload:Fire(tick())

if s.UseAcrylic then
s.CreatedWindow.AcrylicPaint.Model:Destroy()
end

l.Disconnect()

for y,z in next,s.Connections do
local A=typeof(z)

if A=="RBXScriptConnection"and z.Connected then
z:Disconnect()
end
end

local y,z,A=TweenInfo.new(0.6666666666666666,Enum.EasingStyle.Quint),{},false

local function IsA(B,C)
local D=B:IsA(C)

if D then
A=true
end

return D
end

for B,C in next,s.GUI:GetDescendants()do
table.clear(z)

if IsA(C,"GuiObject")then
z.BackgroundTransparency=1
end

if IsA(C,"ScrollingFrame")then
z.ScrollBarImageTransparency=1
end

if IsA(C,"TextLabel")or IsA(C,"TextBox")then
z.TextStrokeTransparency=1
z.TextTransparency=1
end

if IsA(C,"UIStroke")then
z.Transparency=1
end

if IsA(C,"ImageLabel")or IsA(C,"ImageButton")then
z.ImageTransparency=1
end

if A then
A=false
ad:Create(C,y,z):Play()
end
end

task.delay(y.Time,function()
s.GUI:Destroy()

s.PostUnload:Fire(tick())
end)
end
end

function s.ToggleAcrylic(x,y)
if s.CreatedWindow then
if s.UseAcrylic then
s.Acrylic=y
s.CreatedWindow.AcrylicPaint.Model.Transparency=y and 0.98 or 1
if y then
n.Enable()
else
n.Disable()
end
end
end
end

function s.ToggleTransparency(x,y)
if s.CreatedWindow then
s.CreatedWindow.AcrylicPaint.Frame.Background.BackgroundTransparency=y and 0.35 or 0
end
end

function s.Notify(x,y)
return t:New(y)
end

return s

end)()
end
b["Modules/Acrylic/AcrylicBlur"]=function()
local aa=createProxy"Root/Modules/Acrylic/AcrylicBlur"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab=aa.Parent.Parent.Parent
local ac=require(ab.Modules.Creator)
local ad=require(aa.Parent.CreateAcrylic)
local g,h=unpack(require(aa.Parent.Utils))

local i=Instance.new("Folder",game:GetService"Workspace".CurrentCamera)

local function createAcrylicBlur(j)
local k={}

j=j or 0.001
local l={
topLeft=Vector2.new(),
topRight=Vector2.new(),
bottomRight=Vector2.new(),
}
local m=ad()
local n=m:FindFirstChildWhichIsA"SpecialMesh"

m.Parent=i

local function updatePositions(o,p)
l.topLeft=p
l.topRight=p+Vector2.new(o.X,0)
l.bottomRight=p+o
end

local function render()
local o=game:GetService"Workspace".CurrentCamera
local p=(o and{(o.CFrame)}or{(CFrame.identity)})[1]

local q=l.topLeft
local r=l.topRight
local s=l.bottomRight

local t=g(q,j)
local u=g(r,j)
local v=g(s,j)

local w=(u-t).Magnitude
local x=(u-v).Magnitude

m.CFrame=
CFrame.fromMatrix((t+v)/2,p.XVector,p.YVector,p.ZVector)

if n then
n.Scale=Vector3.new(w,x,0)
end
end

local function onChange(o)
local p=h()
local q=o.AbsoluteSize-Vector2.new(p,p)
local r=o.AbsolutePosition+Vector2.new(p/2,p/2)

updatePositions(q,r)
task.spawn(render)
end

local function renderOnChange()
local o=game:GetService"Workspace".CurrentCamera
if not o then
return
end

k[#k+1]=o:GetPropertyChangedSignal"CFrame":Connect(render)
k[#k+1]=o:GetPropertyChangedSignal"ViewportSize":Connect(render)
k[#k+1]=o:GetPropertyChangedSignal"FieldOfView":Connect(render)
task.spawn(render)
end

m.Destroying:Connect(function()
for o,p in k do
pcall(function()
p:Disconnect()
end)
end
end)

renderOnChange()

return onChange,m
end

return function(j)
local k={}
local l,m=createAcrylicBlur(j)

local n=ac.New("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
})

ac.AddSignal(n:GetPropertyChangedSignal"AbsolutePosition",function()
l(n)
end)

ac.AddSignal(n:GetPropertyChangedSignal"AbsoluteSize",function()
l(n)
end)

k.AddParent=function(o)
ac.AddSignal(o:GetPropertyChangedSignal"Visible",function()
k.SetVisibility(o.Visible)
end)
end

k.SetVisibility=function(o)
m.Transparency=o and 0.98 or 1
end

k.Frame=n
k.Model=m

return k
end

end)()
end
b["Modules/Acrylic/AcrylicPaint"]=function()
local aa=createProxy"Root/Modules/Acrylic/AcrylicPaint"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab=aa.Parent.Parent.Parent
local ac=require(ab.Modules.Creator)
local ad=require(aa.Parent.AcrylicBlur)

local g=ac.New

return function(h)
local i={}

i.Frame=g("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0.9,
BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,
},{
g("ImageLabel",{
Image="rbxassetid://8992230677",
ScaleType="Slice",
SliceCenter=Rect.new(Vector2.new(99,99),Vector2.new(99,99)),
AnchorPoint=Vector2.new(0.5,0.5),
Size=UDim2.new(1,120,1,116),
Position=UDim2.new(0.5,0,0.5,0),
BackgroundTransparency=1,
ImageColor3=Color3.fromRGB(0,0,0),
ImageTransparency=0.7,
}),

g("UICorner",{
CornerRadius=UDim.new(0,8),
}),

g("Frame",{
BackgroundTransparency=0.45,
Size=UDim2.fromScale(1,1),
Name="Background",
ThemeTag={
BackgroundColor3="AcrylicMain",
},
},{
g("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

g("Frame",{
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=0.4,
Size=UDim2.fromScale(1,1),
},{
g("UICorner",{
CornerRadius=UDim.new(0,8),
}),

g("UIGradient",{
Rotation=90,
ThemeTag={
Color="AcrylicGradient",
},
}),
}),

g("ImageLabel",{
Image="rbxassetid://9968344105",
ImageTransparency=0.98,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
},{
g("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

g("ImageLabel",{
Image="rbxassetid://9968344227",
ImageTransparency=0.9,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
ThemeTag={
ImageTransparency="AcrylicNoise",
},
},{
g("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

g("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
ZIndex=2,
},{
g("UICorner",{
CornerRadius=UDim.new(0,8),
}),
g("UIStroke",{
Transparency=0.5,
Thickness=1,
ThemeTag={
Color="AcrylicBorder",
},
}),
}),
})

local j

if require(ab).UseAcrylic then
j=ad()
j.Frame.Parent=i.Frame
i.Model=j.Model
i.AddParent=j.AddParent
i.SetVisibility=j.SetVisibility
end

return i
end

end)()
end
b["Modules/Acrylic/CreateAcrylic"]=function()
local aa=createProxy"Root/Modules/Acrylic/CreateAcrylic"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab=aa.Parent.Parent.Parent
local ac=require(ab.Modules.Creator)

local function createAcrylic()
local ad=ac.New("Part",{
Name="Body",
Color=Color3.new(0,0,0),
Material=Enum.Material.Glass,
Size=Vector3.new(1,1,0),
Anchored=true,
CanCollide=false,
Locked=true,
CastShadow=false,
Transparency=0.98,
},{
ac.New("SpecialMesh",{
MeshType=Enum.MeshType.Brick,
Offset=Vector3.new(0,0,-1E-6),
})
})

return ad
end

return createAcrylic

end)()
end
b["Modules/Acrylic"]=function()
local aa=createProxy"Root/Modules/Acrylic"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab={
AcrylicBlur=require(aa.AcrylicBlur),
CreateAcrylic=require(aa.CreateAcrylic),
AcrylicPaint=require(aa.AcrylicPaint),
}

function ab.init()
local ac=Instance.new"DepthOfFieldEffect"
ac.FarIntensity=0
ac.InFocusRadius=0.1
ac.NearIntensity=1

local ad={}

function ab.Enable()
for g,h in next,ad do
h.Enabled=false
end
ac.Parent=game:GetService"Lighting"
end

function ab.Disable()
for g,h in next,ad do
h.Enabled=h.enabled
end
ac.Parent=nil
end

local function registerDefaults()
local function register(g)
if g:IsA"DepthOfFieldEffect"then
ad[g]={enabled=g.Enabled}
end
end

for g,h in next,game:GetService"Lighting":GetChildren()do
register(h)
end

if game:GetService"Workspace".CurrentCamera then
for g,h in next,game:GetService"Workspace".CurrentCamera:GetChildren()do
register(h)
end
end
end

registerDefaults()
ab.Enable()
end

return ab

end)()
end
b["Modules/Acrylic/Utils"]=function()
local aa=createProxy"Root/Modules/Acrylic/Utils"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local function map(ab,ac,ad,g,h)
return(ab-ac)*(h-g)/(ad-ac)+g
end

local function viewportPointToWorld(ab,ac)
local ad=game:GetService"Workspace".CurrentCamera:ScreenPointToRay(ab.X,ab.Y)
return ad.Origin+ad.Direction*ac
end

local function getOffset()
local ab=game:GetService"Workspace".CurrentCamera.ViewportSize.Y
return map(ab,0,2560,8,56)
end

return{viewportPointToWorld,getOffset}

end)()
end
b["Modules/Creator"]=function()
local aa=createProxy"Root/Modules/Creator"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()

local ab=aa.Parent.Parent
local ac=require(ab.Themes)
local ad,g=require(ab.Packages.Flipper),require(ab.Packages.Ripple)
local h=require(ab.Packages.Signal)


local i
local function GetLibrary()
if not i then
i=require(ab)
end
return i
end

local j={
Registry={},
Signals={},
TransparencyMotors={},
DefaultProperties={
ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
},
Frame={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
BorderSizePixel=0,
},
ScrollingFrame={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
ScrollBarImageColor3=Color3.new(0,0,0),
},
TextLabel={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
Font=Enum.Font.SourceSans,
Text="",
TextColor3=Color3.new(0,0,0),
BackgroundTransparency=1,
TextSize=14,
RichText=true,
},
TextButton={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
AutoButtonColor=false,
Font=Enum.Font.SourceSans,
Text="",
TextColor3=Color3.new(0,0,0),
TextSize=14,
RichText=true,
},
TextBox={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
ClearTextOnFocus=false,
Font=Enum.Font.SourceSans,
Text="",
TextColor3=Color3.new(0,0,0),
TextSize=14,
RichText=true,
},
ImageLabel={
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
BorderSizePixel=0,
},
ImageButton={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
AutoButtonColor=false,
},
CanvasGroup={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
BorderSizePixel=0,
}
},
Theme={
Updating=false,
Updated=h.new()
}
}

local function ApplyCustomProps(k,l)
if typeof(l)=="table"and l.ThemeTag then
j.AddThemeObject(k,l.ThemeTag)
end
end

function j.AddSignal(k,l)
j.Signals[#j.Signals+1]=k:Connect(l)
end

function j.Disconnect()
for k=#j.Signals,1,-1 do
local l=table.remove(j.Signals,k)

if l then
l:Disconnect()
end
end
end

function j.GetThemeProperty(k)
local l=GetLibrary().Theme
local m=ac[l]
if m and m[k]then
return m[k]
end
return ac.Dark[k]
end

function j.UpdateTheme(k)

if typeof(k)=="Instance"and j.Registry[k]then
for l,m in pairs(j.Registry[k].Properties)do
k[l]=j.GetThemeProperty(m)
end
else
for l,m in pairs(j.Registry)do
for n,o in pairs(m.Properties)do
m.Object[n]=j.GetThemeProperty(o)
end
end
end


for l,m in pairs(j.TransparencyMotors)do
m:setGoal(ad.Instant.new(j.GetThemeProperty"ElementTransparency"))
end
end

function j.AddThemeObject(k,l)
local m=#j.Registry+1
local n={
Object=k,
Properties=l,
Idx=m,
}

j.Registry[k]=n
task.spawn(function()
j.UpdateTheme(k)
end)

return k
end

function j.OverrideTag(k,l)
j.Registry[k].Properties=l
task.spawn(function()
j.UpdateTheme(k)
end)
end

function j.New(k,l,m)
local n=Instance.new(k)


for o,p in next,j.DefaultProperties[k]or{}do
n[o]=p
end


for o,p in next,l or{}do
if o~="ThemeTag"then
n[o]=p
end
end


for o,p in next,m or{}do
p.Parent=n
end

ApplyCustomProps(n,l)

return n
end

function j.SpringMotor(k,l,m,n,o)
n=n or false
o=o or false
local p=ad.SingleMotor.new(k)
p:onStep(function(q)
l[m]=q
end)

if o then
j.TransparencyMotors[#j.TransparencyMotors+1]=p
end

local function SetValue(q,r)
r=r or false
if not n then
if not r then
if m=="BackgroundTransparency"and require(ab).DialogOpen then
return
end
end
end
p:setGoal(ad.Spring.new(q,{frequency=8}))
end

return p,SetValue
end

return j

end)()
end
b["Modules/Icons"]=function()
local aa=createProxy"Root/Modules/Icons"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab='rbxassetid://124334518624683'
local ac='rbxassetid://113826256227095'
local ad='rbxassetid://129900432084566'
local g='rbxassetid://118976126805967'
local h='rbxassetid://125298981894618'
local i='rbxassetid://131738208650267'
local j='rbxassetid://110728422432625'
local k='rbxassetid://135200213477510'
local l='rbxassetid://134392099945785'
local m='rbxassetid://79415505456349'
local n='rbxassetid://94499019266816'
local o='rbxassetid://72284904787415'
local p='rbxassetid://72284904787415'
local q='rbxassetid://102465529977025'
local r='rbxassetid://108796161822566'
local s='rbxassetid://104034552823126'
local t='rbxassetid://115396960406352'
local u='rbxassetid://88000092080903'
local v='rbxassetid://74902412828188'
local w='rbxassetid://95092644481468'
local x='rbxassetid://116618277156257'
local y='rbxassetid://101225869294852'
local z='rbxassetid://130974669650190'
local A='rbxassetid://122510634246659'
local B='rbxassetid://130565723724393'
local C='rbxassetid://130172565496219'
local D='rbxassetid://100537559853437'
local E='rbxassetid://77444842975129'
local F='rbxassetid://133795234078681'
local G='rbxassetid://88182585007332'
local H='rbxassetid://123183581552431'
local I='rbxassetid://108153633480449'
local J='rbxassetid://116280890977475'
local K='rbxassetid://97148406853110'
local L='rbxassetid://138968597001035'
local M='rbxassetid://129030569615452'
local N='rbxassetid://97278475063854'
local O='rbxassetid://138343757151795'
local P='rbxassetid://131684019420923'
local Q='rbxassetid://139123669104105'
local R='rbxassetid://83798598825627'
local S='rbxassetid://93555120675964'


local T=setmetatable({},{
__index=function(T,U)
local V,W=U:match"^(%d+)_(%d+)$"
if V and W then
local X=Vector2.new(tonumber(V),tonumber(W))
rawset(T,U,X)
return X
end
return nil
end
})



local U={}
U.SetIcon=function(V,W,X)
local Y=V[X]

if typeof(Y)~='table'then
local Z
local _=math.huge

for ae,af in next,V do
local ag,ah=ae,X
local ai,aj=#ag,#ah
local ak={}

for al=0,ai do
ak[al]={}
ak[al][0]=al
end

for al=0,aj do
ak[0][al]=al
end

for al=1,ai do
for am=1,aj do
local an=(ag:sub(al,al)==ah:sub(am,am))and 0 or 1
ak[al][am]=math.min(ak[al-1][am]+1,ak[al][am-1]+1,ak[al-1][am-1]+an)
end
end

local al=ak[ai][aj]

if al<_ then
_=al
Z=ae
end
end

if Z then
Y=V[Z]
if typeof(Y)~='table'then
return error(debug.traceback(string.format("Argument #2 '%s' is not a valid Icon. Did you mean '%s'?", tostring(X), tostring(Z))))
end
else
return error(debug.traceback(string.format([[Argument #2 '%s' is not a valid Icon. No similar names found.]], tostring(X))))
end
end

W.ImageRectSize=Y.ImageRectSize
W.ImageRectOffset=Y.ImageRectOffset
W.Image=Y.Image

return nil
end
U.Close="rbxassetid://9886659671"
U.Min="rbxassetid://9886659276"
U.Max="rbxassetid://9886659406"
U.Restore="rbxassetid://9886659001"
U['circle-user']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=ac
}
U.copy={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=ac
}
U['eye-closed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=ad
}
U['eye-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=ad
}
U.eye={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=ad
}
U['phosphor-eye-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=t
}
U['phosphor-footprints-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=w
}
U['phosphor-gear-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=w
}
U['phosphor-house-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=z
}
U['phosphor-user-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=O
}
U['phosphor-wrench-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=Q
}
U.search={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=R
}
U.settings={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=R
}
U.user={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=S
}
U.run={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=F
}

if U['phosphor-house-bold']then U.home=U['phosphor-house-bold']end
if U['phosphor-footprints-bold']then U.footprints=U['phosphor-footprints-bold']end
if U['phosphor-eye-bold']then U.eye=U['phosphor-eye-bold']end
if U['phosphor-user-bold']then U.user=U['phosphor-user-bold']end
if U['phosphor-wrench-bold']then U.wrench=U['phosphor-wrench-bold']end
if U['phosphor-gear-bold']then U.settings=U['phosphor-gear-bold']end


if U.eye then U['phosphor-eye']=U.eye end
if U['eye-off']then U['phosphor-eye-slash']=U['eye-off']end
return U
end)()
end
b["Packages/Flipper/BaseMotor"]=function()
local aa=createProxy"Root/Packages/Flipper/BaseMotor"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab=game:GetService"RunService"

local ac=require(aa.Parent.Signal)

local ad=function()end

local ae={}
ae.__index=ae

function ae.new()
return setmetatable({
_onStep=ac.new(),
_onStart=ac.new(),
_onComplete=ac.new(),
},ae)
end

function ae.onStep(af,ag)
return af._onStep:connect(ag)
end

function ae.onStart(af,ag)
return af._onStart:connect(ag)
end

function ae.onComplete(af,ag)
return af._onComplete:connect(ag)
end

function ae.start(af)
if not af._connection then
af._connection=ab.RenderStepped:Connect(function(ag)
af:step(ag)
end)
end
end

function ae.stop(af)
if af._connection then
af._connection:Disconnect()
af._connection=nil
end
end

ae.destroy=ae.stop

ae.step=ad
ae.getValue=ad
ae.setGoal=ad

function ae.__tostring(af)
return"Motor"
end

return ae

end)()
end
b["Packages/Flipper/GroupMotor"]=function()
local aa=createProxy"Root/Packages/Flipper/GroupMotor"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab=require(aa.Parent.BaseMotor)
local ac=require(aa.Parent.SingleMotor)

local ad=require(aa.Parent.isMotor)

local ae=setmetatable({},ab)
ae.__index=ae

local function toMotor(af)
if ad(af)then
return af
end

local ag=typeof(af)

if ag=="number"then
return ac.new(af,false)
elseif ag=="table"then
return ae.new(af,false)
end

error(("Unable to convert %q to motor; type %s is unsupported"):format(af,ag),2)
end

function ae.new(af,ag)
assert(af,"Missing argument #1: initialValues")
assert(typeof(af)=="table","initialValues must be a table!")
assert(
not af.step,
'initialValues contains disallowed property "step". Did you mean to put a table of values here?'
)

local ah=setmetatable(ab.new(),ae)

if ag~=nil then
ah._useImplicitConnections=ag
else
ah._useImplicitConnections=true
end

ah._complete=true
ah._motors={}

for ai,aj in pairs(af)do
ah._motors[ai]=toMotor(aj)
end

return ah
end

function ae.step(af,ag)
if af._complete then
return true
end

local ah=true

for ai,aj in pairs(af._motors)do
local ak=aj:step(ag)
if not ak then

ah=false
end
end

af._onStep:fire(af:getValue())

if ah then
if af._useImplicitConnections then
af:stop()
end

af._complete=true
af._onComplete:fire()
end

return ah
end

function ae.setGoal(af,ag)
assert(not ag.step,'goals contains disallowed property "step". Did you mean to put a table of goals here?')

af._complete=false
af._onStart:fire()

for ah,ai in pairs(ag)do
local aj=assert(af._motors[ah],("Unknown motor for key %s"):format(ah))
aj:setGoal(ai)
end

if af._useImplicitConnections then
af:start()
end
end

function ae.getValue(af)
local ag={}

for ah,ai in pairs(af._motors)do
ag[ah]=ai:getValue()
end

return ag
end

function ae.__tostring(af)
return"Motor(Group)"
end

return ae

end)()
end
b["Packages/Flipper"]=function()
local aa=createProxy"Root/Packages/Flipper"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab={
SingleMotor=require(aa.SingleMotor),
GroupMotor=require(aa.GroupMotor),

Instant=require(aa.Instant),
Linear=require(aa.Linear),
Spring=require(aa.Spring),

isMotor=require(aa.isMotor),
}

return ab

end)()
end
b["Packages/Flipper/Instant"]=function()
local aa=createProxy"Root/Packages/Flipper/Instant"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab={}
ab.__index=ab

function ab.new(ac)
return setmetatable({
_targetValue=ac,
},ab)
end

function ab.step(ac)
return{
complete=true,
value=ac._targetValue,
}
end

return ab

end)()
end
b["Packages/Flipper/isMotor"]=function()
local aa=createProxy"Root/Packages/Flipper/isMotor"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local function isMotor(ab)
local ac=tostring(ab):match"^Motor%((.+)%)$"

if ac then
return true,ac
else
return false
end
end

return isMotor

end)()
end
b["Packages/Flipper/Linear"]=function()
local aa=createProxy"Root/Packages/Flipper/Linear"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab={}
ab.__index=ab

function ab.new(ac,ad)
assert(ac,"Missing argument #1: targetValue")

ad=ad or{}

return setmetatable({
_targetValue=ac,
_velocity=ad.velocity or 1,
},ab)
end

function ab.step(ac,ad,ae)
local af=ad.value
local ag=ac._velocity
local ah=ac._targetValue

local ai=ae*ag

local aj=ai>=math.abs(ah-af)
af=af+ai*(ah>af and 1 or-1)
if aj then
af=ac._targetValue
ag=0
end

return{
complete=aj,
value=af,
velocity=ag,
}
end

return ab

end)()
end
b["Packages/Flipper/Signal"]=function()
local aa=createProxy"Root/Packages/Flipper/Signal"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab={}
ab.__index=ab

function ab.new(ac,ad)
return setmetatable({
signal=ac,
connected=true,
_handler=ad,
},ab)
end

function ab.disconnect(ac)
if ac.connected then
ac.connected=false

for ad,ae in pairs(ac.signal._connections)do
if ae==ac then
table.remove(ac.signal._connections,ad)
return
end
end
end
end

local ac={}
ac.__index=ac

function ac.new()
return setmetatable({
_connections={},
_threads={},
},ac)
end

function ac.fire(ad,...)
for ae,af in pairs(ad._connections)do
af._handler(...)
end

for ae,af in pairs(ad._threads)do
coroutine.resume(af,...)
end

ad._threads={}
end

function ac.connect(ad,ae)
local af=ab.new(ad,ae)
table.insert(ad._connections,af)
return af
end

function ac.wait(ad)
table.insert(ad._threads,coroutine.running())
return coroutine.yield()
end

return ac

end)()
end
b["Packages/Flipper/SingleMotor"]=function()
local aa=createProxy"Root/Packages/Flipper/SingleMotor"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab=require(aa.Parent.BaseMotor)

local ac=setmetatable({},ab)
ac.__index=ac

function ac.new(ad,ae)
assert(ad,"Missing argument #1: initialValue")
assert(typeof(ad)=="number","initialValue must be a number!")

local af=setmetatable(ab.new(),ac)

if ae~=nil then
af._useImplicitConnections=ae
else
af._useImplicitConnections=true
end

af._goal=nil
af._state={
complete=true,
value=ad,
}

return af
end

function ac.step(ad,ae)
if ad._state.complete then
return true
end

local af=ad._goal:step(ad._state,ae)

ad._state=af
ad._onStep:fire(af.value)

if af.complete then
if ad._useImplicitConnections then
ad:stop()
end

ad._onComplete:fire()
end

return af.complete
end

function ac.getValue(ad)
return ad._state.value
end

function ac.setGoal(ad,ae)
ad._state.complete=false
ad._goal=ae

ad._onStart:fire()

if ad._useImplicitConnections then
ad:start()
end
end

function ac.__tostring(ad)
return"Motor(Single)"
end

return ac

end)()
end
b["Packages/Flipper/Spring"]=function()
local aa=createProxy"Root/Packages/Flipper/Spring"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab=0.001
local ac=0.001

local ad=0.0001

local ae={}
ae.__index=ae

function ae.new(af,ag)
assert(af,"Missing argument #1: targetValue")
ag=ag or{}

return setmetatable({
_targetValue=af,
_frequency=ag.frequency or 4,
_dampingRatio=ag.dampingRatio or 1,
},ae)
end

function ae.step(af,ag,ah)




local ai=af._dampingRatio
local aj=af._frequency*2*math.pi
local ak=af._targetValue
local al=ag.value
local am=ag.velocity or 0

local an=al-ak
local g=math.exp(-ai*aj*ah)

local h,i

if ai==1 then
h=(an*(1+aj*ah)+am*ah)*g+ak
i=(am*(1-aj*ah)-an*(aj*aj*ah))*g
elseif ai<1 then
local j=math.sqrt(1-ai*ai)

local k=math.cos(aj*j*ah)
local l=math.sin(aj*j*ah)













local m
if j>ad then
m=l/j
else
local n=ah*aj
m=n+((n*n)*(j*j)*(j*j)/20-j*j)*(n*n*n)/6
end








local n
if aj*j>ad then
n=l/(aj*j)
else
local o=aj*j
n=ah+((ah*ah)*(o*o)*(o*o)/20-o*o)*(ah*ah*ah)/6
end

h=(an*(k+ai*m)+am*n)*g+ak
i=(am*(k-m*ai)-an*(m*aj))*g
else
local j=math.sqrt(ai*ai-1)

local k=-aj*(ai-j)
local l=-aj*(ai+j)

local m=(am-an*k)/(2*aj*j)
local n=an-m

local o=n*math.exp(k*ah)
local p=m*math.exp(l*ah)

h=o+p+ak
i=o*k+p*l
end

local j=math.abs(i)<ab and math.abs(h-ak)<ac

return{
complete=j,
value=j and ak or h,
velocity=i,
}
end

return ae

end)()
end
b["Packages/Ripple"]=function()
local aa=createProxy"Root/Packages/Ripple"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()



local ab=require(aa.Parent.Flipper.Spring)

local ac={}
ac.__index=ac

function ac.new(ad,ae)
ae=ae or{}
return ab.new(ad,{
frequency=ae.frequency or 8,
dampingRatio=ae.dampingRatio or 1
})
end

setmetatable(ac,{
__call=function(ad,ae,af)
return ac.new(ae,af)
end
})

return ac

end)()
end
b["Packages/Signal"]=function()
local aa=createProxy"Root/Packages/Signal"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab={}
ab.__index=ab

function ab.new(ac,ad)
return setmetatable({
signal=ac,
connected=true,
_handler=ad,
},ab)
end

function ab.disconnect(ac)
if ac.connected then
ac.connected=false

for ad,ae in pairs(ac.signal._connections)do
if ae==ac then
table.remove(ac.signal._connections,ad)
return
end
end
end
end

function ab.Disconnect(ac)
ac:disconnect()
end

local ac={}
ac.__index=ac

function ac.new()
return setmetatable({
_connections={},
_threads={},
},ac)
end

function ac.fire(ad,...)
for ae,af in pairs(ad._connections)do
af._handler(...)
end

for ae,af in pairs(ad._threads)do
coroutine.resume(af,...)
end

ad._threads={}
end

function ac.Fire(ad,...)
ad:fire(...)
end

function ac.connect(ad,ae)
local af=ab.new(ad,ae)
table.insert(ad._connections,af)
return af
end

function ac.Connect(ad,ae)
return ad:connect(ae)
end

function ac.wait(ad)
table.insert(ad._threads,coroutine.running())
return coroutine.yield()
end

function ac.Wait(ad)
return ad:wait()
end

return ac

end)()
end
b["Themes/Amethyst"]=function()
local aa=createProxy"Root/Themes/Amethyst"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
return{
Accent=Color3.fromRGB(97,62,167),

AcrylicMain=Color3.fromRGB(20,20,20),
AcrylicBorder=Color3.fromRGB(110,90,130),
AcrylicGradient=ColorSequence.new(Color3.fromRGB(85,57,139),Color3.fromRGB(40,25,65)),
AcrylicNoise=0.92,

TitleBarLine=Color3.fromRGB(95,75,110),
Tab=Color3.fromRGB(160,140,180),

Element=Color3.fromRGB(140,120,160),
ElementBorder=Color3.fromRGB(60,50,70),
InElementBorder=Color3.fromRGB(100,90,110),
ElementTransparency=0.87,

ToggleSlider=Color3.fromRGB(140,120,160),
ToggleToggled=Color3.fromRGB(0,0,0),

SliderRail=Color3.fromRGB(140,120,160),

DropdownFrame=Color3.fromRGB(170,160,200),
DropdownHolder=Color3.fromRGB(60,45,80),
DropdownBorder=Color3.fromRGB(50,40,65),
DropdownOption=Color3.fromRGB(140,120,160),

Keybind=Color3.fromRGB(140,120,160),

Input=Color3.fromRGB(140,120,160),
InputFocused=Color3.fromRGB(20,10,30),
InputIndicator=Color3.fromRGB(170,150,190),

Dialog=Color3.fromRGB(60,45,80),
DialogHolder=Color3.fromRGB(45,30,65),
DialogHolderLine=Color3.fromRGB(40,25,60),
DialogButton=Color3.fromRGB(60,45,80),
DialogButtonBorder=Color3.fromRGB(95,80,110),
DialogBorder=Color3.fromRGB(85,70,100),
DialogInput=Color3.fromRGB(70,55,85),
DialogInputLine=Color3.fromRGB(175,160,190),

Text=Color3.fromRGB(240,240,240),
SubText=Color3.fromRGB(170,170,170),
Hover=Color3.fromRGB(140,120,160),
HoverChange=0.04
}

end)()
end
b["Themes/Aqua"]=function()
local aa=createProxy"Root/Themes/Aqua"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
return{
Accent=Color3.fromRGB(60,165,165),

AcrylicMain=Color3.fromRGB(20,20,20),
AcrylicBorder=Color3.fromRGB(50,100,100),
AcrylicGradient=ColorSequence.new(Color3.fromRGB(60,140,140),Color3.fromRGB(40,80,80)),
AcrylicNoise=0.92,

TitleBarLine=Color3.fromRGB(60,120,120),
Tab=Color3.fromRGB(140,180,180),

Element=Color3.fromRGB(110,160,160),
ElementBorder=Color3.fromRGB(40,70,70),
InElementBorder=Color3.fromRGB(80,110,110),
ElementTransparency=0.84,

ToggleSlider=Color3.fromRGB(110,160,160),
ToggleToggled=Color3.fromRGB(0,0,0),

SliderRail=Color3.fromRGB(110,160,160),

DropdownFrame=Color3.fromRGB(160,200,200),
DropdownHolder=Color3.fromRGB(40,80,80),
DropdownBorder=Color3.fromRGB(40,65,65),
DropdownOption=Color3.fromRGB(110,160,160),

Keybind=Color3.fromRGB(110,160,160),

Input=Color3.fromRGB(110,160,160),
InputFocused=Color3.fromRGB(20,10,30),
InputIndicator=Color3.fromRGB(130,170,170),

Dialog=Color3.fromRGB(40,80,80),
DialogHolder=Color3.fromRGB(30,60,60),
DialogHolderLine=Color3.fromRGB(25,50,50),
DialogButton=Color3.fromRGB(40,80,80),
DialogButtonBorder=Color3.fromRGB(80,110,110),
DialogBorder=Color3.fromRGB(50,100,100),
DialogInput=Color3.fromRGB(45,90,90),
DialogInputLine=Color3.fromRGB(130,170,170),

Text=Color3.fromRGB(240,240,240),
SubText=Color3.fromRGB(170,170,170),
Hover=Color3.fromRGB(110,160,160),
HoverChange=0.04
}

end)()
end
b["Themes/FSSvs"]=function()
local aa=createProxy"Root/Themes/FSSvs"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
local ab={
Accent=Color3.fromRGB(138,110,215),

AcrylicMain=Color3.fromRGB(25,20,35),
AcrylicBorder=Color3.fromRGB(140,120,210),
AcrylicGradient=ColorSequence.new(Color3.fromRGB(20,20,25),Color3.fromRGB(10,10,15)),
AcrylicNoise=1,

TitleBarLine=Color3.fromRGB(140,120,210),
Tab=Color3.fromRGB(180,180,200),

Element=Color3.fromRGB(15,12,25),
ElementBorder=Color3.fromRGB(40,30,60),
InElementBorder=Color3.fromRGB(138,110,215),
ElementTransparency=0.5,

ToggleSlider=Color3.fromRGB(138,110,215),
ToggleToggled=Color3.fromRGB(20,20,25),

SliderRail=Color3.fromRGB(40,30,60),

DropdownFrame=Color3.fromRGB(15,12,25),
DropdownHolder=Color3.fromRGB(15,12,25),
DropdownBorder=Color3.fromRGB(40,30,60),
DropdownOption=Color3.fromRGB(180,180,200),

Keybind=Color3.fromRGB(180,180,200),

Input=Color3.fromRGB(15,12,25),
InputFocused=Color3.fromRGB(20,20,25),
InputIndicator=Color3.fromRGB(170,150,240),

Dialog=Color3.fromRGB(25,20,35),
DialogHolder=Color3.fromRGB(15,12,25),
DialogHolderLine=Color3.fromRGB(140,120,210),
DialogButton=Color3.fromRGB(40,30,60),
DialogButtonBorder=Color3.fromRGB(140,120,210),
DialogBorder=Color3.fromRGB(140,120,210),
DialogInput=Color3.fromRGB(15,12,25),
DialogInputLine=Color3.fromRGB(138,110,215),

Text=Color3.fromRGB(255,255,255),
SubText=Color3.fromRGB(180,180,200),
Hover=Color3.fromRGB(170,150,240),
HoverChange=0.1
}

return ab

end)()
end
b["Themes/Dark"]=function()
local aa=createProxy"Root/Themes/Dark"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
return{
Accent=Color3.fromRGB(96,205,255),

AcrylicMain=Color3.fromRGB(60,60,60),
AcrylicBorder=Color3.fromRGB(90,90,90),
AcrylicGradient=ColorSequence.new(Color3.fromRGB(40,40,40),Color3.fromRGB(40,40,40)),
AcrylicNoise=0.9,

TitleBarLine=Color3.fromRGB(75,75,75),
Tab=Color3.fromRGB(120,120,120),

Element=Color3.fromRGB(120,120,120),
ElementBorder=Color3.fromRGB(35,35,35),
InElementBorder=Color3.fromRGB(90,90,90),
ElementTransparency=0.87,

ToggleSlider=Color3.fromRGB(120,120,120),
ToggleToggled=Color3.fromRGB(0,0,0),

SliderRail=Color3.fromRGB(120,120,120),

DropdownFrame=Color3.fromRGB(160,160,160),
DropdownHolder=Color3.fromRGB(45,45,45),
DropdownBorder=Color3.fromRGB(35,35,35),
DropdownOption=Color3.fromRGB(120,120,120),

Keybind=Color3.fromRGB(120,120,120),

Input=Color3.fromRGB(160,160,160),
InputFocused=Color3.fromRGB(10,10,10),
InputIndicator=Color3.fromRGB(150,150,150),

Dialog=Color3.fromRGB(45,45,45),
DialogHolder=Color3.fromRGB(35,35,35),
DialogHolderLine=Color3.fromRGB(30,30,30),
DialogButton=Color3.fromRGB(45,45,45),
DialogButtonBorder=Color3.fromRGB(80,80,80),
DialogBorder=Color3.fromRGB(70,70,70),
DialogInput=Color3.fromRGB(55,55,55),
DialogInputLine=Color3.fromRGB(160,160,160),

Text=Color3.fromRGB(240,240,240),
SubText=Color3.fromRGB(170,170,170),
Hover=Color3.fromRGB(120,120,120),
HoverChange=0.07
}

end)()
end
b.Themes=function()
local aa=createProxy"Root/Themes"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()




local ab={
"Vynixu",
"Dark",
"Light",
"Aqua",
"Amethyst",
"Rose",
"FSS",
}


local ac={}

local ad={
Names=ab,
}


function ad.Get(ae,af)
if not table.find(ab,af)then
return nil
end

if not ac[af]then
local ag=require(aa[af])
ag.Name=af
ac[af]=ag
end

return ac[af]
end


function ad.Preload(ae,af)
if table.find(ab,af)then
ae:Get(af)
end
end


function ad.PreloadAll(ae)
for af,ag in ipairs(ab)do
ae:Preload(ag)
end
end


setmetatable(ad,{
__index=function(ae,af)
if table.find(ab,af)then
return ae:Get(af)
end
return nil
end
})

return ad

end)()
end
b["Themes/Light"]=function()
local aa=createProxy"Root/Themes/Light"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
return{
Accent=Color3.fromRGB(0,103,192),

AcrylicMain=Color3.fromRGB(200,200,200),
AcrylicBorder=Color3.fromRGB(120,120,120),
AcrylicGradient=ColorSequence.new(Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,255)),
AcrylicNoise=0.96,

TitleBarLine=Color3.fromRGB(160,160,160),
Tab=Color3.fromRGB(90,90,90),

Element=Color3.fromRGB(255,255,255),
ElementBorder=Color3.fromRGB(180,180,180),
InElementBorder=Color3.fromRGB(150,150,150),
ElementTransparency=0.65,

ToggleSlider=Color3.fromRGB(40,40,40),
ToggleToggled=Color3.fromRGB(255,255,255),

SliderRail=Color3.fromRGB(40,40,40),

DropdownFrame=Color3.fromRGB(200,200,200),
DropdownHolder=Color3.fromRGB(240,240,240),
DropdownBorder=Color3.fromRGB(200,200,200),
DropdownOption=Color3.fromRGB(150,150,150),

Keybind=Color3.fromRGB(120,120,120),

Input=Color3.fromRGB(200,200,200),
InputFocused=Color3.fromRGB(100,100,100),
InputIndicator=Color3.fromRGB(80,80,80),

Dialog=Color3.fromRGB(255,255,255),
DialogHolder=Color3.fromRGB(240,240,240),
DialogHolderLine=Color3.fromRGB(228,228,228),
DialogButton=Color3.fromRGB(255,255,255),
DialogButtonBorder=Color3.fromRGB(190,190,190),
DialogBorder=Color3.fromRGB(140,140,140),
DialogInput=Color3.fromRGB(250,250,250),
DialogInputLine=Color3.fromRGB(160,160,160),

Text=Color3.fromRGB(41,41,41),
SubText=Color3.fromRGB(40,40,40),
Hover=Color3.fromRGB(50,50,50),
HoverChange=0.16
}

end)()
end
b["Themes/Rose"]=function()
local aa=createProxy"Root/Themes/Rose"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
return{
Accent=Color3.fromRGB(180,55,90),

AcrylicMain=Color3.fromRGB(40,40,40),
AcrylicBorder=Color3.fromRGB(130,90,110),
AcrylicGradient=ColorSequence.new(Color3.fromRGB(190,60,135),Color3.fromRGB(165,50,70)),
AcrylicNoise=0.92,

TitleBarLine=Color3.fromRGB(140,85,105),
Tab=Color3.fromRGB(180,140,160),

Element=Color3.fromRGB(200,120,170),
ElementBorder=Color3.fromRGB(110,70,85),
InElementBorder=Color3.fromRGB(120,90,90),
ElementTransparency=0.86,

ToggleSlider=Color3.fromRGB(200,120,170),
ToggleToggled=Color3.fromRGB(0,0,0),

SliderRail=Color3.fromRGB(200,120,170),

DropdownFrame=Color3.fromRGB(200,160,180),
DropdownHolder=Color3.fromRGB(120,50,75),
DropdownBorder=Color3.fromRGB(90,40,55),
DropdownOption=Color3.fromRGB(200,120,170),

Keybind=Color3.fromRGB(200,120,170),

Input=Color3.fromRGB(200,120,170),
InputFocused=Color3.fromRGB(20,10,30),
InputIndicator=Color3.fromRGB(170,150,190),

Dialog=Color3.fromRGB(120,50,75),
DialogHolder=Color3.fromRGB(95,40,60),
DialogHolderLine=Color3.fromRGB(90,35,55),
DialogButton=Color3.fromRGB(120,50,75),
DialogButtonBorder=Color3.fromRGB(155,90,115),
DialogBorder=Color3.fromRGB(100,70,90),
DialogInput=Color3.fromRGB(135,55,80),
DialogInputLine=Color3.fromRGB(190,160,180),

Text=Color3.fromRGB(240,240,240),
SubText=Color3.fromRGB(170,170,170),
Hover=Color3.fromRGB(200,120,170),
HoverChange=0.04
}

end)()
end
b["Themes/Vynixu"]=function()
local aa=createProxy"Root/Themes/Vynixu"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
return{
Accent=Color3.fromRGB(90,235,45),

AcrylicMain=Color3.fromRGB(30,30,30),
AcrylicBorder=Color3.fromRGB(60,60,60),
AcrylicGradient=ColorSequence.new(Color3.fromRGB(25,25,25),Color3.fromRGB(15,15,15)),
AcrylicNoise=0.94,

TitleBarLine=Color3.fromRGB(65,65,65),
Tab=Color3.fromRGB(100,100,100),

Element=Color3.fromRGB(70,70,70),
ElementBorder=Color3.fromRGB(25,25,25),
InElementBorder=Color3.fromRGB(55,55,55),
ElementTransparency=0.82,


ToggleSlider=Color3.fromRGB(90,235,45),
ToggleToggled=Color3.fromRGB(0,0,0),
SliderRail=Color3.fromRGB(90,235,45),

DropdownFrame=Color3.fromRGB(120,120,120),
DropdownHolder=Color3.fromRGB(35,35,35),
DropdownBorder=Color3.fromRGB(25,25,25),
DropdownOption=Color3.fromRGB(90,235,45),

Keybind=Color3.fromRGB(90,235,45),

Input=Color3.fromRGB(120,120,120),
InputFocused=Color3.fromRGB(10,10,10),
InputIndicator=Color3.fromRGB(150,150,150),

Dialog=Color3.fromRGB(35,35,35),
DialogHolder=Color3.fromRGB(25,25,25),
DialogHolderLine=Color3.fromRGB(20,20,20),
DialogButton=Color3.fromRGB(35,35,35),
DialogButtonBorder=Color3.fromRGB(55,55,55),
DialogBorder=Color3.fromRGB(50,50,50),
DialogInput=Color3.fromRGB(45,45,45),
DialogInputLine=Color3.fromRGB(120,120,120),

Text=Color3.fromRGB(240,240,240),
SubText=Color3.fromRGB(170,170,170),
Hover=Color3.fromRGB(90,235,45),
HoverChange=0.1
}
end)()
end
b["Themes/FSS"]=function()
local aa=createProxy"Root/Themes/FSS"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()
return{
Accent=Color3.fromRGB(170,0,255),

AcrylicMain=Color3.fromRGB(20,15,30),
AcrylicBorder=Color3.fromRGB(60,40,100),
AcrylicGradient=ColorSequence.new(Color3.fromRGB(20,15,30),Color3.fromRGB(10,5,15)),
AcrylicNoise=0.90,

TitleBarLine=Color3.fromRGB(100,50,200),
Tab=Color3.fromRGB(180,180,200),

Element=Color3.fromRGB(25,20,35),
ElementBorder=Color3.fromRGB(50,30,80),
InElementBorder=Color3.fromRGB(60,40,100),
ElementTransparency=0.80,

ToggleSlider=Color3.fromRGB(170,0,255),
ToggleToggled=Color3.fromRGB(20,15,30),
SliderRail=Color3.fromRGB(0,255,230),

DropdownFrame=Color3.fromRGB(30,25,45),
DropdownHolder=Color3.fromRGB(25,20,35),
DropdownBorder=Color3.fromRGB(60,40,100),
DropdownOption=Color3.fromRGB(170,0,255),

Keybind=Color3.fromRGB(0,255,230),

Input=Color3.fromRGB(30,25,45),
InputFocused=Color3.fromRGB(20,15,30),
InputIndicator=Color3.fromRGB(170,0,255),

Dialog=Color3.fromRGB(25,20,35),
DialogHolder=Color3.fromRGB(20,15,30),
DialogHolderLine=Color3.fromRGB(60,40,100),
DialogButton=Color3.fromRGB(35,30,50),
DialogButtonBorder=Color3.fromRGB(80,50,120),
DialogBorder=Color3.fromRGB(60,40,100),
DialogInput=Color3.fromRGB(40,35,60),
DialogInputLine=Color3.fromRGB(170,0,255),

Text=Color3.fromRGB(240,230,255),
SubText=Color3.fromRGB(160,150,180),
Hover=Color3.fromRGB(0,255,230),
HoverChange=0.1
}
end)()
end

local aa=__REQUIRE"Root"
getgenv().FSSHUB_FLUENT=aa
local function Execute()








local ab=getgenv().FSSHUB_PRODUCTION or false
local function Log(ac)
if not ab then
print("[FSSHUB] "..tostring(ac))
end
end

if not getgenv().FSSHUB_INFO then
warn"[FSSHUB] Error: FSSHUB_INFO not found."
return
end


if _G.FSSHUB_FLUENT then
pcall(function()_G.FSSHUB_FLUENT:Destroy()end)

pcall(function()
if _G.FSSHUB_FLUENT.Options then
_G.FSSHUB_FLUENT.Options={}
end
end)
end
_G.FSSHUB_WINDOW=nil
_G.FSSHUB_OPTIONS=nil





local ac=getgenv().FSSHUB_INFO


local ad="FSSHUB/Config/theme.cfg"
if makefolder then
pcall(function()
if not isfolder"FSSHUB"then makefolder"FSSHUB"end
if not isfolder"FSSHUB/Config"then makefolder"FSSHUB/Config"end
end)
end

local function SaveTheme(ae)
if writefile then pcall(writefile,ad,ae)end
end

local function GetSavedTheme()
if not readfile then return"FSSvs"end
local ae,af=pcall(readfile,ad)
return ae and af or"FSSvs"
end



local function InitUI(ae)
Log"Starting UI Build Phase..."



local af=_G.FSSHUB_EVENTS
if not af and getgenv then
af=getgenv().FSSHUB_EVENTS
end


if not af then
warn"[FSSHUB] CRITICAL: Event Bus NOT Connected. Features will not work."
af={listeners={},Emit=function()warn"[FSSHUB] Attempted to emit event on disconnected bus"end,On=function()end}
end

if not _G.FSSHUB_EVENTS then
_G.FSSHUB_EVENTS=af
end


local ag=(ac.User.IsPremium==true or ac.User.IsPremium=="true")
local ah=ac.Game.Name or"Universal"


if _G.FSSHUB_WINDOW and _G.FSSHUB_WINDOW.Destroy then
pcall(function()_G.FSSHUB_WINDOW:Destroy()end)
end

if game:GetService"CoreGui":FindFirstChild"FSSHUB"then
pcall(function()game:GetService"CoreGui".FSSHUB:Destroy()end)
elseif game:GetService"CoreGui":FindFirstChild"ScreenGui"then


end

local ai=ae:Window{
Title=ag and"FSSHUB [VIP] | "..ah or"FSSHUB | "..ah,
SubTitle=ac.Version or"v2.0",
TabWidth=160,
Size=UDim2.fromOffset(580,460),
Resize=false,
MinimizeKey=Enum.KeyCode.RightControl,
Acrylic=false,
Theme=GetSavedTheme(),

OnClose=function()

if _G.FSSHUB_CLEANUP then
_G.FSSHUB_CLEANUP()
end
end
}


if getgenv().FSSHUB_JANITOR then
getgenv().FSSHUB_JANITOR.TrackInstance(ai)

getgenv().FSSHUB_JANITOR.Register(function()


_G.FSSHUB_WINDOW=nil
_G.FSSHUB_FLUENT=nil
end)
end


if ae.ThemeChanged then
ae.ThemeChanged:Connect(SaveTheme)
end


local function Toggle(aj,ak,al,am,an,g)
local h={Title=al,Default=am,Callback=an or function()end}
local i=aj:AddToggle(ak,h)


if ag then

local j=g or Enum.KeyCode.Unknown
i:Keybind("Key_"..ak,
{Title="Key",Default=j,Mode="Toggle",Callback=function()end,ChangedCallback=function()end})
end
return i
end


task.wait(0.05)
local aj={}

aj.Home=ai:Tab{Title="Dashboard",Icon="home"}


aj.Home:AddParagraph("Welcome",{
Title=ag and"Welcome, Premium User! [VIP]"or"Welcome to FSSHub",
Content="User: "..(ac.User.Username or"Guest").."\nTier: "..(ac.User.Tier or"Free")
})
aj.Home:AddButton{
Title="Join Discord",
Description="Get Support & Premium",
Callback=function()
if setclipboard then setclipboard"https://discord.gg/fsshub"end
ae:Notify{Title="Link Copied!",Content="Discord link copied to clipboard.",Duration=3}
end
}

task.wait(0.02)

aj.Movement=ai:Tab{Title="Movement",Icon="footprints"}




aj.Movement:AddSlider("SpeedVal",
{
Title="Value",
Default=16,
Min=16,
Max=500,
Callback=function(ak)
local al=false
if ae.Options.Speed and ae.Options.Speed.Value then al=ae.Options.Speed.Value end
af:Emit("toggle_speed",al,ak)
end
})

Toggle(aj.Movement,"Speed","Walk Speed",false,
function(ak)
local al=16
if ae.Options.SpeedVal and ae.Options.SpeedVal.Value then al=ae.Options.SpeedVal.Value end
af:Emit("toggle_speed",ak,al)
end)

aj.Movement:AddSlider("JumpVal",
{
Title="Value",
Default=50,
Min=50,
Max=500,
Callback=function(ak)
local al=false
if ae.Options.Jump and ae.Options.Jump.Value then al=ae.Options.Jump.Value end
af:Emit("toggle_jump",al,ak)
end
})

Toggle(aj.Movement,"Jump","Jump Power",false,
function(ak)
local al=50
if ae.Options.JumpVal and ae.Options.JumpVal.Value then al=ae.Options.JumpVal.Value end
af:Emit("toggle_jump",ak,al)
end)

if ag then
aj.Movement:AddParagraph("Prem",{Title="Premium",Content="Fly & Noclip unlocked"})
Toggle(aj.Movement,"Fly","Fly Mode",false,function(ak)af:Emit("toggle_fly",ak)end,Enum.KeyCode.F)
Toggle(aj.Movement,"Noclip","Noclip",false,function(ak)af:Emit("toggle_noclip",ak)end)
end

task.wait(0.02)

aj.Visual=ai:Tab{Title="Visual",Icon="eye"}

Toggle(aj.Visual,"ESP","Enable ESP",false,function(ak)af:Emit("toggle_esp",ak)end,Enum.KeyCode.E)
Toggle(aj.Visual,"Fullbright","Fullbright",false,function(ak)af:Emit("toggle_fullbright",ak)end)

task.wait(0.02)

aj.Utility=ai:Tab{Title="Utility",Icon="wrench"}
aj.Utility:AddButton{Title="Rejoin Server",Callback=function()af:Emit"action_rejoin"end}

aj.Player=ai:Tab{Title="Player",Icon="user"}
aj.Player:AddButton{Title="Reset Character",Callback=function()af:Emit"action_reset"end}

task.wait(0.02)

aj.Settings=ai:Tab{Title="Settings",Icon="settings"}

task.wait()


local ak={}
for al,am in ipairs(ae.Themes)do

if type(am)=="string"and am~="Default"and am~="Names"then
table.insert(ak,am)
end
end

pcall(function()
table.sort(ak,function(al,am)
return tostring(al)<tostring(am)
end)
end)


local al=GetSavedTheme()
local am=table.find(ak,al)and al or(ak[1]or"Dark")

aj.Settings:AddDropdown("Theme",
{Title="Theme",Values=ak,Default=am,Callback=function(an)
ae:SetTheme(an)
SaveTheme(an)
end})

ai:SelectTab(1)


_G.FSSHUB_WINDOW=ai
_G.FSSHUB_FLUENT=ae
_G.FSSHUB_OPTIONS=ae.Options

Log"UI Built. Signaling Loader..."


if getgenv then getgenv().FSSHUB_MAIN_MENU_READY=true end
print"[FSSHUB] UI Fully Loaded."
end


task.spawn(function()

if getgenv().FSSHUB_GET_FLUENT then
Log"Checking pre-load cache..."
local ae=getgenv().FSSHUB_GET_FLUENT(10)
if ae then
Log"Using Cached Fluent"
task.defer(function()InitUI(ae)end)
return
end
end


Log"Checking Local Cache..."
local ae="FSSHUB/Bin/Fluent.luau"
local af

if isfile and isfile(ae)then
local ag,ah=pcall(readfile,ae)
if ag then
local ai,aj=loadstring(ah)
if ai then
af=ai
Log"Loaded Fluent from Local Cache"
end
end
end

if not af then
Log"Downloading Fluent Library..."
local ag,ah=pcall(function()
return game:HttpGet
"https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/fluent_loader.lua?v=4.0.8"
end)

if ag and ah then

if writefile then
pcall(function()
if not isfolder"FSSHUB"then makefolder"FSSHUB"end
if not isfolder"FSSHUB/Bin"then makefolder"FSSHUB/Bin"end
writefile(ae,ah)
end)
end
af=loadstring(ah)
end
end

local ag,ah=pcall(function()
if af then return af()end
error"Failed to load library"
end)

if ag and ah then
Log"Fluent Loaded. Initializing UI..."
task.wait(0.05)


task.spawn(function()
InitUI(ah)
end)
else
warn("Fluent Load Error: "..tostring(ah))




end
end)

end
if getgenv().FSSHUB_EXEC_IMMEDIATE then Execute()end
getgenv().FSSHUB_UI_EXEC=Execute
return{Fluent=aa,Execute=Execute,Assets=a}
end)

local BuilderChunk = (function()




return function(a)

local b=getgenv().FSSHUB_INFO or{
User={Tier="Loading...",IsPremium=false,Username="Guest",ExpiryText="..."},
Game={Name="Universal",Slug="universal",IsSupported=true},
Version="v6.4"
}


a.Themes.Default={
Accent=Color3.fromRGB(138,110,215),
AcrylicMain=Color3.fromRGB(25,20,35),
AcrylicBorder=Color3.fromRGB(140,120,210),
AcrylicGradient=ColorSequence.new(Color3.fromRGB(20,20,25),Color3.fromRGB(10,10,15)),
AcrylicNoise=1,
TitleBarLine=Color3.fromRGB(140,120,210),
Tab=Color3.fromRGB(180,180,200),
Element=Color3.fromRGB(15,12,25),
ElementBorder=Color3.fromRGB(40,30,60),
InElementBorder=Color3.fromRGB(138,110,215),
ElementTransparency=0.5,
ToggleSlider=Color3.fromRGB(138,110,215),
ToggleToggled=Color3.fromRGB(20,20,25),
SliderRail=Color3.fromRGB(40,30,60),
DropdownFrame=Color3.fromRGB(15,12,25),
DropdownHolder=Color3.fromRGB(15,12,25),
DropdownBorder=Color3.fromRGB(40,30,60),
DropdownOption=Color3.fromRGB(180,180,200),
Keybind=Color3.fromRGB(180,180,200),
Input=Color3.fromRGB(15,12,25),
InputFocused=Color3.fromRGB(20,20,25),
InputIndicator=Color3.fromRGB(170,150,240),
Dialog=Color3.fromRGB(25,20,35),
DialogHolder=Color3.fromRGB(15,12,25),
DialogHolderLine=Color3.fromRGB(140,120,210),
DialogButton=Color3.fromRGB(40,30,60),
DialogButtonBorder=Color3.fromRGB(140,120,210),
DialogBorder=Color3.fromRGB(140,120,210),
DialogInput=Color3.fromRGB(15,12,25),
DialogInputLine=Color3.fromRGB(138,110,215),
Text=Color3.fromRGB(255,255,255),
SubText=Color3.fromRGB(180,180,200),
Hover=Color3.fromRGB(170,150,240),
HoverChange=0.1
}


local c="FSSHUB/Config"
local d="FSSHUB/Config/theme.cfg"

local e="FSSHUB/Config/autoload.cfg"
local f="FSSHUB/Config/autosave.cfg"

local function SaveTheme(g)
task.spawn(function()
if not isfolder"FSSHUB"then makefolder"FSSHUB"end
if not isfolder(c)then makefolder(c)end
if writefile then pcall(writefile,d,g)end
end)
end

local function GetSavedTheme()
if not readfile or not isfile(d)then return"FSSvs"end
local g,h=pcall(readfile,d)
return g and h or"FSSvs"
end

local function SaveAutoload(g)
if not isfolder"FSSHUB"then makefolder"FSSHUB"end
if not isfolder(c)then makefolder(c)end
if writefile then pcall(writefile,e,g or"")end
end

local function GetAutoload()
if not isfile(e)then return nil end
local g,h=pcall(readfile,e)
return g and h~=""and h or nil
end

local function SaveAutosave(g)
if not isfolder"FSSHUB"then makefolder"FSSHUB"end
if not isfolder(c)then makefolder(c)end
if writefile then pcall(writefile,f,g and"true"or"false")end
getgenv().FSSHUB_AUTOSAVE=g
end

local function GetAutosave()
if not isfile(f)then return false end
local g,h=pcall(readfile,f)
return g and h=="true"
end

local function GetConfigList()
if not isfolder(c)then return{}end
local g=listfiles(c)
local h={}
for i,j in ipairs(g)do
if j:match"%.json$"then
local k=j:match"([^/\\]+)%.json$"
if k then table.insert(h,k)end
end
end
return h
end

local function SaveConfig(g)
if not isfolder"FSSHUB"then makefolder"FSSHUB"end
if not isfolder(c)then makefolder(c)end

local h=c.."/"..g..".json"
local i={}

for j,k in pairs(a.Options)do
if k.Type=="Toggle"then
i[j]={Type="Toggle",Value=k.Value,Key=k.Keybind and k.Keybind.Value.Name or"None"}
elseif k.Type=="Slider"then
i[j]={Type="Slider",Value=k.Value}
elseif k.Type=="Dropdown"then
i[j]={Type="Dropdown",Value=k.Value}
elseif k.Type=="Keybind"then
i[j]={Type="Keybind",Value=k.Value.Name}
end
end

if writefile then
local j,k=pcall(game:GetService"HttpService".JSONEncode,game:GetService"HttpService",i)
if j then writefile(h,k)end
end
a:Notify{Title="Config Saved",Content="Saved config: "..g,Duration=3}
end

local function LoadConfig(g)
local h=c.."/"..g..".json"
if not isfile(h)then
a:Notify{Title="Load Error",Content="Config not found: "..g,Duration=3}
return
end

local i,j=pcall(game:GetService"HttpService".JSONDecode,game:GetService"HttpService",readfile(h))
if i and j then
for k,l in pairs(j)do
local m=a.Options[k]
if m then
if l.Type=="Toggle"then
m:SetValue(l.Value)
if m.Keybind and l.Key then
pcall(function()m.Keybind:SetValue(Enum.KeyCode[l.Key])end)
end
elseif l.Type=="Slider"then
m:SetValue(l.Value)
elseif l.Type=="Dropdown"then
m:SetValue(l.Value)
elseif l.Type=="Keybind"then
pcall(function()m:SetValue(Enum.KeyCode[l.Value])end)
end
end
end
a:Notify{Title="Config Loaded",Content="Loaded config: "..g,Duration=3}
end
end


if _G.FSSHUB_WINDOW and _G.FSSHUB_WINDOW.Destroy then
pcall(function()_G.FSSHUB_WINDOW:Destroy()end)
end


local g=_G.FSSHUB_EVENTS or{listeners={},Emit=function()end,On=function()end}


local h=(b.User.IsPremium==true or b.User.IsPremium=="true")
local i=b.Game.Name or"Universal"

local j=a:Window{
Title=h and"FSSHUB [VIP] | "..i or"FSSHUB | "..i,
SubTitle=b.Version or"v5.0",
TabWidth=160,
Size=UDim2.fromOffset(580,460),
Resize=false,
MinimizeKey=Enum.KeyCode.RightControl,
Acrylic=false,
Theme=GetSavedTheme(),
OnClose=function()
if _G.FSSHUB_CLEANUP then _G.FSSHUB_CLEANUP()end
end
}

getgenv().FSSHUB_AUTOSAVE=GetAutosave()

if a.ThemeChanged then a.ThemeChanged:Connect(SaveTheme)end


local function Toggle(k,l,m,n,o,p)
local q={Title=m,Default=n,Callback=function(q)
if o then o(q)end
if getgenv().FSSHUB_AUTOSAVE then
local r="default"
local s=a.Options.ConfSelect
if s then
if s.SearchBox and s.SearchBox.Text~=""then
r=s.SearchBox.Text
elseif s.Value then
r=s.Value
end
end
SaveConfig(r)
end
end}
local r=k:AddToggle(l,q)
if h then
local s=p or Enum.KeyCode.Unknown
r:Keybind("Key_"..l,{Title="Key",Default=s,Mode="Toggle"})
end
return r
end


local k={}


k.Home=j:Tab{Title="Dashboard",Icon="home"}
k.Home:AddParagraph("Welcome",{
Title=h and"Welcome, Premium Member [VIP]"or"Welcome to FSSHub",
Content="User: "..
(b.User.Username or"Guest")..
"\nTier: "..(b.User.Tier or"Free").."\nExpires: "..(b.User.ExpiryText or"Never")
})



k.Home:AddButton{
Title="Join Discord",
Description="Get Support",
Icon="gamepad-2",
Callback=function()
if setclipboard then setclipboard"https://discord.gg/fsshub"end
a:Notify{Title="Link Copied!",Content="Discord link copied.",Duration=3}
end
}

task.wait()


k.Movement=j:Tab{Title="Movement",Icon="run"}


k.Movement:AddSlider("SpeedVal",{
Title="Walk Speed Value",
Default=16,
Min=16,
Max=500,
Callback=function(l)
local m=false
if a.Options.Speed and a.Options.Speed.Value then m=a.Options.Speed.Value end
g:Emit("toggle_speed",m,l)
end
})
Toggle(k.Movement,"Speed","Enable Walk Speed",false,function(l)
local m=16
if a.Options.SpeedVal then m=a.Options.SpeedVal.Value end
g:Emit("toggle_speed",l,m)
end,Enum.KeyCode.B)


k.Movement:AddSlider("JumpVal",{
Title="Jump Power Value",
Default=50,
Min=50,
Max=500,
Callback=function(l)
local m=false
if a.Options.Jump and a.Options.Jump.Value then m=a.Options.Jump.Value end
g:Emit("toggle_jump",m,l)
end
})
Toggle(k.Movement,"Jump","Enable Jump Power",false,function(l)
local m=50
if a.Options.JumpVal then m=a.Options.JumpVal.Value end
g:Emit("toggle_jump",l,m)
end,Enum.KeyCode.V)

Toggle(k.Movement,"InfJump","Infinite Jump",false,function(l)g:Emit("toggle_infinitejump",l)end,Enum.KeyCode.G)

if h then

Toggle(k.Movement,"Fly","Fly Mode",false,function(l)
local m=a.Options.FlySpeed and a.Options.FlySpeed.Value or 50
g:Emit("toggle_fly",l,m)
end,Enum.KeyCode.H)

k.Movement:AddSlider("FlySpeed",{
Title="Fly Speed",
Default=50,
Min=10,
Max=200,
Callback=function(l)
if a.Options.Fly and a.Options.Fly.Value then g:Emit("toggle_fly",true,l)end
end
})

Toggle(k.Movement,"Noclip","Noclip",false,function(l)g:Emit("toggle_noclip",l)end,Enum.KeyCode.N)
Toggle(k.Movement,"NoClipPhys","Platform Stand",false,
function(l)g:Emit("toggle_platformstand",l)end,Enum.KeyCode.RightAlt)

k.Movement:AddSlider("Gravity",
{Title="Gravity",Default=196.2,Min=0,Max=200,Callback=function(l)g:Emit("set_gravity",l)end})
end

task.wait()


k.Visual=j:Tab{Title="Visual",Icon="eye"}
Toggle(k.Visual,"ESP","Enable ESP",false,function(l)
local m={showName=true,showDistance=true,showHealth=true,showChams=true}
g:Emit("toggle_esp",l,m)
end,Enum.KeyCode.Y)

Toggle(k.Visual,"Fullbright","Fullbright",false,function(l)g:Emit("toggle_fullbright",l)end,Enum.KeyCode.U)

if h then

end

task.wait()


k.Player=j:Tab{Title="Player",Icon="user"}
k.Player:AddButton{Title="Reset Character",Icon="skull",Callback=function()g:Emit"action_reset"end}
Toggle(k.Player,"NoCol","Disable Collision",false,function(l)g:Emit("toggle_nocollision",l)end)

if h then

Toggle(k.Player,"NoFall","No Fall Damage",false,function(l)g:Emit("toggle_nofall",l)end,Enum.KeyCode.End)
Toggle(k.Player,"NoRagdoll","Anti-Ragdoll",false,function(l)g:Emit("toggle_noragdoll",l)end)
k.Player:AddSlider("AnimSpeed",
{Title="Animation Speed",Default=1,Min=0,Max=5,Callback=function(l)g:Emit(
"toggle_animspeed",true,l)end})
end

task.wait()


k.Utility=j:Tab{Title="Utility",Icon="wrench"}
k.Utility:AddButton{Title="Rejoin Server",Icon="refresh-cw",Callback=function()g:Emit"action_rejoin"end}
k.Utility:AddButton{Title="Unlock FPS",Description="Boost FPS Cap",Icon="unlock",Callback=function()g:Emit
"action_unlockfps"end}
Toggle(k.Utility,"AntiAFK","Anti-AFK",false,function(l)g:Emit("toggle_antiafk",l)end,Enum.KeyCode.P)
Toggle(k.Utility,"FPSBoost","FPS Boost & Anti-Lag",false,function(l)g:Emit("toggle_fpsboost",l)end,Enum.KeyCode.O)

if h then
k.Utility:AddButton{Title="Server Hop",Description="Find a better server",Icon="server",Callback=function()g
:Emit"action_serverhop"end}
k.Utility:AddButton{Title="Auto Rejoin",Description="Rejoin on kick",Icon="repeat",Callback=function()g:Emit(
"toggle_autorejoin",true)end}
Toggle(k.Utility,"PerfMon","Performance Monitor",false,function(l)g:Emit("toggle_perfmon",l)end)
end

task.wait()


k.Settings=j:Tab{Title="Settings",Icon="settings"}

task.wait()


local l={}
print"[FSSHUB DEBUG] populating themes from Fluent.Themes..."

if type(a.Themes)=="table"then

local m=(type(a.Themes.Names)=="table")and a.Themes.Names or a.Themes
for n,o in ipairs(m)do

if type(o)=="string"and o~="Default"and o~="Names"then
print("[FSSHUB DEBUG] found theme name:",o)
if not table.find(l,o)then
table.insert(l,o)
end
end
end
end


if type(a.Themes)=="table"and a.Themes.Names then
for m,n in ipairs(a.Themes.Names)do
if not table.find(l,n)then
table.insert(l,n)
end
end
end
print("[FSSHUB DEBUG] total themes found:",#l)

pcall(function()
table.sort(l,function(m,n)
return tostring(m)<tostring(n)
end)
end)


local m=GetSavedTheme()
local n=table.find(l,m)and m or(l[1]or"Dark")

k.Settings:AddDropdown("Theme",
{Title="Interface Theme",Values=l,Default=n,Callback=function(o)
a:SetTheme(o)
SaveTheme(o)
g:Emit("theme_changed",o)
end})

k.Settings:AddKeybind("CloseUI",{
Title="Hide Menu Keybind",
Description="Key to toggle the main menu visibility",
Default=Enum.KeyCode.RightControl,
ChangedCallback=function(o)
a.MinimizeKey=o
end
})



if h then
k.Settings:AddSection"Config Manager"

local o=GetConfigList()

local p=k.Settings:AddDropdown("ConfSelect",{
Title="Config Manager",
Description="Select existing or type new config name",
Values=o,
Multi=false,
Default=nil,
Searchable=true,
AllowCustomInput=true,
Callback=function(p)

end
})



k.Settings:AddButton{
Title="Refresh List",
Icon="refresh-cw",
Callback=function()
p:SetValues(GetConfigList())
a:Notify{Title="Refreshed",Content="Config list updated.",Duration=2}
end
}

k.Settings:AddButton{
Title="Save Config",
Icon="save",
Callback=function()

local q="default"
if p.SearchBox and p.SearchBox.Text~=""then
q=p.SearchBox.Text
elseif p.Value then
q=p.Value
end

SaveConfig(q)
p:SetValues(GetConfigList())

p:SetValue(q)
end
}
k.Settings:AddButton{
Title="Load Config",
Icon="file-output",
Callback=function()
local q="default"
if p.SearchBox and p.SearchBox.Text~=""then
q=p.SearchBox.Text
elseif p.Value then
q=p.Value
end
LoadConfig(q)
end
}

k.Settings:AddButton{
Title="Reset Defaults",
Description="Reset all settings to default values",
Icon="rotate-ccw",
Callback=function()
j:Dialog{
Title="Reset Settings?",
Content="Are you sure you want to reset all settings to their default values?",
Buttons={
{
Title="Yes, Reset",
Callback=function()
for q,r in pairs(a.Options)do
if r.Type=="Toggle"then
r:SetValue(r.Default~=nil and r.Default or false)
elseif r.Type=="Slider"then
r:SetValue(r.Default or r.Min or 0)
elseif r.Type=="Dropdown"then
r:SetValue(r.Default or r.Values[1])
elseif r.Type=="Colorpicker"then
r:SetValue(r.Default or Color3.new(1,1,1))
elseif r.Type=="Keybind"then
r:SetValue(r.Default or"None")
end
end
a:SetTheme"FSSvs"
SaveAutoload""
SaveAutosave(false)
if a.Options.AutoloadConfig then a.Options.AutoloadConfig:SetValue(false)end
if a.Options.AutosaveConfig then a.Options.AutosaveConfig:SetValue(false)end
a:Notify{Title="Reset Complete",Content="Settings have been reset.",Duration=3}
end
},
{
Title="Cancel",
Callback=function()end
}
}
}
end
}

k.Settings:AddSection"Auto Manager"

local q=GetAutoload()
k.Settings:AddToggle("AutoloadConfig",{
Title="Autoload Selected",
Description="Automatically load the selected config on startup",
Default=q~=nil,
Callback=function(r)
if r then
local s="default"
if p.SearchBox and p.SearchBox.Text~=""then
s=p.SearchBox.Text
elseif p.Value then
s=p.Value
end
SaveAutoload(s)
a:Notify{Title="Autoload Enabled",Content="Will autoload: "..s,Duration=2}
else
SaveAutoload""
a:Notify{Title="Autoload Disabled",Content="Autoload has been cleared.",Duration=2}
end
end
})

k.Settings:AddToggle("AutosaveConfig",{
Title="Enable Autosave",
Description="Automatically save config when settings change",
Default=GetAutosave(),
Callback=function(r)
SaveAutosave(r)
a:Notify{Title="Autosave "..(r and"Enabled"or"Disabled"),Content="Config will "..(r and"now"or"no longer").." save automatically.",Duration=2}
end
})
end


task.spawn(function()
task.wait(0.2)
if j then j:SelectTab(1)end
end)

_G.FSSHUB_WINDOW=j
_G.FSSHUB_FLUENT=a
_G.FSSHUB_OPTIONS=a.Options
if getgenv then getgenv().FSSHUB_MAIN_MENU_READY=true end


if h then
pcall(function()
local o=GetAutoload()
if o and isfile(c.."/"..o..".json")then
LoadConfig(o)
elseif isfile(c.."/default.json")then
LoadConfig"default"
end
end)
end



g:On("features_ready",function()
print"[FSSHUB] Features ready! Syncing UI state with features..."
task.spawn(function()
task.wait(0.1)
for o,p in pairs(a.Options)do
if p.Type=="Toggle"and p.Value==true then

if p.Callback then
pcall(p.Callback,p.Value)
end
end
end
print"[FSSHUB] UI state synced with features."
end)
end)

print"[FSSHUB] UI Builder Completed."
end
end)

local LoginChunk = (function()




return function()

local a={
Title="FSSHUB",
Desc="KEYSYSTEM GATEWAY",
Assets={
Logo="rbxthumb://type=Asset&id=120860566854298&w=420&h=420"
},
Colors={
Background=Color3.fromRGB(25,20,35),
MainStroke=Color3.fromRGB(140,120,210),
Accent=Color3.fromRGB(138,110,215),
Secondary=Color3.fromRGB(170,150,240),
Error=Color3.fromRGB(255,80,100),
Success=Color3.fromRGB(50,255,120),
Info=Color3.fromRGB(0,200,255),
TextLight=Color3.fromRGB(255,255,255),
TextDim=Color3.fromRGB(180,180,200),
InputBg=Color3.fromRGB(15,12,25),
ButtonBg=Color3.fromRGB(40,30,60)
}
}

local b=game:GetService"TweenService"
local c=game:GetService"CoreGui"
local d="FSSHUB/bin/SavedKeyFSSHUB.cfg"


local e=getgenv().Junkie
if not e then
pcall(function()
e=loadstring(game:HttpGet"https://jnkie.com/sdk/library.lua")()
if e then
e.service="FSSHUB Official"
e.identifier="1000139"
e.provider="FSSHUB - KEY SYSTEM"
end
end)
end


local f={
Connections={},
UI=nil,
Keys={
Assets=a.Assets,
MainTitle=a.Title,
MainDesc=a.Desc
}
}


local g={}
function g.RandomString(h)
local i=""
for j=1,h do i=i..string.char(math.random(65,90))end
return i
end

function g.NeonStroke(h,i,j)
local k=Instance.new"UIStroke"
k.Thickness=j or 1
k.Color=i
k.Transparency=0.2
k.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
k.Parent=h
return k
end

function g.GlitchText(h,i)
task.spawn(function()
local j=i.Text or h.Text
for k=1,10 do
if not h or not h.Parent then break end
h.Text=g.RandomString(#j)
local l=i.TextColor3 or a.Colors.TextLight
h.TextColor3=(k%2==0)and a.Colors.TextLight or l
task.wait(0.05)
end
if h and h.Parent then
h.Text=j
h.TextColor3=i.TextColor3 or a.Colors.TextLight
end
end)
end


function f.SaveKey(h)
if not isfolder"FSSHUB"then makefolder"FSSHUB"end
if not isfolder"FSSHUB/bin"then makefolder"FSSHUB/bin"end
if writefile then pcall(writefile,d,h)end
pcall(function()
if isfile"verifiedkey"then delfile"verifiedkey"end
if isfile"FSSHUB/bin/SavedKeyFSSHUB"then delfile"FSSHUB/bin/SavedKeyFSSHUB"end
end)
end

function f.LoadKey()
if isfile and isfile(d)then
local h,i=pcall(readfile,d)
if h and i and i~=""then
local j=e and e.check_key(i)
if j and(j.valid or j.message=="KEY_VALID"or j.message=="KEYLESS")then
return i
end
end
end
return nil
end

local h=f.LoadKey()
if h then
f.SavedKey=h
f.AutoLoggedIn=true
end


function f.Initialize(i)
local j=i.Function or i.validateCallback
local k=i.KeyLink or"https://fsshub.com/getkey"

if f.UI then f.UI:Destroy()end


local l=c:FindFirstChild"FSSHUB_Lazy_Loader"or
(gethui and gethui():FindFirstChild"FSSHUB_Lazy_Loader")
if l then l:Destroy()end

local m=Instance.new"ScreenGui"
m.Name="FSSHUB_Cyber_Loader"
m.IgnoreGuiInset=true
m.DisplayOrder=10000
if gethui then m.Parent=gethui()else m.Parent=c end
f.UI=m


local n=Instance.new"BlurEffect"
n.Size=0
n.Parent=game:GetService"Lighting"
b:Create(n,TweenInfo.new(0.5),{Size=24}):Play()


local o=a.Assets.Logo
local p=UDim2.new(0,80,0,80)
if f.Keys.Assets and f.Keys.Assets.Logo then
if type(f.Keys.Assets.Logo)=="table"then
o=f.Keys.Assets.Logo.ID
p=f.Keys.Assets.Logo.Size or UDim2.new(0,80,0,80)
else
o=f.Keys.Assets.Logo
end
end
local q=(o~=nil and o~="")
local r=q and 340 or 280


local s=Instance.new"Frame"
s.Name="MainContainer"
s.Size=UDim2.new(0,400,0,r)
s.Position=UDim2.new(0.5,0,0.5,0)
s.AnchorPoint=Vector2.new(0.5,0.5)
s.BackgroundColor3=a.Colors.Background
s.BorderSizePixel=0
s.BackgroundTransparency=0.25
s.Parent=m
s.ClipsDescendants=true

local t=Instance.new"UICorner"
t.CornerRadius=UDim.new(0,12)
t.Parent=s


local u=Instance.new"UIGradient"
u.Rotation=45
u.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(20,20,25)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(10,10,15))
}
u.Parent=s

local v=g.NeonStroke(s,a.Colors.MainStroke,2)
local w=Instance.new"UIGradient"
w.Rotation=45
w.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,a.Colors.Secondary),
ColorSequenceKeypoint.new(0.5,a.Colors.Accent),
ColorSequenceKeypoint.new(1,a.Colors.Secondary)
}
w.Parent=v


local x=Instance.new"Frame"
x.Name="GalaxyBg"
x.Size=UDim2.new(1,0,1,0)
x.BackgroundTransparency=1
x.ClipsDescendants=true
x.Parent=s
local y=Instance.new"UICorner"
y.CornerRadius=UDim.new(0,8)
y.Parent=x

task.spawn(function()
local z={a.Colors.Accent,a.Colors.Secondary,Color3.fromRGB(150,50,255),Color3
.fromRGB(255,255,255)}
while m and m.Parent do
if not x.Parent then break end
if math.random()>0.5 then
local A=Instance.new"Frame"
local B=math.random(2,4)
A.Size=UDim2.new(0,B,0,B)
A.Position=UDim2.new(math.random(),0,math.random(),0)
A.BackgroundColor3=z[math.random(1,#z)]
A.BorderSizePixel=0
A.BackgroundTransparency=math.random(0.3,0.7)
local C=Instance.new"UICorner"
C.CornerRadius=UDim.new(1,0)
C.Parent=A
A.Parent=x
local D=math.random(3,8)
local E=A.Position+UDim2.new(math.random(-0.1,0.1),0,math.random(-0.1,0.1),0)
b:Create(A,
TweenInfo.new(D,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
{Position=E,BackgroundTransparency=1}):Play()
game.Debris:AddItem(A,D)
end
task.wait(0.05)
end
end)


local z=Instance.new"TextButton"
z.Text="X"
z.TextColor3=a.Colors.TextDim
z.Font=Enum.Font.Code
z.TextSize=18
z.BackgroundTransparency=1
z.Size=UDim2.new(0,30,0,30)
z.Position=UDim2.new(1,-30,0,0)
z.Parent=s
z.MouseEnter:Connect(function()z.TextColor3=a.Colors.Error end)
z.MouseLeave:Connect(function()z.TextColor3=a.Colors.TextDim end)


local A
if q then
A=Instance.new"ImageLabel"
A.Image=o
A.Size=p
A.Position=UDim2.new(0.5,0,0,20)
A.AnchorPoint=Vector2.new(0.5,0)
A.BackgroundTransparency=1
A.ImageTransparency=1
A.ZIndex=5
A.Parent=s
local B=Instance.new"UICorner"
B.CornerRadius=UDim.new(0,12)
B.Parent=A
end

local B=Instance.new"TextLabel"
B.Text=f.Keys.MainTitle or"FSSHUB"
B.Font=Enum.Font.GothamBold
B.TextSize=28
B.TextColor3=a.Colors.Accent
B.Size=UDim2.new(1,0,0,30)
B.Position=UDim2.new(0,0,0,A and 105 or 30)
B.BackgroundTransparency=1
B.TextTransparency=1
B.Parent=s

local C=Instance.new"TextLabel"
C.Text=f.Keys.MainDesc or"KEYSYSTEM GATEWAY"
C.Font=Enum.Font.Gotham
C.TextSize=12
C.TextColor3=a.Colors.TextDim
C.Size=UDim2.new(1,0,0,20)
C.Position=UDim2.new(0,0,0,A and 135 or 60)
C.BackgroundTransparency=1
C.TextTransparency=1
C.Parent=s

local D=game:GetService"Players"
local E=D.LocalPlayer
local F=Instance.new"TextLabel"
F.Text="Welcome, @"..(E and E.Name or"User")
F.Font=Enum.Font.GothamMedium
F.TextSize=13
F.TextColor3=a.Colors.Accent
F.Size=UDim2.new(1,0,0,20)
F.Position=UDim2.new(0,0,0,A and 155 or 85)
F.BackgroundTransparency=1
F.TextTransparency=1
F.Parent=s


local G=A and 195 or 125
local H=Instance.new"Frame"
H.Size=UDim2.new(0.85,0,0,42)
H.Position=UDim2.new(0.5,0,0,G)
H.AnchorPoint=Vector2.new(0.5,0)
H.BackgroundColor3=a.Colors.InputBg
H.BackgroundTransparency=0.5
H.Parent=s
H.Visible=false
local I=Instance.new"UICorner"
I.CornerRadius=UDim.new(0,6)
I.Parent=H
g.NeonStroke(H,a.Colors.TextDim,1)

local J=Instance.new"TextBox"
J.Size=UDim2.new(1,-20,1,0)
J.Position=UDim2.new(0,10,0,0)
J.BackgroundTransparency=1
J.Font=Enum.Font.Code
J.Text=""
J.PlaceholderText="INPUT_KEY_HERE"
J.PlaceholderColor3=Color3.fromRGB(60,80,80)
J.TextColor3=a.Colors.Secondary
J.TextSize=14
J.Parent=H


function f.ShowStatus(K,L)
local M=s:FindFirstChild"StatusFrame"
if M then M:Destroy()end
local N=Instance.new"Frame"
N.Name="StatusFrame"
N.Size=UDim2.new(0,0,0,26)
N.Position=UDim2.new(0.5,0,1,-12)
N.AnchorPoint=Vector2.new(0.5,1)
N.BackgroundColor3=a.Colors.InputBg
N.BackgroundTransparency=0.3
N.Parent=s
local O=Instance.new"UICorner"
O.CornerRadius=UDim.new(0,6)
O.Parent=N
local P=Instance.new"UIStroke"
P.Color=L
P.Thickness=1
P.Parent=N
local Q=Instance.new"TextLabel"
Q.Text=string.upper(K)
Q.TextColor3=L
Q.Font=Enum.Font.GothamMedium
Q.TextSize=12
Q.Size=UDim2.new(1,0,1,0)
Q.BackgroundTransparency=1
Q.TextTransparency=1
Q.Parent=N
b:Create(N,TweenInfo.new(0.4,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
{Size=UDim2.new(0.9,0,0,26)}):Play()
task.delay(0.2,function()
b:Create(Q,TweenInfo.new(0.2),{TextTransparency=0}):Play()
g.GlitchText(Q,{Text=string.upper(K),TextColor3=L})
end)
task.delay(3,function()
if N.Parent then
b:Create(Q,TweenInfo.new(0.2),{TextTransparency=1}):Play()
local R=b:Create(N,
TweenInfo.new(0.4,Enum.EasingStyle.Quart,Enum.EasingDirection.In),
{Size=UDim2.new(0,0,0,26)})
R:Play()
R.Completed:Wait()
N:Destroy()
end
end)
end

local function createCyberButton(K,L,M,N)
local O=Instance.new"TextButton"
O.Size=UDim2.new(0.35,0,0,35)
O.AnchorPoint=Vector2.new(0.5,0)
O.Position=L
O.BackgroundColor3=a.Colors.ButtonBg
O.BackgroundTransparency=0.3
O.Text=K
O.Font=Enum.Font.GothamBold
O.TextColor3=M and a.Colors.Accent or a.Colors.TextDim
O.TextSize=14
O.Parent=s
O.Visible=false
local P=Instance.new"UICorner"
P.CornerRadius=UDim.new(0,8)
P.Parent=O
local Q=g.NeonStroke(O,M and a.Colors.Accent or a.Colors.TextDim,1)
O.MouseEnter:Connect(function()
b:Create(Q,TweenInfo.new(0.2),
{Color=M and a.Colors.Secondary or a.Colors.TextLight}):Play()
O.TextColor3=M and a.Colors.Secondary or a.Colors.TextLight
end)
O.MouseLeave:Connect(function()
b:Create(Q,TweenInfo.new(0.2),
{Color=M and a.Colors.Accent or a.Colors.TextDim}):Play()
O.TextColor3=M and a.Colors.Accent or a.Colors.TextDim
end)
O.MouseButton1Click:Connect(function()
N()
local R=Instance.new"Frame"
R.Size=UDim2.new(1,0,1,0)
R.BackgroundColor3=a.Colors.TextLight
R.BackgroundTransparency=0.5
R.Parent=O
local S=Instance.new"UICorner"
S.CornerRadius=UDim.new(0,6)
S.Parent=R
b:Create(R,TweenInfo.new(0.2),{BackgroundTransparency=1}):Play()
game.Debris:AddItem(R,0.4)
end)
return O
end

local K=A and 255 or 185
local L=createCyberButton("GET KEY",UDim2.new(0.28,0,0,K),false,function()
if setclipboard then
setclipboard(k)
f.ShowStatus("LINK_COPIED",a.Colors.Info)
else
f.ShowStatus("LINK: "..k,a.Colors.Info)
end
end)
local M=createCyberButton("VERIFY",UDim2.new(0.72,0,0,K),true,function()
local M=J.Text:gsub("%s+","")
if M==""then
f.ShowStatus("NO_KEY_ENTERED",a.Colors.Error)
return
end
if j then j(M)end
end)

J.FocusLost:Connect(function(N)
if N then
local O=J.Text:gsub("%s+","")
if O==""then
f.ShowStatus("NO_KEY_ENTERED",a.Colors.Error)
return
end
if j then j(O)end
end
end)


function f.Close(N)
getgenv().UI_CLOSED=true
if n then b:Create(n,TweenInfo.new(0.3),{Size=0}):Play()end
if s then
local O=b:Create(s,
TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.In),
{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1})
O:Play()
O.Completed:Wait()
end
if m then m:Destroy()end
if n then n:Destroy()end
if not N and _G.FSSHUB_CLEANUP then
_G.FSSHUB_CLEANUP()
end
end

z.MouseButton1Click:Connect(f.Close)


function f.Authorize()
f.ShowStatus("ACCESS_GRANTED... AUTHENTICATING",a.Colors.Success)
task.delay(1,function()
for N,O in ipairs(s:GetChildren())do
local P=false
if O.Name=="GalaxyBg"or O.Name=="MainGradient"or O.Name=="InnerHighlight"or O.ClassName=="UICorner"then P=true end
if O==v then P=true end
if O==A or O==B or O==C or O==z then P=true end
if not P then
pcall(function()
local Q={BackgroundTransparency=1}
if O:IsA"TextLabel"or O:IsA"TextButton"or O:IsA"TextBox"then Q.TextTransparency=1 end
if O:IsA"ImageLabel"or O:IsA"ImageButton"then Q.ImageTransparency=1 end
b:Create(O,TweenInfo.new(0.3),Q):Play()
end)
task.delay(0.3,function()pcall(function()O:Destroy()end)end)
end
end

task.wait(0.4)
if A then
b:Create(A,
TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),
{Size=UDim2.new(0,85,0,85)}):Play()
end

local N=Instance.new"TextLabel"
N.Text="LOADING CORE..."
N.Font=Enum.Font.Code
N.TextSize=18
N.TextColor3=a.Colors.Accent
N.Size=UDim2.new(1,0,0,30)
N.Position=UDim2.new(0,0,0.65,0)
N.BackgroundTransparency=1
N.TextTransparency=1
N.Parent=s

b:Create(N,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
{TextTransparency=0}):Play()
g.GlitchText(N,{Text="LOADING CORE...",TextColor3=a.Colors.Accent})

local O=Instance.new"Frame"
O.Size=UDim2.new(0.6,0,0,4)
O.Position=UDim2.new(0.5,0,0.75,0)
O.AnchorPoint=Vector2.new(0.5,0.5)
O.BackgroundColor3=a.Colors.InputBg
O.BackgroundTransparency=1
O.Parent=s
Instance.new("UICorner",O).CornerRadius=UDim.new(1,0)

local P=Instance.new"Frame"
P.Size=UDim2.new(0,0,1,0)
P.BackgroundColor3=a.Colors.Success
P.Parent=O
Instance.new("UICorner",P).CornerRadius=UDim.new(1,0)

b:Create(O,TweenInfo.new(0.5),{BackgroundTransparency=0.5}):Play()

task.spawn(function()
local Q=tick()
_G.FSSHUB_STATUS="REQUESTING CORE..."

while(tick()-Q<60)do
if not m or not m.Parent then break end
local R=(getgenv().FSSHUB_MAIN_MENU_READY==true)or(_G.FSSHUB_WINDOW~=nil)
if R then
pcall(function()
b:Create(P,TweenInfo.new(0.3),{Size=UDim2.new(1,0,1,0)}):Play()
N.Text="READY - LAUNCHING"
N.TextColor3=a.Colors.Success
end)
task.wait(0.5)
f.Close(true)
return
end

local S=_G.FSSHUB_STATUS or"WAITING..."
pcall(function()
N.Text=string.upper(S)
local T=string.rep(".",math.floor(tick()*2)%4)
if not string.find(N.Text,"%.%.%.")then N.Text=N.Text..T end
local U=tick()*2
local V=(math.sin(U)+1)/2
P.Size=UDim2.new(0.3,0,1,0)
P.Position=UDim2.new(V*0.7,0,0,0)
end)
task.wait(0.1)
end
f.Close()
end)
end)
end

function f.Fail()
f.ShowStatus("ACCESS_DENIED: INVALID_KEY",a.Colors.Error)
local N=UDim2.new(0.5,0,0.5,0)
for O=1,6 do
s.Position=N+UDim2.new(0,math.random(-5,5),0,math.random(-5,5))
task.wait(0.04)
end
s.Position=N
end


s.Size=UDim2.new(0,150,0,50)
s.BackgroundTransparency=0.05
local N=Instance.new"TextLabel"
N.Text="INITIALIZING..."
N.Font=Enum.Font.Code
N.TextSize=12
N.TextColor3=a.Colors.Secondary
N.Size=UDim2.new(1,0,1,0)
N.BackgroundTransparency=1
N.Parent=s

task.spawn(function()
task.wait(0.4)
N:Destroy()
local O=UDim2.new(0,400,0,r)
b:Create(s,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
{Size=O}):Play()
task.wait(0.35)
if A then b:Create(A,TweenInfo.new(0.3),{ImageTransparency=0}):Play()end
b:Create(B,TweenInfo.new(0.3),{TextTransparency=0}):Play()
b:Create(C,TweenInfo.new(0.3),{TextTransparency=0}):Play()

if f.AutoLoggedIn then
H.Visible=false
L.Visible=false
M.Visible=false
F.Text="Welcome Back, @"..(E and E.Name or"User")
b:Create(F,TweenInfo.new(0.3),{TextTransparency=0}):Play()
f.ShowStatus("WELCOME BACK",a.Colors.Success)
task.delay(1.5,function()
f.Authorize()
task.wait(1)
getgenv().SCRIPT_KEY=f.SavedKey
end)
else
b:Create(F,TweenInfo.new(0.3),{TextTransparency=0}):Play()
H.Visible=true
L.Visible=true
M.Visible=true
end

task.spawn(function()
task.wait(0.2)
g.GlitchText(B,
{Text=f.Keys.MainTitle or"FSSHUB",TextColor3=a.Colors.Accent})
end)
end)

return f
end
end
end)

return function()
    local LibResult = LibChunk()
    task.wait() 
    local Fluent = LibResult and LibResult.Fluent or nil
    local Builder = nil
    
    if type(BuilderChunk) == 'function' then
        Builder = BuilderChunk()
    end

    local LoginUI = nil
    if type(LoginChunk) == 'function' then
        LoginUI = LoginChunk()
    end
    
    return Fluent, Builder, LoginUI
end