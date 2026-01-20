-- FSSHUB UI Bundle (generated)
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
createProxy"Root/Components/Assets"




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
local k=j.New local l=

i.Spring.new

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
})local

q, r=j.SpringMotor(1,p.HoverFrame,"BackgroundTransparency",o)
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
})local

q, r=i.SpringMotor(1,o.TintFrame,"BackgroundTransparency",true)

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
})local

s, t=i.SpringMotor(1.1,o.Scale,"Scale")

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
})local

u, v=i.SpringMotor(1,o.Root,"GroupTransparency")

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

p.TitleLabel=j("TextLabel",{
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
})::TextLabel

p.DescLabel=j("TextLabel",{
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
})::TextLabel

p.LabelHolder=j("Frame",{
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
})::Frame

p.Border=j("UIStroke",{
Transparency=0.5,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Color=Color3.fromRGB(0,0,0),
ThemeTag={
Color="ElementBorder",
},
})::UIStroke

p.Frame=j("TextButton",{
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
})::TextButton

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

if n then local q=
h.Themes local
r, s=i.SpringMotor(
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

local l=i.Spring.new local m=
i.Instant.new
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
local l=i.Spring.new local m=
i.Instant.new
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
require(i.Packages.Flipper)
local j=require(i.Modules.Creator)
local k=j.New

return function(l,m)
local n={}

m=m or false

n.Input=k("TextBox",{
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

n.Container=k("Frame",{
BackgroundTransparency=1,
ClipsDescendants=true,
Position=UDim2.new(0,6,0,0),
Size=UDim2.new(1,-12,1,0),
},{
n.Input,
})

n.Indicator=k("Frame",{
Size=UDim2.new(1,-4,0,1),
Position=UDim2.new(0,2,1,0),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=m and 0.5 or 0,
ThemeTag={
BackgroundColor3=m and"InputIndicator"or"DialogInputLine",
},
})

n.Frame=k("Frame",{
Size=UDim2.new(0,0,0,30),
BackgroundTransparency=m and 0.9 or 0,
Parent=l,
ThemeTag={
BackgroundColor3=m and"Input"or"DialogInput",
},
},{
k("UICorner",{
CornerRadius=UDim.new(0,4),
}),
k("UIStroke",{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Transparency=m and 0.5 or 0.65,
ThemeTag={
Color=m and"InElementBorder"or"DialogButtonBorder",
},
}),
n.Indicator,
n.Container,
})

local function Update()
local o=2
local p=n.Container.AbsoluteSize.X

if not n.Input:IsFocused()or n.Input.TextBounds.X<=p-2*o then
n.Input.Position=UDim2.new(0,o,0,0)
else
local q=n.Input.CursorPosition
if q~=-1 then
local r=string.sub(n.Input.Text,1,q-1)
local s=h:GetTextSize(
r,
n.Input.TextSize,
n.Input.Font,
Vector2.new(math.huge,math.huge)
).X

local t=n.Input.Position.X.Offset+s
if t<o then
n.Input.Position=UDim2.fromOffset(o-s,0)
elseif t>p-o-1 then
n.Input.Position=UDim2.fromOffset(p-s-o-1,0)
end
end
end
end

task.spawn(Update)

j.AddSignal(n.Input:GetPropertyChangedSignal"Text",Update)
j.AddSignal(n.Input:GetPropertyChangedSignal"CursorPosition",Update)

j.AddSignal(n.Input.Focused,function()
Update()
n.Indicator.Size=UDim2.new(1,-2,0,2)
n.Indicator.Position=UDim2.new(0,1,1,0)
n.Indicator.BackgroundTransparency=0
j.OverrideTag(n.Frame,{BackgroundColor3=m and"InputFocused"or"DialogHolder"})
j.OverrideTag(n.Indicator,{BackgroundColor3="Accent"})
end)

j.AddSignal(n.Input.FocusLost,function()
Update()
n.Indicator.Size=UDim2.new(1,-4,0,1)
n.Indicator.Position=UDim2.new(0,2,1,0)
n.Indicator.BackgroundTransparency=0.5
j.OverrideTag(n.Frame,{BackgroundColor3=m and"Input"or"DialogInput"})
j.OverrideTag(n.Indicator,{BackgroundColor3=m and"InputIndicator"or"DialogInputLine"})
end)

return n
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
})local

u, v=i.SpringMotor(1,t.Frame,"BackgroundTransparency")

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
Content=`Press {o.Utilities:Prettify(S)} to toggle the interface.`,
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

local p=j("ImageLabel",{
Size=UDim2.fromOffset(16,16),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-10,0.5,0),
BackgroundTransparency=1,
Parent=o.Frame,
ThemeTag={
ImageColor3="Text",
}
})::ImageLabel

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

local v=m("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundColor3=t.Value,
Parent=u.Frame,
},{
m("UICorner",{
CornerRadius=UDim.new(0,4),
}),
})::Frame

m("ImageLabel",{
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
})

local function CreateColorDialog()
local w=require(n.Dialog):Create()
w.Title.Text=t.Title
w.Root.Size=UDim2.fromOffset(430,330)

local x,y,z=t.Hue,t.Sat,t.Vib
local A=t.Transparency

local B,C,D,E=t.Hue,t.Sat,t.Vib,t.Transparency

local function CreateInput()
local F=require(n.Textbox)()
F.Frame.Parent=w.Root
F.Frame.Size=UDim2.new(0,90,0,32)

return F
end

local function CreateInputLabel(F,G):TextLabel
return m("TextLabel",{
FontFace=Font.new(
"rbxasset://fonts/families/GothamSSm.json",
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
),
Text=F,
TextColor3=Color3.fromRGB(240,240,240),
TextSize=13,
TextXAlignment=Enum.TextXAlignment.Left,
Size=UDim2.new(1,0,0,32),
Position=G,
BackgroundTransparency=1,
Parent=w.Root,
ThemeTag={
TextColor3="Text",
},
})::TextLabel
end

local function GetRGB()
local F=Color3.fromHSV(x,y,z)
return{R=math.floor(F.R*255),G=math.floor(F.G*255),B=math.floor(F.B*255)}
end

local F=m("ImageLabel",{
Size=UDim2.new(0,18,0,18),
ScaleType=Enum.ScaleType.Fit,
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Image="http://www.roblox.com/asset/?id=4805639000",
})::ImageLabel

local G=m("ImageLabel",{
Size=UDim2.fromOffset(180,160),
Position=UDim2.fromOffset(20,55),
Image="rbxassetid://4155801252",
BackgroundColor3=t.Value,
BackgroundTransparency=0,
Parent=w.Root,
},{
m("UICorner",{
CornerRadius=UDim.new(0,4),
}),
F,
})::ImageLabel

local H=m("Frame",{
BackgroundColor3=t.Value,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=t.Transparency,
},{
m("UICorner",{
CornerRadius=UDim.new(0,4),
}),
})::Frame

m("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(112,220),
Size=UDim2.fromOffset(88,24),
Parent=w.Root,
},{
m("UICorner",{
CornerRadius=UDim.new(0,4),
}),
m("UIStroke",{
Thickness=2,
Transparency=0.75,
}),
H,
})

local I=m("Frame",{
BackgroundColor3=t.Value,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
},{
m("UICorner",{
CornerRadius=UDim.new(0,4),
}),
})::Frame

m("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(20,220),
Size=UDim2.fromOffset(88,24),
Parent=w.Root,
},{
m("UICorner",{
CornerRadius=UDim.new(0,4),
}),
m("UIStroke",{
Thickness=2,
Transparency=0.75,
}),
I,
})

local J={}

for K=0,1,0.1 do
J[#J+1]=ColorSequenceKeypoint.new(K,Color3.fromHSV(K,1,1))
end

local K=m("UIGradient",{
Color=ColorSequence.new(J),
Rotation=90,
})::UIGradient

local L=m("Frame",{
Size=UDim2.new(1,0,1,-10),
Position=UDim2.fromOffset(0,5),
BackgroundTransparency=1,
})::Frame

local M=m("ImageLabel",{
Size=UDim2.fromOffset(14,14),
Image="http://www.roblox.com/asset/?id=12266946128",
Parent=L,
ThemeTag={
ImageColor3="DialogInput",
},
})::ImageLabel

local N=m("Frame",{
Size=UDim2.fromOffset(12,190),
Position=UDim2.fromOffset(210,55),
Parent=w.Root,
},{
m("UICorner",{
CornerRadius=UDim.new(1,0),
}),
K,
L,
})::Frame

local O=CreateInput()
O.Frame.Position=UDim2.fromOffset(r.Transparency and 260 or 240,55)
CreateInputLabel("Hex",UDim2.fromOffset(r.Transparency and 360 or 340,55))

local P=CreateInput()
P.Frame.Position=UDim2.fromOffset(r.Transparency and 260 or 240,95)
CreateInputLabel("Red",UDim2.fromOffset(r.Transparency and 360 or 340,95))

local Q=CreateInput()
Q.Frame.Position=UDim2.fromOffset(r.Transparency and 260 or 240,135)
CreateInputLabel("Green",UDim2.fromOffset(r.Transparency and 360 or 340,135))

local R=CreateInput()
R.Frame.Position=UDim2.fromOffset(r.Transparency and 260 or 240,175)
CreateInputLabel("Blue",UDim2.fromOffset(r.Transparency and 360 or 340,175))

local S
if r.Transparency then
S=CreateInput()
S.Frame.Position=UDim2.fromOffset(260,215)
CreateInputLabel("Alpha",UDim2.fromOffset(360,215))
end

local T,U,V
if r.Transparency then
local W=m("Frame",{
Size=UDim2.new(1,0,1,-10),
Position=UDim2.fromOffset(0,5),
BackgroundTransparency=1,
})::Frame

U=m("ImageLabel",{
Size=UDim2.fromOffset(14,14),
Image="http://www.roblox.com/asset/?id=12266946128",
Parent=W,
ThemeTag={
ImageColor3="DialogInput",
},
})::ImageLabel

V=m("Frame",{
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
})::Frame

T=m("Frame",{
Size=UDim2.fromOffset(12,190),
Position=UDim2.fromOffset(230,55),
Parent=w.Root,
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
Parent=w.Root,
},{
m("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
V,
W,
})::Frame
end

local function Display()
G.BackgroundColor3=Color3.fromHSV(x,1,1)
M.Position=UDim2.new(0,-1,x,-6)
F.Position=UDim2.new(y,0,1-z,0)
I.BackgroundColor3=Color3.fromHSV(x,y,z)

O.Input.Text=`#{Color3.fromHSV(x,y,z):ToHex()}`
P.Input.Text=GetRGB().R
Q.Input.Text=GetRGB().G
R.Input.Text=GetRGB().B

if r.Transparency then
V.BackgroundColor3=Color3.fromHSV(x,y,z)
I.BackgroundTransparency=A
U.Position=UDim2.new(0,-1,1-A,-6)
S.Input.Text=`{s.Utilities:Round((1-A)*100,0)}%`
end

if t.UpdateOnChange then
t:SetValue({x,y,z},A)
end
end

l.AddSignal(O.Input.FocusLost,function(W)
if W then
local X,Y=pcall(Color3.fromHex,O.Input.Text)
if X and typeof(Y)=="Color3"then
x,y,z=Color3.toHSV(Y)
end
end
Display()
end)

l.AddSignal(P.Input.FocusLost,function(W)
if W then
local X=GetRGB()
local Y,Z=pcall(Color3.fromRGB,P.Input.Text,X.G,X.B)
if Y and typeof(Z)=="Color3"then
if tonumber(P.Input.Text)<=255 then
x,y,z=Color3.toHSV(Z)
end
end
end
Display()
end)

l.AddSignal(Q.Input.FocusLost,function(W)
if W then
local X=GetRGB()
local Y,Z=
pcall(Color3.fromRGB,X.R,Q.Input.Text,X.B)
if Y and typeof(Z)=="Color3"then
if tonumber(Q.Input.Text)<=255 then
x,y,z=Color3.toHSV(Z)
end
end
end
Display()
end)

l.AddSignal(R.Input.FocusLost,function(W)
if W then
local X=GetRGB()
local Y,Z=
pcall(Color3.fromRGB,X.R,X.G,R.Input.Text)
if Y and typeof(Z)=="Color3"then
if tonumber(R.Input.Text)<=255 then
x,y,z=Color3.toHSV(Z)
end
end
end
Display()
end)

if r.Transparency then
l.AddSignal(S.Input.FocusLost,function(W)
if W then
pcall(function()
local X=tonumber(S.Input.Text)
A=X>=0 and X<=100 and 1-X*0.01 or A
end)
end
Display()
end)
end

local function UpdateSatVib()
local W=G.AbsolutePosition.X
local X=W+G.AbsoluteSize.X
local Y=math.clamp(j.X,W,X)

local Z=G.AbsolutePosition.Y
local _=Z+G.AbsoluteSize.Y
local aa=math.clamp(j.Y,Z,_)

y=(Y-W)/(X-W)
z=1-((aa-Z)/(_-Z))
Display()
end

local function UpdateHue()
local aa=N.AbsolutePosition.Y
local W=aa+N.AbsoluteSize.Y
local X=math.clamp(j.Y,aa,W)

x=((X-aa)/(W-aa))
Display()
end

local function UpdateTransparency()
local aa=T.AbsolutePosition.Y
local W=aa+T.AbsoluteSize.Y
local X=math.clamp(j.Y,aa,W)

A=1-((X-aa)/(W-aa))
Display()
end

local aa
l.AddSignal(G.InputBegan,function(W)
if W.UserInputType==Enum.UserInputType.MouseButton1
or W.UserInputType==Enum.UserInputType.Touch then

aa=j.Move:Connect(UpdateSatVib)
UpdateSatVib()
end
end)

l.AddSignal(G.InputEnded,function(W)
if W.UserInputType==Enum.UserInputType.MouseButton1
or W.UserInputType==Enum.UserInputType.Touch then

if aa then
aa:Disconnect()
aa=nil
end
end
end)

l.AddSignal(N.InputBegan,function(W)
if W.UserInputType==Enum.UserInputType.MouseButton1
or W.UserInputType==Enum.UserInputType.Touch then

aa=j.Move:Connect(UpdateHue)
UpdateHue()
end
end)

l.AddSignal(N.InputEnded,function(W)
if W.UserInputType==Enum.UserInputType.MouseButton1
or W.UserInputType==Enum.UserInputType.Touch then

if aa then
aa:Disconnect()
aa=nil
end
end
end)

if r.Transparency then
l.AddSignal(T.InputBegan,function(W)
if W.UserInputType==Enum.UserInputType.MouseButton1
or W.UserInputType==Enum.UserInputType.Touch then

aa=j.Move:Connect(UpdateTransparency)
UpdateTransparency()
end
end)

l.AddSignal(T.InputEnded,function(W)
if W.UserInputType==Enum.UserInputType.MouseButton1
or W.UserInputType==Enum.UserInputType.Touch then

if aa then
aa:Disconnect()
aa=nil
end
end
end)
end

Display()

w:Button("Done",function()
t:SetValue({x,y,z},A)
end)

w:Button("Cancel",function()
t:SetValue({B,C,D},E)
end)

w:Open()
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

function t.SetValue(aa,w,x)
local y=Color3.fromHSV(w[1],w[2],w[3])

rawset(t,"Transparency",x or 0)
t:SetHSVFromRGB(y)
t:Display()
end

function t.SetValueRGB(aa,w,x)
rawset(t,"Transparency",x or 0)
t:SetHSVFromRGB(w)
t:Display()
end

function t.OnChanged(aa,w)
t.Changed=w
s:SafeCallback(w,t.Value,t.Value)
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
__newindex=function(aa,w,x)
local y=typeof(x)
if w=="Value"then
if y=="table"then
task.spawn(t.SetValue,t,x,t.Transparency)
else
task.spawn(t.SetValueRGB,t,x,t.Transparency)
end
elseif w=="Transparency"and y=="number"then
task.spawn(t.SetValueRGB,t,t.Value,x)
else
rawset(aa,w,x)
end
end
})
end

