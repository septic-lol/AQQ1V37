if not _G.NEVERWIN_AUTH then return end

local Camera = workspace.CurrentCamera
local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.Parent = game.CoreGui

-- Dynamic scale
local scale = Instance.new("UIScale", gui)
local function updateScale()
	local size = Camera.ViewportSize
	scale.Scale = math.clamp(size.X / 1400, 0.7, 1)
end
updateScale()
Camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)

-- Main hub
local main = Instance.new("Frame", gui)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.fromScale(0.5, 0.5)
main.Size = UDim2.fromScale(0.92, 0.88)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 18)

-- Title
local title = Instance.new("TextLabel", main)
title.AnchorPoint = Vector2.new(0.5, 0)
title.Position = UDim2.fromScale(0.5, 0.03)
title.Size = UDim2.fromScale(0.95, 0.08)
title.Text = "NEVERWIN SCRIPT HUB"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(170, 120, 255)
title.BackgroundTransparency = 1
title.TextXAlignment = Left

-- Scroll
local scroll = Instance.new("ScrollingFrame", main)
scroll.AnchorPoint = Vector2.new(0.5, 0)
scroll.Position = UDim2.fromScale(0.5, 0.14)
scroll.Size = UDim2.fromScale(0.95, 0.82)
scroll.CanvasSize = UDim2.new()
scroll.ScrollBarImageTransparency = 0.4
scroll.BackgroundTransparency = 1

local grid = Instance.new("UIGridLayout", scroll)
grid.HorizontalAlignment = Center
grid.CellPadding = UDim2.fromScale(0.03, 0.04)
grid.CellSize = UDim2.fromScale(0.44, 0.3)

grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scroll.CanvasSize = UDim2.new(0, 0, 0, grid.AbsoluteContentSize.Y + 20)
end)

-- Cards
local function card(name, url)
	local f = Instance.new("Frame", scroll)
	f.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
	f.BorderSizePixel = 0
	Instance.new("UICorner", f).CornerRadius = UDim.new(0, 14)

	local t = Instance.new("TextLabel", f)
	t.AnchorPoint = Vector2.new(0.5, 0)
	t.Position = UDim2.fromScale(0.5, 0.12)
	t.Size = UDim2.fromScale(0.9, 0.25)
	t.Text = name
	t.Font = Enum.Font.GothamSemibold
	t.TextScaled = true
	t.TextWrapped = true
	t.TextColor3 = Color3.new(1,1,1)
	t.BackgroundTransparency = 1

	local run = Instance.new("TextButton", f)
	run.AnchorPoint = Vector2.new(0.5, 1)
	run.Position = UDim2.fromScale(0.5, 0.92)
	run.Size = UDim2.fromScale(0.85, 0.22)
	run.Text = "RUN"
	run.Font = Enum.Font.GothamBold
	run.TextScaled = true
	run.TextColor3 = Color3.new(1,1,1)
	run.BackgroundColor3 = Color3.fromRGB(120, 80, 200)
	Instance.new("UICorner", run).CornerRadius = UDim.new(0, 12)

	run.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(url))()
	end)
end

-- Add scripts
card("Arsenal", "https://your-script.lua")
card("Blox Fruits", "https://your-script.lua")
card("Universal", "https://your-script.lua")
