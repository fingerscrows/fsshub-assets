
local a={}

local b={}
local c={}
local d={}
local function __REQUIRE(e)
if c[e]then return c[e]end
if d[e]then error("Cyclic dependency detected: "..tostring(e))end
if not b[e]then error("Mod 404: "..tostring(e))end
d[e]=true
local f=b[e]()
d[e]=nil
c[e]=f
return f
end
local function createProxy(e)
local f={}
f.__index=function(g,h)

if h=="Name"then
return e:match"([^/]+)$"or e
elseif h=="Parent"then
local i=e:match"^(.*)/[^/]+$"
if i then
return createProxy(i)
elseif e~="Root"then
return createProxy"Root"
end
return nil
end
return createProxy(e=="Root"and h or(e.."/"..h))
end
f.__tostring=function()return e end
return setmetatable({},f)
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
local e=createProxy"Root/Components/Button"
local function require(f)
local g=tostring(f):gsub("Root/","")
return __REQUIRE(g)
end
return(function()
local f=e.Parent.Parent
local g=require(f.Packages.Flipper)
local h=require(f.Modules.Creator)
local i=h.New local j=

g.Spring.new

return function(k,l,m)
local n={}

m=m or false

n.Title=i("TextLabel",{
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

n.HoverFrame=i("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
ThemeTag={
BackgroundColor3="Hover",
},
},{
i("UICorner",{
CornerRadius=UDim.new(0,4),
}),
})

n.Frame=i("TextButton",{
Size=UDim2.new(0,0,0,32),
Parent=l,
ThemeTag={
BackgroundColor3="DialogButton",
},
},{
i("UICorner",{
CornerRadius=UDim.new(0,4),
}),
i("UIStroke",{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Transparency=0.65,
ThemeTag={
Color="DialogButtonBorder",
},
}),
n.HoverFrame,
n.Title,
})local

o, p=h.SpringMotor(1,n.HoverFrame,"BackgroundTransparency",m)
h.AddSignal(n.Frame.MouseEnter,function()
p(0.97)
end)
h.AddSignal(n.Frame.MouseLeave,function()
p(1)
end)
h.AddSignal(n.Frame.MouseButton1Down,function()
p(1)
end)
h.AddSignal(n.Frame.MouseButton1Up,function()
p(0.97)
end)

return n
end

end)()
end
b["Components/Dialog"]=function()
local e=createProxy"Root/Components/Dialog"
local function require(f)
local g=tostring(f):gsub("Root/","")
return __REQUIRE(g)
end
return(function()
local f=e.Parent.Parent
local g=require(f.Modules.Creator)
local h=require(f.Components.Button)
local i=require(f.Packages.Signal)

local j=g.New

local k={
Window=nil,
}

function k.Init(l,m)
k.Window=m
return k
end

function k.Create(l)
local m,n={
Buttons=0,
Closing=i.new(),
Closed=i.new()
},require(f)

m.TintFrame=j("TextButton",{
Text="",
Size=UDim2.fromScale(1,1),
BackgroundColor3=Color3.fromRGB(0,0,0),
BackgroundTransparency=1,
Parent=k.Window.Root,
},{
j("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})local

o, p=g.SpringMotor(1,m.TintFrame,"BackgroundTransparency",true)

m.ButtonHolder=j("Frame",{
Size=UDim2.new(1,-40,1,-40),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),
BackgroundTransparency=1,
},{
j("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection=Enum.FillDirection.Horizontal,
HorizontalAlignment=Enum.HorizontalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,
}),
})

m.ButtonHolderFrame=j("Frame",{
Size=UDim2.new(1,0,0,70),
Position=UDim2.new(0,0,1,-70),
ThemeTag={
BackgroundColor3="DialogHolder",
},
},{
j("Frame",{
Size=UDim2.new(1,0,0,1),
ThemeTag={
BackgroundColor3="DialogHolderLine",
},
}),
m.ButtonHolder,
})

m.Title=j("TextLabel",{
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

m.Scale=j("UIScale",{
Scale=1,
})local

q, r=g.SpringMotor(1.1,m.Scale,"Scale")

m.Root=j("CanvasGroup",{
Size=UDim2.fromOffset(300,165),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),
GroupTransparency=1,
Parent=m.TintFrame,
ThemeTag={
BackgroundColor3="Dialog",
},
},{
j("UICorner",{
CornerRadius=UDim.new(0,8),
}),
j("UIStroke",{
Transparency=0.5,
ThemeTag={
Color="DialogBorder",
},
}),
m.Scale,
m.Title,
m.ButtonHolderFrame,
})local

s, t=g.SpringMotor(1,m.Root,"GroupTransparency")

function m.Open(u)
n.DialogOpen=true
m.Scale.Scale=1.1
p(0.75)
t(0)
r(1)
end

function m.Close(u)
m.Closing:Fire()
n.DialogOpen=false
p(1)
t(1)
r(1.1)
m.Root.UIStroke:Destroy()
task.wait(0.15)
m.TintFrame:Destroy()
m.Closed:Fire()
end

function m.Button(u,v,w)
m.Buttons=m.Buttons+1
v=v or"Button"
w=w or function()end

local x=h("",m.ButtonHolder,true)
x.Title.Text=v

for y,z in next,m.ButtonHolder:GetChildren()do
if z:IsA"TextButton"then
z.Size=UDim2.new(1/m.Buttons,-((m.Buttons-1)*10/m.Buttons),0,32)
end
end

g.AddSignal(x.Frame.MouseButton1Click,function()
n:SafeCallback(w)
pcall(function()
m:Close()
end)
end)

return x
end

return m
end

return k

end)()
end
b["Components/Element"]=function()
local e=createProxy"Root/Components/Element"
local function require(f)
local g=tostring(f):gsub("Root/","")
return __REQUIRE(g)
end
return(function()
local f=e.Parent.Parent
local g=require(f.Modules.Creator)
local h=g.New

return function(i,j,k,l,m)
local n={
CreatedAt=tick()
}

m=typeof(m)=="table"and m or{}

n.TitleLabel=h("TextLabel",{
FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Medium,Enum.FontStyle.Normal),
Text=i,
TextColor3=Color3.fromRGB(240,240,240),
TextSize=13,
TextXAlignment=m.TitleAlignment or Enum.TextXAlignment.Left,
Size=UDim2.new(1,0,0,14),
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
ThemeTag={
TextColor3="Text",
},
})::TextLabel

n.DescLabel=h("TextLabel",{
FontFace=Font.new"rbxasset://fonts/families/GothamSSm.json",
Text=j,
TextColor3=Color3.fromRGB(200,200,200),
TextSize=12,
TextWrapped=true,
TextXAlignment=m.DescriptionAlignment or Enum.TextXAlignment.Left,
BackgroundColor3=Color3.fromRGB(255,255,255),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,14),
ThemeTag={
TextColor3="SubText",
},
})::TextLabel

n.LabelHolder=h("Frame",{
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Position=UDim2.fromOffset(10,0),
Size=UDim2.new(1,-28,0,0),
},{
h("UIListLayout",{
SortOrder=Enum.SortOrder.LayoutOrder,
VerticalAlignment=Enum.VerticalAlignment.Center,
}),
h("UIPadding",{
PaddingBottom=UDim.new(0,13),
PaddingTop=UDim.new(0,13),
}),
n.TitleLabel,
n.DescLabel,
})::Frame

n.Border=h("UIStroke",{
Transparency=0.5,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Color=Color3.fromRGB(0,0,0),
ThemeTag={
Color="ElementBorder",
},
})::UIStroke

n.Frame=h("TextButton",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=0.89,
BackgroundColor3=Color3.fromRGB(130,130,130),
Parent=k,
AutomaticSize=Enum.AutomaticSize.Y,
Text="",
LayoutOrder=7,
ThemeTag={
BackgroundColor3="Element",
BackgroundTransparency="ElementTransparency",
},
},{
h("UICorner",{
CornerRadius=UDim.new(0,4),
}),
n.Border,
n.LabelHolder,
})::TextButton

function n.SetTitle(o,p)
n.TitleLabel.Text=p
end

function n.SetDesc(o,p)
if p==nil then
p=""
end
if p==""then
n.DescLabel.Visible=false
else
n.DescLabel.Visible=true
end
n.DescLabel.Text=p
end

function n.Destroy(o)
n.Frame:Destroy()
end

n:SetTitle(i)
n:SetDesc(j)

if l then local o=
f.Themes local
p, q=g.SpringMotor(
g.GetThemeProperty"ElementTransparency",
n.Frame,
"BackgroundTransparency",
false,
true
)

g.AddSignal(n.Frame.MouseEnter,function()
q(g.GetThemeProperty"ElementTransparency"-g.GetThemeProperty"HoverChange")
end)
g.AddSignal(n.Frame.MouseLeave,function()
q(g.GetThemeProperty"ElementTransparency")
end)
g.AddSignal(n.Frame.MouseButton1Down,function()
q(g.GetThemeProperty"ElementTransparency"+g.GetThemeProperty"HoverChange")
end)
g.AddSignal(n.Frame.MouseButton1Up,function()
q(g.GetThemeProperty"ElementTransparency"-g.GetThemeProperty"HoverChange")
end)
end

return setmetatable(n,{
__newindex=function(o,p,q)
if p=="Title"then
n:SetTitle(q)
elseif p=="Description"or p=="Desc"then
n:SetDesc(q)
end
return rawset(o,p,q)
end
})
end

end)()
end
b["Components/Notification"]=function()
local e=createProxy"Root/Components/Notification"
local function require(f)
local g=tostring(f):gsub("Root/","")
return __REQUIRE(g)
end
return(function()
local f=e.Parent.Parent

local g=require(f.Packages.Flipper)
local h=require(f.Modules.Creator)
local i=require(f.Modules.Acrylic)

local j=g.Spring.new local k=
g.Instant.new
local l=h.New

local m=game:GetService"SoundService"

local n={}

function n.Init(o,p)
n.Holder=l("Frame",{
Position=UDim2.new(1,-30,1,-30),
Size=UDim2.new(0,310,1,-30),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
Parent=p,
},{
l("UIListLayout",{
HorizontalAlignment=Enum.HorizontalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,
VerticalAlignment=Enum.VerticalAlignment.Bottom,
Padding=UDim.new(0,20),
}),
})
end

function n.New(o,p)
local q={
Closed=false,
}

p.Title=p.Title or"Title"
p.Content=p.Content or"Content"
p.SubContent=p.SubContent or""
p.Duration=p.Duration or nil
p.Buttons=p.Buttons or{}
p.Sound=p.Sound or{}

p.Sound.Parent=m
p.Sound.PlayOnRemove=true

q.AcrylicPaint=i.AcrylicPaint()

q.Title=l("TextLabel",{
Position=UDim2.new(0,14,0,17),
Text=p.Title,
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

q.ContentLabel=l("TextLabel",{
FontFace=Font.new"rbxasset://fonts/families/GothamSSm.json",
Text=p.Content,
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

q.SubContentLabel=l("TextLabel",{
FontFace=Font.new"rbxasset://fonts/families/GothamSSm.json",
Text=p.SubContent,
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

q.LabelHolder=l("Frame",{
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Position=UDim2.fromOffset(14,40),
Size=UDim2.new(1,-28,0,0),
},{
l("UIListLayout",{
SortOrder=Enum.SortOrder.LayoutOrder,
VerticalAlignment=Enum.VerticalAlignment.Center,
Padding=UDim.new(0,3),
}),
q.ContentLabel,
q.SubContentLabel,
})

q.CloseButton=l("TextButton",{
Text="",
Position=UDim2.new(1,-14,0,13),
Size=UDim2.fromOffset(20,20),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
},{
l("ImageLabel",{
Image=require(e.Parent.Assets).Close,
Size=UDim2.fromOffset(16,16),
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
}),
})

q.Root=l("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromScale(1,0),
},{
q.AcrylicPaint.Frame,
q.Title,
q.CloseButton,
q.LabelHolder,
})

if p.Content==""then
q.ContentLabel.Visible=false
end

if p.SubContent==""then
q.SubContentLabel.Visible=false
end

q.Holder=l("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,200),
Parent=n.Holder,
},{
q.Root,
})

local r=g.GroupMotor.new{
Scale=1,
Offset=60,
}

r:onStep(function(s)
q.Root.Position=UDim2.new(s.Scale,s.Offset,0,0)
end)

h.AddSignal(q.CloseButton.MouseButton1Click,function()
q:Close()
end)

function q.Open(s)
local t=q.LabelHolder.AbsoluteSize.Y
q.Holder.Size=UDim2.new(1,0,0,58+t)

if p.Sound.SoundId then
q.Sound=l("Sound",p.Sound)

if not q.Sound.IsLoaded then
q.Sound.Loaded:Wait()
end

q.Sound:Destroy()
q.Sound=nil
end

r:setGoal{
Scale=j(0,{frequency=5}),
Offset=j(0,{frequency=5}),
}
end

function q.Close(s)
if not q.Closed then
q.Closed=true
task.spawn(function()
r:setGoal{
Scale=j(1,{frequency=5}),
Offset=j(60,{frequency=5}),
}
task.wait(0.4)
if require(f).UseAcrylic then
q.AcrylicPaint.Model:Destroy()
end
q.Holder:Destroy()
end)
end
end

q:Open()
if p.Duration then
task.delay(p.Duration,function()
q:Close()
end)
end
return q
end

return n

end)()
end
b["Components/Section"]=function()
local e=createProxy"Root/Components/Section"
local function require(f)
local g=tostring(f):gsub("Root/","")
return __REQUIRE(g)
end
return(function()
local f=e.Parent.Parent
local g=require(f.Modules.Creator)

local h=g.New

return function(i,j)
local k={}

k.Layout=h("UIListLayout",{
Padding=UDim.new(0,5),
})

k.Container=h("Frame",{
Size=UDim2.new(1,0,0,26),
Position=UDim2.fromOffset(0,24),
BackgroundTransparency=1,
},{
k.Layout,
})

k.Root=h("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,26),
LayoutOrder=7,
Parent=j,
},{
h("TextLabel",{
RichText=true,
Text=i,
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
k.Container,
})

g.AddSignal(k.Layout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if k.Container.Size~=UDim2.new(1,0,0,k.Layout.AbsoluteContentSize.Y)or k.Root.Size~=UDim2.new(1,0,0,k.Layout.AbsoluteContentSize.Y+25)then
k.Container.Size=UDim2.new(1,0,0,k.Layout.AbsoluteContentSize.Y)
k.Root.Size=UDim2.new(1,0,0,k.Layout.AbsoluteContentSize.Y+25)
end
end)

return k
end

end)()
end
b["Components/Tab"]=function()
local e=createProxy"Root/Components/Tab"
local function require(f)
local g=tostring(f):gsub("Root/","")
return __REQUIRE(g)
end
return(function()
local f=e.Parent.Parent
local g=require(f.Packages.Flipper)
local h=require(f.Modules.Creator)

local i=h.New
local j=g.Spring.new local k=
g.Instant.new
local l=f.Components

local m={
Window=nil,
Tabs={},
Containers={},
SelectedTab=0,
TabCount=0,
}

function m.Init(n,o)
m.Window=o
return m
end

function m.GetCurrentTabPos(n)
local o=m.Window.TabHolder.AbsolutePosition.Y
local p=m.Tabs[m.SelectedTab].Frame.AbsolutePosition.Y

return p-o
end

function m.New(n,o,p,q)
local r=require(f)
local s=m.Window
local t=r.Elements

m.TabCount=m.TabCount+1
local u=m.TabCount

local v={
Selected=false,
Name=o,
Type="Tab",
}

p=p:find"^rbxasset[://|id://]"==nil and r.Utilities:GetIcon(p)or{
Image=p,
ImageRectOffset=Vector2.zero,
ImageRectSize=Vector2.zero
}

v.Frame=i("TextButton",{
Size=UDim2.new(1,0,0,34),
BackgroundTransparency=1,
Parent=q,
ThemeTag={
BackgroundColor3="Tab",
},
},{
i("UICorner",{
CornerRadius=UDim.new(0,6),
}),
i("TextLabel",{
AnchorPoint=Vector2.new(0,0.5),
Position=p~=nil and UDim2.new(0,30,0.5,0)or UDim2.new(0,12,0.5,0),
Text=o,
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
i("ImageLabel",{
AnchorPoint=Vector2.new(0,0.5),
Size=UDim2.fromOffset(16,16),
Position=UDim2.new(0,8,0.5,0),
BackgroundTransparency=1,
ImageRectOffset=p and p.ImageRectOffset or Vector2.zero,
ImageRectSize=p and p.ImageRectSize or Vector2.zero,
Image=p and p.Image or nil,
ThemeTag={
ImageColor3="Text",
},
}),
})

local w=i("UIListLayout",{
Padding=UDim.new(0,5),
SortOrder=Enum.SortOrder.LayoutOrder,
})

v.ContainerFrame=i("ScrollingFrame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
Parent=s.ContainerHolder,
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
w,
i("UIPadding",{
PaddingRight=UDim.new(0,10),
PaddingLeft=UDim.new(0,1),
PaddingTop=UDim.new(0,1),
PaddingBottom=UDim.new(0,1),
}),
})

h.AddSignal(w:GetPropertyChangedSignal"AbsoluteContentSize",function()
if v.ContainerFrame.CanvasSize~=UDim2.fromOffset(0,w.AbsoluteContentSize.Y+2)then
v.ContainerFrame.CanvasSize=UDim2.fromOffset(0,w.AbsoluteContentSize.Y+2)
end
end)

v.Motor,v.SetTransparency=h.SpringMotor(1,v.Frame,"BackgroundTransparency")

h.AddSignal(v.Frame.MouseEnter,function()
v.SetTransparency(v.Selected and 0.85 or 0.89)
end)
h.AddSignal(v.Frame.MouseLeave,function()
v.SetTransparency(v.Selected and 0.89 or 1)
end)
h.AddSignal(v.Frame.MouseButton1Down,function()
v.SetTransparency(0.92)
end)
h.AddSignal(v.Frame.MouseButton1Up,function()
v.SetTransparency(v.Selected and 0.85 or 0.89)
end)
h.AddSignal(v.Frame.MouseButton1Click,function()
m:SelectTab(u)
end)

m.Containers[u]=v.ContainerFrame
m.Tabs[u]=v

v.Container=v.ContainerFrame
v.ScrollFrame=v.Container

function v.Section(x,y)
local z={
Type="Section"
}

local A=require(l.Section)(y,v.Container)
z.Container=A.Container
z.ScrollFrame=v.Container

setmetatable(z,t)
return z
end

v.CreateSection=v.Section
v.AddSection=v.Section

setmetatable(v,t)
return v
end

function m.SelectTab(n,o)
local p=m.Window

m.SelectedTab=o

for q,r in next,m.Tabs do
r.SetTransparency(1)
r.Selected=false
end

m.Tabs[o].SetTransparency(0.89)
m.Tabs[o].Selected=true

p.TabDisplay.Text=m.Tabs[o].Name
p.SelectorPosMotor:setGoal(j(m:GetCurrentTabPos(),{frequency=6}))

task.spawn(function()
p.ContainerHolder.Parent=p.ContainerAnim

p.ContainerPosMotor:setGoal(j(15,{frequency=10}))
p.ContainerBackMotor:setGoal(j(1,{frequency=10}))

task.wait(0.12)

for q,r in next,m.Containers do
r.Visible=false
end

m.Containers[o].Visible=true
p.ContainerPosMotor:setGoal(j(0,{frequency=5}))
p.ContainerBackMotor:setGoal(j(0,{frequency=8}))

task.wait(0.12)

p.ContainerHolder.Parent=p.ContainerCanvas
end)
end

return m

end)()
end
b["Components/Textbox"]=function()
local e=createProxy"Root/Components/Textbox"
local function require(f)
local g=tostring(f):gsub("Root/","")
return __REQUIRE(g)
end
return(function()
local f=game:GetService"TextService"
local g=e.Parent.Parent
require(g.Packages.Flipper)
local h=require(g.Modules.Creator)
local i=h.New

return function(j,k)
local l={}

k=k or false

l.Input=i("TextBox",{
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

l.Container=i("Frame",{
BackgroundTransparency=1,
ClipsDescendants=true,
Position=UDim2.new(0,6,0,0),
Size=UDim2.new(1,-12,1,0),
},{
l.Input,
})

l.Indicator=i("Frame",{
Size=UDim2.new(1,-4,0,1),
Position=UDim2.new(0,2,1,0),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=k and 0.5 or 0,
ThemeTag={
BackgroundColor3=k and"InputIndicator"or"DialogInputLine",
},
})

l.Frame=i("Frame",{
Size=UDim2.new(0,0,0,30),
BackgroundTransparency=k and 0.9 or 0,
Parent=j,
ThemeTag={
BackgroundColor3=k and"Input"or"DialogInput",
},
},{
i("UICorner",{
CornerRadius=UDim.new(0,4),
}),
i("UIStroke",{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Transparency=k and 0.5 or 0.65,
ThemeTag={
Color=k and"InElementBorder"or"DialogButtonBorder",
},
}),
l.Indicator,
l.Container,
})

local function Update()
local m=2
local n=l.Container.AbsoluteSize.X

if not l.Input:IsFocused()or l.Input.TextBounds.X<=n-2*m then
l.Input.Position=UDim2.new(0,m,0,0)
else
local o=l.Input.CursorPosition
if o~=-1 then
local p=string.sub(l.Input.Text,1,o-1)
local q=f:GetTextSize(
p,
l.Input.TextSize,
l.Input.Font,
Vector2.new(math.huge,math.huge)
).X

local r=l.Input.Position.X.Offset+q
if r<m then
l.Input.Position=UDim2.fromOffset(m-q,0)
elseif r>n-m-1 then
l.Input.Position=UDim2.fromOffset(n-q-m-1,0)
end
end
end
end

task.spawn(Update)

h.AddSignal(l.Input:GetPropertyChangedSignal"Text",Update)
h.AddSignal(l.Input:GetPropertyChangedSignal"CursorPosition",Update)

h.AddSignal(l.Input.Focused,function()
Update()
l.Indicator.Size=UDim2.new(1,-2,0,2)
l.Indicator.Position=UDim2.new(0,1,1,0)
l.Indicator.BackgroundTransparency=0
h.OverrideTag(l.Frame,{BackgroundColor3=k and"InputFocused"or"DialogHolder"})
h.OverrideTag(l.Indicator,{BackgroundColor3="Accent"})
end)

h.AddSignal(l.Input.FocusLost,function()
Update()
l.Indicator.Size=UDim2.new(1,-4,0,1)
l.Indicator.Position=UDim2.new(0,2,1,0)
l.Indicator.BackgroundTransparency=0.5
h.OverrideTag(l.Frame,{BackgroundColor3=k and"Input"or"DialogInput"})
h.OverrideTag(l.Indicator,{BackgroundColor3=k and"InputIndicator"or"DialogInputLine"})
end)

return l
end

end)()
end
b["Components/TitleBar"]=function()
local e=createProxy"Root/Components/TitleBar"
local function require(f)
local g=tostring(f):gsub("Root/","")
return __REQUIRE(g)
end
return(function()
local f=e.Parent.Parent
local g=require(f.Modules.Creator)

local h=g.New
local i=g.AddSignal

return function(j)
local k={}

local l=require(f)

local function BarButton(m,n,o,p,q)
local r={
Callback=q or function()end,
OnDebounce=false
}

r.Frame=h("TextButton",{
Size=UDim2.new(0,34,1,-8),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
Parent=o,
Position=n,
Text="",
ThemeTag={
BackgroundColor3="Text",
},
},{
h("UICorner",{
CornerRadius=UDim.new(0,7),
}),
h("ImageLabel",{
Image=m,
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

s, t=g.SpringMotor(1,r.Frame,"BackgroundTransparency")

i(r.Frame.MouseEnter,function()
t(0.94)
end)

i(r.Frame.MouseLeave,function()
t(1,true)
end)

i(r.Frame.MouseButton1Down,function()
t(0.96)
end)

i(r.Frame.MouseButton1Up,function()
t(0.94)
end)

i(r.Frame.MouseButton1Click,function(...)
if not r.OnDebounce then
r.OnDebounce=true
task.delay(p,rawset,r,"OnDebounce",false)
r.Callback(...)
end
end)

return r
end

k.Frame=h("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
Parent=j.Parent
},{
h("Frame",{
BackgroundTransparency=0.5,
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0,0,1,0),
ThemeTag={
BackgroundColor3="TitleBarLine",
}
})
})

k.TitleHolder=h("Frame",{
Size=UDim2.new(1,-16,1,0),
Parent=k.Frame,
Position=UDim2.new(0,16,0,0),
BackgroundTransparency=1,
},{
h("UIListLayout",{
Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal,
SortOrder=Enum.SortOrder.LayoutOrder,
})
})

k.Title=h("TextLabel",{
RichText=true,
Text=j.Title or"FSSHUB",
Parent=k.TitleHolder,
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

k.SubTitle=h("TextLabel",{
RichText=true,
Text=j.SubTitle,
Parent=k.TitleHolder,
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

k.CloseButton=BarButton(l.Utilities:GetIcon"Close",UDim2.new(1,-4,0,4),k.Frame,0,function()
l.CreatedWindow:Dialog{
Title="Close",
Content="Are you sure you want to unload the interface?",
Buttons={
{
Title="Yes",
Callback=l.Destroy,
},
{
Title="No",
}
}
}
end)

k.MaxButton=BarButton(l.Utilities:GetIcon"Max",UDim2.new(1,-40,0,4),k.Frame,0,function()
j.Window.Maximize(not j.Window.Maximized)
end)

k.MinButton=BarButton(l.Utilities:GetIcon"Min",UDim2.new(1,-80,0,4),k.Frame,0,function()
j.Window:Minimize()
end)









































































return k
end

end)()
end
b["Components/Window"]=function()
local e=createProxy"Root/Components/Window"
local function require(f)
local g=tostring(f):gsub("Root/","")
return __REQUIRE(g)
end
return(function()


local f=e.Parent.Parent
local g=require(f.Packages.Flipper)
local h=require(f.Modules.Creator)
local i=require(f.Modules.Acrylic)
local j=require(f.Packages.Signal)
local k=require(e.Parent.Assets)
local l=e.Parent

local m=require(f)

local n=m.Utilities:Clone(game:GetService"UserInputService")
local o=m.Utilities:Clone(game:GetService"Players").LocalPlayer:GetMouse()
local p=m.Utilities:Clone(game:GetService"Workspace").CurrentCamera

local q=g.Spring.new
local r=g.Instant.new
local s=h.New

return function(t)
assert(typeof(t.Mobile)=="table","Config key 'Mobile' must be a table!")
assert(typeof(t.Mobile.GetIcon)=="function","Mobile Config key 'GetIcon' must be a function!")
assert(typeof(t.Mobile.Size)=="UDim2","Mobile Config key 'Size' must be a UDim2!")

local u={
Minimized=false,
OnMinimized=j.new(),
PostMinimized=j.new(),
Maximized=false,
OnMaximized=j.new(),
PostMaximized=j.new(),
Size=t.Size,
MinSize=t.MinSize,
CurrentPos=0,
TabWidth=0,
Position=UDim2.fromOffset(
p.ViewportSize.X/2-t.Size.X.Offset/2,
p.ViewportSize.Y/2-t.Size.Y.Offset/2
),
}

local v,w,x,y=false
local z,A=false
local B=false
local C,D,E,F=false

u.AcrylicPaint=i.AcrylicPaint()
u.TabWidth=t.TabWidth

local G=s("Frame",{
Size=UDim2.fromOffset(4,0),
BackgroundColor3=Color3.fromRGB(76,194,255),
Position=UDim2.fromOffset(0,17),
AnchorPoint=Vector2.new(0,0.5),
ThemeTag={
BackgroundColor3="Accent",
},
},{
s("UICorner",{
CornerRadius=UDim.new(0,2),
}),
})

local H=s("Frame",{
Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,
Position=UDim2.new(1,-20,1,-20),
})

u.TabHolder=s("ScrollingFrame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
ScrollBarImageTransparency=1,
ScrollBarThickness=0,
BorderSizePixel=0,
CanvasSize=UDim2.fromScale(0,0),
ScrollingDirection=Enum.ScrollingDirection.Y,
},{
s("UIListLayout",{
Padding=UDim.new(0,4),
}),
})

local I=s("Frame",{
Size=UDim2.new(0,u.TabWidth,1,-66),
Position=UDim2.new(0,12,0,54),
BackgroundTransparency=1,
ClipsDescendants=true,
},{
u.TabHolder,
G,
})

u.TabDisplay=s("TextLabel",{
RichText=true,
Text="Tab",
TextTransparency=0,
FontFace=Font.new("rbxassetid://12187365364",Enum.FontWeight.SemiBold,Enum.FontStyle.Normal),
TextSize=28,
TextXAlignment="Left",
TextYAlignment="Center",
Size=UDim2.new(1,-16,0,28),
Position=UDim2.fromOffset(u.TabWidth+26,56),
BackgroundTransparency=1,
ThemeTag={
TextColor3="Text",
},
})

u.ContainerHolder=s("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
})

u.ContainerAnim=s("CanvasGroup",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
})

u.ContainerCanvas=s("Frame",{
Size=UDim2.new(1,-u.TabWidth-32,1,-102),
Position=UDim2.fromOffset(u.TabWidth+26,90),
BackgroundTransparency=1,
},{
u.ContainerAnim,
u.ContainerHolder
})

u.Root=s("Frame",{
BackgroundTransparency=1,
Size=u.Size,
Position=u.Position,
Parent=t.Parent,
},{
u.AcrylicPaint.Frame,
u.TabDisplay,
u.ContainerCanvas,
I,
H,
})

u.HideButton=s("ImageButton",{
Visible=m.Utilities:GetOS()=="Mobile",
Size=t.Mobile.Size,
BackgroundTransparency=1,
Position=UDim2.new(1,-t.Mobile.Size.X.Offset-25,0.5,-t.Mobile.Size.Y.Offset/2),
Parent=t.Parent,
Image=t.Mobile.GetIcon(false).Image,
ImageRectOffset=t.Mobile.GetIcon(false).ImageRectOffset,
ImageRectSize=t.Mobile.GetIcon(false).ImageRectSize
})

u.TitleBar=require(e.Parent.TitleBar){
Title=t.Title,
SubTitle=t.SubTitle,
Parent=u.Root,
Window=u,
}

if m.UseAcrylic then
u.AcrylicPaint.AddParent(u.Root)
end

local J=g.GroupMotor.new{
X=u.Size.X.Offset,
Y=u.Size.Y.Offset,
}

local K=g.GroupMotor.new{
X=u.Position.X.Offset,
Y=u.Position.Y.Offset,
}

u.SelectorPosMotor=g.SingleMotor.new(17)
u.SelectorSizeMotor=g.SingleMotor.new(0)
u.ContainerBackMotor=g.SingleMotor.new(0)
u.ContainerPosMotor=g.SingleMotor.new(94)

J:onStep(function(L)
u.Root.Size=UDim2.new(0,L.X,0,L.Y)
end)

K:onStep(function(L)
u.Root.Position=UDim2.new(0,L.X,0,L.Y)
end)

local L=0
local M=0
u.SelectorPosMotor:onStep(function(N)
G.Position=UDim2.new(0,0,0,N+17)
local O=tick()
local P=O-M

if L~=nil then
u.SelectorSizeMotor:setGoal(q((math.abs(N-L)/(P*60))+16))
L=N
end
M=O
end)

u.SelectorSizeMotor:onStep(function(N)
G.Size=UDim2.new(0,4,0,N)
end)

u.ContainerBackMotor:onStep(function(N)
u.ContainerAnim.GroupTransparency=N
end)

u.ContainerPosMotor:onStep(function(N)
u.ContainerAnim.Position=UDim2.fromOffset(0,N)
end)

local N
local O
u.Maximize=function(P,Q,R)
u.OnMaximized:Fire(tick())

u.Maximized=P
u.TitleBar.MaxButton.Frame.Icon.Image=P and k.Restore or k.Max

if P then
N=u.Size.X.Offset
O=u.Size.Y.Offset
end
local S=P and p.ViewportSize.X or N
local T=P and p.ViewportSize.Y or O
J:setGoal{
X=g[R and"Instant"or"Spring"].new(S,{frequency=6}),
Y=g[R and"Instant"or"Spring"].new(T,{frequency=6}),
}
u.Size=UDim2.fromOffset(S,T)

if not Q then
K:setGoal{
X=q(P and 0 or u.Position.X.Offset,{frequency=6}),
Y=q(P and 0 or u.Position.Y.Offset,{frequency=6}),
}
end

u.PostMaximized:Fire(tick())
end

h.AddSignal(u.TitleBar.Frame.InputBegan,function(P)
if
P.UserInputType==Enum.UserInputType.MouseButton1
or P.UserInputType==Enum.UserInputType.Touch
then
v=true
x=P.Position
y=u.Root.Position

if u.Maximized then
y=UDim2.fromOffset(
o.X-(o.X*((N-100)/u.Root.AbsoluteSize.X)),
o.Y-(o.Y*(O/u.Root.AbsoluteSize.Y))
)
end

P.Changed:Connect(function()
if P.UserInputState==Enum.UserInputState.End then
v=false
end
end)
end
end)

h.AddSignal(u.TitleBar.Frame.InputChanged,function(P)
if
P.UserInputType==Enum.UserInputType.MouseMovement
or P.UserInputType==Enum.UserInputType.Touch
then
w=P
end
end)

h.AddSignal(H.InputBegan,function(P)
if
P.UserInputType==Enum.UserInputType.MouseButton1
or P.UserInputType==Enum.UserInputType.Touch
then
z=true
A=P.Position
end
end)

h.AddSignal(n.InputChanged,function(P)
if P==w and v then
local Q=P.Position-x
u.Position=UDim2.fromOffset(y.X.Offset+Q.X,y.Y.Offset+Q.Y)
K:setGoal{
X=r(u.Position.X.Offset),
Y=r(u.Position.Y.Offset),
}

if u.Maximized then
u.Maximize(false,true,true)
end
end

if
(P.UserInputType==Enum.UserInputType.MouseMovement or P.UserInputType==Enum.UserInputType.Touch)
and z
then
local Q=P.Position-A
local R=u.Size

local S=Vector3.new(R.X.Offset,R.Y.Offset,0)+Vector3.new(1,1,0)*Q
local T=
Vector2.new(math.clamp(S.X,u.MinSize.X,2048),math.clamp(S.Y,u.MinSize.Y,2048))

J:setGoal{
X=g.Instant.new(T.X),
Y=g.Instant.new(T.Y),
}
end
end)

h.AddSignal(n.InputEnded,function(P)
if z==true or P.UserInputType==Enum.UserInputType.Touch then
z=false
u.Size=UDim2.fromOffset(J:getValue().X,J:getValue().Y)
end
end)

h.AddSignal(u.TabHolder.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if u.TabHolder.CanvasSize~=UDim2.fromOffset(0,u.TabHolder.UIListLayout.AbsoluteContentSize.Y)then
u.TabHolder.CanvasSize=UDim2.fromOffset(0,u.TabHolder.UIListLayout.AbsoluteContentSize.Y)
end
end)

function u.Minimize(P)
u.Minimized=not u.Minimized
u.Root.Visible=not u.Minimized

u.OnMinimized:Fire(tick(),u.Root.Visible)

if not B then
local Q=m.MinimizeKeybind and m.MinimizeKeybind.Value or typeof(m.MinimizeKey)=="string"and m.MinimizeKey or m.MinimizeKey.Name

B=true

m:Notify{
Title="Interface",
Content=`Press {m.Utilities:Prettify(Q)} to toggle the interface.`,
Duration=6
}
end
if m.Utilities:GetOS()=="Mobile"then
local Q=t.Mobile.GetIcon(u.Minimized)
u.HideButton.Image=Q.Image
u.HideButton.ImageRectOffset=Q.ImageRectOffset
u.HideButton.ImageRectSize=Q.ImageRectSiz
end
u.PostMinimized:Fire(tick(),u.Root.Visible)
end

h.AddSignal(n.InputBegan,function(P)
if
type(m.MinimizeKeybind)=="table"
and m.MinimizeKeybind.Type=="Keybind"
and not n:GetFocusedTextBox()
then
if P.KeyCode.Name==m.MinimizeKeybind.Value or P.KeyCode.Name==m.MinimizeKeybind.Value.Name then
u:Minimize()
end
elseif(P.KeyCode==m.MinimizeKey or P.KeyCode.Name==m.MinimizeKey)and not n:GetFocusedTextBox()then
u:Minimize()
end
end)

h.AddSignal(u.HideButton.InputBegan,function(P)
if
P.UserInputType==Enum.UserInputType.MouseButton1
or P.UserInputType==Enum.UserInputType.Touch
then
C=true
E=P.Position
F=u.HideButton.Position

P.Changed:Connect(function()
if P.UserInputState==Enum.UserInputState.End then
C=false
end
end)
end
end)

h.AddSignal(u.HideButton.InputChanged,function(P)
if
P.UserInputType==Enum.UserInputType.MouseMovement
or P.UserInputType==Enum.UserInputType.Touch
then
D=P
end
end)

h.AddSignal(n.InputChanged,function(P)
if P==D and C then
local Q=P.Position-E
u.HideButton.Position=UDim2.new(F.X.Scale,F.X.Offset+Q.X,F.Y.Scale,F.Y.Offset+Q.Y)
end
end)

if m.Utilities:GetOS()=="Mobile"then
h.AddSignal(u.HideButton.TouchTap,function()
u.Minimized=not u.Minimized
u.Root.Visible=not u.Minimized
local P=t.Mobile.GetIcon(u.Minimized)
u.HideButton.Image=P.Image
u.HideButton.ImageRectOffset=P.ImageRectOffset
u.HideButton.ImageRectSize=P.ImageRectSize
end)
else
h.AddSignal(u.HideButton.MouseButton1Click,function()
u.Minimized=not u.Minimized
u.Root.Visible=not u.Minimized
end)
end

function u.Destroy(P)
if t.OnClose then
task.spawn(t.OnClose)
end
if m.UseAcrylic then
u.AcrylicPaint.Model:Destroy()
end
u.Root:Destroy()
end

local P=require(l.Dialog):Init(u)
function u.Dialog(Q,R)
local S=P:Create()
S.Title.Text=R.Title

local T=s("TextLabel",{
FontFace=Font.new"rbxasset://fonts/families/GothamSSm.json",
Text=R.Content,
TextColor3=Color3.fromRGB(240,240,240),
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,
Size=UDim2.new(1,-40,1,0),
Position=UDim2.fromOffset(20,60),
BackgroundTransparency=1,
Parent=S.Root,
ClipsDescendants=false,
ThemeTag={
TextColor3="Text",
},
})

s("UISizeConstraint",{
MinSize=Vector2.new(300,165),
MaxSize=Vector2.new(620,math.huge),
Parent=S.Root,
})

S.Root.Size=UDim2.fromOffset(T.TextBounds.X+40,165)
if T.TextBounds.X+40>u.Size.X.Offset-120 then
S.Root.Size=UDim2.fromOffset(u.Size.X.Offset-120,165)
T.TextWrapped=true
S.Root.Size=UDim2.fromOffset(u.Size.X.Offset-120,T.TextBounds.Y+150)
end

for U,V in next,R.Buttons do
S:Button(V.Title,V.Callback)
end

S:Open()

if R.Yield then
S.Closed:Wait()
end

return S
end

local Q=require(l.Tab):Init(u)

function u.Tab(R,S)
return Q:New(S.Title,S.Icon,u.TabHolder)
end

function u.AddTab(R,S)
return u:Tab(S)
end

function u.CreateTab(R,S)
return u:Tab(S)
end

function u.SelectTab(R,S)
Q:SelectTab(S)
end

h.AddSignal(u.TabHolder:GetPropertyChangedSignal"CanvasPosition",function()
L=Q:GetCurrentTabPos()+16
M=0
u.SelectorPosMotor:setGoal(r(Q:GetCurrentTabPos()))
end)

return u
end

end)()
end
b["Elements/Button"]=function()
local e=createProxy"Root/Elements/Button"
local function require(f)
local g=tostring(f):gsub("Root/","")
return __REQUIRE(g)
end
return(function()
local f=e.Parent.Parent
local g=require(f.Modules.Creator)

local h=g.New
local i=f.Components

local j={}
j.__index=j
j.__type="Button"

function j.New(k,l)
assert(l.Title,"Button - Missing Title")
l.Callback=l.Callback or function()end

local m=require(i.Element)(l.Title,l.Description,k.Container,true)

local n=h("ImageLabel",{
Size=UDim2.fromOffset(16,16),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-10,0.5,0),
BackgroundTransparency=1,
Parent=m.Frame,
ThemeTag={
ImageColor3="Text",
}
})::ImageLabel

k.Library.Utilities.Icons:SetIcon(n,"chevron-right")

g.AddSignal(m.Frame.MouseButton1Click,function()
if typeof(l.Callback)=="function"then
k.Library:SafeCallback(l.Callback,l.Value)
end
end)

m.Instance=m

return m
end

return j

end)()
end
b["Elements/Colorpicker"]=function()
local e=createProxy"Root/Elements/Colorpicker"
local function require(f)
local g=tostring(f):gsub("Root/","")
return __REQUIRE(g)
end
return(function()
local f=game:GetService"Players"

local g=f.LocalPlayer
local h=g:GetMouse()

local i=e.Parent.Parent
local j=require(i.Modules.Creator)

local k=j.New
local l=i.Components

local m={}
m.__index=m
m.__type="Colorpicker"

function m.New(n,o,p)
local q=n.Library
assert(p.Title,"Colorpicker - Missing Title")
assert(p.Default,"AddColorPicker: Missing default value.")

local r={
Value=p.Default or p.Value,
Transparency=p.Transparency or 0,
UpdateOnChange=p.UpdateOnChange or p.UpdateWhileSliding or false,
Type="Colorpicker",
Title=type(p.Title)=="string"and p.Title or"Colorpicker",
Callback=p.Callback or function(r)end,
}

function r.SetHSVFromRGB(s,t)
local u,v,w=Color3.toHSV(t)
r.Hue=u
r.Sat=v
r.Vib=w
end

r:SetHSVFromRGB(r.Value)

local s=require(l.Element)(p.Title,p.Description,n.Container,true)

r.SetTitle=s.SetTitle
r.SetDesc=s.SetDesc

local t=k("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundColor3=r.Value,
Parent=s.Frame,
},{
k("UICorner",{
CornerRadius=UDim.new(0,4),
}),
})::Frame

k("ImageLabel",{
Size=UDim2.fromOffset(26,26),
Position=UDim2.new(1,-10,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
Parent=s.Frame,
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
},{
k("UICorner",{
CornerRadius=UDim.new(0,4),
}),
t,
})

local function CreateColorDialog()
local u=require(l.Dialog):Create()
u.Title.Text=r.Title
u.Root.Size=UDim2.fromOffset(430,330)

local v,w,x=r.Hue,r.Sat,r.Vib
local y=r.Transparency

local z,A,B,C=r.Hue,r.Sat,r.Vib,r.Transparency

local function CreateInput()
local D=require(l.Textbox)()
D.Frame.Parent=u.Root
D.Frame.Size=UDim2.new(0,90,0,32)

return D
end

local function CreateInputLabel(D,E):TextLabel
return k("TextLabel",{
FontFace=Font.new(
"rbxasset://fonts/families/GothamSSm.json",
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
),
Text=D,
TextColor3=Color3.fromRGB(240,240,240),
TextSize=13,
TextXAlignment=Enum.TextXAlignment.Left,
Size=UDim2.new(1,0,0,32),
Position=E,
BackgroundTransparency=1,
Parent=u.Root,
ThemeTag={
TextColor3="Text",
},
})::TextLabel
end

local function GetRGB()
local D=Color3.fromHSV(v,w,x)
return{R=math.floor(D.R*255),G=math.floor(D.G*255),B=math.floor(D.B*255)}
end

local D=k("ImageLabel",{
Size=UDim2.new(0,18,0,18),
ScaleType=Enum.ScaleType.Fit,
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Image="http://www.roblox.com/asset/?id=4805639000",
})::ImageLabel

local E=k("ImageLabel",{
Size=UDim2.fromOffset(180,160),
Position=UDim2.fromOffset(20,55),
Image="rbxassetid://4155801252",
BackgroundColor3=r.Value,
BackgroundTransparency=0,
Parent=u.Root,
},{
k("UICorner",{
CornerRadius=UDim.new(0,4),
}),
D,
})::ImageLabel

local F=k("Frame",{
BackgroundColor3=r.Value,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=r.Transparency,
},{
k("UICorner",{
CornerRadius=UDim.new(0,4),
}),
})::Frame

k("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(112,220),
Size=UDim2.fromOffset(88,24),
Parent=u.Root,
},{
k("UICorner",{
CornerRadius=UDim.new(0,4),
}),
k("UIStroke",{
Thickness=2,
Transparency=0.75,
}),
F,
})

local G=k("Frame",{
BackgroundColor3=r.Value,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
},{
k("UICorner",{
CornerRadius=UDim.new(0,4),
}),
})::Frame

k("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(20,220),
Size=UDim2.fromOffset(88,24),
Parent=u.Root,
},{
k("UICorner",{
CornerRadius=UDim.new(0,4),
}),
k("UIStroke",{
Thickness=2,
Transparency=0.75,
}),
G,
})

local H={}

for I=0,1,0.1 do
H[#H+1]=ColorSequenceKeypoint.new(I,Color3.fromHSV(I,1,1))
end

local I=k("UIGradient",{
Color=ColorSequence.new(H),
Rotation=90,
})::UIGradient

local J=k("Frame",{
Size=UDim2.new(1,0,1,-10),
Position=UDim2.fromOffset(0,5),
BackgroundTransparency=1,
})::Frame

local K=k("ImageLabel",{
Size=UDim2.fromOffset(14,14),
Image="http://www.roblox.com/asset/?id=12266946128",
Parent=J,
ThemeTag={
ImageColor3="DialogInput",
},
})::ImageLabel

local L=k("Frame",{
Size=UDim2.fromOffset(12,190),
Position=UDim2.fromOffset(210,55),
Parent=u.Root,
},{
k("UICorner",{
CornerRadius=UDim.new(1,0),
}),
I,
J,
})::Frame

local M=CreateInput()
M.Frame.Position=UDim2.fromOffset(p.Transparency and 260 or 240,55)
CreateInputLabel("Hex",UDim2.fromOffset(p.Transparency and 360 or 340,55))

local N=CreateInput()
N.Frame.Position=UDim2.fromOffset(p.Transparency and 260 or 240,95)
CreateInputLabel("Red",UDim2.fromOffset(p.Transparency and 360 or 340,95))

local O=CreateInput()
O.Frame.Position=UDim2.fromOffset(p.Transparency and 260 or 240,135)
CreateInputLabel("Green",UDim2.fromOffset(p.Transparency and 360 or 340,135))

local P=CreateInput()
P.Frame.Position=UDim2.fromOffset(p.Transparency and 260 or 240,175)
CreateInputLabel("Blue",UDim2.fromOffset(p.Transparency and 360 or 340,175))

local Q
if p.Transparency then
Q=CreateInput()
Q.Frame.Position=UDim2.fromOffset(260,215)
CreateInputLabel("Alpha",UDim2.fromOffset(360,215))
end

local R,S,T
if p.Transparency then
local U=k("Frame",{
Size=UDim2.new(1,0,1,-10),
Position=UDim2.fromOffset(0,5),
BackgroundTransparency=1,
})::Frame

S=k("ImageLabel",{
Size=UDim2.fromOffset(14,14),
Image="http://www.roblox.com/asset/?id=12266946128",
Parent=U,
ThemeTag={
ImageColor3="DialogInput",
},
})::ImageLabel

T=k("Frame",{
Size=UDim2.fromScale(1,1),
},{
k("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Rotation=270,
}),
k("UICorner",{
CornerRadius=UDim.new(1,0),
}),
})::Frame

R=k("Frame",{
Size=UDim2.fromOffset(12,190),
Position=UDim2.fromOffset(230,55),
Parent=u.Root,
BackgroundTransparency=1,
},{
k("UICorner",{
CornerRadius=UDim.new(1,0),
}),
k("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Parent=u.Root,
},{
k("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
T,
U,
})::Frame
end

local function Display()
E.BackgroundColor3=Color3.fromHSV(v,1,1)
K.Position=UDim2.new(0,-1,v,-6)
D.Position=UDim2.new(w,0,1-x,0)
G.BackgroundColor3=Color3.fromHSV(v,w,x)

M.Input.Text=`#{Color3.fromHSV(v,w,x):ToHex()}`
N.Input.Text=GetRGB().R
O.Input.Text=GetRGB().G
P.Input.Text=GetRGB().B

if p.Transparency then
T.BackgroundColor3=Color3.fromHSV(v,w,x)
G.BackgroundTransparency=y
S.Position=UDim2.new(0,-1,1-y,-6)
Q.Input.Text=`{q.Utilities:Round((1-y)*100,0)}%`
end

if r.UpdateOnChange then
r:SetValue({v,w,x},y)
end
end

j.AddSignal(M.Input.FocusLost,function(U)
if U then
local V,W=pcall(Color3.fromHex,M.Input.Text)
if V and typeof(W)=="Color3"then
v,w,x=Color3.toHSV(W)
end
end
Display()
end)

j.AddSignal(N.Input.FocusLost,function(U)
if U then
local V=GetRGB()
local W,X=pcall(Color3.fromRGB,N.Input.Text,V.G,V.B)
if W and typeof(X)=="Color3"then
if tonumber(N.Input.Text)<=255 then
v,w,x=Color3.toHSV(X)
end
end
end
Display()
end)

j.AddSignal(O.Input.FocusLost,function(U)
if U then
local V=GetRGB()
local W,X=
pcall(Color3.fromRGB,V.R,O.Input.Text,V.B)
if W and typeof(X)=="Color3"then
if tonumber(O.Input.Text)<=255 then
v,w,x=Color3.toHSV(X)
end
end
end
Display()
end)

j.AddSignal(P.Input.FocusLost,function(U)
if U then
local V=GetRGB()
local W,X=
pcall(Color3.fromRGB,V.R,V.G,P.Input.Text)
if W and typeof(X)=="Color3"then
if tonumber(P.Input.Text)<=255 then
v,w,x=Color3.toHSV(X)
end
end
end
Display()
end)

if p.Transparency then
j.AddSignal(Q.Input.FocusLost,function(U)
if U then
pcall(function()
local V=tonumber(Q.Input.Text)
y=V>=0 and V<=100 and 1-V*0.01 or y
end)
end
Display()
end)
end

local function UpdateSatVib()
local U=E.AbsolutePosition.X
local V=U+E.AbsoluteSize.X
local W=math.clamp(h.X,U,V)

local X=E.AbsolutePosition.Y
local Y=X+E.AbsoluteSize.Y
local Z=math.clamp(h.Y,X,Y)

w=(W-U)/(V-U)
x=1-((Z-X)/(Y-X))
Display()
end

local function UpdateHue()
local U=L.AbsolutePosition.Y
local V=U+L.AbsoluteSize.Y
local W=math.clamp(h.Y,U,V)

v=((W-U)/(V-U))
Display()
end

local function UpdateTransparency()
local U=R.AbsolutePosition.Y
local V=U+R.AbsoluteSize.Y
local W=math.clamp(h.Y,U,V)

y=1-((W-U)/(V-U))
Display()
end

local U
j.AddSignal(E.InputBegan,function(V)
if V.UserInputType==Enum.UserInputType.MouseButton1
or V.UserInputType==Enum.UserInputType.Touch then

U=h.Move:Connect(UpdateSatVib)
UpdateSatVib()
end
end)

j.AddSignal(E.InputEnded,function(V)
if V.UserInputType==Enum.UserInputType.MouseButton1
or V.UserInputType==Enum.UserInputType.Touch then

if U then
U:Disconnect()
U=nil
end
end
end)

j.AddSignal(L.InputBegan,function(V)
if V.UserInputType==Enum.UserInputType.MouseButton1
or V.UserInputType==Enum.UserInputType.Touch then

U=h.Move:Connect(UpdateHue)
UpdateHue()
end
end)

j.AddSignal(L.InputEnded,function(V)
if V.UserInputType==Enum.UserInputType.MouseButton1
or V.UserInputType==Enum.UserInputType.Touch then

if U then
U:Disconnect()
U=nil
end
end
end)

if p.Transparency then
j.AddSignal(R.InputBegan,function(V)
if V.UserInputType==Enum.UserInputType.MouseButton1
or V.UserInputType==Enum.UserInputType.Touch then

U=h.Move:Connect(UpdateTransparency)
UpdateTransparency()
end
end)

j.AddSignal(R.InputEnded,function(V)
if V.UserInputType==Enum.UserInputType.MouseButton1
or V.UserInputType==Enum.UserInputType.Touch then

if U then
U:Disconnect()
U=nil
end
end
end)
end

Display()

u:Button("Done",function()
r:SetValue({v,w,x},y)
end)

u:Button("Cancel",function()
r:SetValue({z,A,B},C)
end)

u:Open()
end

function r.Display(u)
rawset(r,"Value",Color3.fromHSV(r.Hue,r.Sat,r.Vib))

t.BackgroundColor3=r.Value
t.BackgroundTransparency=r.Transparency

if typeof(r.Callback)=="function"then
q:SafeCallback(r.Callback,r.Value)
end
if typeof(r.Changed)=="function"then
q:SafeCallback(r.Changed,r.Value)
end
end

function r.SetValue(u,v,w)
local x=Color3.fromHSV(v[1],v[2],v[3])

rawset(r,"Transparency",w or 0)
r:SetHSVFromRGB(x)
r:Display()
end

function r.SetValueRGB(u,v,w)
rawset(r,"Transparency",w or 0)
r:SetHSVFromRGB(v)
r:Display()
end

function r.OnChanged(u,v)
r.Changed=v
q:SafeCallback(v,r.Value,r.Value)
end

function r.Destroy(u)
s:Destroy()
q.Options[o]=nil
end

j.AddSignal(s.Frame.MouseButton1Click,function()
CreateColorDialog()
end)

r:Display()

q.Options[o]=r

r.Instance=s

return setmetatable(r,{
__newindex=function(u,v,w)
local x=typeof(w)
if v=="Value"then
if x=="table"then
task.spawn(r.SetValue,r,w,r.Transparency)
else
task.spawn(r.SetValueRGB,r,w,r.Transparency)
end
elseif v=="Transparency"and x=="number"then
task.spawn(r.SetValueRGB,r,r.Value,w)
else
rawset(u,v,w)
end
end
})
end

return m
end)()
end
b["Elements/Dropdown"]=function()
local e=createProxy"Root/Elements/Dropdown"
local function require(f)
local g=tostring(f):gsub("Root/","")
return __REQUIRE(g)
end
return(function()
local f=game:GetService"UserInputService"
local g=game:GetService"Players".LocalPlayer:GetMouse()
local h=game:GetService"Workspace".CurrentCamera

local i=e.Parent.Parent
local j=require(i.Modules.Creator)
local k=require(i.Packages.Flipper)

local l=j.New
local m=i.Components

local n={}
n.__index=n
n.__type="Dropdown"

function n.New(o,p,q)
local r=o.Library

local s={
Values=(function()
local s={}

for t,u in next,q.Values or{}do
s[#s+1]=u
end

return s
end)(),
Value=q.Default or q.Value,
Multi=q.Multi or false,
AutoDeselect=q.AutoDeselect or false,
Searchable=q.Searchable or false,
FocusSearch=q.FocusSearch or true,
SearchPlaceholder=q.SearchPlaceholder or"Search...",
Displayer=typeof(q.Displayer)=="function"and q.Displayer or function(s)
return typeof(s)~="number"and tostring(r.Utilities:Prettify(s))or s
end,
CustomDisplayer=(typeof(q.Displayer)=="function"and q.Displayer and true)or false,
Buttons={},
Opened=false,
Type="Dropdown",
Callback=q.Callback or function()end,
Changed=q.Changed or function()end
}

local t=require(m.Element)(q.Title,q.Description,o.Container,false)
t.DescLabel.Size=UDim2.new(1,-170,0,14)

s.SetTitle=t.SetTitle
s.SetDesc=t.SetDesc

local u=l("TextLabel",{
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

local v=l("ImageLabel",{
Image="rbxassetid://10709790948",
Size=UDim2.fromOffset(16,16),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-8,0.5,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="SubText",
}
})

local w=l("TextButton",{
Size=UDim2.fromOffset(160,30),
Position=UDim2.new(1,-10,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=0.9,
Parent=t.Frame,
ThemeTag={
BackgroundColor3="DropdownFrame"
}
},{
l("UICorner",{
CornerRadius=UDim.new(0,5),
}),
l("UIStroke",{
Transparency=0.5,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
ThemeTag={
Color="InElementBorder",
},
}),
v,
u,
})

local x=l("UIListLayout",{
Padding=UDim.new(0,3),
})

local y=l("ScrollingFrame",{
Size=UDim2.new(1,-5,1,s.Searchable and-40 or-10),
Position=UDim2.fromOffset(5,s.Searchable and 40 or 5),
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
x,
})

local z=l("Frame",{
Size=UDim2.fromScale(1,0.6),
ThemeTag={
BackgroundColor3="DropdownHolder",
},
},{
y,
l("UICorner",{
CornerRadius=UDim.new(0,7),
}),
l("UIStroke",{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
ThemeTag={
Color="DropdownBorder",
},
}),
l("ImageLabel",{
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

local A=require(m.Textbox)(z,true)
A.Frame.Visible=s.Searchable
A.Frame.AnchorPoint=Vector2.new(0.5,0)
A.Frame.Position=UDim2.new(0.5,0,0,5)
A.Frame.Size=UDim2.new(1,-5,0,32)
A.Input.PlaceholderText=s.SearchPlaceholder
A.Input.Text=""

local B=A.Input

local C=l("Frame",{
Size=UDim2.fromOffset(4,14),
BackgroundColor3=Color3.fromRGB(76,194,255),
Position=UDim2.fromOffset(-1,16),
AnchorPoint=Vector2.new(0,0.5),
ThemeTag={
BackgroundColor3="Accent",
}
},{
l("UICorner",{
CornerRadius=UDim.new(0,2),
}),
})::Frame

local D=l("TextLabel",{
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

local E=l("TextButton",{
Size=UDim2.new(1,-5,0,32),
BackgroundTransparency=1,
ZIndex=23,
Text="",
ThemeTag={
BackgroundColor3="DropdownOption"
}
},{
C,
D,
l("UICorner",{
CornerRadius=UDim.new(0,6),
})
})::TextButton

local F=l("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromOffset(170,300),
Parent=o.Library.GUI,
Visible=false,
},{
z,
l("UISizeConstraint",{
MinSize=Vector2.new(170,0),
}),
})

r.OpenFrames[#r.OpenFrames+1]=F

local function RecalculateListPosition()
local G=0
if h.ViewportSize.Y-w.AbsolutePosition.Y<F.AbsoluteSize.Y-5 then
G=F.AbsoluteSize.Y
-5
-(h.ViewportSize.Y-w.AbsolutePosition.Y)
+40
end
F.Position=
UDim2.fromOffset(w.AbsolutePosition.X-1,w.AbsolutePosition.Y-5-G)
end

local G=0
local function RecalculateListSize()
local H=s.Searchable and 42 or 0
local I=s.Searchable and 35 or 0

F.Size=UDim2.fromOffset(G,math.min(392-H,x.AbsoluteContentSize.Y+10+I))
end

local function RecalculateCanvasSize()
y.CanvasSize=UDim2.fromOffset(0,x.AbsoluteContentSize.Y)
end

local function RepopulateDropdownList()
s:BuildDropdownList()
end

RecalculateListPosition()
RecalculateListSize()

j.AddSignal(w:GetPropertyChangedSignal"AbsolutePosition",RecalculateListPosition)
j.AddSignal(B:GetPropertyChangedSignal"Text",RepopulateDropdownList)

local H=o.ScrollFrame
function s.Open(I)
s.Opened=true
H.ScrollingEnabled=false
F.Visible=true
z:TweenSize(
UDim2.fromScale(1,1),
Enum.EasingDirection.Out,
Enum.EasingStyle.Quart,
.2
)

if s.Searchable then
B.Text=""

if s.FocusSearch then
B:CaptureFocus()
end
end
end

function s.Close(I)
s.Opened=false
H.ScrollingEnabled=true
z.Size=UDim2.fromScale(1,0.6)
F.Visible=false

if s.Searchable then
B.Text=""
B:ReleaseFocus()
end
end

j.AddSignal(w.MouseButton1Click,function()
s:Open()
end)

j.AddSignal(f.InputBegan,function(I)
if
I.UserInputType==Enum.UserInputType.MouseButton1
or I.UserInputType==Enum.UserInputType.Touch
then
local J,K=z.AbsolutePosition,z.AbsoluteSize
if
g.X<J.X
or g.X>J.X+K.X
or g.Y<(J.Y-20-1)
or g.Y>J.Y+K.Y
then
s:Close()
end
end
end)

function s.Display(I)
local J=s.Values
local K=""

if q.Multi then
for L,M in next,J do
if s.Value[M]then
K=`{K}{s.Displayer(M)}, `
end
end
K=K:sub(1,#K-2)
else
K=s.Value and s.Displayer(s.Value)or""
end

u.Text=(K==""and"--"or K)
end

function s.GetActiveValues(I)
if q.Multi then
local J={}

for K,L in next,s.Value do
J[#J+1]=K
end

return J
else
return s.Value and 1 or 0
end
end

function s.BuildDropdownList(I)
local J=s.Values
local K={}

for L,M in next,y:GetChildren()do
if not M:IsA"UIListLayout"then
M:Destroy()
end
end

local L=0

for M,N in next,J do
L+=1

if L%30==0 then
task.wait()
end

if s.Searchable and B.Text~=""and not string.lower(s.Displayer(N)):match(string.lower(B.Text))then
continue
end

local O={}
local P

local Q=E:Clone()
local R,S=Q.Frame,Q.ButtonLabel





j.AddThemeObject(Q,{
BackgroundColor3="DropdownOption"
})

j.AddThemeObject(R,{
BackgroundColor3="Accent",
})

j.AddThemeObject(S,{
TextColor3="Text"
})

if q.Multi then
P=s.Value[N]
else
P=s.Value==N
end local

T, U=j.SpringMotor(1,Q,"BackgroundTransparency")local
V, W=j.SpringMotor(1,R,"BackgroundTransparency")
local X=k.SingleMotor.new(6)

X:onStep(function(Y)
R.Size=UDim2.new(0,4,0,Y)
end)

j.AddSignal(Q.MouseEnter,function()
U(P and 0.85 or 0.89)
end)

j.AddSignal(Q.MouseLeave,function()
U(P and 0.89 or 1)
end)

j.AddSignal(Q.MouseButton1Down,function()
U(0.92)
end)

j.AddSignal(Q.MouseButton1Up,function()
U(P and 0.85 or 0.89)
end)

function O.UpdateButton(Y)
if q.Multi then
P=s.Value[N]
if P then
U(0.89)
end
else
P=s.Value==N
U(P and 0.89 or 1)
end

X:setGoal(k.Spring.new(P and 14 or 6,{frequency=6}))
W(P and 0 or 1)
end

S.InputBegan:Connect(function(Y)
if
Y.UserInputType==Enum.UserInputType.MouseButton1
or Y.UserInputType==Enum.UserInputType.Touch
then
local Z=not P

if s:GetActiveValues()==1 and not Z and not q.AllowNull then
else
if q.Multi then
P=Z
s.Value[N]=P and true or nil

if typeof(s.Callback)=="function"then
r:SafeCallback(s.Callback,s.Value)
end
if typeof(s.Changed)=="function"then
r:SafeCallback(s.Changed,s.Value)
end
else
P=Z
s:SetValue(P and N or nil)

for _,aa in next,K do
aa:UpdateButton()
end
end

O:UpdateButton()
s:Display()
end
end
end)

S.Text=s.Displayer(N)
Q.Parent=y

O:UpdateButton()
s:Display()

K[Q]=O
end

G=0

for aa,M in next,K do
if aa.ButtonLabel then
if aa.ButtonLabel.TextBounds.X>G then
G=aa.ButtonLabel.TextBounds.X
end
end
end

G=G+30

RecalculateCanvasSize()
RecalculateListSize()
end

function s.SetValues(aa,I)
if I then
rawset(s,"Values",I)
end

s:BuildDropdownList()
end

function s.OnChanged(aa,I)
s.Changed=I
r:SafeCallback(I,s.Value,s.Value)
end

function s.SetValue(aa,I)
if s.Multi then
local J={}

for K,L in next,I do
if table.find(s.Values,K)then
J[K]=true
end
end

rawset(s,"Value",J)
else
if not I then
rawset(s,"Value",nil)
elseif table.find(s.Values,I)then
rawset(s,"Value",I)
end
end

s:BuildDropdownList()

if typeof(s.Callback)=="function"then
r:SafeCallback(s.Callback,s.Value)
end
if typeof(s.Changed)=="function"then
r:SafeCallback(s.Changed,s.Value)
end
end

function s.Destroy(aa)
t:Destroy()
r.Options[p]=nil
end

s:BuildDropdownList()
s:Display()

local aa={}

if type(q.Default)=="table"then
for I,J in next,q.Default do
local K=table.find(s.Values,J)

if K then
aa[#aa+1]=K
end
end
table.clear(q.Default)
elseif type(q.Default)=="number"and s.Values[q.Default]~=nil then
aa[#aa+1]=q.Default
else
local I=table.find(s.Values,q.Default)
if I then
aa[#aa+1]=I
end
end

if next(aa)then
for I=1,#aa do
local J=aa[I]

if q.Multi then
s.Value[s.Values[J] ]=true
else
s.Value=s.Values[J]
break
end
end

s:BuildDropdownList()
s:Display()
end

r.Options[p]=s

s.Instance=t

return setmetatable(s,{
__newindex=function(I,J,K)
if J=="Value"then
task.spawn(s.SetValue,s,K)
elseif J=="Values"or J=="List"then
task.spawn(s.SetValues,s,K)
end
rawset(I,J,K)
end
})
end

return n

end)()
end
b.Elements=function()
local aa=createProxy"Root/Elements"
local function require(e)
local f=tostring(e):gsub("Root/","")
return __REQUIRE(f)
end
return(function()

local e={}


local f=aa:GetChildren()


for g=1,#f do
e[g]=require(f[g])
end

return e

end)()
end
b["Elements/Input"]=function()
local aa=createProxy"Root/Elements/Input"
local function require(e)
local f=tostring(e):gsub("Root/","")
return __REQUIRE(f)
end
return(function()
local e=aa.Parent.Parent
local f=require(e.Modules.Creator)

local g=f.AddSignal
local h=e.Components

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
local function require(e)
local f=tostring(e):gsub("Root/","")
return __REQUIRE(f)
end
return(function()
local e=game:GetService"UserInputService"

local f=aa.Parent.Parent
local g=require(f.Modules.Creator)

local h=g.New
local i=f.Components

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
}
})

local t=h("TextButton",{
Size=UDim2.fromOffset(0,30),
Position=UDim2.new(1,-35,0.5,0),
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


s.MouseButton1Click:Connect(function()
o:SetValue("None",o.Mode)
end)

function o.GetState(u)
if e:GetFocusedTextBox()and o.Mode~="Always"then
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
return v=="LeftMousebutton"and e:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
or v=="RightMousebutton"
and e:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
else
return e:IsKeyDown(Enum.KeyCode[o.Value])
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
if
u.UserInputType==Enum.UserInputType.MouseButton1
or u.UserInputType==Enum.UserInputType.Touch
then
p=true
r.Text="..."

wait(0.2)

e.InputBegan:Once(function(v)
local w

if v.UserInputType==Enum.UserInputType.Keyboard then
w=v.KeyCode.Name
elseif v.UserInputType==Enum.UserInputType.MouseButton1 then
w="LeftMousebutton"
elseif v.UserInputType==Enum.UserInputType.MouseButton2 then
w="RightMousebutton"
end

e.InputEnded:Once(function(x)
if(x.KeyCode.Name==w
or w=="LeftMousebutton"and x.UserInputType==Enum.UserInputType.MouseButton1
or w=="RightMousebutton"and x.UserInputType==Enum.UserInputType.MouseButton2)
and not n.Unloaded
then
p=false

o.Value=w

r.Text=n.Utilities:Prettify(o.Value)

n:SafeCallback(o.ChangedCallback,x.KeyCode or x.UserInputType)
n:SafeCallback(o.Changed,x.KeyCode or x.UserInputType)
end
end)
end)
end
end)

g.AddSignal(e.InputBegan,function(u)
if not p and not e:GetFocusedTextBox()then
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
local function require(e)
local f=tostring(e):gsub("Root/","")
return __REQUIRE(f)
end
return(function()
local e=aa.Parent.Parent
local f=e.Components

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

local m=require(f.Element)(j.Title,l.Value,h.Container,false,{
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
local function require(e)
local f=tostring(e):gsub("Root/","")
return __REQUIRE(f)
end
return(function()
local e=game:GetService"UserInputService"
local f=aa.Parent.Parent
local g=require(f.Modules.Creator)

local h=g.New
local i=f.Components

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

g.AddSignal(e.InputChanged,function(v)
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
local function require(e)
local f=tostring(e):gsub("Root/","")
return __REQUIRE(f)
end
return(function()

local e,f=game:GetService"TweenService",game:GetService"UserInputService"
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

e:Create(
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
Position=UDim2.new(1,-10,0.5,0),
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
Position=UDim2.new(1,-30,0.5,0),
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
})


local function UpdateClearButton()
E.Visible=(B.Value~="None"and B.Value~=Enum.KeyCode.Unknown)
end


E.MouseButton1Click:Connect(function()
B:SetValue"None"
UpdateClearButton()
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

local function UpdateTogglePosition()
w.Position=UDim2.new(1,F.Position.X.Offset-F.AbsoluteSize.X-10,0.5,0)
end

function B.GetState(G)
if f:GetFocusedTextBox()and G.Mode~="Always"then
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
return H=="LeftMousebutton"and f:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
or H=="RightMousebutton"
and f:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
else
return f:IsKeyDown(Enum.KeyCode[G.Value])
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
F.Size=UDim2.new()
F.Position=UDim2.new()
F:Destroy()
r.Options[z]=nil
end

h.AddSignal(F.InputBegan,function(G)

if G.UserInputType==Enum.UserInputType.MouseButton2 then
B:SetValue"None"
UpdateClearButton()
return
end

if
G.UserInputType==Enum.UserInputType.MouseButton1
or G.UserInputType==Enum.UserInputType.Touch
then
C=true
D.Text="..."

wait(0.2)

f.InputBegan:Once(function(H)
local I

if H.UserInputType==Enum.UserInputType.Keyboard then
I=H.KeyCode.Name
elseif H.UserInputType==Enum.UserInputType.MouseButton1 then
I="LeftMousebutton"
elseif H.UserInputType==Enum.UserInputType.MouseButton2 then
I="RightMousebutton"
end

f.InputEnded:Once(function(J)
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

h.AddSignal(f.InputBegan,function(G)
if not C and not f:GetFocusedTextBox()then
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

h.AddSignal(F:GetPropertyChangedSignal"AbsoluteSize",UpdateTogglePosition)

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
local function require(e)
local f=tostring(e):gsub("Root/","")
return __REQUIRE(f)
end
return(function()

local function Clone<Original>(e:any&Original):(Original,boolean)
local f=typeof(e)

if f=="function"and(clonefunc or clonefunction)then
return(clonefunc or clonefunction)(e),true
elseif f=="Instance"and(cloneref or clonereference)then
return(cloneref or clonereference)(e),true
elseif f=="table"then
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

return deepcopy(e),true
else
return e,false
end
end


local e={}
local function GetService(f:string)
if not e[f]then
e[f]=Clone(game:GetService(f))
end
return e[f]
end

local f=GetService"MarketplaceService"
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
local A,B=pcall(f.GetProductInfo,f,game.PlaceId)

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
local function require(e)
local f=tostring(e):gsub("Root/","")
return __REQUIRE(f)
end
return(function()
local e=aa.Parent.Parent.Parent
local f=require(e.Modules.Creator)
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

local o=f.New("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
})

f.AddSignal(o:GetPropertyChangedSignal"AbsolutePosition",function()
m(o)
end)

f.AddSignal(o:GetPropertyChangedSignal"AbsoluteSize",function()
m(o)
end)

l.AddParent=function(p)
f.AddSignal(p:GetPropertyChangedSignal"Visible",function()
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
local function require(e)
local f=tostring(e):gsub("Root/","")
return __REQUIRE(f)
end
return(function()
local e=aa.Parent.Parent.Parent
local f=require(e.Modules.Creator)
local g=require(aa.Parent.AcrylicBlur)

local h=f.New

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

if require(e).UseAcrylic then
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
local function require(e)
local f=tostring(e):gsub("Root/","")
return __REQUIRE(f)
end
return(function()
local e=aa.Parent.Parent.Parent
local f=require(e.Modules.Creator)

local function createAcrylic()
local g=f.New("Part",{
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
f.New("SpecialMesh",{
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
local function require(e)
local f=tostring(e):gsub("Root/","")
return __REQUIRE(f)
end
return(function()
local e={
AcrylicBlur=require(aa.AcrylicBlur),
CreateAcrylic=require(aa.CreateAcrylic),
AcrylicPaint=require(aa.AcrylicPaint),
}

function e.init()
local f=Instance.new"DepthOfFieldEffect"
f.FarIntensity=0
f.InFocusRadius=0.1
f.NearIntensity=1

local g={}

function e.Enable()
for h,i in next,g do
i.Enabled=false
end
f.Parent=game:GetService"Lighting"
end

function e.Disable()
for h,i in next,g do
i.Enabled=i.enabled
end
f.Parent=nil
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
e.Enable()
end

return e

end)()
end
b["Modules/Acrylic/Utils"]=function()
createProxy"Root/Modules/Acrylic/Utils"




return(function()
local function map(aa,e,f,g,h)
return(aa-e)*(h-g)/(f-e)+g
end

local function viewportPointToWorld(aa,e)
local f=game:GetService"Workspace".CurrentCamera:ScreenPointToRay(aa.X,aa.Y)
return f.Origin+f.Direction*e
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
local function require(e)
local f=tostring(e):gsub("Root/","")
return __REQUIRE(f)
end
return(function()

local e=aa.Parent.Parent
local f=require(e.Themes)local
g, h=require(e.Packages.Flipper), require(e.Packages.Ripple)
local i=require(e.Packages.Signal)


local j
local function GetLibrary()
if not j then
j=require(e)
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
local n=f[m]
if n and n[l]then
return n[l]
end
return f.Dark[l]
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
if n=="BackgroundTransparency"and require(e).DialogOpen then
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
local aa='rbxassetid://124334518624683'
local e='rbxassetid://113826256227095'
local f='rbxassetid://129900432084566'
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

local T={['0_0']=Vector2.new(0,0),['64_0']=Vector2.new(64,0),['128_0']=Vector2.new(128,0),['192_0']=Vector2.new(192,0),['256_0']=Vector2.new(256,0),['320_0']=Vector2.new(320,0),['384_0']=Vector2.new(384,0),['448_0']=Vector2.new(448,0),['512_0']=Vector2.new(512,0),['576_0']=Vector2.new(576,0),['640_0']=Vector2.new(640,0),['704_0']=Vector2.new(704,0),['768_0']=Vector2.new(768,0),['832_0']=Vector2.new(832,0),['896_0']=Vector2.new(896,0),['960_0']=Vector2.new(960,0),['0_64']=Vector2.new(0,64),['64_64']=Vector2.new(64,64),['128_64']=Vector2.new(128,64),['192_64']=Vector2.new(192,64),['256_64']=Vector2.new(256,64),['320_64']=Vector2.new(320,64),['384_64']=Vector2.new(384,64),['448_64']=Vector2.new(448,64),['512_64']=Vector2.new(512,64),['576_64']=Vector2.new(576,64),['640_64']=Vector2.new(640,64),['704_64']=Vector2.new(704,64),['768_64']=Vector2.new(768,64),['832_64']=Vector2.new(832,64),['896_64']=Vector2.new(896,64),['960_64']=Vector2.new(960,64),['0_128']=Vector2.new(0,128),['64_128']=Vector2.new(64,128),['128_128']=Vector2.new(128,128),['192_128']=Vector2.new(192,128),['256_128']=Vector2.new(256,128),['320_128']=Vector2.new(320,128),['384_128']=Vector2.new(384,128),['448_128']=Vector2.new(448,128),['512_128']=Vector2.new(512,128),['576_128']=Vector2.new(576,128),['640_128']=Vector2.new(640,128),['704_128']=Vector2.new(704,128),['768_128']=Vector2.new(768,128),['832_128']=Vector2.new(832,128),['896_128']=Vector2.new(896,128),['960_128']=Vector2.new(960,128),['0_192']=Vector2.new(0,192),['64_192']=Vector2.new(64,192),['128_192']=Vector2.new(128,192),['192_192']=Vector2.new(192,192),['256_192']=Vector2.new(256,192),['320_192']=Vector2.new(320,192),['384_192']=Vector2.new(384,192),['448_192']=Vector2.new(448,192),['512_192']=Vector2.new(512,192),['576_192']=Vector2.new(576,192),['640_192']=Vector2.new(640,192),['704_192']=Vector2.new(704,192),['768_192']=Vector2.new(768,192),['832_192']=Vector2.new(832,192),['896_192']=Vector2.new(896,192),['960_192']=Vector2.new(960,192),['0_256']=Vector2.new(0,256),['64_256']=Vector2.new(64,256),['128_256']=Vector2.new(128,256),['192_256']=Vector2.new(192,256),['256_256']=Vector2.new(256,256),['320_256']=Vector2.new(320,256),['384_256']=Vector2.new(384,256),['448_256']=Vector2.new(448,256),['512_256']=Vector2.new(512,256),['576_256']=Vector2.new(576,256),['640_256']=Vector2.new(640,256),['704_256']=Vector2.new(704,256),['768_256']=Vector2.new(768,256),['832_256']=Vector2.new(832,256),['896_256']=Vector2.new(896,256),['960_256']=Vector2.new(960,256),['0_320']=Vector2.new(0,320),['64_320']=Vector2.new(64,320),['128_320']=Vector2.new(128,320),['192_320']=Vector2.new(192,320),['256_320']=Vector2.new(256,320),['320_320']=Vector2.new(320,320),['384_320']=Vector2.new(384,320),['448_320']=Vector2.new(448,320),['512_320']=Vector2.new(512,320),['576_320']=Vector2.new(576,320),['640_320']=Vector2.new(640,320),['704_320']=Vector2.new(704,320),['768_320']=Vector2.new(768,320),['832_320']=Vector2.new(832,320),['896_320']=Vector2.new(896,320),['960_320']=Vector2.new(960,320),['0_384']=Vector2.new(0,384),['64_384']=Vector2.new(64,384),['128_384']=Vector2.new(128,384),['192_384']=Vector2.new(192,384),['256_384']=Vector2.new(256,384),['320_384']=Vector2.new(320,384),['384_384']=Vector2.new(384,384),['448_384']=Vector2.new(448,384),['512_384']=Vector2.new(512,384),['576_384']=Vector2.new(576,384),['640_384']=Vector2.new(640,384),['704_384']=Vector2.new(704,384),['768_384']=Vector2.new(768,384),['832_384']=Vector2.new(832,384),['896_384']=Vector2.new(896,384),['960_384']=Vector2.new(960,384),['0_448']=Vector2.new(0,448),['64_448']=Vector2.new(64,448),['128_448']=Vector2.new(128,448),['192_448']=Vector2.new(192,448),['256_448']=Vector2.new(256,448),['320_448']=Vector2.new(320,448),['384_448']=Vector2.new(384,448),['448_448']=Vector2.new(448,448),['512_448']=Vector2.new(512,448),['576_448']=Vector2.new(576,448),['640_448']=Vector2.new(640,448),['704_448']=Vector2.new(704,448),['768_448']=Vector2.new(768,448),['832_448']=Vector2.new(832,448),['896_448']=Vector2.new(896,448),['960_448']=Vector2.new(960,448),['0_512']=Vector2.new(0,512),['64_512']=Vector2.new(64,512),['128_512']=Vector2.new(128,512),['192_512']=Vector2.new(192,512),['256_512']=Vector2.new(256,512),['320_512']=Vector2.new(320,512),['384_512']=Vector2.new(384,512),['448_512']=Vector2.new(448,512),['512_512']=Vector2.new(512,512),['576_512']=Vector2.new(576,512),['640_512']=Vector2.new(640,512),['704_512']=Vector2.new(704,512),['768_512']=Vector2.new(768,512),['832_512']=Vector2.new(832,512),['896_512']=Vector2.new(896,512),['960_512']=Vector2.new(960,512),['0_576']=Vector2.new(0,576),['64_576']=Vector2.new(64,576),['128_576']=Vector2.new(128,576),['192_576']=Vector2.new(192,576),['256_576']=Vector2.new(256,576),['320_576']=Vector2.new(320,576),['384_576']=Vector2.new(384,576),['448_576']=Vector2.new(448,576),['512_576']=Vector2.new(512,576),['576_576']=Vector2.new(576,576),['640_576']=Vector2.new(640,576),['704_576']=Vector2.new(704,576),['768_576']=Vector2.new(768,576),['832_576']=Vector2.new(832,576),['896_576']=Vector2.new(896,576),['960_576']=Vector2.new(960,576),['0_640']=Vector2.new(0,640),['64_640']=Vector2.new(64,640),['128_640']=Vector2.new(128,640),['192_640']=Vector2.new(192,640),['256_640']=Vector2.new(256,640),['320_640']=Vector2.new(320,640),['384_640']=Vector2.new(384,640),['448_640']=Vector2.new(448,640),['512_640']=Vector2.new(512,640),['576_640']=Vector2.new(576,640),['640_640']=Vector2.new(640,640),['704_640']=Vector2.new(704,640),['768_640']=Vector2.new(768,640),['832_640']=Vector2.new(832,640),['896_640']=Vector2.new(896,640),['960_640']=Vector2.new(960,640),['0_704']=Vector2.new(0,704),['64_704']=Vector2.new(64,704),['128_704']=Vector2.new(128,704),['192_704']=Vector2.new(192,704),['256_704']=Vector2.new(256,704),['320_704']=Vector2.new(320,704),['384_704']=Vector2.new(384,704),['448_704']=Vector2.new(448,704),['512_704']=Vector2.new(512,704),['576_704']=Vector2.new(576,704),['640_704']=Vector2.new(640,704),['704_704']=Vector2.new(704,704),['768_704']=Vector2.new(768,704),['832_704']=Vector2.new(832,704),['896_704']=Vector2.new(896,704),['960_704']=Vector2.new(960,704),['0_768']=Vector2.new(0,768),['64_768']=Vector2.new(64,768),['128_768']=Vector2.new(128,768),['192_768']=Vector2.new(192,768),['256_768']=Vector2.new(256,768),['320_768']=Vector2.new(320,768),['384_768']=Vector2.new(384,768),['448_768']=Vector2.new(448,768),['512_768']=Vector2.new(512,768),['576_768']=Vector2.new(576,768),['640_768']=Vector2.new(640,768),['704_768']=Vector2.new(704,768),['768_768']=Vector2.new(768,768),['832_768']=Vector2.new(832,768),['896_768']=Vector2.new(896,768),['960_768']=Vector2.new(960,768),['0_832']=Vector2.new(0,832),['64_832']=Vector2.new(64,832),['128_832']=Vector2.new(128,832),['192_832']=Vector2.new(192,832),['256_832']=Vector2.new(256,832),['320_832']=Vector2.new(320,832),['384_832']=Vector2.new(384,832),['448_832']=Vector2.new(448,832),['512_832']=Vector2.new(512,832),['576_832']=Vector2.new(576,832),['640_832']=Vector2.new(640,832),['704_832']=Vector2.new(704,832),['768_832']=Vector2.new(768,832),['832_832']=Vector2.new(832,832),['896_832']=Vector2.new(896,832),['960_832']=Vector2.new(960,832),['0_896']=Vector2.new(0,896),['64_896']=Vector2.new(64,896),['128_896']=Vector2.new(128,896),['192_896']=Vector2.new(192,896),['256_896']=Vector2.new(256,896),['320_896']=Vector2.new(320,896),['384_896']=Vector2.new(384,896),['448_896']=Vector2.new(448,896),['512_896']=Vector2.new(512,896),['576_896']=Vector2.new(576,896),['640_896']=Vector2.new(640,896),['704_896']=Vector2.new(704,896),['768_896']=Vector2.new(768,896),['832_896']=Vector2.new(832,896),['896_896']=Vector2.new(896,896),['960_896']=Vector2.new(960,896),['0_960']=Vector2.new(0,960),['64_960']=Vector2.new(64,960),['128_960']=Vector2.new(128,960),['192_960']=Vector2.new(192,960),['256_960']=Vector2.new(256,960),['320_960']=Vector2.new(320,960),['384_960']=Vector2.new(384,960),['448_960']=Vector2.new(448,960),['512_960']=Vector2.new(512,960),['576_960']=Vector2.new(576,960),['640_960']=Vector2.new(640,960),['704_960']=Vector2.new(704,960),['768_960']=Vector2.new(768,960),['832_960']=Vector2.new(832,960),['896_960']=Vector2.new(896,960),['960_960']=Vector2.new(960,960)}

game:GetService'ContentProvider':PreloadAsync{aa,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,"rbxassetid://9886659671","rbxassetid://9886659276","rbxassetid://9886659406","rbxassetid://9886659001"}

return{
SetIcon=function(U,V:ImageLabel&ImageButton,W:string)
local X=U[W]

if typeof(X)~='table'then
local Y
local Z=math.huge

for _,ab in next,U do
local ac,ad=_,W
local ae,af=#ac,#ad
local ag={}

for ah=0,ae do
ag[ah]={}
ag[ah][0]=ah
end

for ah=0,af do
ag[0][ah]=ah
end

for ah=1,ae do
for ai=1,af do
local aj=(ac:sub(ah,ah)==ad:sub(ai,ai))and 0 or 1
ag[ah][ai]=math.min(ag[ah-1][ai]+1,ag[ah][ai-1]+1,ag[ah-1][ai-1]+aj)
end
end

local ah=ag[ae][af]

if ah<Z then
Z=ah
Y=_
end
end

if Y then
X=U[Y]
if typeof(X)~='table'then
return error(debug.traceback(`Argument #2 '{W}' is not a valid Icon. Did you mean '{Y}'?`))
end
else
return error(debug.traceback(`Argument #2 '{W}' is not a valid Icon. No similar names found.`))
end
end

V.ImageRectSize=X.ImageRectSize
V.ImageRectOffset=X.ImageRectOffset
V.Image=X.Image

return nil::never
end,Close=
"rbxassetid://9886659671",Min=
"rbxassetid://9886659276",Max=
"rbxassetid://9886659406",Restore=
"rbxassetid://9886659001",
['a-arrow-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=aa
},
['a-arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=aa
},
['alarm-clock-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=aa
},
['alarm-clock-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=aa
},
['alarm-clock-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=aa
},
['alarm-clock-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=aa
},
['alarm-clock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=aa
},
['align-center-horizontal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=aa
},
['align-center-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=aa
},
['align-center']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=aa
},
['align-end-horizontal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=aa
},
['align-end-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=aa
},
['align-horizontal-distribute-center']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=aa
},
['align-horizontal-distribute-end']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=aa
},
['align-horizontal-distribute-start']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=aa
},
['align-horizontal-justify-center']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=aa
},
['align-horizontal-justify-end']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=aa
},
['align-horizontal-justify-start']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=aa
},
['align-horizontal-space-around']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=aa
},
['align-horizontal-space-between']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=aa
},
['align-justify']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=aa
},
['align-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=aa
},
['align-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=aa
},
['align-start-horizontal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=aa
},
['align-start-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=aa
},
['align-vertical-distribute-center']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=aa
},
['align-vertical-distribute-end']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=aa
},
['align-vertical-distribute-start']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=aa
},
['align-vertical-justify-center']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=aa
},
['align-vertical-justify-end']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=aa
},
['align-vertical-justify-start']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=aa
},
['align-vertical-space-around']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=aa
},
['align-vertical-space-between']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=aa
},
['archive-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=aa
},
['arrow-big-down-dash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=aa
},
['arrow-big-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=aa
},
['arrow-big-left-dash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=aa
},
['arrow-big-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=aa
},
['arrow-big-right-dash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=aa
},
['arrow-big-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=aa
},
['arrow-big-up-dash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=aa
},
['arrow-big-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=aa
},
['arrow-down-0-1']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_256'],
Image=aa
},
['arrow-down-1-0']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=aa
},
['arrow-down-a-z']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_256'],
Image=aa
},
['arrow-down-from-line']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=aa
},
['arrow-down-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=aa
},
['arrow-down-narrow-wide']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=aa
},
['arrow-down-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=aa
},
['arrow-down-to-dot']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=aa
},
['arrow-down-to-line']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=aa
},
['arrow-down-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=aa
},
['arrow-down-wide-narrow']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_256'],
Image=aa
},
['arrow-down-z-a']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=aa
},
['arrow-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=aa
},
['arrow-left-from-line']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=aa
},
['arrow-left-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=aa
},
['arrow-left-to-line']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=aa
},
['arrow-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=aa
},
['arrow-right-from-line']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=aa
},
['arrow-right-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_320'],
Image=aa
},
['arrow-right-to-line']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=aa
},
['arrow-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=aa
},
['arrow-up-0-1']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=aa
},
['arrow-up-1-0']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=aa
},
['arrow-up-a-z']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=aa
},
['arrow-up-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=aa
},
['arrow-up-from-dot']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=aa
},
['arrow-up-from-line']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=aa
},
['arrow-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=aa
},
['arrow-up-narrow-wide']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_320'],
Image=aa
},
['arrow-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=aa
},
['arrow-up-to-line']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=aa
},
['arrow-up-wide-narrow']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=aa
},
['arrow-up-z-a']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_384'],
Image=aa
},
['arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=aa
},
['arrows-up-from-line']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_384'],
Image=aa
},axe=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=aa
},
['axis-3d']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_384'],
Image=aa
},
['badge-alert']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=aa
},
['badge-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=aa
},
['badge-help']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=aa
},
['badge-info']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_448'],
Image=aa
},
['badge-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_448'],
Image=aa
},
['badge-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_448'],
Image=aa
},
['badge-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_448'],
Image=aa
},
['battery-charging']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_512'],
Image=aa
},
['battery-full']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=aa
},
['battery-low']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_512'],
Image=aa
},
['battery-medium']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=aa
},
['battery-warning']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=aa
},battery=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=aa
},
['bell-dot']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=aa
},
['bell-electric']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_576'],
Image=aa
},
['bell-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=aa
},
['bell-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=aa
},
['bell-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=aa
},
['bell-ring']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_576'],
Image=aa
},bell=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=aa
},
['between-horizontal-start']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=aa
},
['between-vertical-start']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=aa
},
['biceps-flexed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_640'],
Image=aa
},blocks=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=aa
},
['bluetooth-connected']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=aa
},
['bluetooth-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=aa
},
['bluetooth-searching']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_640'],
Image=aa
},bluetooth=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=aa
},bold=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_640'],
Image=aa
},
['book-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_704'],
Image=aa
},
['book-copy']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=aa
},
['book-heart']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=aa
},
['book-lock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=aa
},
['book-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=aa
},
['book-open-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=aa
},
['book-open-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=aa
},
['book-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=aa
},
['book-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=aa
},
['book-type']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=aa
},
['book-user']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=aa
},
['book-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=aa
},
['bookmark-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=aa
},
['bookmark-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=aa
},
['bookmark-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=aa
},
['bookmark-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=aa
},
['boom-box']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=aa
},
['bot-message-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=aa
},box=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=aa
},boxes=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=aa
},
['calendar-arrow-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=aa
},
['calendar-arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=aa
},
['calendar-check-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_960'],
Image=aa
},
['calendar-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=aa
},
['calendar-clock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=aa
},
['calendar-heart']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=aa
},
['calendar-minus-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=aa
},
['calendar-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=aa
},
['calendar-plus-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=aa
},
['calendar-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=aa
},
['calendar-search']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=aa
},
['calendar-x-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=e
},
['calendar-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=e
},
['car-taxi-front']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=e
},
['chart-no-axes-column-decreasing']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=e
},
['chart-no-axes-column-increasing']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=e
},
['chart-no-axes-column']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=e
},
['chart-no-axes-combined']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=e
},
['chart-no-axes-gantt']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=e
},
['check-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=e
},check=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=e
},
['chevron-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=e
},
['chevron-first']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=e
},
['chevron-last']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=e
},
['chevron-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=e
},
['chevron-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=e
},
['chevron-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=e
},
['chevrons-down-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=e
},
['chevrons-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=e
},
['chevrons-left-right-ellipsis']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=e
},
['chevrons-left-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=e
},
['chevrons-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=e
},
['chevrons-right-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=e
},
['chevrons-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=e
},
['chevrons-up-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=e
},
['chevrons-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_256'],
Image=e
},
['circle-alert']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=e
},
['circle-arrow-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=e
},
['circle-arrow-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=e
},
['circle-arrow-out-down-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=e
},
['circle-arrow-out-down-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=e
},
['circle-arrow-out-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_256'],
Image=e
},
['circle-arrow-out-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=e
},
['circle-arrow-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=e
},
['circle-arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=e
},
['circle-check-big']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=e
},
['circle-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=e
},
['circle-chevron-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=e
},
['circle-chevron-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=e
},
['circle-chevron-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_320'],
Image=e
},
['circle-chevron-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=e
},
['circle-dashed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=e
},
['circle-divide']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=e
},
['circle-dollar-sign']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=e
},
['circle-dot-dashed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=e
},
['circle-dot']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=e
},
['circle-ellipsis']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=e
},
['circle-equal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=e
},
['circle-fading-arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=e
},
['circle-fading-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_320'],
Image=e
},
['circle-gauge']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=e
},
['circle-help']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=e
},
['circle-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=e
},
['circle-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_384'],
Image=e
},
['circle-parking-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=e
},
['circle-parking']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_384'],
Image=e
},
['circle-percent']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_384'],
Image=e
},
['circle-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_384'],
Image=e
},
['circle-power']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=e
},
['circle-slash-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_384'],
Image=e
},
['circle-slash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=e
},
['circle-user-round']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=e
},
['circle-user']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=e
},
['circle-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=e
},circle=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_384'],
Image=e
},
['clipboard-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=e
},
['clipboard-copy']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=e
},
['clipboard-list']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_448'],
Image=e
},
['clipboard-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=e
},
['clipboard-paste']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_448'],
Image=e
},
['clipboard-pen-line']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=e
},
['clipboard-pen']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_448'],
Image=e
},
['clipboard-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=e
},
['clipboard-type']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_448'],
Image=e
},
['clipboard-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=e
},clipboard=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_448'],
Image=e
},
['clock-1']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=e
},
['clock-10']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_448'],
Image=e
},
['clock-11']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=e
},
['clock-12']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=e
},
['clock-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=e
},
['clock-3']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_512'],
Image=e
},
['clock-4']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=e
},
['clock-5']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_512'],
Image=e
},
['clock-6']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=e
},
['clock-7']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_512'],
Image=e
},
['clock-8']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=e
},
['clock-9']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_512'],
Image=e
},
['clock-alert']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=e
},
['clock-arrow-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=e
},
['clock-arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=e
},clock=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=e
},
['cloud-alert']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=e
},
['code-xml']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=e
},codesandbox=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_640'],
Image=e
},
['concierge-bell']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_704'],
Image=e
},
['copy-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=e
},
['copy-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_704'],
Image=e
},
['copy-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=e
},
['copy-slash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=e
},
['copy-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=e
},copy=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=e
},copyleft=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=e
},copyright=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=e
},
['corner-down-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=e
},
['corner-down-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=e
},
['corner-left-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=e
},
['corner-left-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=e
},
['corner-right-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=e
},
['corner-right-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=e
},
['corner-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=e
},
['corner-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=e
},cpu=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=e
},
['database-backup']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_832'],
Image=e
},
['database-zap']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=e
},database=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_832'],
Image=e
},
['diamond-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=e
},
['diamond-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=e
},dumbbell=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=f
},
['earth-lock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=f
},eclipse=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=f
},
['equal-approximately']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=f
},expand=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=f
},
['external-link']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=f
},
['eye-closed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=f
},
['eye-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=f
},eye=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=f
},
['file-axis-3d']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=f
},
['file-box']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=f
},
['file-check-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=f
},
['file-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=f
},
['file-clock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=f
},
['file-heart']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=f
},
['file-lock-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=f
},
['file-lock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=f
},
['file-minus-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=f
},
['file-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=f
},
['file-plus-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=f
},
['file-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_256'],
Image=f
},
['file-search-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=f
},
['file-search']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=f
},
['file-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=f
},
['file-type-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=f
},
['file-type']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=f
},
['file-user']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=f
},
['file-warning']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=f
},
['file-x-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=f
},
['file-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=f
},
['filter-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=f
},
['fire-extinguisher']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=f
},
['flag-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_384'],
Image=f
},
['flag-triangle-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=f
},
['flag-triangle-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_384'],
Image=f
},flag=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=f
},
['folder-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=f
},
['folder-clock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_448'],
Image=f
},
['folder-heart']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=f
},
['folder-lock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_512'],
Image=f
},
['folder-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=f
},
['folder-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=f
},
['folder-search-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=f
},
['folder-search']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=f
},
['folder-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=f
},
['git-branch-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=f
},
['git-compare-arrows']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=f
},
['git-pull-request-arrow']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=f
},
['git-pull-request-create-arrow']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_704'],
Image=f
},github=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=f
},
['globe-lock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=f
},
['grid-2x2-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=f
},
['grid-2x2-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=f
},
['grid-2x2-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=f
},
['grid-2x2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=f
},
['grid-3x3']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=f
},
['hand-heart']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=f
},
['hand-helping']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=f
},
['hard-drive-download']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=f
},
['hard-drive-upload']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_832'],
Image=f
},
['hard-drive']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=f
},
['heart-crack']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_896'],
Image=f
},
['heart-handshake']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=f
},
['heart-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_896'],
Image=f
},
['heart-pulse']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=f
},heart=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=f
},hexagon=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=f
},
['house-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=f
},
['image-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=f
},
['image-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=f
},inbox=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=g
},info=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=g
},italic=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=g
},
['key-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=g
},
['laptop-minimal-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=g
},
['layout-grid']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=g
},
['layout-list']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=g
},
['letter-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=g
},
['list-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=g
},
['list-checks']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=g
},
['list-collapse']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=g
},
['list-end']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_256'],
Image=g
},
['list-filter-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=g
},
['list-filter']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_256'],
Image=g
},
['list-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=g
},
['list-ordered']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=g
},
['list-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=g
},
['list-restart']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=g
},
['list-start']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=g
},
['list-todo']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=g
},
['list-tree']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_256'],
Image=g
},
['list-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=g
},list=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=g
},
['loader-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=g
},
['loader-pinwheel']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=g
},loader=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=g
},
['locate-fixed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=g
},
['lock-keyhole-open']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=g
},
['lock-keyhole']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=g
},
['lock-open']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=g
},lock=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=g
},
['mail-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=g
},
['mail-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=g
},
['mail-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=g
},
['mail-search']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=g
},
['mail-warning']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_384'],
Image=g
},
['mail-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=g
},mailbox=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=g
},
['map-pin-check-inside']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=g
},
['map-pin-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_384'],
Image=g
},
['map-pin-minus-inside']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=g
},
['map-pin-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=g
},
['map-pin-plus-inside']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=g
},
['map-pin-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=g
},
['map-pin-x-inside']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=g
},
['map-pin-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=g
},
['maximize-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=g
},maximize=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_448'],
Image=g
},menu=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_448'],
Image=g
},
['message-circle-code']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=g
},
['message-circle-dashed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=g
},
['message-circle-heart']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_512'],
Image=g
},
['message-circle-more']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=g
},
['message-circle-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_512'],
Image=g
},
['message-circle-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=g
},
['message-circle-question']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_512'],
Image=g
},
['message-circle-reply']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=g
},
['message-circle-warning']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_512'],
Image=g
},
['message-circle-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=g
},
['message-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=g
},
['message-square-code']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=g
},
['message-square-dashed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=g
},
['message-square-diff']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=g
},
['message-square-dot']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_512'],
Image=g
},
['message-square-heart']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=g
},
['message-square-lock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_576'],
Image=g
},
['message-square-more']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=g
},
['message-square-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=g
},
['message-square-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=g
},
['message-square-quote']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=g
},
['message-square-reply']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=g
},
['message-square-share']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_576'],
Image=g
},
['message-square-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=g
},
['message-square-warning']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=g
},
['message-square-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=g
},
['message-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_576'],
Image=g
},
['messages-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=g
},
['minimize-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=g
},minimize=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_640'],
Image=g
},minus=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=g
},
['monitor-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=g
},
['monitor-cog']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=g
},
['monitor-dot']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=g
},
['monitor-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=g
},
['monitor-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_640'],
Image=g
},
['monitor-smartphone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=g
},
['monitor-speaker']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_704'],
Image=g
},
['monitor-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=g
},
['monitor-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=g
},monitor=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_704'],
Image=g
},
['moon-star']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=g
},
['move-3d']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=g
},
['move-diagonal-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=g
},
['move-diagonal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=g
},
['move-down-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=g
},
['move-down-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=g
},
['move-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=g
},
['move-horizontal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=g
},
['move-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=g
},
['move-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=g
},
['move-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=g
},
['move-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=g
},
['move-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=g
},
['move-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=g
},move=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=g
},
['notebook-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_832'],
Image=g
},
['notepad-text-dashed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=g
},
['notepad-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=g
},
['octagon-alert']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_896'],
Image=g
},
['octagon-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=g
},
['octagon-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=g
},
['package-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=g
},
['package-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=g
},
['package-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=g
},
['package-search']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=g
},
['package-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=g
},paperclip=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=h
},
['phosphor-acorn-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=h
},
['phosphor-address-book-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=h
},
['phosphor-address-book-tabs-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=h
},
['phosphor-air-traffic-control-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=h
},
['phosphor-airplane-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=h
},
['phosphor-airplane-in-flight-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=h
},
['phosphor-airplane-landing-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=h
},
['phosphor-airplane-takeoff-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=h
},
['phosphor-airplane-taxiing-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=h
},
['phosphor-airplane-taxiing-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_320'],
Image=h
},
['phosphor-airplane-taxiing-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=h
},
['phosphor-airplane-taxiing-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=h
},
['phosphor-airplane-taxiing-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=h
},
['phosphor-airplane-taxiing']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=h
},
['phosphor-airplane-tilt-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=h
},
['phosphor-alarm-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=h
},
['phosphor-alien-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=h
},
['phosphor-align-bottom-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=h
},
['phosphor-align-bottom-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=h
},
['phosphor-align-bottom-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=h
},
['phosphor-align-bottom-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_448'],
Image=h
},
['phosphor-align-bottom-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=h
},
['phosphor-align-bottom-simple-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_448'],
Image=h
},
['phosphor-align-bottom-simple-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=h
},
['phosphor-align-bottom-simple-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_448'],
Image=h
},
['phosphor-align-bottom-simple-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=h
},
['phosphor-align-bottom-simple']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_448'],
Image=h
},
['phosphor-align-bottom-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=h
},
['phosphor-align-bottom']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_448'],
Image=h
},
['phosphor-align-center-horizontal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=h
},
['phosphor-align-center-horizontal-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_448'],
Image=h
},
['phosphor-align-center-horizontal-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=h
},
['phosphor-align-center-horizontal-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=h
},
['phosphor-align-center-horizontal-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=h
},
['phosphor-align-center-horizontal-simple-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_512'],
Image=h
},
['phosphor-align-center-horizontal-simple-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=h
},
['phosphor-align-center-horizontal-simple-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_512'],
Image=h
},
['phosphor-align-center-horizontal-simple-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=h
},
['phosphor-align-center-horizontal-simple']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_512'],
Image=h
},
['phosphor-align-center-horizontal-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=h
},
['phosphor-align-center-horizontal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_512'],
Image=h
},
['phosphor-align-center-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=h
},
['phosphor-align-center-vertical-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=h
},
['phosphor-align-center-vertical-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=h
},
['phosphor-align-center-vertical-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=h
},
['phosphor-align-center-vertical-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=h
},
['phosphor-align-center-vertical-simple-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_512'],
Image=h
},
['phosphor-align-center-vertical-simple-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=h
},
['phosphor-align-center-vertical-simple-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_576'],
Image=h
},
['phosphor-align-center-vertical-simple-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=h
},
['phosphor-align-center-vertical-simple']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=h
},
['phosphor-align-center-vertical-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=h
},
['phosphor-align-center-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=h
},
['phosphor-align-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=h
},
['phosphor-align-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_576'],
Image=h
},
['phosphor-align-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=h
},
['phosphor-align-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=h
},
['phosphor-align-left-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=h
},
['phosphor-align-left-simple-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_576'],
Image=h
},
['phosphor-align-left-simple-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=h
},
['phosphor-align-left-simple-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_576'],
Image=h
},
['phosphor-align-left-simple-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=h
},
['phosphor-align-left-simple']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_576'],
Image=h
},
['phosphor-align-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=h
},
['phosphor-align-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_640'],
Image=h
},
['phosphor-align-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=h
},
['phosphor-align-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_640'],
Image=h
},
['phosphor-align-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=h
},
['phosphor-align-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_640'],
Image=h
},
['phosphor-align-right-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=h
},
['phosphor-align-right-simple-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_640'],
Image=h
},
['phosphor-align-right-simple-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=h
},
['phosphor-align-right-simple-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=h
},
['phosphor-align-right-simple-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=h
},
['phosphor-align-right-simple']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=h
},
['phosphor-align-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=h
},
['phosphor-align-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_640'],
Image=h
},
['phosphor-align-top-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=h
},
['phosphor-align-top-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_640'],
Image=h
},
['phosphor-align-top-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=h
},
['phosphor-align-top-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_704'],
Image=h
},
['phosphor-align-top-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=h
},
['phosphor-align-top-simple-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=h
},
['phosphor-align-top-simple-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=h
},
['phosphor-align-top-simple-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_704'],
Image=h
},
['phosphor-align-top-simple-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=h
},
['phosphor-align-top-simple']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_704'],
Image=h
},
['phosphor-align-top-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=h
},
['phosphor-align-top']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=h
},
['phosphor-amazon-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=h
},
['phosphor-ambulance-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=h
},
['phosphor-anchor-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=h
},
['phosphor-anchor-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=h
},
['phosphor-android-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=h
},
['phosphor-angle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=h
},
['phosphor-angular-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=h
},
['phosphor-aperture-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=h
},
['phosphor-app-store-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=h
},
['phosphor-app-window-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=h
},
['phosphor-apple-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=h
},
['phosphor-apple-podcasts-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=h
},
['phosphor-approximate-equals-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=i
},
['phosphor-approximate-equals-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=i
},
['phosphor-approximate-equals-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=i
},
['phosphor-approximate-equals-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=i
},
['phosphor-approximate-equals-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=i
},
['phosphor-approximate-equals']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=i
},
['phosphor-archive-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=i
},
['phosphor-armchair-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=i
},
['phosphor-arrow-arc-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=i
},
['phosphor-arrow-arc-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=i
},
['phosphor-arrow-arc-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=i
},
['phosphor-arrow-arc-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=i
},
['phosphor-arrow-arc-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=i
},
['phosphor-arrow-arc-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=i
},
['phosphor-arrow-arc-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=i
},
['phosphor-arrow-arc-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=i
},
['phosphor-arrow-arc-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=i
},
['phosphor-arrow-arc-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=i
},
['phosphor-arrow-arc-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=i
},
['phosphor-arrow-arc-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=i
},
['phosphor-arrow-bend-double-up-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=i
},
['phosphor-arrow-bend-double-up-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=i
},
['phosphor-arrow-bend-double-up-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=i
},
['phosphor-arrow-bend-double-up-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=i
},
['phosphor-arrow-bend-double-up-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=i
},
['phosphor-arrow-bend-double-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=i
},
['phosphor-arrow-bend-double-up-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=i
},
['phosphor-arrow-bend-double-up-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=i
},
['phosphor-arrow-bend-double-up-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=i
},
['phosphor-arrow-bend-double-up-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=i
},
['phosphor-arrow-bend-double-up-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=i
},
['phosphor-arrow-bend-double-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=i
},
['phosphor-arrow-bend-down-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=i
},
['phosphor-arrow-bend-down-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=i
},
['phosphor-arrow-bend-down-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=i
},
['phosphor-arrow-bend-down-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=i
},
['phosphor-arrow-bend-down-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=i
},
['phosphor-arrow-bend-down-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=i
},
['phosphor-arrow-bend-down-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=i
},
['phosphor-arrow-bend-down-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=i
},
['phosphor-arrow-bend-down-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=i
},
['phosphor-arrow-bend-down-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=i
},
['phosphor-arrow-bend-down-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=i
},
['phosphor-arrow-bend-down-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=i
},
['phosphor-arrow-bend-left-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=i
},
['phosphor-arrow-bend-left-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=i
},
['phosphor-arrow-bend-left-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=i
},
['phosphor-arrow-bend-left-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=i
},
['phosphor-arrow-bend-left-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=i
},
['phosphor-arrow-bend-left-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=i
},
['phosphor-arrow-bend-left-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=i
},
['phosphor-arrow-bend-left-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=i
},
['phosphor-arrow-bend-left-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=i
},
['phosphor-arrow-bend-left-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_256'],
Image=i
},
['phosphor-arrow-bend-left-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=i
},
['phosphor-arrow-bend-left-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_256'],
Image=i
},
['phosphor-arrow-bend-right-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=i
},
['phosphor-arrow-bend-right-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=i
},
['phosphor-arrow-bend-right-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=i
},
['phosphor-arrow-bend-right-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=i
},
['phosphor-arrow-bend-right-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=i
},
['phosphor-arrow-bend-right-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=i
},
['phosphor-arrow-bend-right-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=i
},
['phosphor-arrow-bend-right-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_256'],
Image=i
},
['phosphor-arrow-bend-right-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=i
},
['phosphor-arrow-bend-right-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=i
},
['phosphor-arrow-bend-right-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=i
},
['phosphor-arrow-bend-right-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=i
},
['phosphor-arrow-bend-up-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=i
},
['phosphor-arrow-bend-up-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=i
},
['phosphor-arrow-bend-up-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=i
},
['phosphor-arrow-bend-up-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_320'],
Image=i
},
['phosphor-arrow-bend-up-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=i
},
['phosphor-arrow-bend-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=i
},
['phosphor-arrow-bend-up-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=i
},
['phosphor-arrow-bend-up-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=i
},
['phosphor-arrow-bend-up-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=i
},
['phosphor-arrow-bend-up-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=i
},
['phosphor-arrow-bend-up-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=i
},
['phosphor-arrow-bend-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=i
},
['phosphor-arrow-circle-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=i
},
['phosphor-arrow-circle-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_320'],
Image=i
},
['phosphor-arrow-circle-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=i
},
['phosphor-arrow-circle-down-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=i
},
['phosphor-arrow-circle-down-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=i
},
['phosphor-arrow-circle-down-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_384'],
Image=i
},
['phosphor-arrow-circle-down-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=i
},
['phosphor-arrow-circle-down-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_384'],
Image=i
},
['phosphor-arrow-circle-down-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=i
},
['phosphor-arrow-circle-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_384'],
Image=i
},
['phosphor-arrow-circle-down-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=i
},
['phosphor-arrow-circle-down-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_384'],
Image=i
},
['phosphor-arrow-circle-down-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=i
},
['phosphor-arrow-circle-down-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_384'],
Image=i
},
['phosphor-arrow-circle-down-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=i
},
['phosphor-arrow-circle-down-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_384'],
Image=i
},
['phosphor-arrow-circle-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=i
},
['phosphor-arrow-circle-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=i
},
['phosphor-arrow-circle-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=i
},
['phosphor-arrow-circle-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_384'],
Image=i
},
['phosphor-arrow-circle-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=i
},
['phosphor-arrow-circle-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=i
},
['phosphor-arrow-circle-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=i
},
['phosphor-arrow-circle-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=i
},
['phosphor-arrow-circle-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=i
},
['phosphor-arrow-circle-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_448'],
Image=i
},
['phosphor-arrow-circle-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=i
},
['phosphor-arrow-circle-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_448'],
Image=i
},
['phosphor-arrow-circle-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=i
},
['phosphor-arrow-circle-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_448'],
Image=i
},
['phosphor-arrow-circle-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=i
},
['phosphor-arrow-circle-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_448'],
Image=i
},
['phosphor-arrow-circle-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=i
},
['phosphor-arrow-circle-up-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_448'],
Image=i
},
['phosphor-arrow-circle-up-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=i
},
['phosphor-arrow-circle-up-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_448'],
Image=i
},
['phosphor-arrow-circle-up-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=i
},
['phosphor-arrow-circle-up-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=i
},
['phosphor-arrow-circle-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=i
},
['phosphor-arrow-circle-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_512'],
Image=i
},
['phosphor-arrow-circle-up-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=i
},
['phosphor-arrow-circle-up-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_512'],
Image=i
},
['phosphor-arrow-circle-up-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=i
},
['phosphor-arrow-circle-up-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_512'],
Image=i
},
['phosphor-arrow-circle-up-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=i
},
['phosphor-arrow-circle-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_512'],
Image=i
},
['phosphor-arrow-circle-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=i
},
['phosphor-arrow-circle-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=i
},
['phosphor-arrow-clockwise-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=i
},
['phosphor-arrow-clockwise-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=i
},
['phosphor-arrow-clockwise-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=i
},
['phosphor-arrow-clockwise-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_512'],
Image=i
},
['phosphor-arrow-clockwise-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=i
},
['phosphor-arrow-clockwise']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_576'],
Image=i
},
['phosphor-arrow-counter-clockwise-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=i
},
['phosphor-arrow-counter-clockwise-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=i
},
['phosphor-arrow-counter-clockwise-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=i
},
['phosphor-arrow-counter-clockwise-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=i
},
['phosphor-arrow-counter-clockwise-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=i
},
['phosphor-arrow-counter-clockwise']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_576'],
Image=i
},
['phosphor-arrow-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=i
},
['phosphor-arrow-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=i
},
['phosphor-arrow-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=i
},
['phosphor-arrow-down-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_576'],
Image=i
},
['phosphor-arrow-down-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=i
},
['phosphor-arrow-down-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_576'],
Image=i
},
['phosphor-arrow-down-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=i
},
['phosphor-arrow-down-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_576'],
Image=i
},
['phosphor-arrow-down-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=i
},
['phosphor-arrow-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_640'],
Image=i
},
['phosphor-arrow-down-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=i
},
['phosphor-arrow-down-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_640'],
Image=i
},
['phosphor-arrow-down-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=i
},
['phosphor-arrow-down-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_640'],
Image=i
},
['phosphor-arrow-down-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=i
},
['phosphor-arrow-down-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_640'],
Image=i
},
['phosphor-arrow-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=i
},
['phosphor-arrow-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=i
},
['phosphor-arrow-elbow-down-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=i
},
['phosphor-arrow-elbow-down-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=i
},
['phosphor-arrow-elbow-down-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=i
},
['phosphor-arrow-elbow-down-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_640'],
Image=i
},
['phosphor-arrow-elbow-down-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=i
},
['phosphor-arrow-elbow-down-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_640'],
Image=i
},
['phosphor-arrow-elbow-down-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=i
},
['phosphor-arrow-elbow-down-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_704'],
Image=i
},
['phosphor-arrow-elbow-down-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=i
},
['phosphor-arrow-elbow-down-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=i
},
['phosphor-arrow-elbow-down-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=i
},
['phosphor-arrow-elbow-down-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_704'],
Image=i
},
['phosphor-arrow-elbow-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=i
},
['phosphor-arrow-elbow-left-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_704'],
Image=i
},
['phosphor-arrow-elbow-left-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=i
},
['phosphor-arrow-elbow-left-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=i
},
['phosphor-arrow-elbow-left-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=i
},
['phosphor-arrow-elbow-left-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_704'],
Image=i
},
['phosphor-arrow-elbow-left-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=i
},
['phosphor-arrow-elbow-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=i
},
['phosphor-arrow-elbow-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=i
},
['phosphor-arrow-elbow-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=i
},
['phosphor-arrow-elbow-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=i
},
['phosphor-arrow-elbow-left-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=i
},
['phosphor-arrow-elbow-left-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=i
},
['phosphor-arrow-elbow-left-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=i
},
['phosphor-arrow-elbow-left-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=i
},
['phosphor-arrow-elbow-left-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=i
},
['phosphor-arrow-elbow-left-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=i
},
['phosphor-arrow-elbow-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=i
},
['phosphor-arrow-elbow-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=i
},
['phosphor-arrow-elbow-right-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=i
},
['phosphor-arrow-elbow-right-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=i
},
['phosphor-arrow-elbow-right-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=i
},
['phosphor-arrow-elbow-right-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=i
},
['phosphor-arrow-elbow-right-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=i
},
['phosphor-arrow-elbow-right-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=i
},
['phosphor-arrow-elbow-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=i
},
['phosphor-arrow-elbow-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=i
},
['phosphor-arrow-elbow-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=i
},
['phosphor-arrow-elbow-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=i
},
['phosphor-arrow-elbow-right-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=i
},
['phosphor-arrow-elbow-right-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=i
},
['phosphor-arrow-elbow-right-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=i
},
['phosphor-arrow-elbow-right-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=i
},
['phosphor-arrow-elbow-right-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_832'],
Image=i
},
['phosphor-arrow-elbow-right-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=i
},
['phosphor-arrow-elbow-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_832'],
Image=i
},
['phosphor-arrow-elbow-up-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=i
},
['phosphor-arrow-elbow-up-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_832'],
Image=i
},
['phosphor-arrow-elbow-up-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=i
},
['phosphor-arrow-elbow-up-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=i
},
['phosphor-arrow-elbow-up-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=i
},
['phosphor-arrow-elbow-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=i
},
['phosphor-arrow-elbow-up-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=i
},
['phosphor-arrow-elbow-up-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_896'],
Image=i
},
['phosphor-arrow-elbow-up-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=i
},
['phosphor-arrow-elbow-up-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_896'],
Image=i
},
['phosphor-arrow-elbow-up-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=i
},
['phosphor-arrow-elbow-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_896'],
Image=i
},
['phosphor-arrow-fat-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=i
},
['phosphor-arrow-fat-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_896'],
Image=i
},
['phosphor-arrow-fat-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=i
},
['phosphor-arrow-fat-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_896'],
Image=i
},
['phosphor-arrow-fat-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=i
},
['phosphor-arrow-fat-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=i
},
['phosphor-arrow-fat-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=i
},
['phosphor-arrow-fat-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=i
},
['phosphor-arrow-fat-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=i
},
['phosphor-arrow-fat-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=i
},
['phosphor-arrow-fat-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=i
},
['phosphor-arrow-fat-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_960'],
Image=i
},
['phosphor-arrow-fat-line-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=i
},
['phosphor-arrow-fat-line-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=i
},
['phosphor-arrow-fat-line-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=i
},
['phosphor-arrow-fat-line-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=i
},
['phosphor-arrow-fat-line-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=i
},
['phosphor-arrow-fat-line-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=i
},
['phosphor-arrow-fat-line-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=i
},
['phosphor-arrow-fat-line-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=i
},
['phosphor-arrow-fat-line-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=i
},
['phosphor-arrow-fat-line-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=i
},
['phosphor-arrow-fat-line-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=i
},
['phosphor-arrow-fat-line-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_960'],
Image=i
},
['phosphor-arrow-fat-line-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=i
},
['phosphor-arrow-fat-line-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=i
},
['phosphor-arrow-fat-line-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=j
},
['phosphor-arrow-fat-line-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=j
},
['phosphor-arrow-fat-line-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=j
},
['phosphor-arrow-fat-line-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=j
},
['phosphor-arrow-fat-line-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=j
},
['phosphor-arrow-fat-line-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=j
},
['phosphor-arrow-fat-line-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=j
},
['phosphor-arrow-fat-line-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=j
},
['phosphor-arrow-fat-line-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=j
},
['phosphor-arrow-fat-line-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=j
},
['phosphor-arrow-fat-lines-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=j
},
['phosphor-arrow-fat-lines-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=j
},
['phosphor-arrow-fat-lines-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=j
},
['phosphor-arrow-fat-lines-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=j
},
['phosphor-arrow-fat-lines-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=j
},
['phosphor-arrow-fat-lines-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=j
},
['phosphor-arrow-fat-lines-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=j
},
['phosphor-arrow-fat-lines-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=j
},
['phosphor-arrow-fat-lines-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=j
},
['phosphor-arrow-fat-lines-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=j
},
['phosphor-arrow-fat-lines-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=j
},
['phosphor-arrow-fat-lines-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=j
},
['phosphor-arrow-fat-lines-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=j
},
['phosphor-arrow-fat-lines-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=j
},
['phosphor-arrow-fat-lines-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=j
},
['phosphor-arrow-fat-lines-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=j
},
['phosphor-arrow-fat-lines-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=j
},
['phosphor-arrow-fat-lines-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=j
},
['phosphor-arrow-fat-lines-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=j
},
['phosphor-arrow-fat-lines-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=j
},
['phosphor-arrow-fat-lines-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=j
},
['phosphor-arrow-fat-lines-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=j
},
['phosphor-arrow-fat-lines-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=j
},
['phosphor-arrow-fat-lines-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=j
},
['phosphor-arrow-fat-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=j
},
['phosphor-arrow-fat-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=j
},
['phosphor-arrow-fat-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=j
},
['phosphor-arrow-fat-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=j
},
['phosphor-arrow-fat-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=j
},
['phosphor-arrow-fat-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=j
},
['phosphor-arrow-fat-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=j
},
['phosphor-arrow-fat-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=j
},
['phosphor-arrow-fat-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=j
},
['phosphor-arrow-fat-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=j
},
['phosphor-arrow-fat-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=j
},
['phosphor-arrow-fat-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=j
},
['phosphor-arrow-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=j
},
['phosphor-arrow-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=j
},
['phosphor-arrow-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=j
},
['phosphor-arrow-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=j
},
['phosphor-arrow-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=j
},
['phosphor-arrow-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=j
},
['phosphor-arrow-line-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=j
},
['phosphor-arrow-line-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=j
},
['phosphor-arrow-line-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=j
},
['phosphor-arrow-line-down-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=j
},
['phosphor-arrow-line-down-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=j
},
['phosphor-arrow-line-down-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=j
},
['phosphor-arrow-line-down-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=j
},
['phosphor-arrow-line-down-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=j
},
['phosphor-arrow-line-down-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=j
},
['phosphor-arrow-line-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=j
},
['phosphor-arrow-line-down-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=j
},
['phosphor-arrow-line-down-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=j
},
['phosphor-arrow-line-down-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=j
},
['phosphor-arrow-line-down-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_256'],
Image=j
},
['phosphor-arrow-line-down-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=j
},
['phosphor-arrow-line-down-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_256'],
Image=j
},
['phosphor-arrow-line-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=j
},
['phosphor-arrow-line-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=j
},
['phosphor-arrow-line-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=j
},
['phosphor-arrow-line-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=j
},
['phosphor-arrow-line-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=j
},
['phosphor-arrow-line-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=j
},
['phosphor-arrow-line-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=j
},
['phosphor-arrow-line-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_256'],
Image=j
},
['phosphor-arrow-line-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=j
},
['phosphor-arrow-line-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=j
},
['phosphor-arrow-line-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=j
},
['phosphor-arrow-line-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=j
},
['phosphor-arrow-line-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=j
},
['phosphor-arrow-line-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=j
},
['phosphor-arrow-line-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=j
},
['phosphor-arrow-line-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_320'],
Image=j
},
['phosphor-arrow-line-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=j
},
['phosphor-arrow-line-up-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=j
},
['phosphor-arrow-line-up-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=j
},
['phosphor-arrow-line-up-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=j
},
['phosphor-arrow-line-up-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=j
},
['phosphor-arrow-line-up-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=j
},
['phosphor-arrow-line-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=j
},
['phosphor-arrow-line-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=j
},
['phosphor-arrow-line-up-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=j
},
['phosphor-arrow-line-up-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_320'],
Image=j
},
['phosphor-arrow-line-up-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=j
},
['phosphor-arrow-line-up-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=j
},
['phosphor-arrow-line-up-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=j
},
['phosphor-arrow-line-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_384'],
Image=j
},
['phosphor-arrow-line-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=j
},
['phosphor-arrow-line-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_384'],
Image=j
},
['phosphor-arrow-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=j
},
['phosphor-arrow-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_384'],
Image=j
},
['phosphor-arrow-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=j
},
['phosphor-arrow-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_384'],
Image=j
},
['phosphor-arrow-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=j
},
['phosphor-arrow-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_384'],
Image=j
},
['phosphor-arrow-square-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=j
},
['phosphor-arrow-square-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_384'],
Image=j
},
['phosphor-arrow-square-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=j
},
['phosphor-arrow-square-down-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=j
},
['phosphor-arrow-square-down-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=j
},
['phosphor-arrow-square-down-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_384'],
Image=j
},
['phosphor-arrow-square-down-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=j
},
['phosphor-arrow-square-down-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=j
},
['phosphor-arrow-square-down-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=j
},
['phosphor-arrow-square-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=j
},
['phosphor-arrow-square-down-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=j
},
['phosphor-arrow-square-down-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_448'],
Image=j
},
['phosphor-arrow-square-down-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=j
},
['phosphor-arrow-square-down-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_448'],
Image=j
},
['phosphor-arrow-square-down-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=j
},
['phosphor-arrow-square-down-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_448'],
Image=j
},
['phosphor-arrow-square-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=j
},
['phosphor-arrow-square-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_448'],
Image=j
},
['phosphor-arrow-square-in-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=j
},
['phosphor-arrow-square-in-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_448'],
Image=j
},
['phosphor-arrow-square-in-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=j
},
['phosphor-arrow-square-in-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_448'],
Image=j
},
['phosphor-arrow-square-in-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=j
},
['phosphor-arrow-square-in']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=j
},
['phosphor-arrow-square-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=j
},
['phosphor-arrow-square-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_512'],
Image=j
},
['phosphor-arrow-square-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=j
},
['phosphor-arrow-square-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_512'],
Image=j
},
['phosphor-arrow-square-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=j
},
['phosphor-arrow-square-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_512'],
Image=j
},
['phosphor-arrow-square-out-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=j
},
['phosphor-arrow-square-out-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_512'],
Image=j
},
['phosphor-arrow-square-out-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=j
},
['phosphor-arrow-square-out-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=j
},
['phosphor-arrow-square-out-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=j
},
['phosphor-arrow-square-out']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=j
},
['phosphor-arrow-square-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=j
},
['phosphor-arrow-square-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_512'],
Image=j
},
['phosphor-arrow-square-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=j
},
['phosphor-arrow-square-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_576'],
Image=j
},
['phosphor-arrow-square-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=j
},
['phosphor-arrow-square-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=j
},
['phosphor-arrow-square-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=j
},
['phosphor-arrow-square-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=j
},
['phosphor-arrow-square-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=j
},
['phosphor-arrow-square-up-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_576'],
Image=j
},
['phosphor-arrow-square-up-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=j
},
['phosphor-arrow-square-up-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=j
},
['phosphor-arrow-square-up-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=j
},
['phosphor-arrow-square-up-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_576'],
Image=j
},
['phosphor-arrow-square-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=j
},
['phosphor-arrow-square-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_576'],
Image=j
},
['phosphor-arrow-square-up-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=j
},
['phosphor-arrow-square-up-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_576'],
Image=j
},
['phosphor-arrow-square-up-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=j
},
['phosphor-arrow-square-up-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_640'],
Image=j
},
['phosphor-arrow-square-up-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=j
},
['phosphor-arrow-square-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_640'],
Image=j
},
['phosphor-arrow-square-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=j
},
['phosphor-arrow-square-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_640'],
Image=j
},
['phosphor-arrow-u-down-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=j
},
['phosphor-arrow-u-down-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_640'],
Image=j
},
['phosphor-arrow-u-down-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=j
},
['phosphor-arrow-u-down-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=j
},
['phosphor-arrow-u-down-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=j
},
['phosphor-arrow-u-down-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=j
},
['phosphor-arrow-u-down-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=j
},
['phosphor-arrow-u-down-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_640'],
Image=j
},
['phosphor-arrow-u-down-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=j
},
['phosphor-arrow-u-down-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_640'],
Image=j
},
['phosphor-arrow-u-down-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=j
},
['phosphor-arrow-u-down-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_704'],
Image=j
},
['phosphor-arrow-u-left-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=j
},
['phosphor-arrow-u-left-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=j
},
['phosphor-arrow-u-left-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=j
},
['phosphor-arrow-u-left-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_704'],
Image=j
},
['phosphor-arrow-u-left-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=j
},
['phosphor-arrow-u-left-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_704'],
Image=j
},
['phosphor-arrow-u-left-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=j
},
['phosphor-arrow-u-left-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=j
},
['phosphor-arrow-u-left-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=j
},
['phosphor-arrow-u-left-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_704'],
Image=j
},
['phosphor-arrow-u-left-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=j
},
['phosphor-arrow-u-left-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=j
},
['phosphor-arrow-u-right-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=j
},
['phosphor-arrow-u-right-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=j
},
['phosphor-arrow-u-right-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=j
},
['phosphor-arrow-u-right-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=j
},
['phosphor-arrow-u-right-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=j
},
['phosphor-arrow-u-right-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=j
},
['phosphor-arrow-u-right-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=j
},
['phosphor-arrow-u-right-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=j
},
['phosphor-arrow-u-right-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=j
},
['phosphor-arrow-u-right-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=j
},
['phosphor-arrow-u-right-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=j
},
['phosphor-arrow-u-right-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=j
},
['phosphor-arrow-u-up-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=j
},
['phosphor-arrow-u-up-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=j
},
['phosphor-arrow-u-up-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=j
},
['phosphor-arrow-u-up-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=j
},
['phosphor-arrow-u-up-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=j
},
['phosphor-arrow-u-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=j
},
['phosphor-arrow-u-up-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=j
},
['phosphor-arrow-u-up-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=j
},
['phosphor-arrow-u-up-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=j
},
['phosphor-arrow-u-up-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=j
},
['phosphor-arrow-u-up-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=j
},
['phosphor-arrow-u-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=j
},
['phosphor-arrow-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=j
},
['phosphor-arrow-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_832'],
Image=j
},
['phosphor-arrow-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=j
},
['phosphor-arrow-up-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_832'],
Image=j
},
['phosphor-arrow-up-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=j
},
['phosphor-arrow-up-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_832'],
Image=j
},
['phosphor-arrow-up-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=j
},
['phosphor-arrow-up-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=j
},
['phosphor-arrow-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=j
},
['phosphor-arrow-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=j
},
['phosphor-arrow-up-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=j
},
['phosphor-arrow-up-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_896'],
Image=j
},
['phosphor-arrow-up-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=j
},
['phosphor-arrow-up-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_896'],
Image=j
},
['phosphor-arrow-up-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=j
},
['phosphor-arrow-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_896'],
Image=j
},
['phosphor-arrow-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=j
},
['phosphor-arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_896'],
Image=j
},
['phosphor-arrows-clockwise-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=j
},
['phosphor-arrows-clockwise-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_896'],
Image=j
},
['phosphor-arrows-clockwise-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=j
},
['phosphor-arrows-clockwise-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=j
},
['phosphor-arrows-clockwise-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=j
},
['phosphor-arrows-clockwise']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=j
},
['phosphor-arrows-counter-clockwise-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=j
},
['phosphor-arrows-counter-clockwise-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=j
},
['phosphor-arrows-counter-clockwise-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=j
},
['phosphor-arrows-counter-clockwise-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_960'],
Image=j
},
['phosphor-arrows-counter-clockwise-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=j
},
['phosphor-arrows-counter-clockwise']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=j
},
['phosphor-arrows-down-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=j
},
['phosphor-arrows-down-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=j
},
['phosphor-arrows-down-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=j
},
['phosphor-arrows-down-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=j
},
['phosphor-arrows-down-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=j
},
['phosphor-arrows-down-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=j
},
['phosphor-arrows-horizontal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=j
},
['phosphor-arrows-horizontal-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=j
},
['phosphor-arrows-horizontal-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=j
},
['phosphor-arrows-horizontal-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_960'],
Image=j
},
['phosphor-arrows-horizontal-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=j
},
['phosphor-arrows-horizontal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=j
},
['phosphor-arrows-in-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=k
},
['phosphor-arrows-in-cardinal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=k
},
['phosphor-arrows-in-cardinal-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=k
},
['phosphor-arrows-in-cardinal-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=k
},
['phosphor-arrows-in-cardinal-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=k
},
['phosphor-arrows-in-cardinal-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=k
},
['phosphor-arrows-in-cardinal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=k
},
['phosphor-arrows-in-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=k
},
['phosphor-arrows-in-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=k
},
['phosphor-arrows-in-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=k
},
['phosphor-arrows-in-line-horizontal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=k
},
['phosphor-arrows-in-line-horizontal-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=k
},
['phosphor-arrows-in-line-horizontal-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=k
},
['phosphor-arrows-in-line-horizontal-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=k
},
['phosphor-arrows-in-line-horizontal-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=k
},
['phosphor-arrows-in-line-horizontal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=k
},
['phosphor-arrows-in-line-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=k
},
['phosphor-arrows-in-line-vertical-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=k
},
['phosphor-arrows-in-line-vertical-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=k
},
['phosphor-arrows-in-line-vertical-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=k
},
['phosphor-arrows-in-line-vertical-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=k
},
['phosphor-arrows-in-line-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=k
},
['phosphor-arrows-in-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=k
},
['phosphor-arrows-in-simple-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=k
},
['phosphor-arrows-in-simple-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=k
},
['phosphor-arrows-in-simple-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=k
},
['phosphor-arrows-in-simple-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=k
},
['phosphor-arrows-in-simple']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=k
},
['phosphor-arrows-in-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=k
},
['phosphor-arrows-in']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=k
},
['phosphor-arrows-left-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=k
},
['phosphor-arrows-left-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=k
},
['phosphor-arrows-left-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=k
},
['phosphor-arrows-left-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=k
},
['phosphor-arrows-left-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=k
},
['phosphor-arrows-left-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=k
},
['phosphor-arrows-merge-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=k
},
['phosphor-arrows-merge-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=k
},
['phosphor-arrows-merge-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=k
},
['phosphor-arrows-merge-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=k
},
['phosphor-arrows-merge-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=k
},
['phosphor-arrows-merge']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=k
},
['phosphor-arrows-out-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=k
},
['phosphor-arrows-out-cardinal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=k
},
['phosphor-arrows-out-cardinal-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=k
},
['phosphor-arrows-out-cardinal-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=k
},
['phosphor-arrows-out-cardinal-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=k
},
['phosphor-arrows-out-cardinal-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=k
},
['phosphor-arrows-out-cardinal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=k
},
['phosphor-arrows-out-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=k
},
['phosphor-arrows-out-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=k
},
['phosphor-arrows-out-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=k
},
['phosphor-arrows-out-line-horizontal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=k
},
['phosphor-arrows-out-line-horizontal-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=k
},
['phosphor-arrows-out-line-horizontal-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=k
},
['phosphor-arrows-out-line-horizontal-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=k
},
['phosphor-arrows-out-line-horizontal-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=k
},
['phosphor-arrows-out-line-horizontal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=k
},
['phosphor-arrows-out-line-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=k
},
['phosphor-arrows-out-line-vertical-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=k
},
['phosphor-arrows-out-line-vertical-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=k
},
['phosphor-arrows-out-line-vertical-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=k
},
['phosphor-arrows-out-line-vertical-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=k
},
['phosphor-arrows-out-line-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=k
},
['phosphor-arrows-out-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=k
},
['phosphor-arrows-out-simple-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_256'],
Image=k
},
['phosphor-arrows-out-simple-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=k
},
['phosphor-arrows-out-simple-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_256'],
Image=k
},
['phosphor-arrows-out-simple-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=k
},
['phosphor-arrows-out-simple']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=k
},
['phosphor-arrows-out-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=k
},
['phosphor-arrows-out']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=k
},
['phosphor-arrows-split-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=k
},
['phosphor-arrows-split-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=k
},
['phosphor-arrows-split-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=k
},
['phosphor-arrows-split-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_256'],
Image=k
},
['phosphor-arrows-split-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=k
},
['phosphor-arrows-split']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=k
},
['phosphor-arrows-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=k
},
['phosphor-arrows-vertical-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=k
},
['phosphor-arrows-vertical-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=k
},
['phosphor-arrows-vertical-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=k
},
['phosphor-arrows-vertical-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=k
},
['phosphor-arrows-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_320'],
Image=k
},
['phosphor-article-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=k
},
['phosphor-article-medium-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=k
},
['phosphor-article-ny-times-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=k
},
['phosphor-asclepius-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=k
},
['phosphor-asterisk-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=k
},
['phosphor-asterisk-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=k
},
['phosphor-at-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=k
},
['phosphor-atom-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=k
},
['phosphor-avocado-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=k
},
['phosphor-axe-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=k
},
['phosphor-axe-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=k
},
['phosphor-axe-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=k
},
['phosphor-axe-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=k
},
['phosphor-axe-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=k
},
['phosphor-axe']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_512'],
Image=k
},
['phosphor-baby-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=k
},
['phosphor-baby-carriage-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_576'],
Image=k
},
['phosphor-backpack-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=k
},
['phosphor-backspace-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=k
},
['phosphor-bag-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=k
},
['phosphor-bag-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=k
},
['phosphor-balloon-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=k
},
['phosphor-bandaids-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=k
},
['phosphor-bank-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=k
},
['phosphor-barbell-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=k
},
['phosphor-barbell-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=k
},
['phosphor-barbell-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=k
},
['phosphor-barbell-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=k
},
['phosphor-barbell-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=k
},
['phosphor-barbell']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=k
},
['phosphor-barcode-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=k
},
['phosphor-barn-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=k
},
['phosphor-barricade-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=k
},
['phosphor-baseball-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=k
},
['phosphor-baseball-cap-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=k
},
['phosphor-baseball-helmet-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_896'],
Image=k
},
['phosphor-basket-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=k
},
['phosphor-basketball-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=k
},
['phosphor-bathtub-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=k
},
['phosphor-battery-charging-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=l
},
['phosphor-battery-charging-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=l
},
['phosphor-battery-charging-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=l
},
['phosphor-battery-charging-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=l
},
['phosphor-battery-charging-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=l
},
['phosphor-battery-charging-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=l
},
['phosphor-battery-charging-vertical-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=l
},
['phosphor-battery-charging-vertical-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=l
},
['phosphor-battery-charging-vertical-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=l
},
['phosphor-battery-charging-vertical-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=l
},
['phosphor-battery-charging-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=l
},
['phosphor-battery-charging']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=l
},
['phosphor-battery-empty-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=l
},
['phosphor-battery-empty-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=l
},
['phosphor-battery-empty-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=l
},
['phosphor-battery-empty-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=l
},
['phosphor-battery-empty-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=l
},
['phosphor-battery-empty']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=l
},
['phosphor-battery-full-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=l
},
['phosphor-battery-full-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=l
},
['phosphor-battery-full-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=l
},
['phosphor-battery-full-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=l
},
['phosphor-battery-full-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=l
},
['phosphor-battery-full']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=l
},
['phosphor-battery-high-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=l
},
['phosphor-battery-high-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=l
},
['phosphor-battery-high-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=l
},
['phosphor-battery-high-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=l
},
['phosphor-battery-high-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=l
},
['phosphor-battery-high']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=l
},
['phosphor-battery-low-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=l
},
['phosphor-battery-low-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=l
},
['phosphor-battery-low-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=l
},
['phosphor-battery-low-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=l
},
['phosphor-battery-low-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=l
},
['phosphor-battery-low']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=l
},
['phosphor-battery-medium-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=l
},
['phosphor-battery-medium-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=l
},
['phosphor-battery-medium-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=l
},
['phosphor-battery-medium-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=l
},
['phosphor-battery-medium-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=l
},
['phosphor-battery-medium']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=l
},
['phosphor-battery-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=l
},
['phosphor-battery-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=l
},
['phosphor-battery-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=l
},
['phosphor-battery-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=l
},
['phosphor-battery-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=l
},
['phosphor-battery-plus-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=l
},
['phosphor-battery-plus-vertical-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=l
},
['phosphor-battery-plus-vertical-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=l
},
['phosphor-battery-plus-vertical-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=l
},
['phosphor-battery-plus-vertical-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=l
},
['phosphor-battery-plus-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=l
},
['phosphor-battery-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=l
},
['phosphor-battery-vertical-empty-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=l
},
['phosphor-battery-vertical-empty-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=l
},
['phosphor-battery-vertical-empty-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=l
},
['phosphor-battery-vertical-empty-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=l
},
['phosphor-battery-vertical-empty-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=l
},
['phosphor-battery-vertical-empty']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=l
},
['phosphor-battery-vertical-full-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=l
},
['phosphor-battery-vertical-full-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=l
},
['phosphor-battery-vertical-full-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=l
},
['phosphor-battery-vertical-full-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_256'],
Image=l
},
['phosphor-battery-vertical-full-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=l
},
['phosphor-battery-vertical-full']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_256'],
Image=l
},
['phosphor-battery-vertical-high-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=l
},
['phosphor-battery-vertical-high-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=l
},
['phosphor-battery-vertical-high-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=l
},
['phosphor-battery-vertical-high-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=l
},
['phosphor-battery-vertical-high-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=l
},
['phosphor-battery-vertical-high']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=l
},
['phosphor-battery-vertical-low-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=l
},
['phosphor-battery-vertical-low-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_256'],
Image=l
},
['phosphor-battery-vertical-low-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=l
},
['phosphor-battery-vertical-low-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=l
},
['phosphor-battery-vertical-low-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=l
},
['phosphor-battery-vertical-low']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=l
},
['phosphor-battery-vertical-medium-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=l
},
['phosphor-battery-vertical-medium-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=l
},
['phosphor-battery-vertical-medium-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=l
},
['phosphor-battery-vertical-medium-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_320'],
Image=l
},
['phosphor-battery-vertical-medium-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=l
},
['phosphor-battery-vertical-medium']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=l
},
['phosphor-battery-warning-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=l
},
['phosphor-battery-warning-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=l
},
['phosphor-battery-warning-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=l
},
['phosphor-battery-warning-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=l
},
['phosphor-battery-warning-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=l
},
['phosphor-battery-warning-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=l
},
['phosphor-battery-warning-vertical-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=l
},
['phosphor-battery-warning-vertical-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_320'],
Image=l
},
['phosphor-battery-warning-vertical-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=l
},
['phosphor-battery-warning-vertical-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=l
},
['phosphor-battery-warning-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=l
},
['phosphor-battery-warning']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_384'],
Image=l
},
['phosphor-beach-ball-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=l
},
['phosphor-beanie-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=l
},
['phosphor-bed-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=l
},
['phosphor-beer-bottle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=l
},
['phosphor-beer-stein-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=l
},
['phosphor-behance-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=l
},
['phosphor-bell-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=l
},
['phosphor-bell-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_512'],
Image=l
},
['phosphor-bell-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=l
},
['phosphor-bell-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_512'],
Image=l
},
['phosphor-bell-ringing-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=l
},
['phosphor-bell-ringing-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=l
},
['phosphor-bell-ringing-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=l
},
['phosphor-bell-ringing-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=l
},
['phosphor-bell-ringing-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=l
},
['phosphor-bell-ringing']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_512'],
Image=l
},
['phosphor-bell-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=l
},
['phosphor-bell-simple-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_576'],
Image=l
},
['phosphor-bell-simple-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=l
},
['phosphor-bell-simple-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=l
},
['phosphor-bell-simple-ringing-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=l
},
['phosphor-bell-simple-ringing-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=l
},
['phosphor-bell-simple-ringing-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=l
},
['phosphor-bell-simple-ringing-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_576'],
Image=l
},
['phosphor-bell-simple-ringing-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=l
},
['phosphor-bell-simple-ringing']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=l
},
['phosphor-bell-simple-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=l
},
['phosphor-bell-simple-slash-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_576'],
Image=l
},
['phosphor-bell-simple-slash-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=l
},
['phosphor-bell-simple-slash-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_576'],
Image=l
},
['phosphor-bell-simple-slash-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=l
},
['phosphor-bell-simple-slash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_576'],
Image=l
},
['phosphor-bell-simple-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=l
},
['phosphor-bell-simple-z-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_640'],
Image=l
},
['phosphor-bell-simple-z-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=l
},
['phosphor-bell-simple-z-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_640'],
Image=l
},
['phosphor-bell-simple-z-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=l
},
['phosphor-bell-simple-z-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_640'],
Image=l
},
['phosphor-bell-simple-z']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=l
},
['phosphor-bell-simple']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_640'],
Image=l
},
['phosphor-bell-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=l
},
['phosphor-bell-slash-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=l
},
['phosphor-bell-slash-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=l
},
['phosphor-bell-slash-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=l
},
['phosphor-bell-slash-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=l
},
['phosphor-bell-slash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_640'],
Image=l
},
['phosphor-bell-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=l
},
['phosphor-bell-z-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_640'],
Image=l
},
['phosphor-bell-z-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=l
},
['phosphor-bell-z-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_704'],
Image=l
},
['phosphor-bell-z-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=l
},
['phosphor-bell-z-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=l
},
['phosphor-bell-z']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=l
},
['phosphor-bell']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_704'],
Image=l
},
['phosphor-belt-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=l
},
['phosphor-bezier-curve-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=l
},
['phosphor-bicycle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=l
},
['phosphor-binary-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=l
},
['phosphor-binoculars-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=l
},
['phosphor-biohazard-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=l
},
['phosphor-bird-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=l
},
['phosphor-blueprint-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=l
},
['phosphor-bluetooth-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=l
},
['phosphor-bluetooth-connected-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_896'],
Image=l
},
['phosphor-bluetooth-connected-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=l
},
['phosphor-bluetooth-connected-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_896'],
Image=l
},
['phosphor-bluetooth-connected-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=l
},
['phosphor-bluetooth-connected-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=l
},
['phosphor-bluetooth-connected']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=l
},
['phosphor-bluetooth-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=l
},
['phosphor-bluetooth-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=l
},
['phosphor-bluetooth-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=l
},
['phosphor-bluetooth-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=l
},
['phosphor-bluetooth-slash-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_960'],
Image=l
},
['phosphor-bluetooth-slash-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=l
},
['phosphor-bluetooth-slash-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=l
},
['phosphor-bluetooth-slash-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=l
},
['phosphor-bluetooth-slash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=l
},
['phosphor-bluetooth-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=l
},
['phosphor-bluetooth-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=l
},
['phosphor-bluetooth-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=l
},
['phosphor-bluetooth-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=l
},
['phosphor-bluetooth-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=l
},
['phosphor-bluetooth-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=l
},
['phosphor-bluetooth-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=l
},
['phosphor-bluetooth']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_960'],
Image=l
},
['phosphor-boat-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=l
},
['phosphor-bomb-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=m
},
['phosphor-bone-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=m
},
['phosphor-book-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=m
},
['phosphor-book-bookmark-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=m
},
['phosphor-book-open-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=m
},
['phosphor-book-open-text-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=m
},
['phosphor-book-open-text-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=m
},
['phosphor-book-open-text-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=m
},
['phosphor-book-open-text-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=m
},
['phosphor-book-open-text-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=m
},
['phosphor-book-open-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=m
},
['phosphor-book-open-user-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=m
},
['phosphor-book-open-user-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=m
},
['phosphor-book-open-user-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=m
},
['phosphor-book-open-user-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=m
},
['phosphor-book-user-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=m
},
['phosphor-book-user']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=m
},
['phosphor-bookmark-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=m
},
['phosphor-bookmark-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=m
},
['phosphor-bookmarks-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=m
},
['phosphor-bookmarks-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=m
},
['phosphor-books-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=m
},
['phosphor-boot-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=m
},
['phosphor-boules-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=m
},
['phosphor-bounding-box-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=m
},
['phosphor-bounding-box-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=m
},
['phosphor-bounding-box-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=m
},
['phosphor-bounding-box-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=m
},
['phosphor-bounding-box-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=m
},
['phosphor-bounding-box']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_320'],
Image=m
},
['phosphor-bowl-food-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=m
},
['phosphor-bowl-steam-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=m
},
['phosphor-bowling-ball-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=m
},
['phosphor-box-arrow-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=m
},
['phosphor-box-arrow-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=m
},
['phosphor-box-arrow-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=m
},
['phosphor-box-arrow-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=m
},
['phosphor-box-arrow-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=m
},
['phosphor-box-arrow-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_448'],
Image=m
},
['phosphor-box-arrow-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=m
},
['phosphor-box-arrow-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_448'],
Image=m
},
['phosphor-box-arrow-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=m
},
['phosphor-box-arrow-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_448'],
Image=m
},
['phosphor-box-arrow-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=m
},
['phosphor-box-arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_448'],
Image=m
},
['phosphor-boxing-glove-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=m
},
['phosphor-boxing-glove-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_448'],
Image=m
},
['phosphor-boxing-glove-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=m
},
['phosphor-boxing-glove-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_448'],
Image=m
},
['phosphor-boxing-glove-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=m
},
['phosphor-boxing-glove']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=m
},
['phosphor-brackets-angle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=m
},
['phosphor-brackets-curly-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=m
},
['phosphor-brackets-round-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=m
},
['phosphor-brackets-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=m
},
['phosphor-brackets-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=m
},
['phosphor-brackets-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=m
},
['phosphor-brackets-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_576'],
Image=m
},
['phosphor-brackets-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=m
},
['phosphor-brackets-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=m
},
['phosphor-brain-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=m
},
['phosphor-brandy-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=m
},
['phosphor-bread-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=m
},
['phosphor-bridge-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=m
},
['phosphor-briefcase-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=m
},
['phosphor-briefcase-metal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=m
},
['phosphor-broadcast-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=m
},
['phosphor-broom-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=m
},
['phosphor-browser-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=m
},
['phosphor-browsers-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=m
},
['phosphor-bug-beetle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=m
},
['phosphor-bug-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=m
},
['phosphor-bug-droid-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=m
},
['phosphor-building-apartment-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=m
},
['phosphor-building-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=m
},
['phosphor-building-office-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=m
},
['phosphor-buildings-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=m
},
['phosphor-bulldozer-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=n
},
['phosphor-bus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=n
},
['phosphor-butterfly-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=n
},
['phosphor-cable-car-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=n
},
['phosphor-cactus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=n
},
['phosphor-cake-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=n
},
['phosphor-calculator-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=n
},
['phosphor-calendar-blank-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=n
},
['phosphor-calendar-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=n
},
['phosphor-calendar-check-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=n
},
['phosphor-calendar-check-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=n
},
['phosphor-calendar-check-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=n
},
['phosphor-calendar-check-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=n
},
['phosphor-calendar-check-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=n
},
['phosphor-calendar-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=n
},
['phosphor-calendar-dot-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=n
},
['phosphor-calendar-dots-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=n
},
['phosphor-calendar-heart-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=n
},
['phosphor-calendar-heart-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=n
},
['phosphor-calendar-heart-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=n
},
['phosphor-calendar-heart-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=n
},
['phosphor-calendar-heart-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=n
},
['phosphor-calendar-heart']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=n
},
['phosphor-calendar-minus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=n
},
['phosphor-calendar-minus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=n
},
['phosphor-calendar-minus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=n
},
['phosphor-calendar-minus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=n
},
['phosphor-calendar-minus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=n
},
['phosphor-calendar-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=n
},
['phosphor-calendar-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=n
},
['phosphor-calendar-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_320'],
Image=n
},
['phosphor-calendar-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=n
},
['phosphor-calendar-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=n
},
['phosphor-calendar-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=n
},
['phosphor-calendar-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=n
},
['phosphor-calendar-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=n
},
['phosphor-calendar-star-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=n
},
['phosphor-calendar-star-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=n
},
['phosphor-calendar-star-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=n
},
['phosphor-calendar-star-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_384'],
Image=n
},
['phosphor-calendar-star-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=n
},
['phosphor-calendar-star']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_384'],
Image=n
},
['phosphor-calendar-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_384'],
Image=n
},
['phosphor-calendar-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=n
},
['phosphor-calendar-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_384'],
Image=n
},
['phosphor-calendar-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=n
},
['phosphor-calendar-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_384'],
Image=n
},
['phosphor-calendar-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=n
},
['phosphor-call-bell-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=n
},
['phosphor-call-bell-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=n
},
['phosphor-call-bell-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=n
},
['phosphor-call-bell-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_384'],
Image=n
},
['phosphor-call-bell-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=n
},
['phosphor-call-bell']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=n
},
['phosphor-campfire-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=n
},
['phosphor-car-battery-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=n
},
['phosphor-car-battery-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_576'],
Image=n
},
['phosphor-car-battery-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=n
},
['phosphor-car-battery-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=n
},
['phosphor-car-battery-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=n
},
['phosphor-car-battery']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=n
},
['phosphor-car-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=n
},
['phosphor-car-profile-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=n
},
['phosphor-car-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=n
},
['phosphor-cardholder-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=n
},
['phosphor-cards-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=n
},
['phosphor-cards-three-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=n
},
['phosphor-caret-circle-double-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=n
},
['phosphor-caret-circle-double-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_704'],
Image=n
},
['phosphor-caret-circle-double-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=n
},
['phosphor-caret-circle-double-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=n
},
['phosphor-caret-circle-double-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=n
},
['phosphor-caret-circle-double-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=n
},
['phosphor-caret-circle-double-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=n
},
['phosphor-caret-circle-double-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=n
},
['phosphor-caret-circle-double-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=n
},
['phosphor-caret-circle-double-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=n
},
['phosphor-caret-circle-double-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=n
},
['phosphor-caret-circle-double-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=n
},
['phosphor-caret-circle-double-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=n
},
['phosphor-caret-circle-double-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=n
},
['phosphor-caret-circle-double-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=n
},
['phosphor-caret-circle-double-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=n
},
['phosphor-caret-circle-double-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=n
},
['phosphor-caret-circle-double-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=n
},
['phosphor-caret-circle-double-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=n
},
['phosphor-caret-circle-double-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=n
},
['phosphor-caret-circle-double-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=n
},
['phosphor-caret-circle-double-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=n
},
['phosphor-caret-circle-double-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=n
},
['phosphor-caret-circle-double-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=n
},
['phosphor-caret-circle-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=n
},
['phosphor-caret-circle-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=n
},
['phosphor-caret-circle-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=n
},
['phosphor-caret-circle-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=n
},
['phosphor-caret-circle-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=n
},
['phosphor-caret-circle-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_832'],
Image=n
},
['phosphor-caret-circle-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=n
},
['phosphor-caret-circle-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_832'],
Image=n
},
['phosphor-caret-circle-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=n
},
['phosphor-caret-circle-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_832'],
Image=n
},
['phosphor-caret-circle-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=n
},
['phosphor-caret-circle-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=n
},
['phosphor-caret-circle-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=n
},
['phosphor-caret-circle-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=n
},
['phosphor-caret-circle-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=n
},
['phosphor-caret-circle-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_896'],
Image=n
},
['phosphor-caret-circle-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=n
},
['phosphor-caret-circle-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_896'],
Image=n
},
['phosphor-caret-circle-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=n
},
['phosphor-caret-circle-up-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_896'],
Image=n
},
['phosphor-caret-circle-up-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=n
},
['phosphor-caret-circle-up-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_896'],
Image=n
},
['phosphor-caret-circle-up-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=n
},
['phosphor-caret-circle-up-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_896'],
Image=n
},
['phosphor-caret-circle-up-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=n
},
['phosphor-caret-circle-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=n
},
['phosphor-caret-circle-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=n
},
['phosphor-caret-circle-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=n
},
['phosphor-caret-circle-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=n
},
['phosphor-caret-circle-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=n
},
['phosphor-caret-double-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=n
},
['phosphor-caret-double-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_960'],
Image=n
},
['phosphor-caret-double-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=n
},
['phosphor-caret-double-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=n
},
['phosphor-caret-double-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=n
},
['phosphor-caret-double-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=n
},
['phosphor-caret-double-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=n
},
['phosphor-caret-double-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=n
},
['phosphor-caret-double-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=n
},
['phosphor-caret-double-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=n
},
['phosphor-caret-double-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=n
},
['phosphor-caret-double-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=n
},
['phosphor-caret-double-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=n
},
['phosphor-caret-double-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_960'],
Image=n
},
['phosphor-caret-double-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=n
},
['phosphor-caret-double-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=n
},
['phosphor-caret-double-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=o
},
['phosphor-caret-double-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=o
},
['phosphor-caret-double-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=o
},
['phosphor-caret-double-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=o
},
['phosphor-caret-double-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=o
},
['phosphor-caret-double-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=o
},
['phosphor-caret-double-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=o
},
['phosphor-caret-double-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=o
},
['phosphor-caret-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=o
},
['phosphor-caret-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=o
},
['phosphor-caret-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=o
},
['phosphor-caret-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=o
},
['phosphor-caret-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=o
},
['phosphor-caret-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=o
},
['phosphor-caret-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=o
},
['phosphor-caret-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=o
},
['phosphor-caret-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=o
},
['phosphor-caret-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=o
},
['phosphor-caret-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=o
},
['phosphor-caret-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=o
},
['phosphor-caret-line-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=o
},
['phosphor-caret-line-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=o
},
['phosphor-caret-line-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=o
},
['phosphor-caret-line-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=o
},
['phosphor-caret-line-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=o
},
['phosphor-caret-line-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=o
},
['phosphor-caret-line-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=o
},
['phosphor-caret-line-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=o
},
['phosphor-caret-line-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=o
},
['phosphor-caret-line-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=o
},
['phosphor-caret-line-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=o
},
['phosphor-caret-line-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=o
},
['phosphor-caret-line-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=o
},
['phosphor-caret-line-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=o
},
['phosphor-caret-line-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=o
},
['phosphor-caret-line-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=o
},
['phosphor-caret-line-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=o
},
['phosphor-caret-line-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=o
},
['phosphor-caret-line-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=o
},
['phosphor-caret-line-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=o
},
['phosphor-caret-line-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=o
},
['phosphor-caret-line-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=o
},
['phosphor-caret-line-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=o
},
['phosphor-caret-line-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=o
},
['phosphor-caret-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=o
},
['phosphor-caret-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=o
},
['phosphor-caret-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=o
},
['phosphor-caret-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=o
},
['phosphor-caret-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=o
},
['phosphor-caret-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=o
},
['phosphor-caret-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=o
},
['phosphor-caret-up-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=o
},
['phosphor-caret-up-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=o
},
['phosphor-caret-up-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=o
},
['phosphor-caret-up-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=o
},
['phosphor-caret-up-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=o
},
['phosphor-caret-up-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=o
},
['phosphor-caret-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=o
},
['phosphor-caret-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=o
},
['phosphor-caret-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=o
},
['phosphor-caret-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=o
},
['phosphor-caret-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=o
},
['phosphor-carrot-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=o
},
['phosphor-cash-register-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=o
},
['phosphor-cassette-tape-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=o
},
['phosphor-castle-turret-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=o
},
['phosphor-cat-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=o
},
['phosphor-cell-signal-full-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=o
},
['phosphor-cell-signal-full-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_320'],
Image=o
},
['phosphor-cell-signal-full-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=o
},
['phosphor-cell-signal-full-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=o
},
['phosphor-cell-signal-full-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=o
},
['phosphor-cell-signal-full']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_384'],
Image=o
},
['phosphor-cell-signal-high-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=o
},
['phosphor-cell-signal-high-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_384'],
Image=o
},
['phosphor-cell-signal-high-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=o
},
['phosphor-cell-signal-high-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_384'],
Image=o
},
['phosphor-cell-signal-high-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=o
},
['phosphor-cell-signal-high']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_384'],
Image=o
},
['phosphor-cell-signal-low-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=o
},
['phosphor-cell-signal-low-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_384'],
Image=o
},
['phosphor-cell-signal-low-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=o
},
['phosphor-cell-signal-low-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_384'],
Image=o
},
['phosphor-cell-signal-low-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=o
},
['phosphor-cell-signal-low']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=o
},
['phosphor-cell-signal-medium-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=o
},
['phosphor-cell-signal-medium-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_384'],
Image=o
},
['phosphor-cell-signal-medium-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=o
},
['phosphor-cell-signal-medium-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=o
},
['phosphor-cell-signal-medium-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=o
},
['phosphor-cell-signal-medium']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=o
},
['phosphor-cell-signal-none-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=o
},
['phosphor-cell-signal-none-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_448'],
Image=o
},
['phosphor-cell-signal-none-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=o
},
['phosphor-cell-signal-none-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_448'],
Image=o
},
['phosphor-cell-signal-none-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=o
},
['phosphor-cell-signal-none']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_448'],
Image=o
},
['phosphor-cell-signal-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=o
},
['phosphor-cell-signal-slash-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_448'],
Image=o
},
['phosphor-cell-signal-slash-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=o
},
['phosphor-cell-signal-slash-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_448'],
Image=o
},
['phosphor-cell-signal-slash-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=o
},
['phosphor-cell-signal-slash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_448'],
Image=o
},
['phosphor-cell-signal-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=o
},
['phosphor-cell-signal-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=o
},
['phosphor-cell-signal-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=o
},
['phosphor-cell-signal-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_512'],
Image=o
},
['phosphor-cell-signal-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=o
},
['phosphor-cell-signal-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_512'],
Image=o
},
['phosphor-cell-tower-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=o
},
['phosphor-certificate-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=o
},
['phosphor-chair-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=o
},
['phosphor-chalkboard-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=o
},
['phosphor-chalkboard-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=o
},
['phosphor-chalkboard-teacher-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=o
},
['phosphor-champagne-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=o
},
['phosphor-charging-station-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=o
},
['phosphor-chart-bar-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=o
},
['phosphor-chart-bar-horizontal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=o
},
['phosphor-chart-donut-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=o
},
['phosphor-chart-line-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=o
},
['phosphor-chart-line-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=o
},
['phosphor-chart-line-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=o
},
['phosphor-chart-pie-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=o
},
['phosphor-chart-pie-slice-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=o
},
['phosphor-chart-polar-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=o
},
['phosphor-chart-scatter-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=o
},
['phosphor-chat-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=o
},
['phosphor-chat-centered-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=o
},
['phosphor-chat-centered-dots-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=o
},
['phosphor-chat-centered-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_960'],
Image=o
},
['phosphor-chat-centered-text-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=p
},
['phosphor-chat-centered-text-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=p
},
['phosphor-chat-centered-text-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=p
},
['phosphor-chat-centered-text-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=p
},
['phosphor-chat-centered-text-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=p
},
['phosphor-chat-centered-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=p
},
['phosphor-chat-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=p
},
['phosphor-chat-circle-dots-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=p
},
['phosphor-chat-circle-dots-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=p
},
['phosphor-chat-circle-dots-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=p
},
['phosphor-chat-circle-dots-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=p
},
['phosphor-chat-circle-dots-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=p
},
['phosphor-chat-circle-dots']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=p
},
['phosphor-chat-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=p
},
['phosphor-chat-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=p
},
['phosphor-chat-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=p
},
['phosphor-chat-circle-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=p
},
['phosphor-chat-circle-slash-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=p
},
['phosphor-chat-circle-slash-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=p
},
['phosphor-chat-circle-slash-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=p
},
['phosphor-chat-circle-slash-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=p
},
['phosphor-chat-circle-slash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=p
},
['phosphor-chat-circle-text-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=p
},
['phosphor-chat-circle-text-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=p
},
['phosphor-chat-circle-text-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=p
},
['phosphor-chat-circle-text-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=p
},
['phosphor-chat-circle-text-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=p
},
['phosphor-chat-circle-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=p
},
['phosphor-chat-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=p
},
['phosphor-chat-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=p
},
['phosphor-chat-dots-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=p
},
['phosphor-chat-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=p
},
['phosphor-chat-teardrop-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=p
},
['phosphor-chat-teardrop-dots-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=p
},
['phosphor-chat-teardrop-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=p
},
['phosphor-chat-teardrop-text-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=p
},
['phosphor-chat-teardrop-text-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_256'],
Image=p
},
['phosphor-chat-teardrop-text-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=p
},
['phosphor-chat-teardrop-text-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=p
},
['phosphor-chat-teardrop-text-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=p
},
['phosphor-chat-teardrop-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=p
},
['phosphor-chat-text-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=p
},
['phosphor-chat-text-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_256'],
Image=p
},
['phosphor-chat-text-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=p
},
['phosphor-chat-text-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=p
},
['phosphor-chat-text-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=p
},
['phosphor-chat-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=p
},
['phosphor-chats-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=p
},
['phosphor-chats-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_320'],
Image=p
},
['phosphor-chats-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=p
},
['phosphor-chats-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=p
},
['phosphor-chats-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=p
},
['phosphor-chats-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=p
},
['phosphor-chats-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=p
},
['phosphor-chats-teardrop-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=p
},
['phosphor-check-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=p
},
['phosphor-check-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_384'],
Image=p
},
['phosphor-check-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=p
},
['phosphor-check-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_384'],
Image=p
},
['phosphor-check-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=p
},
['phosphor-check-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_384'],
Image=p
},
['phosphor-check-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=p
},
['phosphor-check-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_384'],
Image=p
},
['phosphor-check-fat-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=p
},
['phosphor-check-fat-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=p
},
['phosphor-check-fat-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=p
},
['phosphor-check-fat-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_384'],
Image=p
},
['phosphor-check-fat-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=p
},
['phosphor-check-fat']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=p
},
['phosphor-check-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=p
},
['phosphor-check-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=p
},
['phosphor-check-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=p
},
['phosphor-check-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_448'],
Image=p
},
['phosphor-check-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=p
},
['phosphor-check-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_448'],
Image=p
},
['phosphor-check-square-offset-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=p
},
['phosphor-check-square-offset-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_448'],
Image=p
},
['phosphor-check-square-offset-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=p
},
['phosphor-check-square-offset-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_448'],
Image=p
},
['phosphor-check-square-offset-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=p
},
['phosphor-check-square-offset']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_448'],
Image=p
},
['phosphor-check-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=p
},
['phosphor-check-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_448'],
Image=p
},
['phosphor-check-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=p
},
['phosphor-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=p
},
['phosphor-checkerboard-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=p
},
['phosphor-checkerboard-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_512'],
Image=p
},
['phosphor-checkerboard-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=p
},
['phosphor-checkerboard-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_512'],
Image=p
},
['phosphor-checkerboard-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=p
},
['phosphor-checkerboard']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_512'],
Image=p
},
['phosphor-checks-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=p
},
['phosphor-checks-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_512'],
Image=p
},
['phosphor-checks-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=p
},
['phosphor-checks-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=p
},
['phosphor-checks-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=p
},
['phosphor-checks']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=p
},
['phosphor-cheers-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=p
},
['phosphor-cheese-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=p
},
['phosphor-chef-hat-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=p
},
['phosphor-cherries-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=p
},
['phosphor-church-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=p
},
['phosphor-cigarette-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=p
},
['phosphor-cigarette-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=p
},
['phosphor-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=p
},
['phosphor-circle-dashed-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=p
},
['phosphor-circle-dashed-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=p
},
['phosphor-circle-dashed-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_704'],
Image=p
},
['phosphor-circle-dashed-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=p
},
['phosphor-circle-dashed-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=p
},
['phosphor-circle-dashed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=p
},
['phosphor-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=p
},
['phosphor-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=p
},
['phosphor-circle-half-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=p
},
['phosphor-circle-half-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=p
},
['phosphor-circle-half-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=p
},
['phosphor-circle-half-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=p
},
['phosphor-circle-half-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=p
},
['phosphor-circle-half-tilt-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=p
},
['phosphor-circle-half-tilt-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=p
},
['phosphor-circle-half-tilt-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=p
},
['phosphor-circle-half-tilt-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=p
},
['phosphor-circle-half-tilt-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=p
},
['phosphor-circle-half-tilt']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=p
},
['phosphor-circle-half']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=p
},
['phosphor-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=p
},
['phosphor-circle-notch-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=p
},
['phosphor-circle-notch-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=p
},
['phosphor-circle-notch-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=p
},
['phosphor-circle-notch-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=p
},
['phosphor-circle-notch-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=p
},
['phosphor-circle-notch']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=p
},
['phosphor-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=p
},
['phosphor-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=p
},
['phosphor-circles-four-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=p
},
['phosphor-circles-four-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_832'],
Image=p
},
['phosphor-circles-four-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=p
},
['phosphor-circles-four-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_832'],
Image=p
},
['phosphor-circles-four-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=p
},
['phosphor-circles-four']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_832'],
Image=p
},
['phosphor-circles-three-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=p
},
['phosphor-circles-three-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=p
},
['phosphor-circles-three-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=p
},
['phosphor-circles-three-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=p
},
['phosphor-circles-three-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=p
},
['phosphor-circles-three-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_896'],
Image=p
},
['phosphor-circles-three-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=p
},
['phosphor-circles-three-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_896'],
Image=p
},
['phosphor-circles-three-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=p
},
['phosphor-circles-three-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_896'],
Image=p
},
['phosphor-circles-three-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=p
},
['phosphor-circles-three']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_896'],
Image=p
},
['phosphor-circuitry-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=p
},
['phosphor-city-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=p
},
['phosphor-clipboard-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=p
},
['phosphor-clipboard-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=p
},
['phosphor-clipboard-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=p
},
['phosphor-clipboard-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=p
},
['phosphor-clipboard-text-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=p
},
['phosphor-clipboard-text-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=p
},
['phosphor-clipboard-text-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=p
},
['phosphor-clipboard-text-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=p
},
['phosphor-clipboard-text-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=p
},
['phosphor-clipboard-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_960'],
Image=p
},
['phosphor-clipboard-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=p
},
['phosphor-clipboard']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=p
},
['phosphor-clock-afternoon-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=q
},
['phosphor-clock-afternoon-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=q
},
['phosphor-clock-afternoon-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=q
},
['phosphor-clock-afternoon-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=q
},
['phosphor-clock-afternoon-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=q
},
['phosphor-clock-afternoon']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=q
},
['phosphor-clock-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=q
},
['phosphor-clock-clockwise-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=q
},
['phosphor-clock-clockwise-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=q
},
['phosphor-clock-clockwise-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=q
},
['phosphor-clock-clockwise-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=q
},
['phosphor-clock-clockwise-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=q
},
['phosphor-clock-clockwise']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=q
},
['phosphor-clock-countdown-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=q
},
['phosphor-clock-countdown-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=q
},
['phosphor-clock-countdown-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=q
},
['phosphor-clock-countdown-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=q
},
['phosphor-clock-countdown-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=q
},
['phosphor-clock-countdown']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=q
},
['phosphor-clock-counter-clockwise-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=q
},
['phosphor-clock-counter-clockwise-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=q
},
['phosphor-clock-counter-clockwise-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=q
},
['phosphor-clock-counter-clockwise-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=q
},
['phosphor-clock-counter-clockwise-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=q
},
['phosphor-clock-counter-clockwise']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=q
},
['phosphor-clock-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=q
},
['phosphor-clock-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=q
},
['phosphor-clock-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=q
},
['phosphor-clock-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=q
},
['phosphor-clock-user-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=q
},
['phosphor-clock-user-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=q
},
['phosphor-clock-user-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=q
},
['phosphor-clock-user-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=q
},
['phosphor-clock-user-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=q
},
['phosphor-clock-user']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=q
},
['phosphor-clock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=q
},
['phosphor-closed-captioning-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=q
},
['phosphor-cloud-arrow-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=q
},
['phosphor-cloud-arrow-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=q
},
['phosphor-cloud-arrow-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=q
},
['phosphor-cloud-arrow-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=q
},
['phosphor-cloud-arrow-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=q
},
['phosphor-cloud-arrow-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=q
},
['phosphor-cloud-arrow-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=q
},
['phosphor-cloud-arrow-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=q
},
['phosphor-cloud-arrow-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=q
},
['phosphor-cloud-arrow-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=q
},
['phosphor-cloud-arrow-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=q
},
['phosphor-cloud-arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=q
},
['phosphor-cloud-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=q
},
['phosphor-cloud-check-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=q
},
['phosphor-cloud-check-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=q
},
['phosphor-cloud-check-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=q
},
['phosphor-cloud-check-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=q
},
['phosphor-cloud-check-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=q
},
['phosphor-cloud-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=q
},
['phosphor-cloud-fog-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=q
},
['phosphor-cloud-lightning-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=q
},
['phosphor-cloud-moon-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=q
},
['phosphor-cloud-rain-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=q
},
['phosphor-cloud-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=q
},
['phosphor-cloud-snow-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=q
},
['phosphor-cloud-sun-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=q
},
['phosphor-cloud-warning-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_384'],
Image=q
},
['phosphor-cloud-warning-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=q
},
['phosphor-cloud-warning-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=q
},
['phosphor-cloud-warning-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=q
},
['phosphor-cloud-warning-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_384'],
Image=q
},
['phosphor-cloud-warning']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=q
},
['phosphor-cloud-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=q
},
['phosphor-cloud-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=q
},
['phosphor-cloud-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=q
},
['phosphor-cloud-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=q
},
['phosphor-cloud-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_448'],
Image=q
},
['phosphor-cloud-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=q
},
['phosphor-clover-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=q
},
['phosphor-club-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=q
},
['phosphor-coat-hanger-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=q
},
['phosphor-coda-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=q
},
['phosphor-code-block-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=q
},
['phosphor-code-block-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_576'],
Image=q
},
['phosphor-code-block-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=q
},
['phosphor-code-block-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=q
},
['phosphor-code-block-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=q
},
['phosphor-code-block']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=q
},
['phosphor-code-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=q
},
['phosphor-code-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=q
},
['phosphor-codepen-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=q
},
['phosphor-codesandbox-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=q
},
['phosphor-codesandbox-logo-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=q
},
['phosphor-codesandbox-logo-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=q
},
['phosphor-codesandbox-logo-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=q
},
['phosphor-codesandbox-logo-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=q
},
['phosphor-codesandbox-logo']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_640'],
Image=q
},
['phosphor-coffee-bean-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=q
},
['phosphor-coffee-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=q
},
['phosphor-coin-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=q
},
['phosphor-coin-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=q
},
['phosphor-coins-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=q
},
['phosphor-columns-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=q
},
['phosphor-columns-plus-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=q
},
['phosphor-columns-plus-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=q
},
['phosphor-columns-plus-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=q
},
['phosphor-columns-plus-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=q
},
['phosphor-columns-plus-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=q
},
['phosphor-columns-plus-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=q
},
['phosphor-columns-plus-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=q
},
['phosphor-columns-plus-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_832'],
Image=q
},
['phosphor-columns-plus-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=q
},
['phosphor-columns-plus-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_832'],
Image=q
},
['phosphor-columns-plus-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=q
},
['phosphor-columns-plus-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_832'],
Image=q
},
['phosphor-command-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=q
},
['phosphor-compass-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=q
},
['phosphor-compass-rose-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=q
},
['phosphor-compass-tool-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=q
},
['phosphor-computer-tower-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=q
},
['phosphor-confetti-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=q
},
['phosphor-contactless-payment-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=r
},
['phosphor-control-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=r
},
['phosphor-cookie-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=r
},
['phosphor-cooking-pot-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=r
},
['phosphor-copy-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=r
},
['phosphor-copy-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=r
},
['phosphor-copy-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=r
},
['phosphor-copy-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=r
},
['phosphor-copy-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=r
},
['phosphor-copy-simple-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=r
},
['phosphor-copy-simple-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=r
},
['phosphor-copy-simple-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=r
},
['phosphor-copy-simple-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=r
},
['phosphor-copy-simple']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=r
},
['phosphor-copy-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=r
},
['phosphor-copy']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=r
},
['phosphor-copyleft-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=r
},
['phosphor-copyleft-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=r
},
['phosphor-copyleft-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=r
},
['phosphor-copyleft-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=r
},
['phosphor-copyleft-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=r
},
['phosphor-copyleft']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=r
},
['phosphor-copyright-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=r
},
['phosphor-copyright-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=r
},
['phosphor-copyright-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=r
},
['phosphor-copyright-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=r
},
['phosphor-copyright-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=r
},
['phosphor-copyright']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=r
},
['phosphor-corners-in-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=r
},
['phosphor-corners-in-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=r
},
['phosphor-corners-in-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=r
},
['phosphor-corners-in-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=r
},
['phosphor-corners-in-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=r
},
['phosphor-corners-in']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=r
},
['phosphor-corners-out-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=r
},
['phosphor-corners-out-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=r
},
['phosphor-corners-out-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=r
},
['phosphor-corners-out-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=r
},
['phosphor-corners-out-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=r
},
['phosphor-corners-out']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=r
},
['phosphor-couch-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=r
},
['phosphor-court-basketball-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=r
},
['phosphor-cow-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=r
},
['phosphor-cowboy-hat-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=r
},
['phosphor-cpu-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=r
},
['phosphor-cpu-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=r
},
['phosphor-cpu-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=r
},
['phosphor-cpu-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=r
},
['phosphor-cpu-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=r
},
['phosphor-cpu']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=r
},
['phosphor-crane-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=r
},
['phosphor-crane-tower-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_384'],
Image=r
},
['phosphor-credit-card-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=r
},
['phosphor-cricket-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=r
},
['phosphor-crop-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=r
},
['phosphor-cross-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=r
},
['phosphor-crosshair-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=r
},
['phosphor-crosshair-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=r
},
['phosphor-crown-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=r
},
['phosphor-crown-cross-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=r
},
['phosphor-crown-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=r
},
['phosphor-cube-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=r
},
['phosphor-cube-focus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_640'],
Image=r
},
['phosphor-cube-transparent-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=r
},
['phosphor-currency-btc-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=r
},
['phosphor-currency-circle-dollar-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=r
},
['phosphor-currency-circle-dollar-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_704'],
Image=r
},
['phosphor-currency-circle-dollar-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=r
},
['phosphor-currency-circle-dollar-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=r
},
['phosphor-currency-circle-dollar-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=r
},
['phosphor-currency-circle-dollar']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_704'],
Image=r
},
['phosphor-currency-cny-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=r
},
['phosphor-currency-dollar-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=r
},
['phosphor-currency-dollar-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=r
},
['phosphor-currency-eth-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=r
},
['phosphor-currency-eur-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=r
},
['phosphor-currency-gbp-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=r
},
['phosphor-currency-inr-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=r
},
['phosphor-currency-jpy-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=r
},
['phosphor-currency-krw-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=r
},
['phosphor-currency-kzt-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=r
},
['phosphor-currency-ngn-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=r
},
['phosphor-currency-rub-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=r
},
['phosphor-cursor-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=s
},
['phosphor-cursor-click-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=s
},
['phosphor-cursor-text-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=s
},
['phosphor-cursor-text-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=s
},
['phosphor-cursor-text-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=s
},
['phosphor-cursor-text-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=s
},
['phosphor-cursor-text-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=s
},
['phosphor-cursor-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=s
},
['phosphor-cylinder-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=s
},
['phosphor-database-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=s
},
['phosphor-database-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=s
},
['phosphor-database-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=s
},
['phosphor-database-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=s
},
['phosphor-database-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=s
},
['phosphor-database']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=s
},
['phosphor-desk-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=s
},
['phosphor-desktop-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=s
},
['phosphor-desktop-tower-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=s
},
['phosphor-detective-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=s
},
['phosphor-dev-to-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=s
},
['phosphor-device-mobile-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=s
},
['phosphor-device-mobile-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=s
},
['phosphor-device-mobile-speaker-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=s
},
['phosphor-device-rotate-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=s
},
['phosphor-device-rotate-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=s
},
['phosphor-device-rotate-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=s
},
['phosphor-device-rotate-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=s
},
['phosphor-device-rotate-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=s
},
['phosphor-device-rotate']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_320'],
Image=s
},
['phosphor-device-tablet-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=s
},
['phosphor-device-tablet-speaker-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=s
},
['phosphor-devices-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=s
},
['phosphor-diamond-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=s
},
['phosphor-diamonds-four-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=s
},
['phosphor-dice-five-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=s
},
['phosphor-dice-four-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=s
},
['phosphor-dice-one-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=s
},
['phosphor-dice-six-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=s
},
['phosphor-dice-six-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=s
},
['phosphor-dice-six-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=s
},
['phosphor-dice-six-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_576'],
Image=s
},
['phosphor-dice-six-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=s
},
['phosphor-dice-six']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=s
},
['phosphor-dice-three-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=s
},
['phosphor-dice-two-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=s
},
['phosphor-disc-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=s
},
['phosphor-disco-ball-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=s
},
['phosphor-discord-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=s
},
['phosphor-discord-logo-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=s
},
['phosphor-discord-logo-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=s
},
['phosphor-discord-logo-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_704'],
Image=s
},
['phosphor-discord-logo-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=s
},
['phosphor-discord-logo']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_704'],
Image=s
},
['phosphor-divide-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=s
},
['phosphor-dna-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=s
},
['phosphor-dog-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=s
},
['phosphor-door-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=s
},
['phosphor-door-open-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=s
},
['phosphor-dot-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=s
},
['phosphor-dot-outline-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=s
},
['phosphor-dots-nine-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=s
},
['phosphor-dots-six-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=s
},
['phosphor-dots-six-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_896'],
Image=s
},
['phosphor-dots-six-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=s
},
['phosphor-dots-six-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=s
},
['phosphor-dots-six-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=s
},
['phosphor-dots-six-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=s
},
['phosphor-dots-six-vertical-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=s
},
['phosphor-dots-six-vertical-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=s
},
['phosphor-dots-six-vertical-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=s
},
['phosphor-dots-six-vertical-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_960'],
Image=s
},
['phosphor-dots-six-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=s
},
['phosphor-dots-six']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=s
},
['phosphor-dots-three-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=s
},
['phosphor-dots-three-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=s
},
['phosphor-dots-three-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=s
},
['phosphor-dots-three-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=s
},
['phosphor-dots-three-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=s
},
['phosphor-dots-three-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=s
},
['phosphor-dots-three-circle-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=s
},
['phosphor-dots-three-circle-vertical-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=s
},
['phosphor-dots-three-circle-vertical-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=s
},
['phosphor-dots-three-circle-vertical-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_960'],
Image=s
},
['phosphor-dots-three-circle-vertical-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=s
},
['phosphor-dots-three-circle-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=s
},
['phosphor-dots-three-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=t
},
['phosphor-dots-three-outline-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=t
},
['phosphor-dots-three-outline-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=t
},
['phosphor-dots-three-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=t
},
['phosphor-download-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=t
},
['phosphor-download-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=t
},
['phosphor-dress-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=t
},
['phosphor-dresser-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=t
},
['phosphor-dribbble-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=t
},
['phosphor-drone-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=t
},
['phosphor-drop-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=t
},
['phosphor-drop-half-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=t
},
['phosphor-drop-half-bottom-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=t
},
['phosphor-drop-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=t
},
['phosphor-drop-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=t
},
['phosphor-dropbox-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=t
},
['phosphor-dropbox-logo-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=t
},
['phosphor-dropbox-logo-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=t
},
['phosphor-dropbox-logo-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_320'],
Image=t
},
['phosphor-dropbox-logo-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=t
},
['phosphor-dropbox-logo']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=t
},
['phosphor-ear-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=t
},
['phosphor-ear-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=t
},
['phosphor-egg-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=t
},
['phosphor-egg-crack-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=t
},
['phosphor-eject-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=t
},
['phosphor-eject-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=t
},
['phosphor-elevator-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=t
},
['phosphor-empty-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=t
},
['phosphor-engine-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=t
},
['phosphor-envelope-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=t
},
['phosphor-envelope-open-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=t
},
['phosphor-envelope-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=t
},
['phosphor-envelope-simple-open-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=t
},
['phosphor-equalizer-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=t
},
['phosphor-equals-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=t
},
['phosphor-eraser-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=t
},
['phosphor-escalator-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=t
},
['phosphor-escalator-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=t
},
['phosphor-exam-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=t
},
['phosphor-exam-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=t
},
['phosphor-exam-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=t
},
['phosphor-exam-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=t
},
['phosphor-exam-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=t
},
['phosphor-exam']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=t
},
['phosphor-exclamation-mark-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=t
},
['phosphor-exclamation-mark-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=t
},
['phosphor-exclamation-mark-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=t
},
['phosphor-exclamation-mark-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=t
},
['phosphor-exclamation-mark-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=t
},
['phosphor-exclamation-mark']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_832'],
Image=t
},
['phosphor-exclude-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=t
},
['phosphor-exclude-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_832'],
Image=t
},
['phosphor-exclude-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=t
},
['phosphor-exclude-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_832'],
Image=t
},
['phosphor-exclude-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=t
},
['phosphor-exclude-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=t
},
['phosphor-exclude-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=t
},
['phosphor-exclude-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=t
},
['phosphor-exclude-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=t
},
['phosphor-exclude-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_896'],
Image=t
},
['phosphor-exclude-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=t
},
['phosphor-exclude']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_896'],
Image=t
},
['phosphor-export-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=t
},
['phosphor-export-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_896'],
Image=t
},
['phosphor-export-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=t
},
['phosphor-export-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_896'],
Image=t
},
['phosphor-export-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=t
},
['phosphor-export']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_896'],
Image=t
},
['phosphor-eye-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=t
},
['phosphor-eye-closed-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=t
},
['phosphor-eye-closed-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=t
},
['phosphor-eye-closed-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=t
},
['phosphor-eye-closed-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=t
},
['phosphor-eye-closed-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=t
},
['phosphor-eye-closed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=t
},
['phosphor-eye-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_960'],
Image=t
},
['phosphor-eye-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=t
},
['phosphor-eye-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=t
},
['phosphor-eye-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=t
},
['phosphor-eye-slash-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=t
},
['phosphor-eye-slash-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=t
},
['phosphor-eye-slash-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=t
},
['phosphor-eye-slash-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=t
},
['phosphor-eye-slash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=t
},
['phosphor-eye-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=t
},
['phosphor-eye']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=t
},
['phosphor-eyedropper-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=t
},
['phosphor-eyedropper-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_960'],
Image=t
},
['phosphor-eyedropper-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=t
},
['phosphor-eyedropper-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=t
},
['phosphor-eyedropper-sample-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=u
},
['phosphor-eyedropper-sample-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=u
},
['phosphor-eyedropper-sample-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=u
},
['phosphor-eyedropper-sample-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=u
},
['phosphor-eyedropper-sample-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=u
},
['phosphor-eyedropper-sample']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=u
},
['phosphor-eyedropper-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=u
},
['phosphor-eyedropper']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=u
},
['phosphor-eyeglasses-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=u
},
['phosphor-eyeglasses-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=u
},
['phosphor-eyeglasses-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=u
},
['phosphor-eyeglasses-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=u
},
['phosphor-eyeglasses-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=u
},
['phosphor-eyeglasses']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=u
},
['phosphor-eyes-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=u
},
['phosphor-eyes-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=u
},
['phosphor-eyes-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=u
},
['phosphor-eyes-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=u
},
['phosphor-eyes-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=u
},
['phosphor-eyes']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=u
},
['phosphor-face-mask-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=u
},
['phosphor-facebook-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=u
},
['phosphor-factory-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=u
},
['phosphor-faders-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=u
},
['phosphor-faders-horizontal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=u
},
['phosphor-fallout-shelter-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=u
},
['phosphor-fan-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=u
},
['phosphor-farm-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=u
},
['phosphor-fast-forward-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=u
},
['phosphor-fast-forward-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=u
},
['phosphor-fast-forward-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=u
},
['phosphor-fast-forward-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=u
},
['phosphor-fast-forward-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=u
},
['phosphor-fast-forward-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=u
},
['phosphor-fast-forward-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=u
},
['phosphor-feather-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=u
},
['phosphor-fediverse-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=u
},
['phosphor-figma-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=u
},
['phosphor-file-archive-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=u
},
['phosphor-file-arrow-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=u
},
['phosphor-file-arrow-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_384'],
Image=u
},
['phosphor-file-arrow-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=u
},
['phosphor-file-arrow-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_384'],
Image=u
},
['phosphor-file-arrow-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=u
},
['phosphor-file-arrow-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=u
},
['phosphor-file-arrow-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=u
},
['phosphor-file-arrow-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_384'],
Image=u
},
['phosphor-file-arrow-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=u
},
['phosphor-file-arrow-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=u
},
['phosphor-file-arrow-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=u
},
['phosphor-file-arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=u
},
['phosphor-file-audio-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=u
},
['phosphor-file-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=u
},
['phosphor-file-c-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_448'],
Image=u
},
['phosphor-file-c-sharp-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_448'],
Image=u
},
['phosphor-file-cloud-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_512'],
Image=u
},
['phosphor-file-code-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=u
},
['phosphor-file-cpp-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=u
},
['phosphor-file-css-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=u
},
['phosphor-file-csv-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_576'],
Image=u
},
['phosphor-file-dashed-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_640'],
Image=u
},
['phosphor-file-doc-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=u
},
['phosphor-file-html-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=u
},
['phosphor-file-image-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=u
},
['phosphor-file-ini-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=u
},
['phosphor-file-jpg-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=u
},
['phosphor-file-js-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=u
},
['phosphor-file-jsx-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=u
},
['phosphor-file-jsx-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=u
},
['phosphor-file-jsx-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=u
},
['phosphor-file-jsx-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=u
},
['phosphor-file-jsx-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=u
},
['phosphor-file-jsx']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=u
},
['phosphor-file-lock-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=u
},
['phosphor-file-lock-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_832'],
Image=u
},
['phosphor-file-lock-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=u
},
['phosphor-file-lock-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_832'],
Image=u
},
['phosphor-file-lock-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=u
},
['phosphor-file-lock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=u
},
['phosphor-file-magnifying-glass-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=u
},
['phosphor-file-md-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=u
},
['phosphor-file-minus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=u
},
['phosphor-file-minus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=u
},
['phosphor-file-minus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=u
},
['phosphor-file-minus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=u
},
['phosphor-file-minus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=u
},
['phosphor-file-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=u
},
['phosphor-file-pdf-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=u
},
['phosphor-file-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=u
},
['phosphor-file-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=u
},
['phosphor-file-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=u
},
['phosphor-file-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=u
},
['phosphor-file-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=u
},
['phosphor-file-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=u
},
['phosphor-file-png-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=u
},
['phosphor-file-ppt-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=v
},
['phosphor-file-py-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=v
},
['phosphor-file-rs-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=v
},
['phosphor-file-sql-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=v
},
['phosphor-file-svg-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=v
},
['phosphor-file-text-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=v
},
['phosphor-file-text-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=v
},
['phosphor-file-text-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=v
},
['phosphor-file-text-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=v
},
['phosphor-file-text-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=v
},
['phosphor-file-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=v
},
['phosphor-file-ts-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=v
},
['phosphor-file-tsx-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=v
},
['phosphor-file-tsx-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=v
},
['phosphor-file-tsx-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=v
},
['phosphor-file-tsx-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=v
},
['phosphor-file-tsx-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=v
},
['phosphor-file-tsx']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=v
},
['phosphor-file-txt-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=v
},
['phosphor-file-txt-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=v
},
['phosphor-file-txt-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=v
},
['phosphor-file-txt-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=v
},
['phosphor-file-txt-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=v
},
['phosphor-file-txt']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=v
},
['phosphor-file-vue-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=v
},
['phosphor-file-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=v
},
['phosphor-file-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=v
},
['phosphor-file-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=v
},
['phosphor-file-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=v
},
['phosphor-file-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=v
},
['phosphor-file-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=v
},
['phosphor-file-xls-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_256'],
Image=v
},
['phosphor-file-xls-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=v
},
['phosphor-file-xls-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=v
},
['phosphor-file-xls-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=v
},
['phosphor-file-xls-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=v
},
['phosphor-file-xls']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=v
},
['phosphor-file-zip-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=v
},
['phosphor-files-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=v
},
['phosphor-film-reel-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=v
},
['phosphor-film-script-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=v
},
['phosphor-film-slate-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=v
},
['phosphor-film-strip-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=v
},
['phosphor-fingerprint-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=v
},
['phosphor-fingerprint-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=v
},
['phosphor-finn-the-human-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=v
},
['phosphor-fire-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=v
},
['phosphor-fire-extinguisher-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=v
},
['phosphor-fire-extinguisher-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=v
},
['phosphor-fire-extinguisher-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=v
},
['phosphor-fire-extinguisher-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=v
},
['phosphor-fire-extinguisher-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=v
},
['phosphor-fire-extinguisher']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_512'],
Image=v
},
['phosphor-fire-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=v
},
['phosphor-fire-truck-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=v
},
['phosphor-first-aid-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=v
},
['phosphor-first-aid-kit-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_640'],
Image=v
},
['phosphor-fish-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=v
},
['phosphor-fish-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=v
},
['phosphor-flag-banner-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=v
},
['phosphor-flag-banner-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=v
},
['phosphor-flag-banner-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=v
},
['phosphor-flag-banner-fold-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_704'],
Image=v
},
['phosphor-flag-banner-fold-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=v
},
['phosphor-flag-banner-fold-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=v
},
['phosphor-flag-banner-fold-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=v
},
['phosphor-flag-banner-fold-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=v
},
['phosphor-flag-banner-fold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=v
},
['phosphor-flag-banner-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=v
},
['phosphor-flag-banner-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=v
},
['phosphor-flag-banner']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=v
},
['phosphor-flag-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=v
},
['phosphor-flag-checkered-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=v
},
['phosphor-flag-checkered-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=v
},
['phosphor-flag-checkered-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=v
},
['phosphor-flag-checkered-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=v
},
['phosphor-flag-checkered-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=v
},
['phosphor-flag-checkered']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=v
},
['phosphor-flag-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=v
},
['phosphor-flag-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=v
},
['phosphor-flag-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=v
},
['phosphor-flag-pennant-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=v
},
['phosphor-flag-pennant-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=v
},
['phosphor-flag-pennant-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=v
},
['phosphor-flag-pennant-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=v
},
['phosphor-flag-pennant-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=v
},
['phosphor-flag-pennant']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=v
},
['phosphor-flag-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=v
},
['phosphor-flag']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=v
},
['phosphor-flame-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=v
},
['phosphor-flashlight-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=v
},
['phosphor-flask-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=v
},
['phosphor-flip-horizontal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=v
},
['phosphor-flip-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=v
},
['phosphor-floppy-disk-back-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=v
},
['phosphor-floppy-disk-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=v
},
['phosphor-flow-arrow-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=w
},
['phosphor-flow-arrow-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=w
},
['phosphor-flow-arrow-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=w
},
['phosphor-flow-arrow-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=w
},
['phosphor-flow-arrow-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=w
},
['phosphor-flow-arrow']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=w
},
['phosphor-flower-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=w
},
['phosphor-flower-lotus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=w
},
['phosphor-flower-tulip-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=w
},
['phosphor-flying-saucer-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=w
},
['phosphor-folder-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=w
},
['phosphor-folder-dashed-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=w
},
['phosphor-folder-lock-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=w
},
['phosphor-folder-lock-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=w
},
['phosphor-folder-lock-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=w
},
['phosphor-folder-lock-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=w
},
['phosphor-folder-lock-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=w
},
['phosphor-folder-lock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=w
},
['phosphor-folder-minus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=w
},
['phosphor-folder-minus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=w
},
['phosphor-folder-minus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=w
},
['phosphor-folder-minus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=w
},
['phosphor-folder-minus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=w
},
['phosphor-folder-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=w
},
['phosphor-folder-open-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=w
},
['phosphor-folder-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=w
},
['phosphor-folder-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=w
},
['phosphor-folder-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=w
},
['phosphor-folder-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=w
},
['phosphor-folder-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=w
},
['phosphor-folder-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=w
},
['phosphor-folder-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=w
},
['phosphor-folder-simple-dashed-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_256'],
Image=w
},
['phosphor-folder-simple-lock-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=w
},
['phosphor-folder-simple-lock-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_256'],
Image=w
},
['phosphor-folder-simple-lock-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=w
},
['phosphor-folder-simple-lock-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=w
},
['phosphor-folder-simple-lock-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=w
},
['phosphor-folder-simple-lock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=w
},
['phosphor-folder-simple-minus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=w
},
['phosphor-folder-simple-minus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=w
},
['phosphor-folder-simple-minus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=w
},
['phosphor-folder-simple-minus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_320'],
Image=w
},
['phosphor-folder-simple-minus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=w
},
['phosphor-folder-simple-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=w
},
['phosphor-folder-simple-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=w
},
['phosphor-folder-simple-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=w
},
['phosphor-folder-simple-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=w
},
['phosphor-folder-simple-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=w
},
['phosphor-folder-simple-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=w
},
['phosphor-folder-simple-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=w
},
['phosphor-folder-simple-star-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=w
},
['phosphor-folder-simple-star-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_320'],
Image=w
},
['phosphor-folder-simple-star-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=w
},
['phosphor-folder-simple-star-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=w
},
['phosphor-folder-simple-star-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=w
},
['phosphor-folder-simple-star']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_384'],
Image=w
},
['phosphor-folder-simple-user-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_384'],
Image=w
},
['phosphor-folder-simple-user-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=w
},
['phosphor-folder-simple-user-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_384'],
Image=w
},
['phosphor-folder-simple-user-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=w
},
['phosphor-folder-simple-user-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_384'],
Image=w
},
['phosphor-folder-simple-user']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=w
},
['phosphor-folder-star-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=w
},
['phosphor-folder-star-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_384'],
Image=w
},
['phosphor-folder-star-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=w
},
['phosphor-folder-star-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=w
},
['phosphor-folder-star-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=w
},
['phosphor-folder-star']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_384'],
Image=w
},
['phosphor-folder-user-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=w
},
['phosphor-folder-user-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=w
},
['phosphor-folder-user-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=w
},
['phosphor-folder-user-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=w
},
['phosphor-folder-user-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_448'],
Image=w
},
['phosphor-folder-user']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=w
},
['phosphor-folders-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=w
},
['phosphor-football-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=w
},
['phosphor-football-helmet-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=w
},
['phosphor-footprints-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=w
},
['phosphor-fork-knife-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=w
},
['phosphor-four-k-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=w
},
['phosphor-frame-corners-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=w
},
['phosphor-frame-corners-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_576'],
Image=w
},
['phosphor-frame-corners-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=w
},
['phosphor-frame-corners-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_576'],
Image=w
},
['phosphor-frame-corners-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=w
},
['phosphor-frame-corners']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_640'],
Image=w
},
['phosphor-framer-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=w
},
['phosphor-function-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=w
},
['phosphor-funnel-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=w
},
['phosphor-funnel-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=w
},
['phosphor-funnel-simple-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_704'],
Image=w
},
['phosphor-funnel-simple-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=w
},
['phosphor-funnel-simple-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=w
},
['phosphor-funnel-simple-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=w
},
['phosphor-funnel-simple-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_704'],
Image=w
},
['phosphor-funnel-simple-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=w
},
['phosphor-funnel-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=w
},
['phosphor-funnel-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=w
},
['phosphor-funnel-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=w
},
['phosphor-funnel-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=w
},
['phosphor-funnel-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=w
},
['phosphor-funnel-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=w
},
['phosphor-game-controller-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=w
},
['phosphor-garage-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=w
},
['phosphor-gas-can-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=w
},
['phosphor-gas-pump-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=w
},
['phosphor-gauge-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=w
},
['phosphor-gavel-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=w
},
['phosphor-gear-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=w
},
['phosphor-gear-fine-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=w
},
['phosphor-gear-six-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=w
},
['phosphor-gear-six-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=w
},
['phosphor-gear-six-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=w
},
['phosphor-gear-six-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=w
},
['phosphor-gear-six-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=w
},
['phosphor-gear-six']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=w
},
['phosphor-gender-female-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=w
},
['phosphor-gender-intersex-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=x
},
['phosphor-gender-intersex-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=x
},
['phosphor-gender-intersex-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=x
},
['phosphor-gender-intersex-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=x
},
['phosphor-gender-intersex-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=x
},
['phosphor-gender-intersex']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=x
},
['phosphor-gender-male-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=x
},
['phosphor-gender-neuter-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=x
},
['phosphor-gender-nonbinary-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=x
},
['phosphor-gender-transgender-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=x
},
['phosphor-ghost-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=x
},
['phosphor-gif-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=x
},
['phosphor-gift-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=x
},
['phosphor-git-branch-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=x
},
['phosphor-git-commit-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=x
},
['phosphor-git-diff-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=x
},
['phosphor-git-fork-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=x
},
['phosphor-git-merge-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=x
},
['phosphor-git-pull-request-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=x
},
['phosphor-github-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=x
},
['phosphor-github-logo-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=x
},
['phosphor-github-logo-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=x
},
['phosphor-github-logo-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=x
},
['phosphor-github-logo-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=x
},
['phosphor-github-logo']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=x
},
['phosphor-gitlab-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=x
},
['phosphor-gitlab-logo-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=x
},
['phosphor-globe-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=x
},
['phosphor-globe-hemisphere-east-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_384'],
Image=x
},
['phosphor-globe-hemisphere-west-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=x
},
['phosphor-globe-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=x
},
['phosphor-globe-simple-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_448'],
Image=x
},
['phosphor-globe-simple-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=x
},
['phosphor-globe-simple-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_448'],
Image=x
},
['phosphor-globe-simple-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=x
},
['phosphor-globe-simple-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=x
},
['phosphor-globe-simple-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=x
},
['phosphor-globe-stand-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=x
},
['phosphor-globe-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=x
},
['phosphor-globe-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=x
},
['phosphor-globe-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=x
},
['phosphor-globe-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=x
},
['phosphor-globe-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_512'],
Image=x
},
['phosphor-globe-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=x
},
['phosphor-goggles-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=x
},
['phosphor-golf-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=x
},
['phosphor-goodreads-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=x
},
['phosphor-google-cardboard-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=x
},
['phosphor-google-chrome-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=x
},
['phosphor-google-drive-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=x
},
['phosphor-google-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=x
},
['phosphor-google-photos-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=x
},
['phosphor-google-podcasts-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=x
},
['phosphor-gps-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=x
},
['phosphor-gps-fix-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=x
},
['phosphor-gps-fix-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=x
},
['phosphor-gps-fix-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=x
},
['phosphor-gps-fix-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=x
},
['phosphor-gps-fix-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=x
},
['phosphor-gps-fix']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=x
},
['phosphor-gps-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=x
},
['phosphor-gradient-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=x
},
['phosphor-graduation-cap-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=x
},
['phosphor-grains-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=x
},
['phosphor-grains-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=x
},
['phosphor-graph-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=x
},
['phosphor-graphics-card-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=x
},
['phosphor-greater-than-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=y
},
['phosphor-greater-than-or-equal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=y
},
['phosphor-grid-four-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=y
},
['phosphor-grid-four-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=y
},
['phosphor-grid-four-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=y
},
['phosphor-grid-four-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=y
},
['phosphor-grid-four-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=y
},
['phosphor-grid-four']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=y
},
['phosphor-grid-nine-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=y
},
['phosphor-grid-nine-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=y
},
['phosphor-grid-nine-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=y
},
['phosphor-grid-nine-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=y
},
['phosphor-grid-nine-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=y
},
['phosphor-grid-nine']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=y
},
['phosphor-guitar-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=y
},
['phosphor-hair-dryer-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=y
},
['phosphor-hamburger-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=y
},
['phosphor-hammer-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=y
},
['phosphor-hand-arrow-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=y
},
['phosphor-hand-arrow-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=y
},
['phosphor-hand-arrow-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=y
},
['phosphor-hand-arrow-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=y
},
['phosphor-hand-arrow-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=y
},
['phosphor-hand-arrow-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=y
},
['phosphor-hand-arrow-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=y
},
['phosphor-hand-arrow-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=y
},
['phosphor-hand-arrow-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=y
},
['phosphor-hand-arrow-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=y
},
['phosphor-hand-arrow-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=y
},
['phosphor-hand-arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=y
},
['phosphor-hand-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=y
},
['phosphor-hand-coins-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_256'],
Image=y
},
['phosphor-hand-deposit-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=y
},
['phosphor-hand-eye-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=y
},
['phosphor-hand-eye-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=y
},
['phosphor-hand-eye-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=y
},
['phosphor-hand-eye-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=y
},
['phosphor-hand-eye-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=y
},
['phosphor-hand-eye']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_320'],
Image=y
},
['phosphor-hand-fist-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=y
},
['phosphor-hand-grabbing-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=y
},
['phosphor-hand-heart-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_384'],
Image=y
},
['phosphor-hand-heart-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=y
},
['phosphor-hand-heart-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_384'],
Image=y
},
['phosphor-hand-heart-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=y
},
['phosphor-hand-heart-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_384'],
Image=y
},
['phosphor-hand-heart']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=y
},
['phosphor-hand-palm-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=y
},
['phosphor-hand-peace-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=y
},
['phosphor-hand-pointing-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=y
},
['phosphor-hand-soap-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=y
},
['phosphor-hand-swipe-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=y
},
['phosphor-hand-swipe-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=y
},
['phosphor-hand-tap-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=y
},
['phosphor-hand-waving-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=y
},
['phosphor-hand-withdraw-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=y
},
['phosphor-handbag-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=y
},
['phosphor-handbag-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=y
},
['phosphor-hands-clapping-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=y
},
['phosphor-hands-praying-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=y
},
['phosphor-handshake-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=y
},
['phosphor-hard-drive-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=y
},
['phosphor-hard-drive-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=y
},
['phosphor-hard-drive-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=y
},
['phosphor-hard-drive-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=y
},
['phosphor-hard-drive-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=y
},
['phosphor-hard-drive']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=y
},
['phosphor-hard-drives-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=y
},
['phosphor-hard-drives-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=y
},
['phosphor-hard-drives-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=y
},
['phosphor-hard-drives-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=y
},
['phosphor-hard-drives-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=y
},
['phosphor-hard-drives']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=y
},
['phosphor-hard-hat-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=y
},
['phosphor-hash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=y
},
['phosphor-hash-straight-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=y
},
['phosphor-head-circuit-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=y
},
['phosphor-headlights-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=y
},
['phosphor-headphones-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=y
},
['phosphor-headset-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=y
},
['phosphor-heart-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=y
},
['phosphor-heart-break-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=y
},
['phosphor-heart-break-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=y
},
['phosphor-heart-break-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=y
},
['phosphor-heart-break-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=y
},
['phosphor-heart-break-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=y
},
['phosphor-heart-break']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=y
},
['phosphor-heart-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=y
},
['phosphor-heart-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=y
},
['phosphor-heart-half-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_960'],
Image=y
},
['phosphor-heart-half-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=y
},
['phosphor-heart-half-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=y
},
['phosphor-heart-half-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=z
},
['phosphor-heart-half-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=z
},
['phosphor-heart-half']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=z
},
['phosphor-heart-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=z
},
['phosphor-heart-straight-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=z
},
['phosphor-heart-straight-break-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=z
},
['phosphor-heart-straight-break-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=z
},
['phosphor-heart-straight-break-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=z
},
['phosphor-heart-straight-break-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=z
},
['phosphor-heart-straight-break-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=z
},
['phosphor-heart-straight-break']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=z
},
['phosphor-heart-straight-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=z
},
['phosphor-heart-straight-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=z
},
['phosphor-heart-straight-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=z
},
['phosphor-heart-straight-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=z
},
['phosphor-heart-straight']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=z
},
['phosphor-heart-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=z
},
['phosphor-heart']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=z
},
['phosphor-heartbeat-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=z
},
['phosphor-heartbeat-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=z
},
['phosphor-heartbeat-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=z
},
['phosphor-heartbeat-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=z
},
['phosphor-heartbeat-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=z
},
['phosphor-heartbeat']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=z
},
['phosphor-hexagon-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=z
},
['phosphor-hexagon-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=z
},
['phosphor-hexagon-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=z
},
['phosphor-hexagon-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=z
},
['phosphor-hexagon-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=z
},
['phosphor-hexagon']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=z
},
['phosphor-high-definition-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=z
},
['phosphor-high-heel-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=z
},
['phosphor-highlighter-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=z
},
['phosphor-highlighter-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=z
},
['phosphor-highlighter-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=z
},
['phosphor-highlighter-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=z
},
['phosphor-highlighter-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=z
},
['phosphor-highlighter-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=z
},
['phosphor-highlighter-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=z
},
['phosphor-hockey-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=z
},
['phosphor-hoodie-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=z
},
['phosphor-horse-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=z
},
['phosphor-hospital-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=z
},
['phosphor-hourglass-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=z
},
['phosphor-hourglass-high-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=z
},
['phosphor-hourglass-low-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=z
},
['phosphor-hourglass-medium-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=z
},
['phosphor-hourglass-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=z
},
['phosphor-hourglass-simple-high-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_384'],
Image=z
},
['phosphor-hourglass-simple-low-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=z
},
['phosphor-hourglass-simple-medium-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=z
},
['phosphor-house-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=z
},
['phosphor-house-line-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=z
},
['phosphor-house-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=z
},
['phosphor-hurricane-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=z
},
['phosphor-ice-cream-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=z
},
['phosphor-identification-badge-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=z
},
['phosphor-identification-card-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=z
},
['phosphor-image-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=z
},
['phosphor-image-broken-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=z
},
['phosphor-image-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=z
},
['phosphor-image-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=z
},
['phosphor-image-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=z
},
['phosphor-image-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_704'],
Image=z
},
['phosphor-image-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=z
},
['phosphor-image-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_704'],
Image=z
},
['phosphor-images-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=z
},
['phosphor-images-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=z
},
['phosphor-images-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=z
},
['phosphor-images-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=z
},
['phosphor-images-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=z
},
['phosphor-images-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=z
},
['phosphor-images-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=z
},
['phosphor-infinity-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=z
},
['phosphor-info-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=z
},
['phosphor-info-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=z
},
['phosphor-info-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=z
},
['phosphor-info-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=z
},
['phosphor-info-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=z
},
['phosphor-info']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=z
},
['phosphor-instagram-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=z
},
['phosphor-intersect-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=z
},
['phosphor-intersect-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=z
},
['phosphor-intersect-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=z
},
['phosphor-intersect-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=z
},
['phosphor-intersect-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=z
},
['phosphor-intersect-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=z
},
['phosphor-intersect-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_896'],
Image=z
},
['phosphor-intersect-three-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_896'],
Image=z
},
['phosphor-intersection-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=z
},
['phosphor-invoice-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=z
},
['phosphor-island-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=z
},
['phosphor-jar-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=z
},
['phosphor-jar-label-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=z
},
['phosphor-jeep-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=A
},
['phosphor-joystick-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=A
},
['phosphor-kanban-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=A
},
['phosphor-key-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=A
},
['phosphor-key-return-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=A
},
['phosphor-keyboard-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=A
},
['phosphor-keyhole-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=A
},
['phosphor-knife-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=A
},
['phosphor-ladder-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=A
},
['phosphor-ladder-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=A
},
['phosphor-lamp-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=A
},
['phosphor-lamp-pendant-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=A
},
['phosphor-laptop-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=A
},
['phosphor-lasso-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=A
},
['phosphor-lastfm-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=A
},
['phosphor-layout-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=A
},
['phosphor-leaf-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=A
},
['phosphor-lectern-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=A
},
['phosphor-lego-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=A
},
['phosphor-lego-smiley-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=A
},
['phosphor-less-than-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=A
},
['phosphor-less-than-or-equal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=A
},
['phosphor-letter-circle-h-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=A
},
['phosphor-letter-circle-h-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=A
},
['phosphor-letter-circle-h-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=A
},
['phosphor-letter-circle-h-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_512'],
Image=A
},
['phosphor-letter-circle-h-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=A
},
['phosphor-letter-circle-h']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_576'],
Image=A
},
['phosphor-letter-circle-p-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=A
},
['phosphor-letter-circle-p-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=A
},
['phosphor-letter-circle-p-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=A
},
['phosphor-letter-circle-p-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=A
},
['phosphor-letter-circle-p-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=A
},
['phosphor-letter-circle-p']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_576'],
Image=A
},
['phosphor-letter-circle-v-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=A
},
['phosphor-letter-circle-v-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=A
},
['phosphor-letter-circle-v-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=A
},
['phosphor-letter-circle-v-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_576'],
Image=A
},
['phosphor-letter-circle-v-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=A
},
['phosphor-letter-circle-v']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_576'],
Image=A
},
['phosphor-lifebuoy-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=A
},
['phosphor-lightbulb-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=A
},
['phosphor-lightbulb-filament-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=A
},
['phosphor-lighthouse-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=A
},
['phosphor-lightning-a-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=A
},
['phosphor-lightning-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=A
},
['phosphor-lightning-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=A
},
['phosphor-line-segment-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=A
},
['phosphor-line-segments-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=A
},
['phosphor-line-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=A
},
['phosphor-link-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=A
},
['phosphor-link-break-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_832'],
Image=A
},
['phosphor-link-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=A
},
['phosphor-link-simple-break-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_896'],
Image=A
},
['phosphor-link-simple-horizontal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=A
},
['phosphor-link-simple-horizontal-break-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=A
},
['phosphor-linkedin-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=A
},
['phosphor-linktree-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=B
},
['phosphor-linux-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=B
},
['phosphor-linux-logo-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=B
},
['phosphor-linux-logo-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=B
},
['phosphor-linux-logo-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=B
},
['phosphor-linux-logo-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=B
},
['phosphor-linux-logo']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=B
},
['phosphor-list-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=B
},
['phosphor-list-bullets-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=B
},
['phosphor-list-bullets-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=B
},
['phosphor-list-bullets-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=B
},
['phosphor-list-bullets-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=B
},
['phosphor-list-bullets-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=B
},
['phosphor-list-bullets']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=B
},
['phosphor-list-checks-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=B
},
['phosphor-list-checks-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=B
},
['phosphor-list-checks-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=B
},
['phosphor-list-checks-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=B
},
['phosphor-list-checks-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=B
},
['phosphor-list-checks']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=B
},
['phosphor-list-dashes-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=B
},
['phosphor-list-dashes-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=B
},
['phosphor-list-dashes-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=B
},
['phosphor-list-dashes-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=B
},
['phosphor-list-dashes-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=B
},
['phosphor-list-dashes']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=B
},
['phosphor-list-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=B
},
['phosphor-list-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=B
},
['phosphor-list-heart-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=B
},
['phosphor-list-heart-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=B
},
['phosphor-list-heart-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=B
},
['phosphor-list-heart-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=B
},
['phosphor-list-heart-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=B
},
['phosphor-list-heart']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=B
},
['phosphor-list-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=B
},
['phosphor-list-magnifying-glass-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=B
},
['phosphor-list-magnifying-glass-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=B
},
['phosphor-list-magnifying-glass-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=B
},
['phosphor-list-magnifying-glass-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=B
},
['phosphor-list-magnifying-glass-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=B
},
['phosphor-list-magnifying-glass']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=B
},
['phosphor-list-numbers-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=B
},
['phosphor-list-numbers-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=B
},
['phosphor-list-numbers-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=B
},
['phosphor-list-numbers-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=B
},
['phosphor-list-numbers-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=B
},
['phosphor-list-numbers']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=B
},
['phosphor-list-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=B
},
['phosphor-list-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=B
},
['phosphor-list-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=B
},
['phosphor-list-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=B
},
['phosphor-list-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=B
},
['phosphor-list-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=B
},
['phosphor-list-star-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=B
},
['phosphor-list-star-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=B
},
['phosphor-list-star-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=B
},
['phosphor-list-star-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_256'],
Image=B
},
['phosphor-list-star-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=B
},
['phosphor-list-star']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_256'],
Image=B
},
['phosphor-list-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=B
},
['phosphor-list']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=B
},
['phosphor-lock-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=B
},
['phosphor-lock-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=B
},
['phosphor-lock-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=B
},
['phosphor-lock-key-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=B
},
['phosphor-lock-key-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=B
},
['phosphor-lock-key-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_256'],
Image=B
},
['phosphor-lock-key-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=B
},
['phosphor-lock-key-open-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=B
},
['phosphor-lock-key-open-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=B
},
['phosphor-lock-key-open-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=B
},
['phosphor-lock-key-open-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=B
},
['phosphor-lock-key-open-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=B
},
['phosphor-lock-key-open']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=B
},
['phosphor-lock-key-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_320'],
Image=B
},
['phosphor-lock-key']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=B
},
['phosphor-lock-laminated-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=B
},
['phosphor-lock-laminated-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=B
},
['phosphor-lock-laminated-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=B
},
['phosphor-lock-laminated-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=B
},
['phosphor-lock-laminated-open-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=B
},
['phosphor-lock-laminated-open-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=B
},
['phosphor-lock-laminated-open-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=B
},
['phosphor-lock-laminated-open-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=B
},
['phosphor-lock-laminated-open-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_320'],
Image=B
},
['phosphor-lock-laminated-open']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=B
},
['phosphor-lock-laminated-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=B
},
['phosphor-lock-laminated']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=B
},
['phosphor-lock-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_384'],
Image=B
},
['phosphor-lock-open-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=B
},
['phosphor-lock-open-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_384'],
Image=B
},
['phosphor-lock-open-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=B
},
['phosphor-lock-open-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_384'],
Image=B
},
['phosphor-lock-open-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=B
},
['phosphor-lock-open']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_384'],
Image=B
},
['phosphor-lock-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=B
},
['phosphor-lock-simple-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_384'],
Image=B
},
['phosphor-lock-simple-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=B
},
['phosphor-lock-simple-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_384'],
Image=B
},
['phosphor-lock-simple-open-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=B
},
['phosphor-lock-simple-open-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=B
},
['phosphor-lock-simple-open-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=B
},
['phosphor-lock-simple-open-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_384'],
Image=B
},
['phosphor-lock-simple-open-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=B
},
['phosphor-lock-simple-open']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=B
},
['phosphor-lock-simple-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=B
},
['phosphor-lock-simple']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=B
},
['phosphor-lock-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=B
},
['phosphor-lock']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_448'],
Image=B
},
['phosphor-lockers-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=B
},
['phosphor-lockers-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_448'],
Image=B
},
['phosphor-lockers-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=B
},
['phosphor-lockers-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_448'],
Image=B
},
['phosphor-lockers-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=B
},
['phosphor-lockers']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_448'],
Image=B
},
['phosphor-log-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=B
},
['phosphor-magic-wand-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=B
},
['phosphor-magnet-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=B
},
['phosphor-magnet-straight-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=B
},
['phosphor-magnifying-glass-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=B
},
['phosphor-magnifying-glass-minus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=B
},
['phosphor-magnifying-glass-minus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=B
},
['phosphor-magnifying-glass-minus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=B
},
['phosphor-magnifying-glass-minus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_576'],
Image=B
},
['phosphor-magnifying-glass-minus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=B
},
['phosphor-magnifying-glass-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_576'],
Image=B
},
['phosphor-magnifying-glass-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=B
},
['phosphor-magnifying-glass-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_576'],
Image=B
},
['phosphor-magnifying-glass-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=B
},
['phosphor-magnifying-glass-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_640'],
Image=B
},
['phosphor-magnifying-glass-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=B
},
['phosphor-magnifying-glass-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_640'],
Image=B
},
['phosphor-mailbox-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=B
},
['phosphor-mailbox-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_640'],
Image=B
},
['phosphor-mailbox-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=B
},
['phosphor-mailbox-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=B
},
['phosphor-mailbox-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=B
},
['phosphor-mailbox']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=B
},
['phosphor-map-pin-area-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=B
},
['phosphor-map-pin-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=B
},
['phosphor-map-pin-line-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=B
},
['phosphor-map-pin-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=B
},
['phosphor-map-pin-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=B
},
['phosphor-map-pin-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=B
},
['phosphor-map-pin-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=B
},
['phosphor-map-pin-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=B
},
['phosphor-map-pin-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=B
},
['phosphor-map-pin-simple-area-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=B
},
['phosphor-map-pin-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=B
},
['phosphor-map-pin-simple-line-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=B
},
['phosphor-map-trifold-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=B
},
['phosphor-markdown-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=B
},
['phosphor-marker-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=B
},
['phosphor-marker-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_896'],
Image=B
},
['phosphor-marker-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=B
},
['phosphor-marker-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_896'],
Image=B
},
['phosphor-marker-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=B
},
['phosphor-marker-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_896'],
Image=B
},
['phosphor-martini-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=B
},
['phosphor-mask-happy-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=B
},
['phosphor-mask-sad-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=B
},
['phosphor-mastodon-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=B
},
['phosphor-math-operations-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=C
},
['phosphor-matrix-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=C
},
['phosphor-matrix-logo-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=C
},
['phosphor-matrix-logo-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=C
},
['phosphor-matrix-logo-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=C
},
['phosphor-matrix-logo-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=C
},
['phosphor-matrix-logo']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=C
},
['phosphor-medal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=C
},
['phosphor-medal-military-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=C
},
['phosphor-medium-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=C
},
['phosphor-megaphone-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=C
},
['phosphor-megaphone-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=C
},
['phosphor-member-of-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=C
},
['phosphor-memory-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=C
},
['phosphor-messenger-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=C
},
['phosphor-meta-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=C
},
['phosphor-meteor-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=C
},
['phosphor-metronome-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=C
},
['phosphor-minus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=C
},
['phosphor-minus-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_512'],
Image=C
},
['phosphor-minus-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=C
},
['phosphor-minus-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_512'],
Image=C
},
['phosphor-minus-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=C
},
['phosphor-minus-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_512'],
Image=C
},
['phosphor-minus-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=C
},
['phosphor-minus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=C
},
['phosphor-minus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=C
},
['phosphor-minus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=C
},
['phosphor-minus-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=C
},
['phosphor-minus-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_512'],
Image=C
},
['phosphor-minus-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=C
},
['phosphor-minus-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_576'],
Image=C
},
['phosphor-minus-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=C
},
['phosphor-minus-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=C
},
['phosphor-minus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=C
},
['phosphor-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=C
},
['phosphor-money-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=C
},
['phosphor-money-wavy-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_576'],
Image=C
},
['phosphor-monitor-arrow-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=C
},
['phosphor-monitor-arrow-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_640'],
Image=C
},
['phosphor-monitor-arrow-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=C
},
['phosphor-monitor-arrow-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_640'],
Image=C
},
['phosphor-monitor-arrow-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=C
},
['phosphor-monitor-arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_640'],
Image=C
},
['phosphor-monitor-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=C
},
['phosphor-monitor-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=C
},
['phosphor-monitor-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=C
},
['phosphor-monitor-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=C
},
['phosphor-monitor-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=C
},
['phosphor-monitor']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=C
},
['phosphor-moon-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=C
},
['phosphor-moon-stars-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=C
},
['phosphor-moon-stars-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=C
},
['phosphor-moon-stars-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=C
},
['phosphor-moon-stars-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_704'],
Image=C
},
['phosphor-moon-stars-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=C
},
['phosphor-moon-stars']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=C
},
['phosphor-moped-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=C
},
['phosphor-moped-front-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=C
},
['phosphor-mosque-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=C
},
['phosphor-motorcycle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=C
},
['phosphor-mountains-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=C
},
['phosphor-mouse-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=C
},
['phosphor-mouse-left-click-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_896'],
Image=C
},
['phosphor-mouse-middle-click-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=C
},
['phosphor-mouse-right-click-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=C
},
['phosphor-mouse-scroll-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=C
},
['phosphor-mouse-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=C
},
['phosphor-navigation-arrow-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=D
},
['phosphor-navigation-arrow-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=D
},
['phosphor-navigation-arrow-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=D
},
['phosphor-navigation-arrow-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=D
},
['phosphor-navigation-arrow-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=D
},
['phosphor-navigation-arrow']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=D
},
['phosphor-needle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=D
},
['phosphor-network-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=D
},
['phosphor-network-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=D
},
['phosphor-network-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=D
},
['phosphor-network-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=D
},
['phosphor-network-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=D
},
['phosphor-network-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=D
},
['phosphor-network-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_256'],
Image=D
},
['phosphor-network-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=D
},
['phosphor-newspaper-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=D
},
['phosphor-newspaper-clipping-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=D
},
['phosphor-newspaper-clipping-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=D
},
['phosphor-newspaper-clipping-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=D
},
['phosphor-newspaper-clipping-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=D
},
['phosphor-newspaper-clipping-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=D
},
['phosphor-newspaper-clipping']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=D
},
['phosphor-not-equals-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=D
},
['phosphor-not-member-of-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=D
},
['phosphor-not-subset-of-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=D
},
['phosphor-not-superset-of-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=D
},
['phosphor-notches-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=D
},
['phosphor-note-blank-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=D
},
['phosphor-note-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=D
},
['phosphor-note-pencil-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=D
},
['phosphor-notebook-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=D
},
['phosphor-notepad-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=D
},
['phosphor-notification-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=D
},
['phosphor-notion-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=D
},
['phosphor-nuclear-plant-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=D
},
['phosphor-number-circle-eight-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=D
},
['phosphor-number-circle-eight-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_576'],
Image=D
},
['phosphor-number-circle-eight-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=D
},
['phosphor-number-circle-eight-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_640'],
Image=D
},
['phosphor-number-circle-eight-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=D
},
['phosphor-number-circle-eight']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_640'],
Image=D
},
['phosphor-number-circle-five-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=D
},
['phosphor-number-circle-five-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_640'],
Image=D
},
['phosphor-number-circle-five-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=D
},
['phosphor-number-circle-five-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_640'],
Image=D
},
['phosphor-number-circle-five-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=D
},
['phosphor-number-circle-five']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=D
},
['phosphor-number-circle-four-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=D
},
['phosphor-number-circle-four-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=D
},
['phosphor-number-circle-four-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=D
},
['phosphor-number-circle-four-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_640'],
Image=D
},
['phosphor-number-circle-four-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=D
},
['phosphor-number-circle-four']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_640'],
Image=D
},
['phosphor-number-circle-nine-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=D
},
['phosphor-number-circle-nine-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_704'],
Image=D
},
['phosphor-number-circle-nine-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=D
},
['phosphor-number-circle-nine-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=D
},
['phosphor-number-circle-nine-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=D
},
['phosphor-number-circle-nine']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_704'],
Image=D
},
['phosphor-number-circle-one-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=D
},
['phosphor-number-circle-one-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_704'],
Image=D
},
['phosphor-number-circle-one-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=D
},
['phosphor-number-circle-one-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=D
},
['phosphor-number-circle-one-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=D
},
['phosphor-number-circle-one']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_704'],
Image=D
},
['phosphor-number-circle-seven-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=D
},
['phosphor-number-circle-seven-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=D
},
['phosphor-number-circle-seven-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=D
},
['phosphor-number-circle-seven-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=D
},
['phosphor-number-circle-seven-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=D
},
['phosphor-number-circle-seven']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=D
},
['phosphor-number-circle-six-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=D
},
['phosphor-number-circle-six-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=D
},
['phosphor-number-circle-six-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=D
},
['phosphor-number-circle-six-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=D
},
['phosphor-number-circle-six-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=D
},
['phosphor-number-circle-six']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=D
},
['phosphor-number-circle-three-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=D
},
['phosphor-number-circle-three-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=D
},
['phosphor-number-circle-three-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=D
},
['phosphor-number-circle-three-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=D
},
['phosphor-number-circle-three-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=D
},
['phosphor-number-circle-three']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=D
},
['phosphor-number-circle-two-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=D
},
['phosphor-number-circle-two-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=D
},
['phosphor-number-circle-two-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=D
},
['phosphor-number-circle-two-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=D
},
['phosphor-number-circle-two-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=D
},
['phosphor-number-circle-two']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=D
},
['phosphor-number-circle-zero-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=D
},
['phosphor-number-circle-zero-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=D
},
['phosphor-number-circle-zero-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=D
},
['phosphor-number-circle-zero-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_832'],
Image=D
},
['phosphor-number-circle-zero-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=D
},
['phosphor-number-circle-zero']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_832'],
Image=D
},
['phosphor-number-eight-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=D
},
['phosphor-number-five-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=D
},
['phosphor-number-four-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=D
},
['phosphor-number-nine-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=D
},
['phosphor-number-one-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=D
},
['phosphor-number-seven-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=D
},
['phosphor-number-six-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=D
},
['phosphor-number-six-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=D
},
['phosphor-number-six-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=E
},
['phosphor-number-six-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=E
},
['phosphor-number-six-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=E
},
['phosphor-number-six']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=E
},
['phosphor-number-square-eight-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=E
},
['phosphor-number-square-eight-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=E
},
['phosphor-number-square-eight-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=E
},
['phosphor-number-square-eight-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=E
},
['phosphor-number-square-eight-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=E
},
['phosphor-number-square-eight']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=E
},
['phosphor-number-square-five-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=E
},
['phosphor-number-square-five-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=E
},
['phosphor-number-square-five-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=E
},
['phosphor-number-square-five-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=E
},
['phosphor-number-square-five-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=E
},
['phosphor-number-square-five']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=E
},
['phosphor-number-square-four-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=E
},
['phosphor-number-square-four-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=E
},
['phosphor-number-square-four-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=E
},
['phosphor-number-square-four-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=E
},
['phosphor-number-square-four-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=E
},
['phosphor-number-square-four']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=E
},
['phosphor-number-square-nine-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=E
},
['phosphor-number-square-nine-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=E
},
['phosphor-number-square-nine-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=E
},
['phosphor-number-square-nine-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=E
},
['phosphor-number-square-nine-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=E
},
['phosphor-number-square-nine']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=E
},
['phosphor-number-square-one-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=E
},
['phosphor-number-square-one-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=E
},
['phosphor-number-square-one-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=E
},
['phosphor-number-square-one-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=E
},
['phosphor-number-square-one-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=E
},
['phosphor-number-square-one']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=E
},
['phosphor-number-square-seven-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=E
},
['phosphor-number-square-seven-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=E
},
['phosphor-number-square-seven-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=E
},
['phosphor-number-square-seven-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=E
},
['phosphor-number-square-seven-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=E
},
['phosphor-number-square-seven']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=E
},
['phosphor-number-square-six-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=E
},
['phosphor-number-square-six-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=E
},
['phosphor-number-square-six-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=E
},
['phosphor-number-square-six-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=E
},
['phosphor-number-square-six-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=E
},
['phosphor-number-square-six']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=E
},
['phosphor-number-square-three-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=E
},
['phosphor-number-square-three-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=E
},
['phosphor-number-square-three-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=E
},
['phosphor-number-square-three-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=E
},
['phosphor-number-square-three-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=E
},
['phosphor-number-square-three']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=E
},
['phosphor-number-square-two-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=E
},
['phosphor-number-square-two-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=E
},
['phosphor-number-square-two-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=E
},
['phosphor-number-square-two-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=E
},
['phosphor-number-square-two-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=E
},
['phosphor-number-square-two']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=E
},
['phosphor-number-square-zero-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=E
},
['phosphor-number-square-zero-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=E
},
['phosphor-number-square-zero-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=E
},
['phosphor-number-square-zero-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=E
},
['phosphor-number-square-zero-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=E
},
['phosphor-number-square-zero']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=E
},
['phosphor-number-three-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=E
},
['phosphor-number-two-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=E
},
['phosphor-number-zero-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=E
},
['phosphor-numpad-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=E
},
['phosphor-nut-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=E
},
['phosphor-ny-times-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=E
},
['phosphor-octagon-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=E
},
['phosphor-office-chair-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=E
},
['phosphor-onigiri-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=E
},
['phosphor-open-ai-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=E
},
['phosphor-option-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=E
},
['phosphor-orange-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=E
},
['phosphor-orange-slice-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=E
},
['phosphor-oven-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=E
},
['phosphor-package-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=E
},
['phosphor-paint-brush-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=E
},
['phosphor-paint-brush-broad-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_576'],
Image=E
},
['phosphor-paint-brush-household-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_640'],
Image=E
},
['phosphor-paint-bucket-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=E
},
['phosphor-paint-roller-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=E
},
['phosphor-palette-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=E
},
['phosphor-panorama-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=E
},
['phosphor-pants-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=E
},
['phosphor-paper-plane-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=E
},
['phosphor-paper-plane-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=E
},
['phosphor-paper-plane-tilt-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=E
},
['phosphor-paperclip-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=E
},
['phosphor-paperclip-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=E
},
['phosphor-paperclip-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=E
},
['phosphor-paperclip-horizontal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=E
},
['phosphor-paperclip-horizontal-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=E
},
['phosphor-paperclip-horizontal-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_896'],
Image=E
},
['phosphor-paperclip-horizontal-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=E
},
['phosphor-paperclip-horizontal-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_896'],
Image=E
},
['phosphor-paperclip-horizontal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=E
},
['phosphor-paperclip-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_896'],
Image=E
},
['phosphor-paperclip-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=E
},
['phosphor-paperclip']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_896'],
Image=E
},
['phosphor-parachute-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=E
},
['phosphor-paragraph-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=E
},
['phosphor-parallelogram-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=E
},
['phosphor-park-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=E
},
['phosphor-password-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=F
},
['phosphor-path-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=F
},
['phosphor-patreon-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=F
},
['phosphor-paw-print-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=F
},
['phosphor-paypal-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=F
},
['phosphor-peace-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=F
},
['phosphor-pen-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=F
},
['phosphor-pen-nib-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=F
},
['phosphor-pen-nib-straight-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=F
},
['phosphor-pencil-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=F
},
['phosphor-pencil-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_256'],
Image=F
},
['phosphor-pencil-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=F
},
['phosphor-pencil-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=F
},
['phosphor-pencil-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=F
},
['phosphor-pencil-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=F
},
['phosphor-pencil-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=F
},
['phosphor-pencil-line-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=F
},
['phosphor-pencil-ruler-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=F
},
['phosphor-pencil-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=F
},
['phosphor-pencil-simple-line-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=F
},
['phosphor-pencil-simple-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=F
},
['phosphor-pencil-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=F
},
['phosphor-pentagon-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=F
},
['phosphor-pentagram-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=F
},
['phosphor-pepper-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=F
},
['phosphor-percent-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=F
},
['phosphor-person-arms-spread-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=F
},
['phosphor-person-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=F
},
['phosphor-person-simple-bike-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=F
},
['phosphor-person-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=F
},
['phosphor-person-simple-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_576'],
Image=F
},
['phosphor-person-simple-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=F
},
['phosphor-person-simple-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_576'],
Image=F
},
['phosphor-person-simple-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=F
},
['phosphor-person-simple-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_576'],
Image=F
},
['phosphor-person-simple-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=F
},
['phosphor-person-simple-hike-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_640'],
Image=F
},
['phosphor-person-simple-run-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=F
},
['phosphor-person-simple-ski-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=F
},
['phosphor-person-simple-snowboard-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=F
},
['phosphor-person-simple-swim-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=F
},
['phosphor-person-simple-tai-chi-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=F
},
['phosphor-person-simple-throw-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=F
},
['phosphor-person-simple-walk-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=F
},
['phosphor-perspective-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=F
},
['phosphor-phone-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=F
},
['phosphor-phone-call-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=F
},
['phosphor-phone-disconnect-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_896'],
Image=F
},
['phosphor-phone-incoming-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=F
},
['phosphor-phone-list-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=F
},
['phosphor-phone-list-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=F
},
['phosphor-phone-list-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=F
},
['phosphor-phone-list-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=F
},
['phosphor-phone-list-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=F
},
['phosphor-phone-list']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=F
},
['phosphor-phone-outgoing-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=F
},
['phosphor-phone-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=G
},
['phosphor-phone-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=G
},
['phosphor-phone-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=G
},
['phosphor-phone-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=G
},
['phosphor-phone-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=G
},
['phosphor-phone-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=G
},
['phosphor-phone-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=G
},
['phosphor-phone-transfer-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=G
},
['phosphor-phone-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=G
},
['phosphor-phone-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=G
},
['phosphor-phone-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=G
},
['phosphor-phone-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=G
},
['phosphor-phone-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=G
},
['phosphor-phone-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=G
},
['phosphor-phosphor-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=G
},
['phosphor-pi-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=G
},
['phosphor-piano-keys-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=G
},
['phosphor-picnic-table-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=G
},
['phosphor-picture-in-picture-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=G
},
['phosphor-piggy-bank-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=G
},
['phosphor-pill-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=G
},
['phosphor-ping-pong-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=G
},
['phosphor-pint-glass-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=G
},
['phosphor-pinterest-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=G
},
['phosphor-pinwheel-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=G
},
['phosphor-pipe-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=G
},
['phosphor-pipe-wrench-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_384'],
Image=G
},
['phosphor-pix-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=G
},
['phosphor-pix-logo-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_384'],
Image=G
},
['phosphor-pix-logo-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=G
},
['phosphor-pix-logo-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=G
},
['phosphor-pix-logo-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=G
},
['phosphor-pix-logo']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=G
},
['phosphor-pizza-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=G
},
['phosphor-placeholder-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=G
},
['phosphor-planet-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=G
},
['phosphor-plant-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=G
},
['phosphor-plug-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=G
},
['phosphor-plug-charging-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_640'],
Image=G
},
['phosphor-plugs-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=G
},
['phosphor-plugs-connected-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_704'],
Image=G
},
['phosphor-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=G
},
['phosphor-plus-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=G
},
['phosphor-plus-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=G
},
['phosphor-plus-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=G
},
['phosphor-plus-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=G
},
['phosphor-plus-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=G
},
['phosphor-plus-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=G
},
['phosphor-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=G
},
['phosphor-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=G
},
['phosphor-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=G
},
['phosphor-plus-minus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=G
},
['phosphor-plus-minus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=G
},
['phosphor-plus-minus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=G
},
['phosphor-plus-minus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=G
},
['phosphor-plus-minus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=G
},
['phosphor-plus-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=G
},
['phosphor-plus-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=G
},
['phosphor-plus-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=G
},
['phosphor-plus-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=G
},
['phosphor-plus-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=G
},
['phosphor-plus-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=G
},
['phosphor-plus-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=G
},
['phosphor-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=G
},
['phosphor-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=G
},
['phosphor-poker-chip-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=G
},
['phosphor-police-car-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=G
},
['phosphor-polygon-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=G
},
['phosphor-popcorn-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=G
},
['phosphor-popsicle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=G
},
['phosphor-potted-plant-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=G
},
['phosphor-power-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=G
},
['phosphor-prescription-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=G
},
['phosphor-presentation-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=H
},
['phosphor-presentation-chart-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=H
},
['phosphor-printer-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=H
},
['phosphor-prohibit-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=H
},
['phosphor-prohibit-inset-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=H
},
['phosphor-projector-screen-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=H
},
['phosphor-projector-screen-chart-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=H
},
['phosphor-pulse-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=H
},
['phosphor-push-pin-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=H
},
['phosphor-push-pin-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=H
},
['phosphor-push-pin-simple-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=H
},
['phosphor-push-pin-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=H
},
['phosphor-puzzle-piece-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=H
},
['phosphor-qr-code-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=H
},
['phosphor-question-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=H
},
['phosphor-question-mark-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=H
},
['phosphor-queue-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=H
},
['phosphor-quotes-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=H
},
['phosphor-rabbit-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=H
},
['phosphor-racquet-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=H
},
['phosphor-radical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=H
},
['phosphor-radio-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=H
},
['phosphor-radio-button-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_512'],
Image=H
},
['phosphor-radioactive-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=H
},
['phosphor-rainbow-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=H
},
['phosphor-rainbow-cloud-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=H
},
['phosphor-ranking-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=H
},
['phosphor-read-cv-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=H
},
['phosphor-receipt-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=H
},
['phosphor-receipt-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_704'],
Image=H
},
['phosphor-receipt-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=H
},
['phosphor-receipt-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=H
},
['phosphor-receipt-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=H
},
['phosphor-receipt-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_704'],
Image=H
},
['phosphor-receipt-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=H
},
['phosphor-record-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=H
},
['phosphor-rectangle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=H
},
['phosphor-rectangle-dashed-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=H
},
['phosphor-recycle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=H
},
['phosphor-reddit-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=H
},
['phosphor-repeat-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=H
},
['phosphor-repeat-once-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=H
},
['phosphor-replit-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=H
},
['phosphor-resize-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=H
},
['phosphor-rewind-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=H
},
['phosphor-rewind-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=H
},
['phosphor-rewind-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=H
},
['phosphor-rewind-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_960'],
Image=H
},
['phosphor-rewind-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=H
},
['phosphor-rewind-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=H
},
['phosphor-rewind-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=H
},
['phosphor-road-horizon-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=H
},
['phosphor-robot-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=I
},
['phosphor-rocket-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=I
},
['phosphor-rocket-launch-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=I
},
['phosphor-rows-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=I
},
['phosphor-rows-plus-bottom-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=I
},
['phosphor-rows-plus-bottom-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=I
},
['phosphor-rows-plus-bottom-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=I
},
['phosphor-rows-plus-bottom-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=I
},
['phosphor-rows-plus-bottom-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=I
},
['phosphor-rows-plus-bottom']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=I
},
['phosphor-rows-plus-top-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=I
},
['phosphor-rows-plus-top-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=I
},
['phosphor-rows-plus-top-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=I
},
['phosphor-rows-plus-top-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=I
},
['phosphor-rows-plus-top-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=I
},
['phosphor-rows-plus-top']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=I
},
['phosphor-rss-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=I
},
['phosphor-rss-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=I
},
['phosphor-rug-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=I
},
['phosphor-ruler-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=I
},
['phosphor-sailboat-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=I
},
['phosphor-scales-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=I
},
['phosphor-scan-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=I
},
['phosphor-scan-smiley-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=I
},
['phosphor-scissors-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=I
},
['phosphor-scissors-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=I
},
['phosphor-scissors-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=I
},
['phosphor-scissors-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=I
},
['phosphor-scissors-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=I
},
['phosphor-scissors']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=I
},
['phosphor-scooter-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=I
},
['phosphor-screencast-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=I
},
['phosphor-screwdriver-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=I
},
['phosphor-scribble-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=I
},
['phosphor-scribble-loop-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=I
},
['phosphor-scroll-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=I
},
['phosphor-seal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=I
},
['phosphor-seal-check-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_448'],
Image=I
},
['phosphor-seal-check-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=I
},
['phosphor-seal-check-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=I
},
['phosphor-seal-check-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=I
},
['phosphor-seal-check-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_512'],
Image=I
},
['phosphor-seal-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=I
},
['phosphor-seal-percent-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=I
},
['phosphor-seal-question-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=I
},
['phosphor-seal-warning-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=I
},
['phosphor-seal-warning-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=I
},
['phosphor-seal-warning-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_576'],
Image=I
},
['phosphor-seal-warning-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=I
},
['phosphor-seal-warning-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=I
},
['phosphor-seal-warning']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=I
},
['phosphor-seat-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=I
},
['phosphor-seatbelt-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=I
},
['phosphor-selection-all-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=I
},
['phosphor-selection-background-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=I
},
['phosphor-selection-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=I
},
['phosphor-selection-foreground-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=I
},
['phosphor-selection-inverse-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=I
},
['phosphor-selection-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=I
},
['phosphor-selection-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=I
},
['phosphor-selection-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=I
},
['phosphor-selection-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=I
},
['phosphor-selection-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=I
},
['phosphor-selection-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=I
},
['phosphor-selection-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=I
},
['phosphor-shapes-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=I
},
['phosphor-share-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=I
},
['phosphor-share-fat-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=I
},
['phosphor-share-network-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=I
},
['phosphor-shield-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=I
},
['phosphor-shield-check-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_960'],
Image=I
},
['phosphor-shield-check-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=I
},
['phosphor-shield-check-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=I
},
['phosphor-shield-check-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=I
},
['phosphor-shield-check-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=I
},
['phosphor-shield-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=I
},
['phosphor-shield-checkered-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=I
},
['phosphor-shield-checkered-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=I
},
['phosphor-shield-checkered-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=I
},
['phosphor-shield-checkered-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=I
},
['phosphor-shield-checkered-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=I
},
['phosphor-shield-checkered']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=I
},
['phosphor-shield-chevron-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_960'],
Image=I
},
['phosphor-shield-chevron-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=I
},
['phosphor-shield-chevron-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=I
},
['phosphor-shield-chevron-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=J
},
['phosphor-shield-chevron-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=J
},
['phosphor-shield-chevron']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=J
},
['phosphor-shield-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=J
},
['phosphor-shield-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=J
},
['phosphor-shield-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=J
},
['phosphor-shield-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=J
},
['phosphor-shield-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=J
},
['phosphor-shield-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=J
},
['phosphor-shield-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=J
},
['phosphor-shield-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=J
},
['phosphor-shield-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=J
},
['phosphor-shield-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=J
},
['phosphor-shield-slash-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=J
},
['phosphor-shield-slash-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=J
},
['phosphor-shield-slash-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=J
},
['phosphor-shield-slash-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=J
},
['phosphor-shield-slash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=J
},
['phosphor-shield-star-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=J
},
['phosphor-shield-star-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=J
},
['phosphor-shield-star-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=J
},
['phosphor-shield-star-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=J
},
['phosphor-shield-star-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=J
},
['phosphor-shield-star']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=J
},
['phosphor-shield-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=J
},
['phosphor-shield-warning-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=J
},
['phosphor-shield-warning-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=J
},
['phosphor-shield-warning-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=J
},
['phosphor-shield-warning-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=J
},
['phosphor-shield-warning-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=J
},
['phosphor-shield-warning']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=J
},
['phosphor-shield']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=J
},
['phosphor-shipping-container-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=J
},
['phosphor-shirt-folded-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=J
},
['phosphor-shooting-star-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=J
},
['phosphor-shooting-star-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=J
},
['phosphor-shooting-star-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=J
},
['phosphor-shooting-star-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=J
},
['phosphor-shooting-star-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=J
},
['phosphor-shooting-star']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=J
},
['phosphor-shopping-bag-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=J
},
['phosphor-shopping-bag-open-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=J
},
['phosphor-shopping-cart-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=J
},
['phosphor-shopping-cart-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=J
},
['phosphor-shovel-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=J
},
['phosphor-shower-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=J
},
['phosphor-shrimp-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=J
},
['phosphor-shuffle-angular-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=J
},
['phosphor-shuffle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=J
},
['phosphor-shuffle-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=J
},
['phosphor-sidebar-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=J
},
['phosphor-sidebar-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=J
},
['phosphor-sigma-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=J
},
['phosphor-sign-in-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=J
},
['phosphor-sign-out-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=J
},
['phosphor-signature-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=J
},
['phosphor-signpost-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=J
},
['phosphor-sim-card-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=J
},
['phosphor-siren-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=J
},
['phosphor-sketch-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=J
},
['phosphor-skip-back-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=J
},
['phosphor-skip-back-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=J
},
['phosphor-skip-back-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=J
},
['phosphor-skip-back-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_640'],
Image=J
},
['phosphor-skip-back-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=J
},
['phosphor-skip-back-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_640'],
Image=J
},
['phosphor-skip-back-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=J
},
['phosphor-skip-forward-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=J
},
['phosphor-skip-forward-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_704'],
Image=J
},
['phosphor-skip-forward-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=J
},
['phosphor-skip-forward-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=J
},
['phosphor-skip-forward-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=J
},
['phosphor-skip-forward-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_704'],
Image=J
},
['phosphor-skip-forward-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=J
},
['phosphor-skull-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=J
},
['phosphor-skype-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=J
},
['phosphor-slack-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=J
},
['phosphor-sliders-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=J
},
['phosphor-sliders-horizontal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_832'],
Image=J
},
['phosphor-slideshow-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=J
},
['phosphor-smiley-angry-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=J
},
['phosphor-smiley-blank-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=J
},
['phosphor-smiley-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=J
},
['phosphor-smiley-meh-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=J
},
['phosphor-smiley-melting-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=J
},
['phosphor-smiley-nervous-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=K
},
['phosphor-smiley-sad-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=K
},
['phosphor-smiley-sticker-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=K
},
['phosphor-smiley-wink-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=K
},
['phosphor-smiley-x-eyes-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=K
},
['phosphor-smiley-x-eyes-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=K
},
['phosphor-smiley-x-eyes-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=K
},
['phosphor-smiley-x-eyes-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=K
},
['phosphor-smiley-x-eyes-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=K
},
['phosphor-smiley-x-eyes']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=K
},
['phosphor-snapchat-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=K
},
['phosphor-sneaker-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=K
},
['phosphor-sneaker-move-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=K
},
['phosphor-sneaker-move-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=K
},
['phosphor-sneaker-move-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=K
},
['phosphor-sneaker-move-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=K
},
['phosphor-sneaker-move-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=K
},
['phosphor-sneaker-move']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=K
},
['phosphor-snowflake-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=K
},
['phosphor-soccer-ball-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=K
},
['phosphor-sock-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=K
},
['phosphor-solar-panel-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=K
},
['phosphor-solar-roof-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=K
},
['phosphor-sort-ascending-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=K
},
['phosphor-sort-descending-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=K
},
['phosphor-soundcloud-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=K
},
['phosphor-spade-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=K
},
['phosphor-sparkle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=K
},
['phosphor-speaker-hifi-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=K
},
['phosphor-speaker-high-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=K
},
['phosphor-speaker-low-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=K
},
['phosphor-speaker-none-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=K
},
['phosphor-speaker-simple-high-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=K
},
['phosphor-speaker-simple-low-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=K
},
['phosphor-speaker-simple-none-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=K
},
['phosphor-speaker-simple-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=K
},
['phosphor-speaker-simple-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=K
},
['phosphor-speaker-simple-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_640'],
Image=K
},
['phosphor-speaker-simple-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=K
},
['phosphor-speaker-simple-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_640'],
Image=K
},
['phosphor-speaker-simple-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=K
},
['phosphor-speaker-simple-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_640'],
Image=K
},
['phosphor-speaker-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=K
},
['phosphor-speaker-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=K
},
['phosphor-speaker-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_640'],
Image=K
},
['phosphor-speaker-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=K
},
['phosphor-speaker-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_640'],
Image=K
},
['phosphor-speaker-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=K
},
['phosphor-speaker-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_704'],
Image=K
},
['phosphor-speedometer-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=K
},
['phosphor-sphere-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=K
},
['phosphor-spinner-ball-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=K
},
['phosphor-spinner-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=K
},
['phosphor-spinner-gap-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=K
},
['phosphor-spiral-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=K
},
['phosphor-split-horizontal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=K
},
['phosphor-split-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=K
},
['phosphor-spotify-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=K
},
['phosphor-spray-bottle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=K
},
['phosphor-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=K
},
['phosphor-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=K
},
['phosphor-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=K
},
['phosphor-square-half-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_960'],
Image=K
},
['phosphor-square-half-bottom-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=K
},
['phosphor-square-half-bottom-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=K
},
['phosphor-square-half-bottom-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=K
},
['phosphor-square-half-bottom-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=K
},
['phosphor-square-half-bottom-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=K
},
['phosphor-square-half-bottom']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=K
},
['phosphor-square-half-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=K
},
['phosphor-square-half-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=K
},
['phosphor-square-half-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=K
},
['phosphor-square-half-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=K
},
['phosphor-square-half']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=K
},
['phosphor-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_960'],
Image=K
},
['phosphor-square-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=K
},
['phosphor-square-logo-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=K
},
['phosphor-square-logo-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=L
},
['phosphor-square-logo-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=L
},
['phosphor-square-logo-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=L
},
['phosphor-square-logo']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=L
},
['phosphor-square-split-horizontal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=L
},
['phosphor-square-split-horizontal-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=L
},
['phosphor-square-split-horizontal-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=L
},
['phosphor-square-split-horizontal-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=L
},
['phosphor-square-split-horizontal-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=L
},
['phosphor-square-split-horizontal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=L
},
['phosphor-square-split-vertical-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=L
},
['phosphor-square-split-vertical-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=L
},
['phosphor-square-split-vertical-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=L
},
['phosphor-square-split-vertical-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=L
},
['phosphor-square-split-vertical-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=L
},
['phosphor-square-split-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=L
},
['phosphor-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=L
},
['phosphor-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=L
},
['phosphor-squares-four-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=L
},
['phosphor-squares-four-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=L
},
['phosphor-squares-four-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=L
},
['phosphor-squares-four-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=L
},
['phosphor-squares-four-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=L
},
['phosphor-squares-four']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=L
},
['phosphor-stack-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=L
},
['phosphor-stack-minus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=L
},
['phosphor-stack-minus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=L
},
['phosphor-stack-minus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=L
},
['phosphor-stack-minus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=L
},
['phosphor-stack-minus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=L
},
['phosphor-stack-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=L
},
['phosphor-stack-overflow-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=L
},
['phosphor-stack-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=L
},
['phosphor-stack-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=L
},
['phosphor-stack-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=L
},
['phosphor-stack-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=L
},
['phosphor-stack-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=L
},
['phosphor-stack-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=L
},
['phosphor-stack-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=L
},
['phosphor-stairs-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=L
},
['phosphor-stamp-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=L
},
['phosphor-standard-definition-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=L
},
['phosphor-star-and-crescent-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=L
},
['phosphor-star-and-crescent-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=L
},
['phosphor-star-and-crescent-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=L
},
['phosphor-star-and-crescent-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_256'],
Image=L
},
['phosphor-star-and-crescent-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=L
},
['phosphor-star-and-crescent']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_256'],
Image=L
},
['phosphor-star-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=L
},
['phosphor-star-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_256'],
Image=L
},
['phosphor-star-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=L
},
['phosphor-star-four-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_320'],
Image=L
},
['phosphor-star-four-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=L
},
['phosphor-star-four-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_320'],
Image=L
},
['phosphor-star-four-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=L
},
['phosphor-star-four-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=L
},
['phosphor-star-four']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=L
},
['phosphor-star-half-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=L
},
['phosphor-star-half-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=L
},
['phosphor-star-half-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_320'],
Image=L
},
['phosphor-star-half-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=L
},
['phosphor-star-half-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=L
},
['phosphor-star-half']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=L
},
['phosphor-star-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_320'],
Image=L
},
['phosphor-star-of-david-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=L
},
['phosphor-star-of-david-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=L
},
['phosphor-star-of-david-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=L
},
['phosphor-star-of-david-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_384'],
Image=L
},
['phosphor-star-of-david-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=L
},
['phosphor-star-of-david']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_384'],
Image=L
},
['phosphor-star-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=L
},
['phosphor-star']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_384'],
Image=L
},
['phosphor-steam-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=L
},
['phosphor-steering-wheel-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=L
},
['phosphor-steps-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=L
},
['phosphor-stethoscope-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=L
},
['phosphor-sticker-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=L
},
['phosphor-stool-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=L
},
['phosphor-storefront-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=L
},
['phosphor-strategy-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=L
},
['phosphor-stripe-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=L
},
['phosphor-student-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=L
},
['phosphor-subset-of-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=L
},
['phosphor-subset-proper-of-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=L
},
['phosphor-subtitles-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=L
},
['phosphor-subtitles-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=L
},
['phosphor-subtract-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=L
},
['phosphor-subtract-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=L
},
['phosphor-subtract-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=L
},
['phosphor-subtract-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=L
},
['phosphor-subtract-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=L
},
['phosphor-subtract-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=L
},
['phosphor-subtract-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=L
},
['phosphor-subway-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=L
},
['phosphor-suitcase-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=L
},
['phosphor-suitcase-rolling-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=L
},
['phosphor-suitcase-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=L
},
['phosphor-sun-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=L
},
['phosphor-sun-dim-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=L
},
['phosphor-sun-horizon-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=L
},
['phosphor-sunglasses-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=L
},
['phosphor-superset-of-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=M
},
['phosphor-superset-proper-of-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=M
},
['phosphor-swap-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=M
},
['phosphor-swatches-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=M
},
['phosphor-swimming-pool-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=M
},
['phosphor-sword-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=M
},
['phosphor-synagogue-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=M
},
['phosphor-syringe-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=M
},
['phosphor-t-shirt-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=M
},
['phosphor-table-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=M
},
['phosphor-tabs-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=M
},
['phosphor-tag-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=M
},
['phosphor-tag-chevron-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=M
},
['phosphor-tag-chevron-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=M
},
['phosphor-tag-chevron-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=M
},
['phosphor-tag-chevron-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=M
},
['phosphor-tag-chevron-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=M
},
['phosphor-tag-chevron']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=M
},
['phosphor-tag-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=M
},
['phosphor-target-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=M
},
['phosphor-taxi-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_320'],
Image=M
},
['phosphor-taxi-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_320'],
Image=M
},
['phosphor-taxi-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=M
},
['phosphor-taxi-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_320'],
Image=M
},
['phosphor-taxi-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_384'],
Image=M
},
['phosphor-taxi']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_384'],
Image=M
},
['phosphor-tea-bag-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_384'],
Image=M
},
['phosphor-telegram-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=M
},
['phosphor-television-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=M
},
['phosphor-television-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=M
},
['phosphor-tennis-ball-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=M
},
['phosphor-tent-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=M
},
['phosphor-terminal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=M
},
['phosphor-terminal-window-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=M
},
['phosphor-test-tube-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=M
},
['phosphor-text-a-underline-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=M
},
['phosphor-text-a-underline-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=M
},
['phosphor-text-a-underline-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=M
},
['phosphor-text-a-underline-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_576'],
Image=M
},
['phosphor-text-a-underline-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=M
},
['phosphor-text-a-underline']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_576'],
Image=M
},
['phosphor-text-aa-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=M
},
['phosphor-text-aa-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_576'],
Image=M
},
['phosphor-text-aa-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=M
},
['phosphor-text-aa-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_640'],
Image=M
},
['phosphor-text-aa-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=M
},
['phosphor-text-aa']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_640'],
Image=M
},
['phosphor-text-align-center-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=M
},
['phosphor-text-align-center-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_640'],
Image=M
},
['phosphor-text-align-center-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=M
},
['phosphor-text-align-center-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_640'],
Image=M
},
['phosphor-text-align-center-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=M
},
['phosphor-text-align-center']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=M
},
['phosphor-text-align-justify-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=M
},
['phosphor-text-align-justify-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=M
},
['phosphor-text-align-justify-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=M
},
['phosphor-text-align-justify-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_640'],
Image=M
},
['phosphor-text-align-justify-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=M
},
['phosphor-text-align-justify']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_640'],
Image=M
},
['phosphor-text-align-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=M
},
['phosphor-text-align-left-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_704'],
Image=M
},
['phosphor-text-align-left-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=M
},
['phosphor-text-align-left-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=M
},
['phosphor-text-align-left-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=M
},
['phosphor-text-align-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_704'],
Image=M
},
['phosphor-text-align-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=M
},
['phosphor-text-align-right-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_704'],
Image=M
},
['phosphor-text-align-right-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=M
},
['phosphor-text-align-right-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=M
},
['phosphor-text-align-right-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=M
},
['phosphor-text-align-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_704'],
Image=M
},
['phosphor-text-b-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=M
},
['phosphor-text-b-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=M
},
['phosphor-text-b-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=M
},
['phosphor-text-b-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=M
},
['phosphor-text-b-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=M
},
['phosphor-text-b']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=M
},
['phosphor-text-columns-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=M
},
['phosphor-text-columns-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=M
},
['phosphor-text-columns-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=M
},
['phosphor-text-columns-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=M
},
['phosphor-text-columns-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=M
},
['phosphor-text-columns']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=M
},
['phosphor-text-h-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=M
},
['phosphor-text-h-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=M
},
['phosphor-text-h-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=M
},
['phosphor-text-h-five-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=M
},
['phosphor-text-h-five-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=M
},
['phosphor-text-h-five-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=M
},
['phosphor-text-h-five-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=M
},
['phosphor-text-h-five-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=M
},
['phosphor-text-h-five']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=M
},
['phosphor-text-h-four-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=M
},
['phosphor-text-h-four-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=M
},
['phosphor-text-h-four-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=M
},
['phosphor-text-h-four-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=M
},
['phosphor-text-h-four-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=M
},
['phosphor-text-h-four']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=M
},
['phosphor-text-h-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_832'],
Image=M
},
['phosphor-text-h-one-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=M
},
['phosphor-text-h-one-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_832'],
Image=M
},
['phosphor-text-h-one-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=M
},
['phosphor-text-h-one-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_832'],
Image=M
},
['phosphor-text-h-one-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=M
},
['phosphor-text-h-one']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=M
},
['phosphor-text-h-six-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=M
},
['phosphor-text-h-six-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=M
},
['phosphor-text-h-six-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=M
},
['phosphor-text-h-six-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_896'],
Image=M
},
['phosphor-text-h-six-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=M
},
['phosphor-text-h-six']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_896'],
Image=M
},
['phosphor-text-h-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=M
},
['phosphor-text-h-three-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_896'],
Image=M
},
['phosphor-text-h-three-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=M
},
['phosphor-text-h-three-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_896'],
Image=M
},
['phosphor-text-h-three-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=M
},
['phosphor-text-h-three-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_896'],
Image=M
},
['phosphor-text-h-three']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=M
},
['phosphor-text-h-two-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=M
},
['phosphor-text-h-two-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=M
},
['phosphor-text-h-two-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=M
},
['phosphor-text-h-two-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=M
},
['phosphor-text-h-two-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=M
},
['phosphor-text-h-two']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=M
},
['phosphor-text-h']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_960'],
Image=M
},
['phosphor-text-indent-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=M
},
['phosphor-text-indent-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=M
},
['phosphor-text-indent-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=M
},
['phosphor-text-indent-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=M
},
['phosphor-text-indent-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=M
},
['phosphor-text-indent']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=M
},
['phosphor-text-italic-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=M
},
['phosphor-text-italic-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=M
},
['phosphor-text-italic-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=M
},
['phosphor-text-italic-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=M
},
['phosphor-text-italic-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=M
},
['phosphor-text-italic']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_960'],
Image=M
},
['phosphor-text-outdent-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=M
},
['phosphor-text-outdent-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=M
},
['phosphor-text-outdent-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=N
},
['phosphor-text-outdent-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=N
},
['phosphor-text-outdent-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=N
},
['phosphor-text-outdent']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=N
},
['phosphor-text-strikethrough-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=N
},
['phosphor-text-strikethrough-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=N
},
['phosphor-text-strikethrough-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=N
},
['phosphor-text-strikethrough-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=N
},
['phosphor-text-strikethrough-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=N
},
['phosphor-text-strikethrough']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=N
},
['phosphor-text-subscript-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=N
},
['phosphor-text-subscript-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=N
},
['phosphor-text-subscript-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=N
},
['phosphor-text-subscript-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=N
},
['phosphor-text-subscript-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=N
},
['phosphor-text-subscript']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=N
},
['phosphor-text-superscript-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=N
},
['phosphor-text-superscript-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=N
},
['phosphor-text-superscript-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=N
},
['phosphor-text-superscript-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=N
},
['phosphor-text-superscript-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=N
},
['phosphor-text-superscript']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=N
},
['phosphor-text-t-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=N
},
['phosphor-text-t-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=N
},
['phosphor-text-t-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=N
},
['phosphor-text-t-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=N
},
['phosphor-text-t-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=N
},
['phosphor-text-t-slash-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=N
},
['phosphor-text-t-slash-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=N
},
['phosphor-text-t-slash-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=N
},
['phosphor-text-t-slash-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=N
},
['phosphor-text-t-slash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=N
},
['phosphor-text-t-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=N
},
['phosphor-text-t']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=N
},
['phosphor-text-underline-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=N
},
['phosphor-text-underline-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=N
},
['phosphor-text-underline-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=N
},
['phosphor-text-underline-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=N
},
['phosphor-text-underline-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=N
},
['phosphor-text-underline']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=N
},
['phosphor-textbox-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=N
},
['phosphor-textbox-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=N
},
['phosphor-textbox-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=N
},
['phosphor-textbox-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=N
},
['phosphor-textbox-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=N
},
['phosphor-textbox']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=N
},
['phosphor-thermometer-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=N
},
['phosphor-thermometer-cold-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=N
},
['phosphor-thermometer-hot-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=N
},
['phosphor-thermometer-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=N
},
['phosphor-threads-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=N
},
['phosphor-three-d-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=N
},
['phosphor-thumbs-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=N
},
['phosphor-thumbs-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=N
},
['phosphor-ticket-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=N
},
['phosphor-tidal-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=N
},
['phosphor-tiktok-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=N
},
['phosphor-tilde-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=N
},
['phosphor-timer-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=N
},
['phosphor-tip-jar-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=N
},
['phosphor-tipi-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=N
},
['phosphor-tire-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=N
},
['phosphor-toggle-left-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=N
},
['phosphor-toggle-right-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=N
},
['phosphor-toilet-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=N
},
['phosphor-toilet-paper-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=N
},
['phosphor-toolbox-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_640'],
Image=N
},
['phosphor-toolbox-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_640'],
Image=N
},
['phosphor-toolbox-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=N
},
['phosphor-toolbox-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=N
},
['phosphor-toolbox-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=N
},
['phosphor-toolbox']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_640'],
Image=N
},
['phosphor-tooth-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=N
},
['phosphor-tornado-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=N
},
['phosphor-tote-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=N
},
['phosphor-tote-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=N
},
['phosphor-towel-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=N
},
['phosphor-tractor-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=N
},
['phosphor-trademark-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=N
},
['phosphor-trademark-registered-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=N
},
['phosphor-traffic-cone-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=N
},
['phosphor-traffic-sign-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=N
},
['phosphor-traffic-signal-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=N
},
['phosphor-traffic-signal-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_896'],
Image=N
},
['phosphor-traffic-signal-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=N
},
['phosphor-traffic-signal-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=N
},
['phosphor-traffic-signal-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=N
},
['phosphor-traffic-signal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=N
},
['phosphor-train-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=N
},
['phosphor-train-regional-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=N
},
['phosphor-train-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=N
},
['phosphor-tram-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=O
},
['phosphor-translate-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=O
},
['phosphor-tray-arrow-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=O
},
['phosphor-tray-arrow-down-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=O
},
['phosphor-tray-arrow-down-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=O
},
['phosphor-tray-arrow-down-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=O
},
['phosphor-tray-arrow-down-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=O
},
['phosphor-tray-arrow-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=O
},
['phosphor-tray-arrow-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=O
},
['phosphor-tray-arrow-up-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=O
},
['phosphor-tray-arrow-up-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=O
},
['phosphor-tray-arrow-up-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=O
},
['phosphor-tray-arrow-up-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=O
},
['phosphor-tray-arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=O
},
['phosphor-tray-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=O
},
['phosphor-treasure-chest-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=O
},
['phosphor-tree-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=O
},
['phosphor-tree-evergreen-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=O
},
['phosphor-tree-palm-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=O
},
['phosphor-tree-structure-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=O
},
['phosphor-tree-view-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=O
},
['phosphor-trend-down-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_256'],
Image=O
},
['phosphor-trend-up-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=O
},
['phosphor-triangle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_320'],
Image=O
},
['phosphor-triangle-dashed-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_320'],
Image=O
},
['phosphor-trolley-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=O
},
['phosphor-trolley-suitcase-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=O
},
['phosphor-trophy-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=O
},
['phosphor-truck-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=O
},
['phosphor-truck-trailer-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_448'],
Image=O
},
['phosphor-tumblr-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=O
},
['phosphor-twitch-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=O
},
['phosphor-twitter-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=O
},
['phosphor-twitter-logo-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_576'],
Image=O
},
['phosphor-twitter-logo-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=O
},
['phosphor-twitter-logo-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=O
},
['phosphor-twitter-logo-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=O
},
['phosphor-twitter-logo']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_576'],
Image=O
},
['phosphor-umbrella-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=O
},
['phosphor-umbrella-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=O
},
['phosphor-union-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=O
},
['phosphor-unite-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=O
},
['phosphor-unite-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_640'],
Image=O
},
['phosphor-unite-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_640'],
Image=O
},
['phosphor-unite-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_640'],
Image=O
},
['phosphor-unite-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_640'],
Image=O
},
['phosphor-unite-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=O
},
['phosphor-unite-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_704'],
Image=O
},
['phosphor-upload-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=O
},
['phosphor-upload-simple-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=O
},
['phosphor-usb-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=O
},
['phosphor-user-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=O
},
['phosphor-user-check-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=O
},
['phosphor-user-check-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=O
},
['phosphor-user-check-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_768'],
Image=O
},
['phosphor-user-check-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_768'],
Image=O
},
['phosphor-user-check-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=O
},
['phosphor-user-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_768'],
Image=O
},
['phosphor-user-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_768'],
Image=O
},
['phosphor-user-circle-check-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=O
},
['phosphor-user-circle-check-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_768'],
Image=O
},
['phosphor-user-circle-check-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_832'],
Image=O
},
['phosphor-user-circle-check-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=O
},
['phosphor-user-circle-check-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_832'],
Image=O
},
['phosphor-user-circle-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_832'],
Image=O
},
['phosphor-user-circle-dashed-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=O
},
['phosphor-user-circle-dashed-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_832'],
Image=O
},
['phosphor-user-circle-dashed-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_832'],
Image=O
},
['phosphor-user-circle-dashed-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_832'],
Image=O
},
['phosphor-user-circle-dashed-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_832'],
Image=O
},
['phosphor-user-circle-dashed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_832'],
Image=O
},
['phosphor-user-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=O
},
['phosphor-user-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_832'],
Image=O
},
['phosphor-user-circle-gear-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=O
},
['phosphor-user-circle-gear-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=O
},
['phosphor-user-circle-gear-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=O
},
['phosphor-user-circle-gear-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=O
},
['phosphor-user-circle-gear-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=O
},
['phosphor-user-circle-gear']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_896'],
Image=O
},
['phosphor-user-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=O
},
['phosphor-user-circle-minus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_896'],
Image=O
},
['phosphor-user-circle-minus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=O
},
['phosphor-user-circle-minus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_896'],
Image=O
},
['phosphor-user-circle-minus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=O
},
['phosphor-user-circle-minus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_896'],
Image=O
},
['phosphor-user-circle-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_896'],
Image=O
},
['phosphor-user-circle-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_896'],
Image=O
},
['phosphor-user-circle-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=O
},
['phosphor-user-circle-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=O
},
['phosphor-user-circle-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=O
},
['phosphor-user-circle-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=O
},
['phosphor-user-circle-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=O
},
['phosphor-user-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=O
},
['phosphor-user-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=O
},
['phosphor-user-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_960'],
Image=O
},
['phosphor-user-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_960'],
Image=O
},
['phosphor-user-focus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_960'],
Image=O
},
['phosphor-user-focus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_960'],
Image=O
},
['phosphor-user-focus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_960'],
Image=O
},
['phosphor-user-focus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_960'],
Image=O
},
['phosphor-user-focus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_960'],
Image=O
},
['phosphor-user-focus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=O
},
['phosphor-user-gear-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_960'],
Image=O
},
['phosphor-user-gear-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_960'],
Image=O
},
['phosphor-user-gear-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_960'],
Image=O
},
['phosphor-user-gear-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_960'],
Image=O
},
['phosphor-user-gear-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_960'],
Image=O
},
['phosphor-user-gear']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=O
},
['phosphor-user-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_960'],
Image=O
},
['phosphor-user-list-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_0'],
Image=P
},
['phosphor-user-list-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_0'],
Image=P
},
['phosphor-user-list-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=P
},
['phosphor-user-list-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_0'],
Image=P
},
['phosphor-user-list-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_0'],
Image=P
},
['phosphor-user-list']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_0'],
Image=P
},
['phosphor-user-minus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_0'],
Image=P
},
['phosphor-user-minus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=P
},
['phosphor-user-minus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_0'],
Image=P
},
['phosphor-user-minus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=P
},
['phosphor-user-minus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=P
},
['phosphor-user-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_0'],
Image=P
},
['phosphor-user-plus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=P
},
['phosphor-user-plus-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=P
},
['phosphor-user-plus-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_0'],
Image=P
},
['phosphor-user-plus-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=P
},
['phosphor-user-plus-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=P
},
['phosphor-user-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=P
},
['phosphor-user-rectangle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_64'],
Image=P
},
['phosphor-user-rectangle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_64'],
Image=P
},
['phosphor-user-rectangle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=P
},
['phosphor-user-rectangle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_64'],
Image=P
},
['phosphor-user-rectangle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=P
},
['phosphor-user-rectangle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=P
},
['phosphor-user-sound-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=P
},
['phosphor-user-sound-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=P
},
['phosphor-user-sound-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=P
},
['phosphor-user-sound-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=P
},
['phosphor-user-sound-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=P
},
['phosphor-user-sound']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_64'],
Image=P
},
['phosphor-user-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_64'],
Image=P
},
['phosphor-user-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_64'],
Image=P
},
['phosphor-user-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=P
},
['phosphor-user-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=P
},
['phosphor-user-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=P
},
['phosphor-user-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=P
},
['phosphor-user-switch-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=P
},
['phosphor-user-switch-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=P
},
['phosphor-user-switch-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=P
},
['phosphor-user-switch-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_128'],
Image=P
},
['phosphor-user-switch-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=P
},
['phosphor-user-switch']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=P
},
['phosphor-user-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=P
},
['phosphor-user']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=P
},
['phosphor-users-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=P
},
['phosphor-users-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=P
},
['phosphor-users-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=P
},
['phosphor-users-four-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=P
},
['phosphor-users-four-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=P
},
['phosphor-users-four-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=P
},
['phosphor-users-four-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=P
},
['phosphor-users-four-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=P
},
['phosphor-users-four']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=P
},
['phosphor-users-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=P
},
['phosphor-users-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=P
},
['phosphor-users-three-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=P
},
['phosphor-users-three-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=P
},
['phosphor-users-three-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=P
},
['phosphor-users-three-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=P
},
['phosphor-users-three-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=P
},
['phosphor-users-three']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=P
},
['phosphor-users']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=P
},
['phosphor-van-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=P
},
['phosphor-vault-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=P
},
['phosphor-vector-three-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=P
},
['phosphor-vector-two-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_320'],
Image=P
},
['phosphor-vibrate-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=P
},
['phosphor-vignette-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=P
},
['phosphor-vinyl-record-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=P
},
['phosphor-virtual-reality-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=P
},
['phosphor-virus-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=P
},
['phosphor-visor-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=P
},
['phosphor-voicemail-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=P
},
['phosphor-volleyball-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=P
},
['phosphor-wall-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=P
},
['phosphor-wallet-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=P
},
['phosphor-warehouse-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=P
},
['phosphor-warning-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_704'],
Image=P
},
['phosphor-warning-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_704'],
Image=P
},
['phosphor-warning-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_704'],
Image=P
},
['phosphor-warning-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_704'],
Image=P
},
['phosphor-warning-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_704'],
Image=P
},
['phosphor-warning-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_704'],
Image=P
},
['phosphor-warning-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=P
},
['phosphor-warning-diamond-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_704'],
Image=P
},
['phosphor-warning-diamond-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_704'],
Image=P
},
['phosphor-warning-diamond-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_704'],
Image=P
},
['phosphor-warning-diamond-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_704'],
Image=P
},
['phosphor-warning-diamond-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_704'],
Image=P
},
['phosphor-warning-diamond']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_704'],
Image=P
},
['phosphor-warning-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_704'],
Image=P
},
['phosphor-warning-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_704'],
Image=P
},
['phosphor-warning-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_704'],
Image=P
},
['phosphor-warning-octagon-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_768'],
Image=P
},
['phosphor-warning-octagon-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_768'],
Image=P
},
['phosphor-warning-octagon-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_768'],
Image=P
},
['phosphor-warning-octagon-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_768'],
Image=P
},
['phosphor-warning-octagon-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_768'],
Image=P
},
['phosphor-warning-octagon']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_768'],
Image=P
},
['phosphor-warning-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_768'],
Image=P
},
['phosphor-warning']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_768'],
Image=P
},
['phosphor-washing-machine-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_768'],
Image=P
},
['phosphor-watch-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_768'],
Image=P
},
['phosphor-wave-sawtooth-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_832'],
Image=P
},
['phosphor-wave-sine-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=P
},
['phosphor-wave-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=P
},
['phosphor-wave-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_896'],
Image=P
},
['phosphor-wave-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=P
},
['phosphor-wave-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_896'],
Image=P
},
['phosphor-wave-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_896'],
Image=P
},
['phosphor-wave-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_896'],
Image=P
},
['phosphor-wave-triangle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_896'],
Image=P
},
['phosphor-waveform-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_896'],
Image=P
},
['phosphor-waveform-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=P
},
['phosphor-waves-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_960'],
Image=P
},
['phosphor-webcam-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_960'],
Image=P
},
['phosphor-webcam-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_0'],
Image=Q
},
['phosphor-webhooks-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_0'],
Image=Q
},
['phosphor-wechat-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=Q
},
['phosphor-whatsapp-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=Q
},
['phosphor-wheelchair-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_64'],
Image=Q
},
['phosphor-wheelchair-motion-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_128'],
Image=Q
},
['phosphor-wifi-high-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_128'],
Image=Q
},
['phosphor-wifi-high-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_128'],
Image=Q
},
['phosphor-wifi-high-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_128'],
Image=Q
},
['phosphor-wifi-high-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=Q
},
['phosphor-wifi-high-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=Q
},
['phosphor-wifi-high']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=Q
},
['phosphor-wifi-low-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=Q
},
['phosphor-wifi-low-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=Q
},
['phosphor-wifi-low-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=Q
},
['phosphor-wifi-low-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=Q
},
['phosphor-wifi-low-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=Q
},
['phosphor-wifi-low']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=Q
},
['phosphor-wifi-medium-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=Q
},
['phosphor-wifi-medium-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=Q
},
['phosphor-wifi-medium-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=Q
},
['phosphor-wifi-medium-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=Q
},
['phosphor-wifi-medium-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=Q
},
['phosphor-wifi-medium']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=Q
},
['phosphor-wifi-none-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=Q
},
['phosphor-wifi-none-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=Q
},
['phosphor-wifi-none-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=Q
},
['phosphor-wifi-none-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_192'],
Image=Q
},
['phosphor-wifi-none-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_192'],
Image=Q
},
['phosphor-wifi-none']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_192'],
Image=Q
},
['phosphor-wifi-slash-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_256'],
Image=Q
},
['phosphor-wifi-slash-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_256'],
Image=Q
},
['phosphor-wifi-slash-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_256'],
Image=Q
},
['phosphor-wifi-slash-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_256'],
Image=Q
},
['phosphor-wifi-slash-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=Q
},
['phosphor-wifi-slash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=Q
},
['phosphor-wifi-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=Q
},
['phosphor-wifi-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=Q
},
['phosphor-wifi-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_256'],
Image=Q
},
['phosphor-wifi-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_256'],
Image=Q
},
['phosphor-wifi-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_256'],
Image=Q
},
['phosphor-wifi-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_256'],
Image=Q
},
['phosphor-wind-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_256'],
Image=Q
},
['phosphor-windmill-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_320'],
Image=Q
},
['phosphor-windows-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_320'],
Image=Q
},
['phosphor-wine-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_320'],
Image=Q
},
['phosphor-wrench-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=Q
},
['phosphor-x-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=Q
},
['phosphor-x-circle-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_384'],
Image=Q
},
['phosphor-x-circle-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=Q
},
['phosphor-x-circle-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=Q
},
['phosphor-x-circle-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=Q
},
['phosphor-x-circle-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_384'],
Image=Q
},
['phosphor-x-circle']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=Q
},
['phosphor-x-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=Q
},
['phosphor-x-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=Q
},
['phosphor-x-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=Q
},
['phosphor-x-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=Q
},
['phosphor-x-logo-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_448'],
Image=Q
},
['phosphor-x-logo-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=Q
},
['phosphor-x-logo-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_448'],
Image=Q
},
['phosphor-x-logo-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=Q
},
['phosphor-x-logo']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_448'],
Image=Q
},
['phosphor-x-square-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=Q
},
['phosphor-x-square-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_448'],
Image=Q
},
['phosphor-x-square-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=Q
},
['phosphor-x-square-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_448'],
Image=Q
},
['phosphor-x-square-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=Q
},
['phosphor-x-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_448'],
Image=Q
},
['phosphor-x-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=Q
},
['phosphor-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=Q
},
['phosphor-yarn-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=Q
},
['phosphor-yin-yang-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=Q
},
['phosphor-youtube-logo-bold']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=Q
},
['phosphor-youtube-logo-duotone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_512'],
Image=Q
},
['phosphor-youtube-logo-fill']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=Q
},
['phosphor-youtube-logo-light']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_576'],
Image=Q
},
['phosphor-youtube-logo-thin']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=Q
},
['phosphor-youtube-logo']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=Q
},pickaxe=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=Q
},plus=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=Q
},
['printer-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_704'],
Image=Q
},
['receipt-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_832'],
Image=Q
},
['refresh-ccw-dot']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_832'],
Image=Q
},
['refresh-ccw']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_832'],
Image=Q
},
['refresh-cw-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_832'],
Image=Q
},
['refresh-cw']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_832'],
Image=Q
},regex=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=Q
},
['remove-formatting']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=Q
},
['rotate-3d']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=Q
},
['rotate-ccw-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_896'],
Image=Q
},
['rotate-ccw']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=Q
},
['rotate-cw-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_960'],
Image=Q
},
['rotate-cw']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_960'],
Image=Q
},
['scan-eye']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_0'],
Image=R
},
['scan-heart']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_0'],
Image=R
},
['scan-search']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_0'],
Image=R
},
['scan-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_0'],
Image=R
},
['scissors-line-dashed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_64'],
Image=R
},scissors=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_64'],
Image=R
},
['scroll-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_64'],
Image=R
},
['search-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_64'],
Image=R
},
['search-code']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_64'],
Image=R
},
['search-slash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_64'],
Image=R
},
['search-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=R
},search=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=R
},
['server-cog']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_128'],
Image=R
},
['server-crash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_128'],
Image=R
},
['server-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_128'],
Image=R
},server=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_128'],
Image=R
},
['settings-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_128'],
Image=R
},settings=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_128'],
Image=R
},
['shield-alert']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=R
},
['shield-ban']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=R
},
['shield-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=R
},
['shield-ellipsis']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=R
},
['shield-half']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=R
},
['shield-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=R
},
['shield-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=R
},
['shield-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=R
},
['shield-question']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=R
},
['shield-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=R
},shield=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=R
},
['signal-high']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_256'],
Image=R
},
['signal-low']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_256'],
Image=R
},
['signal-medium']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_256'],
Image=R
},
['signal-zero']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_256'],
Image=R
},signal=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_256'],
Image=R
},
['smartphone-charging']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_320'],
Image=R
},
['smartphone-nfc']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_320'],
Image=R
},smartphone=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_320'],
Image=R
},
['smile-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_320'],
Image=R
},
['spell-check-2']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_384'],
Image=R
},
['spell-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_384'],
Image=R
},
['square-activity']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_384'],
Image=R
},
['square-arrow-down-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=R
},
['square-arrow-down-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_384'],
Image=R
},
['square-arrow-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_384'],
Image=R
},
['square-arrow-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_384'],
Image=R
},
['square-arrow-out-down-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_384'],
Image=R
},
['square-arrow-out-down-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_384'],
Image=R
},
['square-arrow-out-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=R
},
['square-arrow-out-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_448'],
Image=R
},
['square-arrow-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=R
},
['square-arrow-up-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=R
},
['square-arrow-up-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_448'],
Image=R
},
['square-arrow-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_448'],
Image=R
},
['square-asterisk']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_448'],
Image=R
},
['square-bottom-dashed-scissors']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_448'],
Image=R
},
['square-chart-gantt']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_448'],
Image=R
},
['square-check-big']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_448'],
Image=R
},
['square-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_448'],
Image=R
},
['square-chevron-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_448'],
Image=R
},
['square-chevron-left']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_448'],
Image=R
},
['square-chevron-right']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_448'],
Image=R
},
['square-chevron-up']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_448'],
Image=R
},
['square-code']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_448'],
Image=R
},
['square-dashed-bottom-code']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_512'],
Image=R
},
['square-dashed-bottom']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_512'],
Image=R
},
['square-dashed-kanban']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_512'],
Image=R
},
['square-dashed-mouse-pointer']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_512'],
Image=R
},
['square-dashed']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_512'],
Image=R
},
['square-divide']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_512'],
Image=R
},
['square-dot']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_512'],
Image=R
},
['square-equal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_512'],
Image=R
},
['square-function']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_512'],
Image=R
},
['square-kanban']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_512'],
Image=R
},
['square-library']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_512'],
Image=R
},
['square-m']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_512'],
Image=R
},
['square-menu']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_512'],
Image=R
},
['square-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_512'],
Image=R
},
['square-mouse-pointer']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_512'],
Image=R
},
['square-parking-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_512'],
Image=R
},
['square-parking']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_576'],
Image=R
},
['square-pen']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_576'],
Image=R
},
['square-percent']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_576'],
Image=R
},
['square-pi']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_576'],
Image=R
},
['square-pilcrow']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_576'],
Image=R
},
['square-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_576'],
Image=R
},
['square-power']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_576'],
Image=R
},
['square-radical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_576'],
Image=R
},
['square-scissors']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_576'],
Image=R
},
['square-sigma']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_576'],
Image=R
},
['square-slash']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_576'],
Image=R
},
['square-split-horizontal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_576'],
Image=R
},
['square-split-vertical']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_576'],
Image=R
},
['square-square']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_576'],
Image=R
},
['square-stack']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_576'],
Image=R
},
['square-terminal']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_640'],
Image=R
},
['square-user-round']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_640'],
Image=R
},
['square-user']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_640'],
Image=R
},
['square-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_640'],
Image=R
},square=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_640'],
Image=R
},
['star-half']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_640'],
Image=R
},
['star-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_640'],
Image=R
},star=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_640'],
Image=R
},
['tablet-smartphone']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_768'],
Image=R
},
['text-cursor-input']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_832'],
Image=R
},
['text-cursor']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_832'],
Image=R
},
['text-quote']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_896'],
Image=R
},
['text-search']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_896'],
Image=R
},
['text-select']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_896'],
Image=R
},text=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_896'],
Image=R
},
['ticket-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_896'],
Image=R
},
['ticket-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_896'],
Image=R
},
['ticket-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_896'],
Image=R
},
['ticket-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_896'],
Image=R
},
['triangle-alert']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_0'],
Image=S
},twitter=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_64'],
Image=S
},
['type-outline']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_64'],
Image=S
},type=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_64'],
Image=S
},
['user-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_128'],
Image=S
},
['user-cog']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_128'],
Image=S
},
['user-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['832_128'],
Image=S
},
['user-pen']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['896_128'],
Image=S
},
['user-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['960_128'],
Image=S
},
['user-round-check']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_192'],
Image=S
},
['user-round-cog']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['64_192'],
Image=S
},
['user-round-minus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_192'],
Image=S
},
['user-round-pen']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_192'],
Image=S
},
['user-round-plus']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['256_192'],
Image=S
},
['user-round-search']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_192'],
Image=S
},
['user-round-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_192'],
Image=S
},
['user-round']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_192'],
Image=S
},
['user-search']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_192'],
Image=S
},
['user-x']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_192'],
Image=S
},user=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_192'],
Image=S
},
['users-round']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['704_192'],
Image=S
},users=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['768_192'],
Image=S
},
['wifi-high']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['320_384'],
Image=S
},
['wifi-low']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['384_384'],
Image=S
},
['wifi-off']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['448_384'],
Image=S
},
['wifi-zero']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['512_384'],
Image=S
},wifi=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['576_384'],
Image=S
},
['wind-arrow-down']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['640_384'],
Image=S
},
['wrap-text']={
ImageRectSize=T['64_64'],
ImageRectOffset=T['0_448'],
Image=S
},x=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['128_448'],
Image=S
},youtube=
{
ImageRectSize=T['64_64'],
ImageRectOffset=T['192_448'],
Image=S
},
}end)()
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
local e=aj:step(ag)
if not e then

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