return o
end)()
end
b["Elements/Dropdown"]=function()
local aa=createProxy"Root/Elements/Dropdown"
local function require(g)
local h=tostring(g):gsub("Root/","")
return __REQUIRE(h)
end
return(function()
local g=game:GetService"UserInputService"
local h=game:GetService"Players".LocalPlayer:GetMouse()
local i=game:GetService"Workspace".CurrentCamera

local j=aa.Parent.Parent
local k=require(j.Modules.Creator)
local l=require(j.Packages.Flipper)

local m=k.New
local n=j.Components

local o={}
o.__index=o
o.__type="Dropdown"

function o.New(p,q,r)
local s=p.Library

local t={
Values=(function()
local t={}

for u,v in next,r.Values or{}do
t[#t+1]=v
end

return t
end)(),
Value=r.Default or r.Value,
Multi=r.Multi or false,
AutoDeselect=r.AutoDeselect or false,
Searchable=r.Searchable or false,
FocusSearch=r.FocusSearch or true,
SearchPlaceholder=r.SearchPlaceholder or"Search...",
Displayer=typeof(r.Displayer)=="function"and r.Displayer or function(t)
return typeof(t)~="number"and tostring(s.Utilities:Prettify(t))or t
end,
CustomDisplayer=(typeof(r.Displayer)=="function"and r.Displayer and true)or false,
Buttons={},
Opened=false,
Type="Dropdown",
Callback=r.Callback or function()end,
Changed=r.Changed or function()end
}

local u=require(n.Element)(r.Title,r.Description,p.Container,false)
u.DescLabel.Size=UDim2.new(1,-170,0,14)

t.SetTitle=u.SetTitle
t.SetDesc=u.SetDesc

local v=m("TextLabel",{
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

local w=m("ImageLabel",{
Image="rbxassetid://10709790948",
Size=UDim2.fromOffset(16,16),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-8,0.5,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="SubText",
}
})

local x=m("TextButton",{
Size=UDim2.fromOffset(160,30),
Position=UDim2.new(1,-10,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=0.9,
Parent=u.Frame,
ThemeTag={
BackgroundColor3="DropdownFrame"
}
},{
m("UICorner",{
CornerRadius=UDim.new(0,5),
}),
m("UIStroke",{
Transparency=0.5,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
ThemeTag={
Color="InElementBorder",
},
}),
w,
v,
})

local y=m("UIListLayout",{
Padding=UDim.new(0,3),
})

local z=m("ScrollingFrame",{
Size=UDim2.new(1,-5,1,t.Searchable and-40 or-10),
Position=UDim2.fromOffset(5,t.Searchable and 40 or 5),
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
y,
})

local A=m("Frame",{
Size=UDim2.fromScale(1,0.6),
ThemeTag={
BackgroundColor3="DropdownHolder",
},
},{
z,
m("UICorner",{
CornerRadius=UDim.new(0,7),
}),
m("UIStroke",{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
ThemeTag={
Color="DropdownBorder",
},
}),
m("ImageLabel",{
BackgroundTransparency=1,
Image="http://www.roblox.com/asset/?id=5554236805",
ScaleType=Enum.ScaleType.Slice,
SliceCenter=Rect.new(23,23,277,277),
Size=UDim2.fromScale(1,1)+UDim2.fromOffset(30,30),
Position=UDim2.fromOffset(-15,-15),
ImageColor3=Color3.fromRGB(0,0,0),
ImageTransparency=0.1,
}),
})::Frame

local B=require(n.Textbox)(A,true)
B.Frame.Visible=t.Searchable
B.Frame.AnchorPoint=Vector2.new(0.5,0)
B.Frame.Position=UDim2.new(0.5,0,0,5)
B.Frame.Size=UDim2.new(1,-5,0,32)
B.Input.PlaceholderText=t.SearchPlaceholder
B.Input.Text=""

local C=B.Input

local D=m("Frame",{
Size=UDim2.fromOffset(4,14),
BackgroundColor3=Color3.fromRGB(76,194,255),
Position=UDim2.fromOffset(-1,16),
AnchorPoint=Vector2.new(0,0.5),
ThemeTag={
BackgroundColor3="Accent",
}
},{
m("UICorner",{
CornerRadius=UDim.new(0,2),
}),
})::Frame

local E=m("TextLabel",{
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
})::TextLabel

local F=m("TextButton",{
Size=UDim2.new(1,-5,0,32),
BackgroundTransparency=1,
ZIndex=23,
Text="",
ThemeTag={
BackgroundColor3="DropdownOption"
}
},{
D,
E,
m("UICorner",{
CornerRadius=UDim.new(0,6),
})
})::TextButton

local G=m("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromOffset(170,300),
Parent=p.Library.GUI,
Visible=false,
},{
A,
m("UISizeConstraint",{
MinSize=Vector2.new(170,0),
}),
})

s.OpenFrames[#s.OpenFrames+1]=G

local function RecalculateListPosition()
local H=0
if i.ViewportSize.Y-x.AbsolutePosition.Y<G.AbsoluteSize.Y-5 then
H=G.AbsoluteSize.Y
-5
-(i.ViewportSize.Y-x.AbsolutePosition.Y)
+40
end
G.Position=
UDim2.fromOffset(x.AbsolutePosition.X-1,x.AbsolutePosition.Y-5-H)
end

local H=0
local function RecalculateListSize()
local I=t.Searchable and 42 or 0
local J=t.Searchable and 35 or 0

G.Size=UDim2.fromOffset(H,math.min(392-I,y.AbsoluteContentSize.Y+10+J))
end

local function RecalculateCanvasSize()
z.CanvasSize=UDim2.fromOffset(0,y.AbsoluteContentSize.Y)
end

local function RepopulateDropdownList()
t:BuildDropdownList()
end

RecalculateListPosition()
RecalculateListSize()

k.AddSignal(x:GetPropertyChangedSignal"AbsolutePosition",RecalculateListPosition)
k.AddSignal(C:GetPropertyChangedSignal"Text",RepopulateDropdownList)

local I=p.ScrollFrame
function t.Open(J)
t.Opened=true
I.ScrollingEnabled=false
G.Visible=true
A:TweenSize(
UDim2.fromScale(1,1),
Enum.EasingDirection.Out,
Enum.EasingStyle.Quart,
.2
)

if t.Searchable then
C.Text=""

if t.FocusSearch then
C:CaptureFocus()
end
end
end

function t.Close(J)
t.Opened=false
I.ScrollingEnabled=true
A.Size=UDim2.fromScale(1,0.6)
G.Visible=false

if t.Searchable then
C.Text=""
C:ReleaseFocus()
end
end

k.AddSignal(x.MouseButton1Click,function()
t:Open()
end)

k.AddSignal(g.InputBegan,function(J)
if
J.UserInputType==Enum.UserInputType.MouseButton1
or J.UserInputType==Enum.UserInputType.Touch
then
local K,L=A.AbsolutePosition,A.AbsoluteSize
if
h.X<K.X
or h.X>K.X+L.X
or h.Y<(K.Y-20-1)
or h.Y>K.Y+L.Y
then
t:Close()
end
end
end)

function t.Display(J)
local K=t.Values
local L=""

if r.Multi then
for M,N in next,K do
if t.Value[N]then
L=`{L}{t.Displayer(N)}, `
end
end
L=L:sub(1,#L-2)
else
L=t.Value and t.Displayer(t.Value)or""
end

v.Text=(L==""and"--"or L)
end

function t.GetActiveValues(J)
if r.Multi then
local K={}

for L,M in next,t.Value do
K[#K+1]=L
end

return K
else
return t.Value and 1 or 0
end
end

function t.BuildDropdownList(J)
local K=t.Values
local L={}

for M,N in next,z:GetChildren()do
if not N:IsA"UIListLayout"then
N:Destroy()
end
end

local M=0

for N,O in next,K do
M+=1

if M%30==0 then
task.wait()
end

if t.Searchable and C.Text~=""and not string.lower(t.Displayer(O)):match(string.lower(C.Text))then
continue
end

local P={}
local Q

local R=F:Clone()
local S,T=R.Frame,R.ButtonLabel





k.AddThemeObject(R,{
BackgroundColor3="DropdownOption"
})

k.AddThemeObject(S,{
BackgroundColor3="Accent",
})

k.AddThemeObject(T,{
TextColor3="Text"
})

if r.Multi then
Q=t.Value[O]
else
Q=t.Value==O
end local

U, V=k.SpringMotor(1,R,"BackgroundTransparency")local
W, X=k.SpringMotor(1,S,"BackgroundTransparency")
local Y=l.SingleMotor.new(6)

Y:onStep(function(Z)
S.Size=UDim2.new(0,4,0,Z)
end)

k.AddSignal(R.MouseEnter,function()
V(Q and 0.85 or 0.89)
end)

k.AddSignal(R.MouseLeave,function()
V(Q and 0.89 or 1)
end)

k.AddSignal(R.MouseButton1Down,function()
V(0.92)
end)

k.AddSignal(R.MouseButton1Up,function()
V(Q and 0.85 or 0.89)
end)

function P.UpdateButton(Z)
if r.Multi then
Q=t.Value[O]
if Q then
V(0.89)
end
else
Q=t.Value==O
V(Q and 0.89 or 1)
end

Y:setGoal(l.Spring.new(Q and 14 or 6,{frequency=6}))
X(Q and 0 or 1)
end

T.InputBegan:Connect(function(Z)
if
Z.UserInputType==Enum.UserInputType.MouseButton1
or Z.UserInputType==Enum.UserInputType.Touch
then
local _=not Q

if t:GetActiveValues()==1 and not _ and not r.AllowNull then
else
if r.Multi then
Q=_
t.Value[O]=Q and true or nil

if typeof(t.Callback)=="function"then
s:SafeCallback(t.Callback,t.Value)
end
if typeof(t.Changed)=="function"then
s:SafeCallback(t.Changed,t.Value)
end
else
Q=_
t:SetValue(Q and O or nil)

for ab,ac in next,L do
ac:UpdateButton()
end
end

P:UpdateButton()
t:Display()
end
end
end)

T.Text=t.Displayer(O)
R.Parent=z

P:UpdateButton()
t:Display()

L[R]=P
end

H=0

for ab,ac in next,L do
if ab.ButtonLabel then
if ab.ButtonLabel.TextBounds.X>H then
H=ab.ButtonLabel.TextBounds.X
end
end
end

H=H+30

RecalculateCanvasSize()
RecalculateListSize()
end

function t.SetValues(ab,ac)
if ac then
rawset(t,"Values",ac)
end

t:BuildDropdownList()
end

function t.OnChanged(ab,ac)
t.Changed=ac
s:SafeCallback(ac,t.Value,t.Value)
end

function t.SetValue(ab,ac)
if t.Multi then
local J={}

for K,L in next,ac do
if table.find(t.Values,K)then
J[K]=true
end
end

rawset(t,"Value",J)
else
if not ac then
rawset(t,"Value",nil)
elseif table.find(t.Values,ac)then
rawset(t,"Value",ac)
end
end

t:BuildDropdownList()

if typeof(t.Callback)=="function"then
s:SafeCallback(t.Callback,t.Value)
end
if typeof(t.Changed)=="function"then
s:SafeCallback(t.Changed,t.Value)
end
end

function t.Destroy(ab)
u:Destroy()
s.Options[q]=nil
end

t:BuildDropdownList()
t:Display()

local ab={}

if type(r.Default)=="table"then
for ac,J in next,r.Default do
local K=table.find(t.Values,J)

if K then
ab[#ab+1]=K
end
end
table.clear(r.Default)
elseif type(r.Default)=="number"and t.Values[r.Default]~=nil then
ab[#ab+1]=r.Default
else
local ac=table.find(t.Values,r.Default)
if ac then
ab[#ab+1]=ac
end
end

if next(ab)then
for ac=1,#ab do
local J=ab[ac]

if r.Multi then
t.Value[t.Values[J] ]=true
else
t.Value=t.Values[J]
break
end
end

t:BuildDropdownList()
t:Display()
end

s.Options[q]=t

t.Instance=u

return setmetatable(t,{
__newindex=function(ac,J,K)
if J=="Value"then
task.spawn(t.SetValue,t,K)
elseif J=="Values"or J=="List"then
task.spawn(t.SetValues,t,K)
end
rawset(ac,J,K)
end
})
end

return o

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

local g=ac.AddSignal
local h=ab.Components

local i={}
i.__index=i
i.__type="Input"

function i.New(j,k,l)
local m=j.Library
assert(l.Title,"Input - Missing Title")
l.Callback=l.Callback or function()end

local n={
Value=l.Default or l.Value or"",
Numeric=l.Numeric or false,
Finished=l.Finished or false,
Callback=l.Callback or function(n)end,
ClearOnFocusLost=l.ClearOnFocusLost or false,
Type="Input",
}

local o=require(h.Element)(l.Title,l.Description,j.Container,false)

n.SetTitle=o.SetTitle
n.SetDesc=o.SetDesc

local p=require(h.Textbox)(o.Frame,true)
p.Frame.Position=UDim2.new(1,-10,0.5,0)
p.Frame.AnchorPoint=Vector2.new(1,0.5)
p.Frame.Size=UDim2.fromOffset(160,30)
p.Input.Text=l.Default or""
p.Input.PlaceholderText=l.Placeholder or""

local q=p.Input

function n.SetValue(r,s)
if l.MaxLength and#s>l.MaxLength then
s=s:sub(1,l.MaxLength)
end

if n.Numeric then
if(not tonumber(s))and s:len()>0 then
s=n.Value
end
end

rawset(n,"Value",s)
q.Text=s

if typeof(n.Callback)=="function"then
m:SafeCallback(n.Callback,n.Value)
end
if typeof(n.Changed)=="function"then
m:SafeCallback(n.Changed,n.Value)
end
end

if n.Finished then
g(q.FocusLost,function(r:boolean,s:InputObject)
if not r then
return
end

n:SetValue(q.Text)

if l.ClearOnFocusLost then
q.Text=""
end
end)
else
g(q:GetPropertyChangedSignal"Text",function()
n:SetValue(q.Text)
end)
end

function n.OnChanged(r,s)
n.Changed=s
m:SafeCallback(s,n.Value,n.Value)
end

function n.Destroy(r)
o:Destroy()
m.Options[k]=nil
end

m.Options[k]=n

n.Instance=o

return setmetatable(n,{
__newindex=function(r,s,t)
if s=="Value"then
task.spawn(n.SetValue,n,t)
end
rawset(r,s,t)
end
})
end

return i

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
local g=require(ac.Modules.Creator)

local h=g.New
local i=ac.Components

local j={}
j.__index=j
j.__type="Keybind"

function j.New(k,l,m)
local n=k.Library

local o={
Value=m.Default or m.Value or Enum.KeyCode.Unknown,
Toggled=false,
Mode=m.Mode or"Toggle",
Type="Keybind",
Callback=m.Callback or function(o)end,
ChangedCallback=m.ChangedCallback or function(o)end,
}

local p=false

local q=require(i.Element)(m.Title or"Keybind",m.Description,k.Container,true)

o.SetTitle=q.SetTitle
o.SetDesc=q.SetDesc

local r=h("TextLabel",{
FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal),
Text=n.Utilities:Prettify(o.Value),
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


local s=h("TextButton",{
Size=UDim2.fromOffset(20,30),
Position=UDim2.new(1,-10,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
Text="X",
TextColor3=Color3.fromRGB(150,150,150),
TextSize=14,
FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Bold),
Parent=q.Frame,
ThemeTag={
TextColor3="SubText"
},
Visible=false
})

local t=h("TextButton",{
Size=UDim2.fromOffset(0,30),
Position=UDim2.new(1,-30,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=0.9,
Parent=q.Frame,
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
r,
})::TextButton

local function UpdateClearButton()
local u=o.Value
if u==Enum.KeyCode.Unknown or u=="None"or u==nil then
s.Visible=false
t.Position=UDim2.new(1,-10,0.5,0)
else
s.Visible=true
t.Position=UDim2.new(1,-30,0.5,0)
end
end


s.MouseButton1Click:Connect(function()
o:SetValue("None",o.Mode)
end)

function o.GetState(u)
if ab:GetFocusedTextBox()and o.Mode~="Always"then
return false
end

if o.Mode=="Always"then
return true
elseif o.Mode=="Hold"then
if o.Value=="None"then
return false
end

local v=o.Value

if v=="LeftMousebutton"or v=="RightMousebutton"then
return v=="LeftMousebutton"and ab:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
or v=="RightMousebutton"
and ab:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
else
return ab:IsKeyDown(Enum.KeyCode[o.Value])
end
else
return o.Toggled
end
end

function o.SetValue(u,v,w)
v=v or o.Value
w=w or o.Mode

rawset(o,"Value",v)
o.Mode=w

r.Text=n.Utilities:Prettify(o.Value)
UpdateClearButton()

if typeof(o.ChangedCallback)=="function"then
n:SafeCallback(o.ChangedCallback,v)
end
if typeof(o.Changed)=="function"then
n:SafeCallback(o.Changed,v)
end
end

function o.OnClick(u,v)
o.Clicked=v
end

function o.OnChanged(u,v)
o.Changed=v
n:SafeCallback(v,o.Value,o.Value)
end

function o.DoClick(u)
if typeof(o.Callback)=="function"then
n:SafeCallback(o.Callback,o.Toggled)
end
if typeof(o.Clicked)=="function"then
n:SafeCallback(o.Clicked,o.Toggled)
end
end

function o.Destroy(u)
q:Destroy()
n.Options[l]=nil
end

g.AddSignal(t.InputBegan,function(u)
if u.UserInputType==Enum.UserInputType.MouseButton2 then
o:SetValue"None"
return
end

if
u.UserInputType==Enum.UserInputType.MouseButton1
or u.UserInputType==Enum.UserInputType.Touch
then
p=true
r.Text="..."

wait(0.2)

ab.InputBegan:Once(function(v)
local w

if v.UserInputType==Enum.UserInputType.Keyboard then
w=v.KeyCode.Name
elseif v.UserInputType==Enum.UserInputType.MouseButton1 then
w="LeftMousebutton"
elseif v.UserInputType==Enum.UserInputType.MouseButton2 then
w="RightMousebutton"
end

ab.InputEnded:Once(function(x)
if(x.KeyCode.Name==w
or w=="LeftMousebutton"and x.UserInputType==Enum.UserInputType.MouseButton1
or w=="RightMousebutton"and x.UserInputType==Enum.UserInputType.MouseButton2)
and not n.Unloaded
then
p=false

o.Value=w

r.Text=n.Utilities:Prettify(o.Value)
UpdateClearButton()

if typeof(o.ChangedCallback)=="function"then
n:SafeCallback(o.ChangedCallback,x.KeyCode or x.UserInputType)
end
if typeof(o.Changed)=="function"then
n:SafeCallback(o.Changed,x.KeyCode or x.UserInputType)
end
end
end)
end)
end
end)

g.AddSignal(ab.InputBegan,function(u)
if not p and not ab:GetFocusedTextBox()then
if o.Mode=="Toggle"then
local v=o.Value

if v=="LeftMousebutton"or v=="RightMousebutton"then
if
v=="LeftMousebutton"and u.UserInputType==Enum.UserInputType.MouseButton1
or v=="RightMousebutton"and u.UserInputType==Enum.UserInputType.MouseButton2
then
o.Toggled=not o.Toggled
o:DoClick()
end
elseif u.UserInputType==Enum.UserInputType.Keyboard then
if u.KeyCode.Name==v or u.KeyCode==v then
o.Toggled=not o.Toggled
o:DoClick()
end
end
end
end
end)

o:SetValue(o.Value)

n.Options[l]=o

o.Instance=q

return setmetatable(o,{
__newindex=function(u,v,w)
if v=="Value"then
task.spawn(o.SetValue,o,w)
end
rawset(u,v,w)
end
})
end

return j

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

local g={}
g.__index=g
g.__type="Paragraph"

function g.New(h,i,j)
local k=h.Library
assert(j.Title,"Paragraph - Missing Title")
j.Content=j.Content or""

local l={
Value=j.Content,
Callback=j.Callback or function(l:string)end,
Type="Paragraph",
}

local m=require(ac.Element)(j.Title,l.Value,h.Container,false,{
TitleAlignment=j.TitleAlignment=="Middle"and"Center"or j.TitleAlignment,
DescriptionAlignment=j.ContentAlignment=="Middle"and"Center"or j.ContentAlignment
})

m.Frame.BackgroundTransparency=0.92
m.Border.Transparency=0.6


function l.OnChanged(n,o)
l.Changed=o
k:SafeCallback(o,l.Value,l.Value)
end

function l.SetContent(n,o)
o=o or""
rawset(l,"Value",o)

m:SetDesc(o)

m.Frame.BackgroundTransparency=0.92
m.Border.Transparency=0.6

if typeof(l.Callback)=="function"then
k:SafeCallback(l.Callback,l.Value)
end
if typeof(l.Changed)=="function"then
k:SafeCallback(l.Changed,l.Value)
end
end

function l.SetValue(n,o)
l:SetContent(o)
end

function l.Destroy(n)
m:Destroy()
k.Options[i]=nil
end

l:SetValue(l.Value)

k.Options[i]=l

l.Instance=m

return setmetatable(l,{
__newindex=function(n,o,p)
if o=="Value"then
task.spawn(l.SetValue,l,p)
end
rawset(n,o,p)
end
})

end

return g

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
local g=require(ac.Modules.Creator)

local h=g.New
local i=ac.Components

local j={}
j.__index=j
j.__type="Slider"

function j.New(k,l,m)
local n=k.Library
assert(m.Max,"Slider - Missing maximum value.")

local o={
Value=nil,
Min=typeof(m.Min)=="number"and m.Min or 0,
Max=m.Max,
Rounding=typeof(m.Rounding)=="number"and m.Rounding or 0,
Callback=typeof(m.Callback)=="function"and m.Callback or function(o,p)end,
Changed=m.Changed or function()end,
Type="Slider"
}

local p=false

local q=require(i.Element)(m.Title or"Slider",m.Description,k.Container,false)
q.DescLabel.Size=UDim2.new(1,-170,0,14)

o.SetTitle=q.SetTitle
o.SetDesc=q.SetDesc

local r=h("ImageLabel",{
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,-7,0.5,0),
Size=UDim2.fromOffset(14,14),
Image="http://www.roblox.com/asset/?id=12266946128",
ThemeTag={
ImageColor3="Accent",
}
})

local s=h("Frame",{
BackgroundTransparency=1,
Position=UDim2.fromOffset(7,0),
Size=UDim2.new(1,-14,1,0)
},{
r,
})

local t=h("Frame",{
Size=UDim2.new(0,0,1,0),
ThemeTag={
BackgroundColor3="Accent",
}
},{
h("UICorner",{
CornerRadius=UDim.new(1,0),
})
})

local u=h("TextBox",{
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

h("Frame",{
Size=UDim2.new(1,0,0,4),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-10,0.5,0),
BackgroundTransparency=0.4,
Parent=q.Frame,
ThemeTag={
BackgroundColor3="SliderRail",
}
},{
h("UICorner",{
CornerRadius=UDim.new(1,0),
}),
h("UISizeConstraint",{
MaxSize=Vector2.new(150,math.huge),
}),
u,
t,
s
})

g.AddSignal(r.InputBegan,function(v)
if
v.UserInputType==Enum.UserInputType.MouseButton1
or v.UserInputType==Enum.UserInputType.Touch
then
p=true
end
end)

g.AddSignal(r.InputEnded,function(v)
if
v.UserInputType==Enum.UserInputType.MouseButton1
or v.UserInputType==Enum.UserInputType.Touch
then
p=false
end
end)

function o.OnChanged(v,w)
o.Changed=w
n:SafeCallback(w,o.Value,o.Value)
end

function o.SetValue(v,w:number)
local x=v.Value or w

rawset(v,"Value",n.Utilities:Round(math.clamp(w,o.Min,o.Max),o.Rounding))

r.Position=UDim2.new((v.Value-o.Min)/(o.Max-o.Min),-7,0.5,0)
t.Size=UDim2.fromScale((v.Value-o.Min)/(o.Max-o.Min),1)
u.Text=tostring(v.Value)

if typeof(o.Callback)=="function"then
n:SafeCallback(o.Callback,v.Value,x)
end
if typeof(o.Changed)=="function"then
n:SafeCallback(o.Changed,v.Value,x)
end
end

g.AddSignal(ab.InputChanged,function(v)
if
p
and(
v.UserInputType==Enum.UserInputType.MouseMovement
or v.UserInputType==Enum.UserInputType.Touch
)
then
local w=
math.clamp((v.Position.X-s.AbsolutePosition.X)/s.AbsoluteSize.X,0,1)
o:SetValue(o.Min+((o.Max-o.Min)*w))
end
end)

g.AddSignal(u.FocusLost,function()
o:SetValue(tonumber(u.Text)or o.Value)
end)

function o.Destroy(v)
q:Destroy()
n.Options[l]=nil
end

o:SetValue(typeof(m.Default)=="number"and m.Default or o.Min)

n.Options[l]=o

o.Instance=q

return setmetatable(o,{
__newindex=function(v,w,x)
if w=="Value"then
task.spawn(o.SetValue,o,x)
end
rawset(v,w,x)
end
})
end

return j

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
local g=aa.Parent.Parent
local h=require(g.Modules.Creator)

local i=h.New
local j=g.Components


local k=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
local l=UDim2.new(0,19,0.5,0)
local m=UDim2.new(0,2,0.5,0)

local n={}
n.__index=n
n.__type="Toggle"

function n.New(o,p,q)
local r=o.Library
assert(q.Title,"Toggle - Missing Title")

local s={
Value=q.Default or q.Value or false,
Callback=q.Callback or function(s)end,
Type="Toggle",
}

local t=require(j.Element)(q.Title,q.Description,o.Container,true)
t.DescLabel.Size=UDim2.new(1,-54,0,14)

s.SetTitle=t.SetTitle
s.SetDesc=t.SetDesc

local u=i("ImageLabel",{
AnchorPoint=Vector2.new(0,0.5),
Size=UDim2.fromOffset(14,14),
Position=UDim2.new(0,2,0.5,0),
Image="http://www.roblox.com/asset/?id=12266946128",
ImageTransparency=0.5,
ThemeTag={
ImageColor3="ToggleSlider",
},
})::ImageLabel

local v=i("UIStroke",{
Transparency=0.5,
ThemeTag={
Color="ToggleSlider",
},
})

local w=i("Frame",{
Size=UDim2.fromOffset(36,18),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-10,0.5,0),
Parent=t.Frame,
BackgroundTransparency=1,
ThemeTag={
BackgroundColor3="Accent",
},
},{
i("UICorner",{
CornerRadius=UDim.new(0,9),
}),
v,
u,
})::Frame

function s.OnChanged(x,y)
s.Changed=y
r:SafeCallback(y,s.Value,s.Value)
end

function s.SetValue(x,y)
y=not not y

rawset(s,"Value",y)

h.OverrideTag(v,{Color=s.Value and"Accent"or"ToggleSlider"})
h.OverrideTag(u,{ImageColor3=s.Value and"ToggleToggled"or"ToggleSlider"})

u:TweenPosition(
s.Value and l or m,
Enum.EasingDirection.Out,
Enum.EasingStyle.Quint,
0.25,
true
)

ab:Create(
w,
k,
{BackgroundTransparency=s.Value and 0 or 1}
):Play()

u.ImageTransparency=s.Value and 0 or 0.5

if typeof(s.Callback)=="function"then
r:SafeCallback(s.Callback,s.Value)
end
if typeof(s.Changed)=="function"then
r:SafeCallback(s.Changed,s.Value)
end
end

function s.Destroy(x)
t:Destroy()
r.Options[p]=nil
end

h.AddSignal(t.Frame.MouseButton1Click,function()
s:SetValue(not s.Value)
end)

s.Keybind=setmetatable({},{
__call=function(x,y,z,A)
local B={
Value=A.Default or A.Value or Enum.KeyCode.Unknown,
Toggled=false,
Mode=A.Mode or"Toggle",
Type="Keybind",
Callback=A.Callback or function(B)end,
ChangedCallback=A.ChangedCallback or function(B)end,
Instance=nil
}

local C=false

local D=i("TextLabel",{
FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal),
Text=r.Utilities:Prettify(B.Value),
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


local E=i("TextButton",{
Size=UDim2.fromOffset(20,20),
Position=UDim2.new(1,-55,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
Text="X",
TextColor3=Color3.fromRGB(100,100,100),
TextSize=12,
FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Bold),
Parent=t.Frame,
ThemeTag={
TextColor3="SubText"
},
Visible=false
})

local F:TextButton=i("TextButton",{
Size=UDim2.fromOffset(0,30),
Position=UDim2.new(1,-55,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=0.9,
Parent=t.Frame,
AutomaticSize=Enum.AutomaticSize.X,
ThemeTag={
BackgroundColor3="Keybind",
},
},{
i("UICorner",{
CornerRadius=UDim.new(0,5),
}),
i("UIPadding",{
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
}),
i("UIStroke",{
Transparency=0.5,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
ThemeTag={
Color="InElementBorder",
},
}),
D
})::TextButton

local function UpdateClearButton()
local G=B.Value
if G==Enum.KeyCode.Unknown or G=="None"or G==nil then
E.Visible=false
F.Position=UDim2.new(1,-55,0.5,0)
else
E.Visible=true
F.Position=UDim2.new(1,-75,0.5,0)
end
end


E.MouseButton1Click:Connect(function()
B:SetValue"None"
end)

B.Instance=setmetatable({
CreatedAt=tick()
},{
__index=function(G,H)
if rawget(G,H)then
return rawget(G,H)
else
return F[H]
end
end
})

function B.GetState(G)
if ac:GetFocusedTextBox()and G.Mode~="Always"then
return false
end

if G.Mode=="Always"then
return true
elseif G.Mode=="Hold"then
if G.Value=="None"then
return false
end

local H=G.Value

if H=="LeftMousebutton"or H=="RightMousebutton"then
return H=="LeftMousebutton"and ac:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
or H=="RightMousebutton"
and ac:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
else
return ac:IsKeyDown(Enum.KeyCode[G.Value])
end
else
return G.Toggled
end
end

function B.SetValue(G,H,I)
H=H or G.Value
I=I or G.Mode

G.Value=H
G.Mode=I

D.Text=r.Utilities:Prettify(G.Value)
UpdateClearButton()

if typeof(G.ChangedCallback)=="function"then
r:SafeCallback(G.ChangedCallback,H)
end
if typeof(G.Changed)=="function"then
r:SafeCallback(G.Changed,H)
end
end

function B.OnClick(G,H)
G.Clicked=H
end

function B.OnChanged(G,H)
G.Changed=H
r:SafeCallback(H,G.Value,G.Value)
end

function B.DoClick(G)
s:SetValue(not s.Value)

if typeof(G.Callback)=="function"then
r:SafeCallback(G.Callback,G.Value)
end
if typeof(G.Clicked)=="function"then
r:SafeCallback(G.Clicked,G.Value)
end
end

function B.Destroy(G)
F:Destroy()
E:Destroy()
r.Options[z]=nil
end

h.AddSignal(F.InputBegan,function(G)

if G.UserInputType==Enum.UserInputType.MouseButton2 then
B:SetValue"None"
return
end

if
G.UserInputType==Enum.UserInputType.MouseButton1
or G.UserInputType==Enum.UserInputType.Touch
then
C=true
D.Text="..."

wait(0.2)

ac.InputBegan:Once(function(H)
local I

if H.UserInputType==Enum.UserInputType.Keyboard then
I=H.KeyCode.Name
elseif H.UserInputType==Enum.UserInputType.MouseButton1 then
I="LeftMousebutton"
elseif H.UserInputType==Enum.UserInputType.MouseButton2 then
I="RightMousebutton"
end

ac.InputEnded:Once(function(J)
if(J.KeyCode.Name==I
or I=="LeftMousebutton"and J.UserInputType==Enum.UserInputType.MouseButton1
or I=="RightMousebutton"and J.UserInputType==Enum.UserInputType.MouseButton2)
and not r.Unloaded
then
C=false

B:SetValue(I)

if y.ChangedCallback then
r:SafeCallback(y.ChangedCallback,J.KeyCode or J.UserInputType)
end
if y.Changed then
r:SafeCallback(y.Changed,J.KeyCode or J.UserInputType)
end
end
end)
end)
end
end)

h.AddSignal(ac.InputBegan,function(G)
if not C and not ac:GetFocusedTextBox()then
if B.Mode=="Toggle"then
local H=B.Value

if H=="LeftMousebutton"or H=="RightMousebutton"then
if
H=="LeftMousebutton"and G.UserInputType==Enum.UserInputType.MouseButton1
or H=="RightMousebutton"and G.UserInputType==Enum.UserInputType.MouseButton2
then
B.Toggled=not B.Toggled
B:DoClick()
end
elseif G.UserInputType==Enum.UserInputType.Keyboard then
if G.KeyCode.Name==H or G.KeyCode==H then
B.Toggled=not B.Toggled
B:DoClick()
end
end
end
end
end)






UpdateClearButton()

r.Options[z]=B

s.Keybind=B

return setmetatable(s.Keybind,{
__newindex=function(G,H,I)
if H=="Value"then
task.spawn(B.SetValue,B,I)
end
rawset(G,H,I)
end
})
end
})

s:SetValue(s.Value)

r.Options[p]=s

s.Instance=t



return setmetatable(s,{
__newindex=function(x,y,z)
if y=="Value"then
task.spawn(s.SetValue,s,z)
end
rawset(x,y,z)
end
})
end

return n

end)()
end
b.Root=function()
local aa=createProxy"Root/Root"
local function require(ab)
local ac=tostring(ab):gsub("Root/","")
return __REQUIRE(ac)
end
return(function()

local function Clone<Original>(ab:any&Original):(Original,boolean)
local ac=typeof(ab)

if ac=="function"and(clonefunc or clonefunction)then
return(clonefunc or clonefunction)(ab),true
elseif ac=="Instance"and(cloneref or clonereference)then
return(cloneref or clonereference)(ab),true
elseif ac=="table"then
local function deepcopy(g,h:{[any]:any}?)
local i=h or{}
local j,k=(typeof(g))

if j=='table'then
if i[g]then
k=i[g]
else
k={}

i[g]=k

for l,m in next,g,nil do
k[deepcopy(l,i)]=deepcopy(m,i)
end

(setrawmetatable or setmetatable)(k,deepcopy((getrawmetatable or getmetatable)(g),i))
end
elseif j=='Instance'or j=='function'then
k=Clone(g)
else
k=g
end

return k
end

return deepcopy(ab),true
else
return ab,false
end
end


local ab={}
local function GetService(ac:string)
if not ab[ac]then
ab[ac]=Clone(game:GetService(ac))
end
return ab[ac]
end

local ac=GetService"MarketplaceService"
local g=GetService"TweenService"
local h=GetService"Workspace".CurrentCamera
local i=GetService"UserInputService"
local j=GetService"GuiService"

local k=aa
local l=k.Components

local m=require(k.Modules.Creator)
local n=require(k.Elements)
local o=require(k.Modules.Acrylic)
local p=require(k.Modules.Icons)
local q=require(k.Themes)
local r=require(k.Packages.Signal)

local s=require(l.Notification)

local t=shared or _G or(getgenv and getgenv())or getfenv(1)
local u=m.New

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

t.FluentRenewed=t.FluentRenewed or{}

s:Init(v)

local w={
Version="1.0.5",

OpenFrames={},
Options={},
Themes=q.Names,

OnUnload=r.new(),
PostUnload=r.new(),
ThemeChanged=r.new(),
CreatedWindow=nil,
WindowFrame=nil,
UIContainer=v.Parent,
Utilities={
Themes=q,
Shared=t,
Creator=m,
Icons=p
},
Connections=m.Signals,
Unloaded=false,
Loaded=true,

Theme="Dark",
DialogOpen=false,
UseAcrylic=false,
Acrylic=false,
Transparency=true,
MinimizeKey=Enum.KeyCode.LeftControl,

GUI=v
}

function w.SafeCallback(x,y,...)
assert(typeof(y)=="function",debug.traceback(`Library:SafeCallback expects type 'function' at Argument #1, got '{typeof(y)}'`,2))

task.spawn(function(...)
local z,A=pcall(y,...)

if not z then local
B, C=A:find":%d+: "

task.defer(error,debug.traceback(A,2))

w:Notify{
Title="Interface",
Content="Callback error",
SubContent=if typeof(C)=="number"then A:sub(C+1)else A,
Duration=5,
}
end
end,...)
end

function w.Utilities.Resize(x,y:number,z:number):(number,number)
local A,B,C=y/1920,z/1080,h.ViewportSize
return C.X*A,C.Y*B
end

function w.Utilities.Truncate(x,y:number,z:number,A:boolean):number
local B=10^(typeof(z)=="number"and math.max(z,0)or 0)

if A then
return math.round(y*B)//1/B
else
return y*B//1/B
end
end

function w.Utilities.Round(x,y:number,z:number):number
return w.Utilities:Truncate(y,z,true)
end

function w.Utilities.GetIcon(x,y:string):{Image:string,ImageRectSize:Vector2,ImageRectOffset:Vector2}
return y~="SetIcon"and p[y]or nil
end

function w.Utilities.Prettify(x,y:EnumItem&string&number):string|number
local z=tostring(y)
if z=="Enum.KeyCode.Unknown"or z=="Unknown"or z=="None"then
return"None"
end

if typeof(y)=="EnumItem"then
return({y.Name:gsub("(%l)(%u)","%1 %2")})[1]
elseif typeof(y)=="string"then
return({y:gsub("(%l)(%u)","%1 %2")})[1]
elseif typeof(y)=="number"then
return w.Utilities:Round(y,2)
else
return tostring(y)
end
end

function w.Utilities.Clone<Original>(x,y:{[any]:any}&((...any)->(any)&Object&Original)):(Original,boolean)
return Clone(y)
end

function w.Utilities.GetOS(x)
local y="Unknown"

if j:IsTenFootInterface()then
local z=i:GetStringForKeyCode(Enum.KeyCode.ButtonL2)

y=if z=="ButtonLT"then"Xbox"elseif z=="ButtonL2"then"PlayStation"else"Console"
elseif j.IsWindows then
y="Windows"
elseif version():find"^0."==1 then
y="macOS"
elseif version():find"^2."==1 then
y=i.VREnabled and"MetaHorizon"or"Mobile"
end

return y
end

local x={}
x.__index=x
x.__namecall=function(y,z,...)
return x[z](...)
end


for y=1,#n do
local z=n[y]
local A=function(A,B,C)
z.Container=A.Container
z.Type=A.Type
z.ScrollFrame=A.ScrollFrame
z.Library=w

return z:New(B,C)
end


if z.__type then

else
warn"Fluent: Element missing __type"
end

x["Create"..z.__type]=A
x["Add"..z.__type]=A
x[z.__type]=A
end

w.Elements=x

function w.Window(y,z:{
Title:string?,
SubTitle:string?,
TabWidth:number?,
MinSize:Vector2?,
Size:UDim2?,
Resize:boolean?,
MinimizeKey:Enum.KeyCode?,
Acrylic:boolean?,
Theme:string?,
Mobile:{
GetIcon:(IsMinimized:boolean)->{Image:string,ImageRectOffset:Vector2,ImageRectSize:Vector2},
Size:UDim2
}?
})
assert(w.CreatedWindow==nil,debug.traceback("You cannot create more than one window.",2))

if not z.Title then
local A,B=pcall(ac.GetProductInfo,ac,game.PlaceId)

z.Title=A and B.Name or"Fluent Renewed"
end

z.MinSize=if typeof(z.MinSize)=="Vector2"then z.MinSize else Vector2.new(470,380)

z.Size=if z.Resize~=true then z.Size else UDim2.fromOffset(w.Utilities:Resize((z.Size and z.Size.X.Offset)or 470,(z.Size and z.Size.Y.Offset)or 380))
z.MinSize=if z.Resize~=true then z.MinSize else Vector2.new(w.Utilities:Resize((z.MinSize and z.MinSize.X)or 470,(z.MinSize and z.MinSize.Y)or 380))

w.MinimizeKey=if typeof(z.MinimizeKey)=="string"or typeof(z.MinimizeKey)=="EnumItem"and z.MinimizeKey.EnumType==Enum.KeyCode then z.MinimizeKey else Enum.KeyCode.LeftControl
w.UseAcrylic=if typeof(z.Acrylic)=="boolean"then z.Acrylic else false
w.Acrylic=if typeof(z.Acrylic)=="boolean"then z.Acrylic else false
w.Theme=if typeof(z.Theme)=="string"then z.Theme else"Vynixu"

if z.Acrylic then
o.init()
end

local A=require(l.Window){
Config=z,
Parent=v,

Size=z.Size,
MinSize=z.MinSize,

Title=z.Title,
SubTitle=z.SubTitle or"Made with Fluent Renewed",

TabWidth=z.TabWidth or 160,
Mobile=z.Mobile or{
GetIcon=function(A:boolean):{Image:string,ImageRectOffset:Vector2,ImageRectSize:Vector2}
return w.Utilities:GetIcon(A and"phosphor-eye"or"phosphor-eye-slash")
end,
Size=UDim2.fromOffset(30,30)
}
}

v.Name=`FluentRenewed_{z.Title}`

w.CreatedWindow=A
w:SetTheme(w.Theme)

return A
end

function w.AddWindow(y,z)
return w:Window(z)
end

function w.CreateWindow(y,z)
return w:Window(z)
end

function w.SetTheme(y,z:string)
if w.CreatedWindow and table.find(w.Themes,z)then
w.Theme=z
m.UpdateTheme()
w.ThemeChanged:Fire(z)
end
end

function w.Destroy(y)
if w.CreatedWindow then
w.Unloaded=true
w.Loaded=false

w.OnUnload:Fire(tick())

if w.UseAcrylic then
w.CreatedWindow.AcrylicPaint.Model:Destroy()
end

m.Disconnect()

for z,A in next,w.Connections do
local B=typeof(A)

if B=="RBXScriptConnection"and A.Connected then
A:Disconnect()
end
end

local z,A,B=TweenInfo.new(0.6666666666666666,Enum.EasingStyle.Quint),{},false

local function IsA(C:Object,D:string)
local E=C:IsA(D)

if E then
B=true
end

return E
end

for C,D in next,w.GUI:GetDescendants()do
table.clear(A)

if IsA(D,"GuiObject")then
A.BackgroundTransparency=1
end

if IsA(D,"ScrollingFrame")then
A.ScrollBarImageTransparency=1
end

if IsA(D,"TextLabel")or IsA(D,"TextBox")then
A.TextStrokeTransparency=1
A.TextTransparency=1
end

if IsA(D,"UIStroke")then
A.Transparency=1
end

if IsA(D,"ImageLabel")or IsA(D,"ImageButton")then
A.ImageTransparency=1
end

if B then
B=false
g:Create(D,z,A):Play()
end
end

task.delay(z.Time,function()
w.GUI:Destroy()

w.PostUnload:Fire(tick())
end)
end
end

function w.ToggleAcrylic(y,z:boolean)
if w.CreatedWindow then
if w.UseAcrylic then
w.Acrylic=z
w.CreatedWindow.AcrylicPaint.Model.Transparency=z and 0.98 or 1
if z then
o.Enable()
else
o.Disable()
end
end
end
end

function w.ToggleTransparency(y,z:boolean)
if w.CreatedWindow then
w.CreatedWindow.AcrylicPaint.Frame.Background.BackgroundTransparency=z and 0.35 or 0
end
end

function w.Notify(y,z)
return s:New(z)
end

return w

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
local g=require(aa.Parent.CreateAcrylic)
local h,i=unpack(require(aa.Parent.Utils))

local j=Instance.new("Folder",game:GetService"Workspace".CurrentCamera)

local function createAcrylicBlur(k)
local l={}

k=k or 0.001
local m={
topLeft=Vector2.new(),
topRight=Vector2.new(),
bottomRight=Vector2.new(),
}
local n=g()
local o=n:FindFirstChildWhichIsA"SpecialMesh"

n.Parent=j

local function updatePositions(p,q)
m.topLeft=q
m.topRight=q+Vector2.new(p.X,0)
m.bottomRight=q+p
end

local function render()
local p=game:GetService"Workspace".CurrentCamera
local q=if p then p.CFrame else CFrame.identity

local r=m.topLeft
local s=m.topRight
local t=m.bottomRight

local u=h(r,k)
local v=h(s,k)
local w=h(t,k)

local x=(v-u).Magnitude
local y=(v-w).Magnitude

n.CFrame=
CFrame.fromMatrix((u+w)/2,q.XVector,q.YVector,q.ZVector)

if o then
o.Scale=Vector3.new(x,y,0)
end
end

local function onChange(p)
local q=i()
local r=p.AbsoluteSize-Vector2.new(q,q)
local s=p.AbsolutePosition+Vector2.new(q/2,q/2)

updatePositions(r,s)
task.spawn(render)
end

local function renderOnChange()
local p=game:GetService"Workspace".CurrentCamera
if not p then
return
end

l[#l+1]=p:GetPropertyChangedSignal"CFrame":Connect(render)
l[#l+1]=p:GetPropertyChangedSignal"ViewportSize":Connect(render)
l[#l+1]=p:GetPropertyChangedSignal"FieldOfView":Connect(render)
task.spawn(render)
end

n.Destroying:Connect(function()
for p,q in l do
pcall(function()
q:Disconnect()
end)
end
end)

renderOnChange()

return onChange,n
end

return function(k)
local l={}
local m,n=createAcrylicBlur(k)

local o=ac.New("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
})

ac.AddSignal(o:GetPropertyChangedSignal"AbsolutePosition",function()
m(o)
end)

ac.AddSignal(o:GetPropertyChangedSignal"AbsoluteSize",function()
m(o)
end)

l.AddParent=function(p)
ac.AddSignal(p:GetPropertyChangedSignal"Visible",function()
l.SetVisibility(p.Visible)
end)
end

l.SetVisibility=function(p)
n.Transparency=p and 0.98 or 1
end

l.Frame=o
l.Model=n

return l
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
local g=require(aa.Parent.AcrylicBlur)

local h=ac.New

return function(i)
local j={}

j.Frame=h("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0.9,
BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,
},{
h("ImageLabel",{
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

h("UICorner",{
CornerRadius=UDim.new(0,8),
}),

h("Frame",{
BackgroundTransparency=0.45,
Size=UDim2.fromScale(1,1),
Name="Background",
ThemeTag={
BackgroundColor3="AcrylicMain",
},
},{
h("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

h("Frame",{
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=0.4,
Size=UDim2.fromScale(1,1),
},{
h("UICorner",{
CornerRadius=UDim.new(0,8),
}),

h("UIGradient",{
Rotation=90,
ThemeTag={
Color="AcrylicGradient",
},
}),
}),

h("ImageLabel",{
Image="rbxassetid://9968344105",
ImageTransparency=0.98,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
},{
h("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

h("ImageLabel",{
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
h("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

h("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
ZIndex=2,
},{
h("UICorner",{
CornerRadius=UDim.new(0,8),
}),
h("UIStroke",{
Transparency=0.5,
Thickness=1,
ThemeTag={
Color="AcrylicBorder",
},
}),
}),
})

local k

if require(ab).UseAcrylic then
k=g()
k.Frame.Parent=j.Frame
j.Model=k.Model
j.AddParent=k.AddParent
j.SetVisibility=k.SetVisibility
end

return j
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
local g=ac.New("Part",{
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

return g
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

local g={}

function ab.Enable()
for h,i in next,g do
i.Enabled=false
end
ac.Parent=game:GetService"Lighting"
end

function ab.Disable()
for h,i in next,g do
i.Enabled=i.enabled
end
ac.Parent=nil
end

local function registerDefaults()
local function register(h)
if h:IsA"DepthOfFieldEffect"then
g[h]={enabled=h.Enabled}
end
end

for h,i in next,game:GetService"Lighting":GetChildren()do
register(i)
end

if game:GetService"Workspace".CurrentCamera then
for h,i in next,game:GetService"Workspace".CurrentCamera:GetChildren()do
register(i)
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
createProxy"Root/Modules/Acrylic/Utils"




return(function()
local function map(aa,ab,ac,g,h)
return(aa-ab)*(h-g)/(ac-ab)+g
end

local function viewportPointToWorld(aa,ab)
local ac=game:GetService"Workspace".CurrentCamera:ScreenPointToRay(aa.X,aa.Y)
return ac.Origin+ac.Direction*ab
end

local function getOffset()
local aa=game:GetService"Workspace".CurrentCamera.ViewportSize.Y
return map(aa,0,2560,8,56)
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
local ac=require(ab.Themes)local
g, h=require(ab.Packages.Flipper), require(ab.Packages.Ripple)
local i=require(ab.Packages.Signal)


local j
local function GetLibrary()
if not j then
j=require(ab)
end
return j
end

local k={
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
Updated=i.new()
}
}

local function ApplyCustomProps(l,m:{[string]:any}?)
if typeof(m)=="table"and m.ThemeTag then
k.AddThemeObject(l,m.ThemeTag)
end
end

function k.AddSignal(l:RBXScriptSignal,m)
k.Signals[#k.Signals+1]=l:Connect(m)
end

function k.Disconnect()
for l=#k.Signals,1,-1 do
local m=table.remove(k.Signals,l)

if m then
m:Disconnect()
end
end
end

function k.GetThemeProperty(l)
local m=GetLibrary().Theme
local n=ac[m]
if n and n[l]then
return n[l]
end
return ac.Dark[l]
end

function k.UpdateTheme(l:Instance?)
if k.Theme.Updating then
k.Theme.Updated:Wait()
end

k.Theme.Updating=true

local m=0

if typeof(l)=="Instance"and k.Registry[l]then
for n,o in pairs(k.Registry[l].Properties)do
m+=1

if m%135==0 then
task.wait()
end

l[n]=k.GetThemeProperty(o)
end
else
for n,o in pairs(k.Registry)do
m+=1

if m%135==0 then
task.wait()
end

for p,q in pairs(o.Properties)do
m+=1

if m%135==0 then
task.wait()
end

o.Object[p]=k.GetThemeProperty(q)
end
end
end

for n:number,o in pairs(k.TransparencyMotors)do
if n%135==0 then
task.wait()
end

o:setGoal(g.Instant.new(k.GetThemeProperty"ElementTransparency"))
end

k.Theme.Updating=false
k.Theme.Updated:Fire()
end

function k.AddThemeObject(l:Instance,m:{[string]:any})
local n=#k.Registry+1
local o={
Object=l,
Properties=m,
Idx=n,
}

k.Registry[l]=o
k.UpdateTheme(l)

return l
end

function k.OverrideTag(l,m)
k.Registry[l].Properties=m
k.UpdateTheme(l)
end

function k.New(l,m:{[string]:any}?,n:{[number]:Instance}?):Instance
local o=Instance.new(l)


for p,q in next,k.DefaultProperties[l]or{}do
o[p]=q
end


for p,q in next,m or{}do
if p~="ThemeTag"then
o[p]=q
end
end


for p,q in next,n or{}do
q.Parent=o
end

ApplyCustomProps(o,m)

return o
end

function k.SpringMotor(l:any,m:Object,n:string,o:boolean?,p:boolean?)
o=o or false
p=p or false
local q=g.SingleMotor.new(l)
q:onStep(function(r)
m[n]=r
end)

if p then
k.TransparencyMotors[#k.TransparencyMotors+1]=q
end

local function SetValue(r,s:boolean?)
s=s or false
if not o then
if not s then
if n=="BackgroundTransparency"and require(ab).DialogOpen then
return
end
end
end
q:setGoal(g.Spring.new(r,{frequency=8}))
end

return q,SetValue
end

return k

end)()
end
b["Modules/Icons"]=function()
createProxy"Root/Modules/Icons"




return(function()

local aa='rbxassetid://113826256227095'
local ab='rbxassetid://129900432084566'













local ac='rbxassetid://115396960406352'


local g='rbxassetid://95092644481468'


local h='rbxassetid://130974669650190'





local i='rbxassetid://133795234078681'








local j='rbxassetid://138343757151795'

local k='rbxassetid://139123669104105'
local l='rbxassetid://83798598825627'
local m='rbxassetid://93555120675964'


local n=setmetatable({},{
__index=function(n,o)
local p,q=o:match"^(%d+)_(%d+)$"
if p and q then
local r=Vector2.new(tonumber(p),tonumber(q))
rawset(n,o,r)
return r
end
return nil
end
})



local o={}
o.SetIcon=function(p,q:ImageLabel&ImageButton,r:string)
local s=p[r]

if typeof(s)~='table'then
local t
local u=math.huge

for v,w in next,p do
local x,y=v,r
local z,A=#x,#y
local B={}

for C=0,z do
B[C]={}
B[C][0]=C
end

for C=0,A do
B[0][C]=C
end

for C=1,z do
for D=1,A do
local E=(x:sub(C,C)==y:sub(D,D))and 0 or 1
B[C][D]=math.min(B[C-1][D]+1,B[C][D-1]+1,B[C-1][D-1]+E)
end
end

local C=B[z][A]

if C<u then
u=C
t=v
end
end

if t then
s=p[t]
if typeof(s)~='table'then
return error(debug.traceback(`Argument #2 '{r}' is not a valid Icon. Did you mean '{t}'?`))
end
else
return error(debug.traceback(`Argument #2 '{r}' is not a valid Icon. No similar names found.`))
end
end

q.ImageRectSize=s.ImageRectSize
q.ImageRectOffset=s.ImageRectOffset
q.Image=s.Image

return nil::never
end
o.Close="rbxassetid://9886659671"
o.Min="rbxassetid://9886659276"
o.Max="rbxassetid://9886659406"
o.Restore="rbxassetid://9886659001"
o['circle-user']={
ImageRectSize=n['64_64'],
ImageRectOffset=n['832_384'],
Image=aa
}
o.copy={
ImageRectSize=n['64_64'],
ImageRectOffset=n['960_704'],
Image=aa
}
o['eye-closed']={
ImageRectSize=n['64_64'],
ImageRectOffset=n['256_64'],
Image=ab
}
o['eye-off']={
ImageRectSize=n['64_64'],
ImageRectOffset=n['320_64'],
Image=ab
}
o.eye={
ImageRectSize=n['64_64'],
ImageRectOffset=n['384_64'],
Image=ab
}
o['phosphor-eye-bold']={
ImageRectSize=n['64_64'],
ImageRectOffset=n['640_896'],
Image=ac
}
o['phosphor-footprints-bold']={
ImageRectSize=n['64_64'],
ImageRectOffset=n['640_512'],
Image=g
}
o['phosphor-gear-bold']={
ImageRectSize=n['64_64'],
ImageRectOffset=n['640_896'],
Image=g
}
o['phosphor-house-bold']={
ImageRectSize=n['64_64'],
ImageRectOffset=n['896_448'],
Image=h
}
o['phosphor-user-bold']={
ImageRectSize=n['64_64'],
ImageRectOffset=n['384_768'],
Image=j
}
o['phosphor-wrench-bold']={
ImageRectSize=n['64_64'],
ImageRectOffset=n['256_384'],
Image=k
}
o.search={
ImageRectSize=n['64_64'],
ImageRectOffset=n['640_64'],
Image=l
}
o.settings={
ImageRectSize=n['64_64'],
ImageRectOffset=n['384_128'],
Image=l
}
o.user={
ImageRectSize=n['64_64'],
ImageRectOffset=n['640_192'],
Image=m
}
o.run={
ImageRectSize=n['64_64'],
ImageRectOffset=n['640_640'],
Image=i
}

if o['phosphor-house-bold']then o.home=o['phosphor-house-bold']end
if o['phosphor-footprints-bold']then o.footprints=o['phosphor-footprints-bold']end
if o['phosphor-eye-bold']then o.eye=o['phosphor-eye-bold']end
if o['phosphor-user-bold']then o.user=o['phosphor-user-bold']end
if o['phosphor-wrench-bold']then o.wrench=o['phosphor-wrench-bold']end
if o['phosphor-gear-bold']then o.settings=o['phosphor-gear-bold']end


if o.eye then o['phosphor-eye']=o.eye end
if o['eye-off']then o['phosphor-eye-slash']=o['eye-off']end
return o
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

local g=function()end

local h={}
h.__index=h

function h.new()
return setmetatable({
_onStep=ac.new(),
_onStart=ac.new(),
_onComplete=ac.new(),
},h)
end

function h.onStep(i,j)
return i._onStep:connect(j)
end

function h.onStart(i,j)
return i._onStart:connect(j)
end

function h.onComplete(i,j)
return i._onComplete:connect(j)
end

function h.start(i)
if not i._connection then
i._connection=ab.RenderStepped:Connect(function(j)
i:step(j)
end)
end
end

function h.stop(i)
if i._connection then
i._connection:Disconnect()
i._connection=nil
end
end

h.destroy=h.stop

h.step=g
h.getValue=g
h.setGoal=g

function h.__tostring(i)
return"Motor"
end

return h

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

local g=require(aa.Parent.isMotor)

local h=setmetatable({},ab)
h.__index=h

local function toMotor(i)
if g(i)then
return i
end

local j=typeof(i)

if j=="number"then
return ac.new(i,false)
elseif j=="table"then
return h.new(i,false)
end

error(("Unable to convert %q to motor; type %s is unsupported"):format(i,j),2)
end

function h.new(i,j)
assert(i,"Missing argument #1: initialValues")
assert(typeof(i)=="table","initialValues must be a table!")
assert(
not i.step,
'initialValues contains disallowed property "step". Did you mean to put a table of values here?'
)

local k=setmetatable(ab.new(),h)

if j~=nil then
k._useImplicitConnections=j
else
k._useImplicitConnections=true
end

k._complete=true
k._motors={}

for l,m in pairs(i)do
k._motors[l]=toMotor(m)
end

return k
end

function h.step(i,j)
if i._complete then
return true
end

local k=true

for l,m in pairs(i._motors)do
local n=m:step(j)
if not n then

k=false
end
end

i._onStep:fire(i:getValue())

if k then
if i._useImplicitConnections then
i:stop()
end

i._complete=true
i._onComplete:fire()
end

return k
end

function h.setGoal(i,j)
assert(not j.step,'goals contains disallowed property "step". Did you mean to put a table of goals here?')

i._complete=false
i._onStart:fire()

for k,l in pairs(j)do
local m=assert(i._motors[k],("Unknown motor for key %s"):format(k))
m:setGoal(l)
end

if i._useImplicitConnections then
i:start()
end
end

function h.getValue(i)
local j={}

for k,l in pairs(i._motors)do
j[k]=l:getValue()
end

return j
end

function h.__tostring(i)
return"Motor(Group)"
end

return h

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
createProxy"Root/Packages/Flipper/Instant"




return(function()
local aa={}
aa.__index=aa

function aa.new(ab)
return setmetatable({
_targetValue=ab,
},aa)
end

function aa.step(ab)
return{
complete=true,
value=ab._targetValue,
}
end

return aa

end)()
end
b["Packages/Flipper/isMotor"]=function()
createProxy"Root/Packages/Flipper/isMotor"




return(function()
local function isMotor(aa)
local ab=tostring(aa):match"^Motor%((.+)%)$"

if ab then
return true,ab
else
return false
end
end

return isMotor

end)()
end
b["Packages/Flipper/Linear"]=function()
createProxy"Root/Packages/Flipper/Linear"




return(function()
local aa={}
aa.__index=aa

function aa.new(ab,ac)
assert(ab,"Missing argument #1: targetValue")

ac=ac or{}

return setmetatable({
_targetValue=ab,
_velocity=ac.velocity or 1,
},aa)
end

function aa.step(ab,ac,g)
local h=ac.value
local i=ab._velocity
local j=ab._targetValue

local k=g*i

local l=k>=math.abs(j-h)
h=h+k*(j>h and 1 or-1)
if l then
h=ab._targetValue
i=0
end

return{
complete=l,
value=h,
velocity=i,
}
end

return aa

end)()
end
b["Packages/Flipper/Signal"]=function()
createProxy"Root/Packages/Flipper/Signal"




return(function()
local aa={}
aa.__index=aa

function aa.new(ab,ac)
return setmetatable({
signal=ab,
connected=true,
_handler=ac,
},aa)
end

function aa.disconnect(ab)
if ab.connected then
ab.connected=false

for ac,g in pairs(ab.signal._connections)do
if g==ab then
table.remove(ab.signal._connections,ac)
return
end
end
end
end

local ab={}
ab.__index=ab

function ab.new()
return setmetatable({
_connections={},
_threads={},
},ab)
end

function ab.fire(ac,...)
for g,h in pairs(ac._connections)do
h._handler(...)
end

for g,h in pairs(ac._threads)do
coroutine.resume(h,...)
end

ac._threads={}
end

function ab.connect(ac,g)
local h=aa.new(ac,g)
table.insert(ac._connections,h)
return h
end

function ab.wait(ac)
table.insert(ac._threads,coroutine.running())
return coroutine.yield()
end

return ab

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

function ac.new(g,h)
assert(g,"Missing argument #1: initialValue")
assert(typeof(g)=="number","initialValue must be a number!")

local i=setmetatable(ab.new(),ac)

if h~=nil then
i._useImplicitConnections=h
else
i._useImplicitConnections=true
end

i._goal=nil
i._state={
complete=true,
value=g,
}

return i
end

function ac.step(g,h)
if g._state.complete then
return true
end

local i=g._goal:step(g._state,h)

g._state=i
g._onStep:fire(i.value)

if i.complete then
if g._useImplicitConnections then
g:stop()
end

g._onComplete:fire()
end

return i.complete
end

function ac.getValue(g)
return g._state.value
end

function ac.setGoal(g,h)
g._state.complete=false
g._goal=h

g._onStart:fire()

if g._useImplicitConnections then
g:start()
end
end

function ac.__tostring(g)
return"Motor(Single)"
end

return ac

end)()
end
b["Packages/Flipper/Spring"]=function()
createProxy"Root/Packages/Flipper/Spring"




return(function()
local aa=0.001
local ab=0.001

local ac=0.0001

local g={}
g.__index=g

function g.new(h,i)
assert(h,"Missing argument #1: targetValue")
i=i or{}

return setmetatable({
_targetValue=h,
_frequency=i.frequency or 4,
_dampingRatio=i.dampingRatio or 1,
},g)
end

function g.step(h,i,j)




local k=h._dampingRatio
local l=h._frequency*2*math.pi
local m=h._targetValue
local n=i.value
local o=i.velocity or 0

local p=n-m
local q=math.exp(-k*l*j)

local r,s

if k==1 then
r=(p*(1+l*j)+o*j)*q+m
s=(o*(1-l*j)-p*(l*l*j))*q
elseif k<1 then
local t=math.sqrt(1-k*k)

local u=math.cos(l*t*j)
local v=math.sin(l*t*j)













local w
if t>ac then
w=v/t
else
local x=j*l
w=x+((x*x)*(t*t)*(t*t)/20-t*t)*(x*x*x)/6
end








local x
if l*t>ac then
x=v/(l*t)
else
local y=l*t
x=j+((j*j)*(y*y)*(y*y)/20-y*y)*(j*j*j)/6
end

r=(p*(u+k*w)+o*x)*q+m
s=(o*(u-w*k)-p*(w*l))*q
else
local t=math.sqrt(k*k-1)

local u=-l*(k-t)
local v=-l*(k+t)

local w=(o-p*u)/(2*l*t)
local x=p-w

local y=x*math.exp(u*j)
local z=w*math.exp(v*j)

r=y+z+m
s=y*u+z*v
end

local t=math.abs(s)<aa and math.abs(r-m)<ab

return{
complete=t,
value=t and m or r,
velocity=s,
}
end

return g

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

function ac.new(g,h)
h=h or{}
return ab.new(g,{
frequency=h.frequency or 8,
dampingRatio=h.dampingRatio or 1
})
end

setmetatable(ac,{
__call=function(g,h,i)
return ac.new(h,i)
end
})

return ac

end)()
end
b["Packages/Signal"]=function()
createProxy"Root/Packages/Signal"




return(function()
local aa={}
aa.__index=aa

function aa.new(ab,ac)
return setmetatable({
signal=ab,
connected=true,
_handler=ac,
},aa)
end

function aa.disconnect(ab)
if ab.connected then
ab.connected=false

for ac,g in pairs(ab.signal._connections)do
if g==ab then
table.remove(ab.signal._connections,ac)
return
end
end
end
end

function aa.Disconnect(ab)
ab:disconnect()
end

local ab={}
ab.__index=ab

function ab.new()
return setmetatable({
_connections={},
_threads={},
},ab)
end

function ab.fire(ac,...)
for g,h in pairs(ac._connections)do
h._handler(...)
end

for g,h in pairs(ac._threads)do
coroutine.resume(h,...)
end

ac._threads={}
end

function ab.Fire(ac,...)
ac:fire(...)
end

function ab.connect(ac,g)
local h=aa.new(ac,g)
table.insert(ac._connections,h)
return h
end

function ab.Connect(ac,g)
return ac:connect(g)
end

function ab.wait(ac)
table.insert(ac._threads,coroutine.running())
return coroutine.yield()
end

function ab.Wait(ac)
return ac:wait()
end

return ab

end)()
end
b["Themes/Amethyst"]=function()
createProxy"Root/Themes/Amethyst"




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
createProxy"Root/Themes/Aqua"




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
createProxy"Root/Themes/FSSvs"




return(function()
local aa={
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

return aa

end)()
end
b["Themes/Dark"]=function()
createProxy"Root/Themes/Dark"




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


local ac:{[string]:{[string]:any}}={}

local g={
Names=ab,
}


function g.Get(h,i:string):{[string]:any}?
if not table.find(ab,i)then
return nil
end

if not ac[i]then
local j=require(aa[i])
j.Name=i
ac[i]=j
end

return ac[i]
end


function g.Preload(h,i:string)
if table.find(ab,i)then
h:Get(i)
end
end


setmetatable(g,{
__index=function(h,i:string)
if table.find(ab,i)then
return h:Get(i)
end
return nil
end
})

return g

end)()
end
b["Themes/Light"]=function()
createProxy"Root/Themes/Light"




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
createProxy"Root/Themes/Rose"




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
createProxy"Root/Themes/Vynixu"




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
createProxy"Root/Themes/FSS"




return(function()
return{
Accent=Color3.fromRGB(0,255,255),

AcrylicMain=Color3.fromRGB(10,10,10),
AcrylicBorder=Color3.fromRGB(0,100,100),
AcrylicGradient=ColorSequence.new(Color3.fromRGB(20,20,20),Color3.fromRGB(5,5,5)),
AcrylicNoise=0.90,

TitleBarLine=Color3.fromRGB(0,80,80),
Tab=Color3.fromRGB(150,150,150),

Element=Color3.fromRGB(20,20,20),
ElementBorder=Color3.fromRGB(0,50,50),
InElementBorder=Color3.fromRGB(0,80,80),
ElementTransparency=0.80,

ToggleSlider=Color3.fromRGB(0,255,255),
ToggleToggled=Color3.fromRGB(0,0,0),
SliderRail=Color3.fromRGB(0,255,255),

DropdownFrame=Color3.fromRGB(40,40,40),
DropdownHolder=Color3.fromRGB(20,20,20),
DropdownBorder=Color3.fromRGB(0,80,80),
DropdownOption=Color3.fromRGB(0,255,255),

Keybind=Color3.fromRGB(0,255,255),

Input=Color3.fromRGB(40,40,40),
InputFocused=Color3.fromRGB(0,0,0),
InputIndicator=Color3.fromRGB(0,200,200),

Dialog=Color3.fromRGB(20,20,20),
DialogHolder=Color3.fromRGB(15,15,15),
DialogHolderLine=Color3.fromRGB(0,60,60),
DialogButton=Color3.fromRGB(25,25,25),
DialogButtonBorder=Color3.fromRGB(0,100,100),
DialogBorder=Color3.fromRGB(0,80,80),
DialogInput=Color3.fromRGB(30,30,30),
DialogInputLine=Color3.fromRGB(0,255,255),

Text=Color3.fromRGB(240,240,240),
SubText=Color3.fromRGB(180,180,180),
Hover=Color3.fromRGB(0,200,200),
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


local g="FSSHUB/Config/theme.cfg"
if makefolder then
pcall(function()
if not isfolder"FSSHUB"then makefolder"FSSHUB"end
if not isfolder"FSSHUB/Config"then makefolder"FSSHUB/Config"end
end)
end

local function SaveTheme(h)
if writefile then pcall(writefile,g,h)end
end

local function GetSavedTheme()
if not readfile then return"FSSvs"end
local h,i=pcall(readfile,g)
return h and i or"FSSvs"
end



local function InitUI(h)
Log"Starting UI Build Phase..."



local i=_G.FSSHUB_EVENTS
if not i and getgenv then
i=getgenv().FSSHUB_EVENTS
end


if not i then
warn"[FSSHUB] CRITICAL: Event Bus NOT Connected. Features will not work."
i={listeners={},Emit=function()warn"[FSSHUB] Attempted to emit event on disconnected bus"end,On=function()end}
end

if not _G.FSSHUB_EVENTS then
_G.FSSHUB_EVENTS=i
end


local j=(ac.User.IsPremium==true or ac.User.IsPremium=="true")
local k=ac.Game.Name or"Universal"


if _G.FSSHUB_WINDOW and _G.FSSHUB_WINDOW.Destroy then
pcall(function()_G.FSSHUB_WINDOW:Destroy()end)
end

if game:GetService"CoreGui":FindFirstChild"FSSHUB"then
pcall(function()game:GetService"CoreGui".FSSHUB:Destroy()end)
elseif game:GetService"CoreGui":FindFirstChild"ScreenGui"then


end

local l=h:Window{
Title=j and"FSSHUB ðŸ‘‘ | "..k or"FSSHUB | "..k,
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
getgenv().FSSHUB_JANITOR.TrackInstance(l)

getgenv().FSSHUB_JANITOR.Register(function()


_G.FSSHUB_WINDOW=nil
_G.FSSHUB_FLUENT=nil
end)
end


if h.ThemeChanged then
h.ThemeChanged:Connect(SaveTheme)
end


local function Toggle(m,n,o,p,q,r)
local s={Title=o,Default=p,Callback=q or function()end}
local t=m:AddToggle(n,s)


if j then

local u=r or Enum.KeyCode.Unknown
t:Keybind("Key_"..n,
{Title="Key",Default=u,Mode="Toggle",Callback=function()end,ChangedCallback=function()end})
end
return t
end


task.wait(0.05)
local m={}

m.Home=l:Tab{Title="Dashboard",Icon="home"}


m.Home:AddParagraph("Welcome",{
Title=j and"Welcome, Premium User! ðŸ‘‘"or"Welcome to FSSHub",
Content="User: "..(ac.User.Username or"Guest").."\nTier: "..(ac.User.Tier or"Free")
})
m.Home:AddButton{
Title="Join Discord",
Description="Get Support & Premium",
Callback=function()
if setclipboard then setclipboard"https://discord.gg/fsshub"end
h:Notify{Title="Link Copied!",Content="Discord link copied to clipboard.",Duration=3}
end
}

task.wait(0.02)

m.Movement=l:Tab{Title="Movement",Icon="footprints"}




m.Movement:AddSlider("SpeedVal",
{
Title="Value",
Default=16,
Min=16,
Max=500,
Callback=function(n)
local o=false
if h.Options.Speed and h.Options.Speed.Value then o=h.Options.Speed.Value end
i:Emit("toggle_speed",o,n)
end
})

Toggle(m.Movement,"Speed","Walk Speed",false,
function(n)
local o=16
if h.Options.SpeedVal and h.Options.SpeedVal.Value then o=h.Options.SpeedVal.Value end
i:Emit("toggle_speed",n,o)
end)

m.Movement:AddSlider("JumpVal",
{
Title="Value",
Default=50,
Min=50,
Max=500,
Callback=function(n)
local o=false
if h.Options.Jump and h.Options.Jump.Value then o=h.Options.Jump.Value end
i:Emit("toggle_jump",o,n)
end
})

Toggle(m.Movement,"Jump","Jump Power",false,
function(n)
local o=50
if h.Options.JumpVal and h.Options.JumpVal.Value then o=h.Options.JumpVal.Value end
i:Emit("toggle_jump",n,o)
end)

if j then
m.Movement:AddParagraph("Prem",{Title="Premium",Content="Fly & Noclip unlocked"})
Toggle(m.Movement,"Fly","Fly Mode",false,function(n)i:Emit("toggle_fly",n)end,Enum.KeyCode.F)
Toggle(m.Movement,"Noclip","Noclip",false,function(n)i:Emit("toggle_noclip",n)end)
end

task.wait(0.02)

m.Visual=l:Tab{Title="Visual",Icon="eye"}

Toggle(m.Visual,"ESP","Enable ESP",false,function(n)i:Emit("toggle_esp",n)end,Enum.KeyCode.E)
Toggle(m.Visual,"Fullbright","Fullbright",false,function(n)i:Emit("toggle_fullbright",n)end)

task.wait(0.02)

m.Utility=l:Tab{Title="Utility",Icon="wrench"}
m.Utility:AddButton{Title="Rejoin Server",Callback=function()i:Emit"action_rejoin"end}

m.Player=l:Tab{Title="Player",Icon="user"}
m.Player:AddButton{Title="Reset Character",Callback=function()i:Emit"action_reset"end}

task.wait(0.02)

m.Settings=l:Tab{Title="Settings",Icon="settings"}

task.wait()


local n={}
for o,p in pairs(h.Themes)do
if type(o)=="string"then
table.insert(n,o)
end
end

pcall(function()
table.sort(n,function(o,p)
return tostring(o)<tostring(p)
end)
end)


local o=GetSavedTheme()
local p=table.find(n,o)and o or(n[1]or"Dark")

m.Settings:AddDropdown("Theme",
{Title="Theme",Values=n,Default=p,Callback=function(q)
h:SetTheme(q)
SaveTheme(q)
end})

l:SelectTab(1)


_G.FSSHUB_WINDOW=l
_G.FSSHUB_FLUENT=h
_G.FSSHUB_OPTIONS=h.Options

Log"UI Built. Signaling Loader..."


if getgenv then getgenv().FSSHUB_MAIN_MENU_READY=true end
print"[FSSHUB] UI Fully Loaded."
end


task.spawn(function()

if getgenv().FSSHUB_GET_FLUENT then
Log"Checking pre-load cache..."
local h=getgenv().FSSHUB_GET_FLUENT(10)
if h then
Log"Using Cached Fluent"
task.defer(function()InitUI(h)end)
return
end
end


Log"Checking Local Cache..."
local h="FSSHUB/Bin/Fluent.luau"
local i

if isfile and isfile(h)then
local j,k=pcall(readfile,h)
if j then local
l, m=loadstring(k)
if l then
i=l
Log"Loaded Fluent from Local Cache"
end
end
end

if not i then
Log"Downloading Fluent Library..."
local j,k=pcall(function()
return game:HttpGet
"https://raw.githubusercontent.com/fingerscrows/fsshub-assets/main/lua/fluent_loader.lua?v=4.0.8"
end)

if j and k then

if writefile then
pcall(function()
if not isfolder"FSSHUB"then makefolder"FSSHUB"end
if not isfolder"FSSHUB/Bin"then makefolder"FSSHUB/Bin"end
writefile(h,k)
end)
end
i=loadstring(k)
end
end

local j,k=pcall(function()
if i then return i()end
error"Failed to load library"
end)

if j and k then
Log"Fluent Loaded. Initializing UI..."
task.wait(0.05)


task.spawn(function()
InitUI(k)
end)
else
warn("Fluent Load Error: "..tostring(k))




end
end)

end
if getgenv().FSSHUB_EXEC_IMMEDIATE then Execute()end
getgenv().FSSHUB_UI_EXEC=Execute
return{Fluent=aa,Execute=Execute,Assets=a}
end)

local BuilderChunk = (function()
-- [[ FSSHUB V5 Menu Builder ]]
-- Architecture: Dual-Asset Lazy Cache
-- Updated: Added complete feature coverage for Free & Premium

return function(Fluent)
    local Info = getgenv().FSSHUB_INFO
    -- task.wait() removed to prevent initial yield error
    if not Info then
        warn("[FSSHUB] Info missing")
        return
    end

    -- 1. Inject Default Theme
    Fluent.Themes["Default"] = {
        Accent = Color3.fromRGB(138, 110, 215),
        AcrylicMain = Color3.fromRGB(25, 20, 35),
        AcrylicBorder = Color3.fromRGB(140, 120, 210),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(20, 20, 25), Color3.fromRGB(10, 10, 15)),
        AcrylicNoise = 1,
        TitleBarLine = Color3.fromRGB(140, 120, 210),
        Tab = Color3.fromRGB(180, 180, 200),
        Element = Color3.fromRGB(15, 12, 25),
        ElementBorder = Color3.fromRGB(40, 30, 60),
        InElementBorder = Color3.fromRGB(138, 110, 215),
        ElementTransparency = 0.5,
        ToggleSlider = Color3.fromRGB(138, 110, 215),
        ToggleToggled = Color3.fromRGB(20, 20, 25),
        SliderRail = Color3.fromRGB(40, 30, 60),
        DropdownFrame = Color3.fromRGB(15, 12, 25),
        DropdownHolder = Color3.fromRGB(15, 12, 25),
        DropdownBorder = Color3.fromRGB(40, 30, 60),
        DropdownOption = Color3.fromRGB(180, 180, 200),
        Keybind = Color3.fromRGB(180, 180, 200),
        Input = Color3.fromRGB(15, 12, 25),
        InputFocused = Color3.fromRGB(20, 20, 25),
        InputIndicator = Color3.fromRGB(170, 150, 240),
        Dialog = Color3.fromRGB(25, 20, 35),
        DialogHolder = Color3.fromRGB(15, 12, 25),
        DialogHolderLine = Color3.fromRGB(140, 120, 210),
        DialogButton = Color3.fromRGB(40, 30, 60),
        DialogButtonBorder = Color3.fromRGB(140, 120, 210),
        DialogBorder = Color3.fromRGB(140, 120, 210),
        DialogInput = Color3.fromRGB(15, 12, 25),
        DialogInputLine = Color3.fromRGB(138, 110, 215),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(180, 180, 200),
        Hover = Color3.fromRGB(170, 150, 240),
        HoverChange = 0.1
    }

    -- 2. Utilities
    local CONFIG_FOLDER = "FSSHUB/Config"
    local THEME_FILE = "FSSHUB/Config/theme.cfg"
    
    local function SaveTheme(themeName)
        task.spawn(function()
            if not isfolder("FSSHUB") then makefolder("FSSHUB") end
            if not isfolder(CONFIG_FOLDER) then makefolder(CONFIG_FOLDER) end
            if writefile then pcall(writefile, THEME_FILE, themeName) end
        end)
    end

    local function GetSavedTheme()
        if not readfile or not isfile(THEME_FILE) then return "FSSvs" end
        local s, t = pcall(readfile, THEME_FILE)
        return s and t or "FSSvs"
    end

    local function GetConfigList()
        if not isfolder(CONFIG_FOLDER) then return {} end
        local files = listfiles(CONFIG_FOLDER)
        local names = {}
        for _, file in ipairs(files) do
            if file:match("%.json$") then
                local name = file:match("([^/\\]+)%.json$")
                if name then table.insert(names, name) end
            end
        end
        return names
    end

    local function SaveConfig(name)
        if not isfolder("FSSHUB") then makefolder("FSSHUB") end
        if not isfolder(CONFIG_FOLDER) then makefolder(CONFIG_FOLDER) end
        
        local path = CONFIG_FOLDER .. "/" .. name .. ".json"
        local data = {}

        for key, option in pairs(Fluent.Options) do
            if option.Type == "Toggle" then
                data[key] = { Type = "Toggle", Value = option.Value, Key = option.Keybind and option.Keybind.Value.Name or "None" }
            elseif option.Type == "Slider" then
                 data[key] = { Type = "Slider", Value = option.Value }
            elseif option.Type == "Dropdown" then
                 data[key] = { Type = "Dropdown", Value = option.Value }
            elseif option.Type == "Keybind" then
                 data[key] = { Type = "Keybind", Value = option.Value.Name }
            end
        end
        
        if writefile then
            local success, encoded = pcall(game:GetService("HttpService").JSONEncode, game:GetService("HttpService"), data)
            if success then writefile(path, encoded) end
        end
        Fluent:Notify({ Title = "Config Saved", Content = "Saved config: " .. name, Duration = 3 })
    end

    local function LoadConfig(name)
        local path = CONFIG_FOLDER .. "/" .. name .. ".json"
        if not isfile(path) then
             Fluent:Notify({ Title = "Load Error", Content = "Config not found: " .. name, Duration = 3 })
             return
        end
        
        local success, decoded = pcall(game:GetService("HttpService").JSONDecode, game:GetService("HttpService"), readfile(path))
        if success and decoded then
            for key, setting in pairs(decoded) do
                local option = Fluent.Options[key]
                if option then
                    if setting.Type == "Toggle" then
                        option:SetValue(setting.Value)
                        if option.Keybind and setting.Key then
                             pcall(function() option.Keybind:SetValue(Enum.KeyCode[setting.Key]) end)
                        end
                    elseif setting.Type == "Slider" then
                        option:SetValue(setting.Value)
                    elseif setting.Type == "Dropdown" then
                        option:SetValue(setting.Value)
                    elseif setting.Type == "Keybind" then
                        pcall(function() option:SetValue(Enum.KeyCode[setting.Value]) end)
                    end
                end
            end
            Fluent:Notify({ Title = "Config Loaded", Content = "Loaded config: " .. name, Duration = 3 })
        end
    end

    -- 3. Cleanup Old UI
    if _G.FSSHUB_WINDOW and _G.FSSHUB_WINDOW.Destroy then
        pcall(function() _G.FSSHUB_WINDOW:Destroy() end)
    end

    -- Event Bus
    local Events = _G.FSSHUB_EVENTS or { listeners = {}, Emit = function() end, On = function() end }

    -- 4. Build Window
    local isPremium = (Info.User.IsPremium == true or Info.User.IsPremium == "true")
    local gameName = Info.Game.Name or "Universal"

    local Window = Fluent:Window({
        Title = isPremium and "FSSHUB ðŸ‘‘ | " .. gameName or "FSSHUB | " .. gameName,
        SubTitle = Info.Version or "v5.0",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Resize = false,
        MinimizeKey = Enum.KeyCode.RightControl,
        Acrylic = false,
        Theme = GetSavedTheme(),
        OnClose = function()
            if _G.FSSHUB_CLEANUP then _G.FSSHUB_CLEANUP() end
        end
    })

    if Fluent.ThemeChanged then Fluent.ThemeChanged:Connect(SaveTheme) end

    -- 5. Helper
    local function Toggle(tab, id, title, default, callback, keybind)
        local config = { Title = title, Default = default, Callback = callback or function() end }
        local toggle = tab:AddToggle(id, config)
        if isPremium then
            local kbind = keybind or Enum.KeyCode.Unknown
            toggle:Keybind("Key_" .. id, { Title = "Key", Default = kbind, Mode = "Toggle" })
        end
        return toggle
    end

    -- 6. Build Tabs
    local Tabs = {}

    -- [[ HOME TAB ]]
    Tabs.Home = Window:Tab({ Title = "Dashboard", Icon = "home" })
    Tabs.Home:AddParagraph("Welcome", {
        Title = isPremium and "Welcome, Premium Member ðŸ‘‘" or "Welcome to FSSHub",
        Content = "User: " ..
        (Info.User.Username or "Guest") ..
        "\nTier: " .. (Info.User.Tier or "Free") .. "\nExpires: " .. (Info.User.ExpiryText or "Never")
    })



    Tabs.Home:AddButton({
        Title = "Join Discord",
        Description = "Get Support",
        Icon = "gamepad-2",
        Callback = function()
            if setclipboard then setclipboard("https://discord.gg/fsshub") end
            Fluent:Notify({ Title = "Link Copied!", Content = "Discord link copied.", Duration = 3 })
        end
    })

    task.wait() -- Yield after Home tab

    -- [[ MOVEMENT TAB ]]
    Tabs.Movement = Window:Tab({ Title = "Movement", Icon = "run" })

    -- Speed
    Tabs.Movement:AddSlider("SpeedVal", {
        Title = "Walk Speed Value",
        Default = 16,
        Min = 16,
        Max = 500,
        Callback = function(v)
            local e = false
            if Fluent.Options.Speed and Fluent.Options.Speed.Value then e = Fluent.Options.Speed.Value end
            Events:Emit("toggle_speed", e, v)
        end
    })
    Toggle(Tabs.Movement, "Speed", "Enable Walk Speed", false, function(v)
        local val = 16
        if Fluent.Options.SpeedVal then val = Fluent.Options.SpeedVal.Value end
        Events:Emit("toggle_speed", v, val)
    end, Enum.KeyCode.B) -- Default: B

    -- Jump
    Tabs.Movement:AddSlider("JumpVal", {
        Title = "Jump Power Value",
        Default = 50,
        Min = 50,
        Max = 500,
        Callback = function(v)
            local e = false
            if Fluent.Options.Jump and Fluent.Options.Jump.Value then e = Fluent.Options.Jump.Value end
            Events:Emit("toggle_jump", e, v)
        end
    })
    Toggle(Tabs.Movement, "Jump", "Enable Jump Power", false, function(v)
        local val = 50
        if Fluent.Options.JumpVal then val = Fluent.Options.JumpVal.Value end
        Events:Emit("toggle_jump", v, val)
    end, Enum.KeyCode.V) -- Default: V

    Toggle(Tabs.Movement, "InfJump", "Infinite Jump", false, function(v) Events:Emit("toggle_infinitejump", v) end, Enum.KeyCode.G) -- Default: G

    if isPremium then

        Toggle(Tabs.Movement, "Fly", "Fly Mode", false, function(v)
            local speed = Fluent.Options.FlySpeed and Fluent.Options.FlySpeed.Value or 50
            Events:Emit("toggle_fly", v, speed)
        end, Enum.KeyCode.H) -- Default: H
        
        Tabs.Movement:AddSlider("FlySpeed", { 
            Title = "Fly Speed",
            Default = 50,
            Min = 10,
            Max = 200,
            Callback = function(v)
                if Fluent.Options.Fly and Fluent.Options.Fly.Value then Events:Emit("toggle_fly", true, v) end
            end
        })

        Toggle(Tabs.Movement, "Noclip", "Noclip", false, function(v) Events:Emit("toggle_noclip", v) end, Enum.KeyCode.N) -- Default: N
        Toggle(Tabs.Movement, "NoClipPhys", "Platform Stand", false,
            function(v) Events:Emit("toggle_platformstand", v) end, Enum.KeyCode.RightAlt) -- Default: RightAlt

        Tabs.Movement:AddSlider("Gravity",
            { Title = "Gravity", Default = 196.2, Min = 0, Max = 200, Callback = function(v) Events:Emit("set_gravity", v) end })
    end

    task.wait() -- Yield after Movement tab

    -- [[ VISUAL TAB ]]
    Tabs.Visual = Window:Tab({ Title = "Visual", Icon = "eye" })
    Toggle(Tabs.Visual, "ESP", "Enable ESP", false, function(v)
        local opts = { showName = true, showDistance = true, showHealth = true, showChams = true }
        Events:Emit("toggle_esp", v, opts)
    end, Enum.KeyCode.Y) -- Default: Y

    Toggle(Tabs.Visual, "Fullbright", "Fullbright", false, function(v) Events:Emit("toggle_fullbright", v) end, Enum.KeyCode.U) -- Default: U

    if isPremium then

        Toggle(Tabs.Visual, "SkelESP", "Skeleton ESP", false, function(v) Events:Emit("toggle_skeleton", v) end, Enum.KeyCode.L) -- Default: L
        Toggle(Tabs.Visual, "Tracers", "Tracers", false, function(v) Events:Emit("toggle_tracers", v) end, Enum.KeyCode.K) -- Default: K
    end

    task.wait() -- Yield after Visual tab

    -- [[ PLAYER TAB ]]
    Tabs.Player = Window:Tab({ Title = "Player", Icon = "user" })
    Tabs.Player:AddButton({ Title = "Reset Character", Icon = "skull", Callback = function() Events:Emit("action_reset") end })
    Toggle(Tabs.Player, "AutoRespawn", "Fast Respawn", false, function(v) Events:Emit("toggle_autorespawn", v) end, Enum.KeyCode.RightBracket) -- Default: RightBracket
    Toggle(Tabs.Player, "NoCol", "Disable Collision", false, function(v) Events:Emit("toggle_nocollision", v) end)

    if isPremium then

        Toggle(Tabs.Player, "GodMode", "God Mode", false, function(v) Events:Emit("toggle_godmode", v) end, Enum.KeyCode.Delete) -- Default: Delete
        Toggle(Tabs.Player, "NoFall", "No Fall Damage", false, function(v) Events:Emit("toggle_nofall", v) end, Enum.KeyCode.End) -- Default: End
        Toggle(Tabs.Player, "NoRagdoll", "Anti-Ragdoll", false, function(v) Events:Emit("toggle_noragdoll", v) end)
        Tabs.Player:AddSlider("AnimSpeed",
            { Title = "Animation Speed", Default = 1, Min = 0, Max = 5, Callback = function(v) Events:Emit(
                "toggle_animspeed", true, v) end })
    end

    task.wait() -- Yield after Player tab

    -- [[ UTILITY TAB ]]
    Tabs.Utility = Window:Tab({ Title = "Utility", Icon = "wrench" })
    Tabs.Utility:AddButton({ Title = "Rejoin Server", Icon = "refresh-cw", Callback = function() Events:Emit("action_rejoin") end })
    Tabs.Utility:AddButton({ Title = "Unlock FPS", Description = "Boost FPS Cap", Icon = "unlock", Callback = function() Events:Emit(
        "action_unlockfps") end })
    Toggle(Tabs.Utility, "AntiAFK", "Anti-AFK", false, function(v) Events:Emit("toggle_antiafk", v) end, Enum.KeyCode.P) -- Default: P
    Toggle(Tabs.Utility, "FPSBoost", "FPS Boost (Low Quality)", false, function(v) Events:Emit("toggle_fpsboost", v) end, Enum.KeyCode.O) -- Default: O

    if isPremium then
        Tabs.Utility:AddButton({ Title = "Server Hop", Description = "Find a better server", Icon = "server", Callback = function() Events
                :Emit("action_serverhop") end })
        Tabs.Utility:AddButton({ Title = "Auto Rejoin", Description = "Rejoin on kick", Icon = "repeat", Callback = function() Events:Emit(
            "toggle_autorejoin", true) end })
        Toggle(Tabs.Utility, "PerfMon", "Performance Monitor", false, function(v) Events:Emit("toggle_perfmon", v) end)
        Toggle(Tabs.Utility, "AntiLag", "Anti-Lag (Textures Off)", false,
            function(v) Events:Emit("toggle_antilag", v) end)
    end

    task.wait() -- Yield after Utility tab

    -- [[ SETTINGS TAB ]]
    Tabs.Settings = Window:Tab({ Title = "Settings", Icon = "settings" })
    
    task.wait() -- Yield before heavy settings tab operations
    
    -- Build theme names list from Fluent.Themes table (only string keys)
    local themeNames = {}
    for themeName, _ in pairs(Fluent.Themes) do
        if type(themeName) == "string" then
            table.insert(themeNames, themeName)
        end
    end
    -- Safe sort with explicit string comparison
    pcall(function()
        table.sort(themeNames, function(a, b) 
            return tostring(a) < tostring(b) 
        end)
    end)
    
    -- Default to first theme if saved theme not found
    local savedTheme = GetSavedTheme()
    local defaultTheme = table.find(themeNames, savedTheme) and savedTheme or (themeNames[1] or "Dark")
    
    Tabs.Settings:AddDropdown("Theme",
        { Title = "Interface Theme", Values = themeNames, Default = defaultTheme, Callback = function(v)
            Fluent:SetTheme(v)
            SaveTheme(v)
            Events:Emit("theme_changed", v)
        end })

    Tabs.Settings:AddKeybind("CloseUI", {
        Title = "Hide Menu Keybind",
        Description = "Key to toggle the main menu visibility",
        Default = Enum.KeyCode.RightControl,
        ChangedCallback = function(New)
            Fluent.MinimizeKey = New
        end
    })



    if isPremium then
        Tabs.Settings:AddSection("Config Manager")
        
        local Configs = GetConfigList()
        
        local ConfDropdown = Tabs.Settings:AddDropdown("ConfSelect", {
            Title = "Select Config",
            Values = Configs,
            Multi = false,
            Default = nil,
            Callback = function(v)
                if Tabs.Settings.Options.ConfName then
                   Tabs.Settings.Options.ConfName:SetValue(v)
                end
            end
        })

        Tabs.Settings:AddInput("ConfName", { Title = "Config Name", Default = "default" })

        Tabs.Settings:AddButton({
            Title = "Refresh List",
            Icon = "refresh-cw",
            Callback = function()
                ConfDropdown:SetValues(GetConfigList())
                Fluent:Notify({ Title = "Refreshed", Content = "Config list updated.", Duration = 2 })
            end
        })

        Tabs.Settings:AddButton({
            Title = "Save Config",
            Icon = "save",
            Callback = function()
                local name = Fluent.Options.ConfName and Fluent.Options.ConfName.Value or "default"
                SaveConfig(name)
                ConfDropdown:SetValues(GetConfigList())
            end
        })
        Tabs.Settings:AddButton({
            Title = "Load Config",
            Icon = "file-output",
            Callback = function()
                local name = Fluent.Options.ConfName and Fluent.Options.ConfName.Value or "default"
                LoadConfig(name)
            end
        })
        
        Tabs.Settings:AddButton({
            Title = "Reset Defaults",
            Description = "Reset all settings to default values",
            Icon = "rotate-ccw",
            Callback = function()
                Window:Dialog({
                    Title = "Reset Settings?",
                    Content = "Are you sure you want to reset all settings to their default values?",
                    Buttons = {
                        {
                            Title = "Yes, Reset",
                            Callback = function()
                                for key, option in pairs(Fluent.Options) do
                                    if option.Type == "Toggle" then
                                        option:SetValue(option.Default ~= nil and option.Default or false)
                                    elseif option.Type == "Slider" then
                                        option:SetValue(option.Default or option.Min or 0)
                                    elseif option.Type == "Dropdown" then
                                        option:SetValue(option.Default or option.Values[1])
                                    elseif option.Type == "Colorpicker" then
                                        option:SetValue(option.Default or Color3.new(1,1,1))
                                    elseif option.Type == "Keybind" then
                                        option:SetValue(option.Default or "None")
                                    end
                                end
                                Fluent:SetTheme("FSSvs")
                                Fluent:Notify({ Title = "Reset Complete", Content = "Settings have been reset.", Duration = 3 })
                            end
                        },
                        {
                            Title = "Cancel",
                            Callback = function() end
                        }
                    }
                })
            end
        })
    end

    -- Fix for empty tab on load: Yield briefly to ensure UI is ready
    task.spawn(function()
        task.wait(0.2)
        if Window then Window:SelectTab(1) end
    end)

    _G.FSSHUB_WINDOW = Window
    _G.FSSHUB_FLUENT = Fluent
    _G.FSSHUB_OPTIONS = Fluent.Options
    if getgenv then getgenv().FSSHUB_MAIN_MENU_READY = true end
    
    -- Auto Load 'default' config if it exists and user is Premium
    if isPremium then
        pcall(function()
            local path = CONFIG_FOLDER .. "/default.json"
            if isfile(path) then
                LoadConfig("default")
            end
        end)
    end
    
    print("[FSSHUB] UI Builder Completed.")
end

end)

return function()
    local LibResult = LibChunk()
    task.wait() -- Reset script timer after heavy module load
    local Fluent = LibResult and LibResult.Fluent or nil
    local Builder = nil
    
    if type(BuilderChunk) == 'function' then
        Builder = BuilderChunk()
    end
    
    return Fluent, Builder
end