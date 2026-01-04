if not _G.NEVERWIN_AUTH then return end

local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera

local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.Parent = game.CoreGui

local scale = Instance.new("UIScale", gui)
local function updateScale()
	scale.Scale = math.clamp(Camera.ViewportSize.X / 1400, 0.7, 1)
end
updateScale()
Camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)

local main = Instance.new("Frame", gui)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.fromScale(0.5, 0.5)
main.Size = UDim2.fromScale(0.92, 0.88)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
main.BorderSizePixel = 0
main.BackgroundTransparency = 1
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 18)

-- Fade in hub
TweenService:Create(main, TweenInfo.new(0.4), {
	BackgroundTransparency = 0
}):Play()

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

local scroll = Instance.new("ScrollingFrame", main)
scroll.AnchorPoint = Vector2.new(0.5, 0)
scroll.Position = UDim2.fromScale(0.5, 0.14)
scroll.Size = UDim2.fromScale(0.95, 0.82)
scroll.BackgroundTransparency = 1
scroll.ScrollBarImageTransparency = 0.4

local grid = Instance.new("UIGridLayout", scroll)
grid.CellPadding = UDim2.fromScale(0.03, 0.04)
grid.CellSize = UDim2.fromScale(0.44, 0.3)
grid.HorizontalAlignment = Center

grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scroll.CanvasSize = UDim2.new(0, 0, 0, grid.AbsoluteContentSize.Y + 20)
end)

local function card(name, url)
	local f = Instance.new("Frame", scroll)
	f.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
	f.BorderSizePixel = 0
	f.BackgroundTransparency = 1
	Instance.new("UICorner", f).CornerRadius = UDim.new(0, 14)

	local t = Instance.new("TextLabel", f)
	t.AnchorPoint = Vector2.new(0.5, 0)
	t.Position = UDim2.fromScale(0.5, 0.12)
	t.Size = UDim2.fromScale(0.9, 0.25)
	t.Text = name
	t.Font = Enum.Font.GothamMedium
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

	-- Card pop-in
	TweenService:Create(f, TweenInfo.new(0.35), {
		BackgroundTransparency = 0
	}):Play()

	run.MouseButton1Click:Connect(function()
		TweenService:Create(run, TweenInfo.new(0.1), {
			Size = run.Size * 0.95
		}):Play()
		task.wait(0.1)
		TweenService:Create(run, TweenInfo.new(0.1), {
			Size = run.Size / 0.95
		}):Play()
		loadstring(game:HttpGet(url))()
	end)
end

card("Arsenal", "https://your-script.lua")
card("Blox Fruits", "https://your-script.lua")
card("Universal", "https://your-script.lua")