function aa.step(ab,ac,ad)
local ae=ac.value
local af=ab._velocity
local ag=ab._targetValue

local ah=ad*af

local ai=ah>=math.abs(ag-ae)
ae=ae+ah*(ag>ae and 1 or-1)
if ai then
ae=ab._targetValue
af=0
end

return{
complete=ai,
value=ae,
velocity=af,
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

for ac,ad in pairs(ab.signal._connections)do
if ad==ab then
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
for ad,ae in pairs(ac._connections)do
ae._handler(...)
end

for ad,ae in pairs(ac._threads)do
coroutine.resume(ae,...)
end

ac._threads={}
end

function ab.connect(ac,ad)
local ae=aa.new(ac,ad)
table.insert(ac._connections,ae)
return ae
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
createProxy"Root/Packages/Flipper/Spring"




return(function()
local aa=0.001
local ab=0.001

local ac=0.0001

local ad={}
ad.__index=ad

function ad.new(ae,af)
assert(ae,"Missing argument #1: targetValue")
af=af or{}

return setmetatable({
_targetValue=ae,
_frequency=af.frequency or 4,
_dampingRatio=af.dampingRatio or 1,
},ad)
end

function ad.step(ae,af,ag)




local ah=ae._dampingRatio
local ai=ae._frequency*2*math.pi
local aj=ae._targetValue
local e=af.value
local f=af.velocity or 0

local g=e-aj
local h=math.exp(-ah*ai*ag)

local i,j

if ah==1 then
i=(g*(1+ai*ag)+f*ag)*h+aj
j=(f*(1-ai*ag)-g*(ai*ai*ag))*h
elseif ah<1 then
local k=math.sqrt(1-ah*ah)

local l=math.cos(ai*k*ag)
local m=math.sin(ai*k*ag)













local n
if k>ac then
n=m/k
else
local o=ag*ai
n=o+((o*o)*(k*k)*(k*k)/20-k*k)*(o*o*o)/6
end








local o
if ai*k>ac then
o=m/(ai*k)
else
local p=ai*k
o=ag+((ag*ag)*(p*p)*(p*p)/20-p*p)*(ag*ag*ag)/6
end

i=(g*(l+ah*n)+f*o)*h+aj
j=(f*(l-n*ah)-g*(n*ai))*h
else
local k=math.sqrt(ah*ah-1)

local l=-ai*(ah-k)
local m=-ai*(ah+k)

local n=(f-g*l)/(2*ai*k)
local o=g-n

local p=o*math.exp(l*ag)
local q=n*math.exp(m*ag)

i=p+q+aj
j=p*l+q*m
end

local k=math.abs(j)<aa and math.abs(i-aj)<ab

return{
complete=k,
value=k and aj or i,
velocity=j,
}
end

return ad

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

for ac,ad in pairs(ab.signal._connections)do
if ad==ab then
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
for ad,ae in pairs(ac._connections)do
ae._handler(...)
end

for ad,ae in pairs(ac._threads)do
coroutine.resume(ae,...)
end

ac._threads={}
end

function ab.Fire(ac,...)
ac:fire(...)
end

function ab.connect(ac,ad)
local ae=aa.new(ac,ad)
table.insert(ac._connections,ae)
return ae
end

function ab.Connect(ac,ad)
return ac:connect(ad)
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
b["Themes/Cyber"]=function()
createProxy"Root/Themes/Cyber"




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
"Cyber",
}


local ac:{[string]:{[string]:any}}={}

local ad={
Names=ab,
}


function ad.Get(ae,af:string):{[string]:any}?
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


function ad.Preload(ae,af:string)
if table.find(ab,af)then
ae:Get(af)
end
end


setmetatable(ad,{
__index=function(ae,af:string)
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

DropdownFrame=Color3.fromRGB(120,120,120),
DropdownHolder=Color3.fromRGB(35,35,35),
DropdownBorder=Color3.fromRGB(25,25,25),

Dialog=Color3.fromRGB(35,35,35),
DialogHolder=Color3.fromRGB(25,25,25),
DialogHolderLine=Color3.fromRGB(20,20,20),
DialogButton=Color3.fromRGB(35,35,35),
DialogButtonBorder=Color3.fromRGB(55,55,55),
DialogBorder=Color3.fromRGB(50,50,50),
DialogInput=Color3.fromRGB(45,45,45),
DialogInputLine=Color3.fromRGB(120,120,120)
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
if not readfile then return"Cyber"end
local ae,af=pcall(readfile,ad)
return ae and af or"Cyber"
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
Title=ag and"FSSHUB 👑 | "..ah or"FSSHUB | "..ah,
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


local function Toggle(aj,e,f,g,h,i)
local j={Title=f,Default=g,Callback=h or function()end}
local k=aj:AddToggle(e,j)


if ag then

local l=i or Enum.KeyCode.Unknown
k:Keybind("Key_"..e,
{Title="Key",Default=l,Mode="Toggle",Callback=function()end,ChangedCallback=function()end})
end
return k
end


task.wait(0.05)
local aj={}

aj.Home=ai:Tab{Title="Dashboard",Icon="home"}


aj.Home:AddParagraph("Welcome",{
Title=ag and"Welcome, Premium User! 👑"or"Welcome to FSSHub",
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
Callback=function(e)
local f=false
if ae.Options.Speed and ae.Options.Speed.Value then f=ae.Options.Speed.Value end
af:Emit("toggle_speed",f,e)
end
})

Toggle(aj.Movement,"Speed","Walk Speed",false,
function(e)
local f=16
if ae.Options.SpeedVal and ae.Options.SpeedVal.Value then f=ae.Options.SpeedVal.Value end
af:Emit("toggle_speed",e,f)
end)

aj.Movement:AddSlider("JumpVal",
{
Title="Value",
Default=50,
Min=50,
Max=500,
Callback=function(e)
local f=false
if ae.Options.Jump and ae.Options.Jump.Value then f=ae.Options.Jump.Value end
af:Emit("toggle_jump",f,e)
end
})

Toggle(aj.Movement,"Jump","Jump Power",false,
function(e)
local f=50
if ae.Options.JumpVal and ae.Options.JumpVal.Value then f=ae.Options.JumpVal.Value end
af:Emit("toggle_jump",e,f)
end)

if ag then
aj.Movement:AddParagraph("Prem",{Title="Premium",Content="Fly & Noclip unlocked"})
Toggle(aj.Movement,"Fly","Fly Mode",false,function(e)af:Emit("toggle_fly",e)end,Enum.KeyCode.F)
Toggle(aj.Movement,"Noclip","Noclip",false,function(e)af:Emit("toggle_noclip",e)end)
end

task.wait(0.02)

aj.Visual=ai:Tab{Title="Visual",Icon="eye"}

Toggle(aj.Visual,"ESP","Enable ESP",false,function(e)af:Emit("toggle_esp",e)end,Enum.KeyCode.E)
Toggle(aj.Visual,"Fullbright","Fullbright",false,function(e)af:Emit("toggle_fullbright",e)end)

task.wait(0.02)

aj.Utility=ai:Tab{Title="Utility",Icon="wrench"}
aj.Utility:AddButton{Title="Rejoin Server",Callback=function()af:Emit"action_rejoin"end}

aj.Player=ai:Tab{Title="Player",Icon="user"}
aj.Player:AddButton{Title="Reset Character",Callback=function()af:Emit"action_reset"end}

task.wait(0.02)

aj.Settings=ai:Tab{Title="Settings",Icon="settings"}
aj.Settings:AddDropdown("Theme",
{Title="Theme",Values=ae.Themes,Default=ae.Theme,Callback=function(e)ae:SetTheme(e)end})

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
if ag then local
ai, aj=loadstring(ah)
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


task.defer(function()
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