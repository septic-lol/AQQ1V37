if not _G.NEVERWIN_AUTH then return end

local UIS = game:GetService("UserInputService")
local gui = Instance.new("ScreenGui", game.CoreGui)

local scale = Instance.new("UIScale", gui)
scale.Scale = UIS.TouchEnabled and 0.8 or 1

local main = Instance.new("Frame", gui)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.Size = UIS.TouchEnabled and UDim2.new(0.95, 0, 0.85, 0) or UDim2.new(0, 700, 0, 450)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -20, 0, 50)
title.Position = UDim2.new(0, 10, 0, 10)
title.Text = "NEVERWIN SCRIPT HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(170, 120, 255)
title.BackgroundTransparency = 1
title.TextXAlignment = Left

local scroll = Instance.new("ScrollingFrame", main)
scroll.Position = UDim2.new(0, 10, 0, 70)
scroll.Size = UDim2.new(1, -20, 1, -80)
scroll.CanvasSize = UDim2.new()
scroll.ScrollBarImageTransparency = 0.4
scroll.BackgroundTransparency = 1

local grid = Instance.new("UIGridLayout", scroll)
grid.CellPadding = UDim2.new(0, 14, 0, 14)
grid.CellSize = UIS.TouchEnabled
	and UDim2.new(0.45, 0, 0, 190)
	or UDim2.new(0, 180, 0, 200)

grid.HorizontalAlignment = Center
grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scroll.CanvasSize = UDim2.new(0, 0, 0, grid.AbsoluteContentSize.Y + 20)
end)

local function card(name, url)
	local f = Instance.new("Frame", scroll)
	f.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
	f.BorderSizePixel = 0
	Instance.new("UICorner", f).CornerRadius = UDim.new(0, 12)

	local t = Instance.new("TextLabel", f)
	t.Size = UDim2.new(1, -20, 0, 40)
	t.Position = UDim2.new(0, 10, 0, 15)
	t.Text = name
	t.Font = Enum.Font.GothamSemibold
	t.TextSize = 16
	t.TextWrapped = true
	t.TextColor3 = Color3.new(1,1,1)
	t.BackgroundTransparency = 1

	local run = Instance.new("TextButton", f)
	run.Size = UDim2.new(1, -20, 0, 36)
	run.Position = UDim2.new(0, 10, 1, -46)
	run.Text = "RUN"
	run.Font = Enum.Font.GothamBold
	run.TextSize = 14
	run.TextColor3 = Color3.new(1,1,1)
	run.BackgroundColor3 = Color3.fromRGB(120, 80, 200)
	Instance.new("UICorner", run).CornerRadius = UDim.new(0, 10)

	run.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(url))()
	end)
end

-- ADD SCRIPTS
card("Arsenal", "https://your-script.lua")
card("Blox Fruits", "https://your-script.lua")
card("Universal", "https://your-script.lua")
