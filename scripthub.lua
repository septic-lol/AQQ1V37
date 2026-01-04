-- NEVERWIN Script Hub (Modern UI)

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local Player = Players.LocalPlayer

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "NeverwinHub"
gui.Parent = game.CoreGui

-- Scale for mobile/pc
local scale = Instance.new("UIScale", gui)
scale.Scale = UIS.TouchEnabled and 0.9 or 1

-- Main Frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 650, 0, 420)
main.Position = UDim2.new(0.5, -325, 0.5, -210)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
main.BorderSizePixel = 0
main.AnchorPoint = Vector2.new(0.5, 0.5)

-- Corner
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -20, 0, 50)
title.Position = UDim2.new(0, 10, 0, 10)
title.Text = "NEVERWIN Script Hub"
title.TextColor3 = Color3.fromRGB(170, 120, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextXAlignment = Left

-- Scroll Area
local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1, -20, 1, -80)
scroll.Position = UDim2.new(0, 10, 0, 65)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarImageTransparency = 0.4
scroll.BackgroundTransparency = 1

-- Grid Layout
local grid = Instance.new("UIGridLayout", scroll)
grid.CellSize = UDim2.new(0, 170, 0, 200)
grid.CellPadding = UDim2.new(0, 15, 0, 15)
grid.HorizontalAlignment = Center

-- Auto resize canvas
grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scroll.CanvasSize = UDim2.new(0, 0, 0, grid.AbsoluteContentSize.Y + 20)
end)

-- GAME CARD FUNCTION
local function createGameCard(name, scriptUrl)
	local card = Instance.new("Frame", scroll)
	card.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
	card.BorderSizePixel = 0

	Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)

	-- Game Icon (placeholder)
	local icon = Instance.new("Frame", card)
	icon.Size = UDim2.new(1, -20, 0, 90)
	icon.Position = UDim2.new(0, 10, 0, 10)
	icon.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
	Instance.new("UICorner", icon).CornerRadius = UDim.new(0, 8)

	-- Game Name
	local label = Instance.new("TextLabel", card)
	label.Size = UDim2.new(1, -20, 0, 30)
	label.Position = UDim2.new(0, 10, 0, 110)
	label.Text = name
	label.TextWrapped = true
	label.TextColor3 = Color3.new(1, 1, 1)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamSemibold
	label.TextSize = 14

	-- Run Button
	local run = Instance.new("TextButton", card)
	run.Size = UDim2.new(1, -20, 0, 35)
	run.Position = UDim2.new(0, 10, 1, -45)
	run.Text = "RUN"
	run.BackgroundColor3 = Color3.fromRGB(120, 80, 200)
	run.TextColor3 = Color3.new(1, 1, 1)
	run.Font = Enum.Font.GothamBold
	run.TextSize = 14
	Instance.new("UICorner", run).CornerRadius = UDim.new(0, 8)

	run.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(scriptUrl))()
	end)
end

-- 🔥 ADD YOUR GAMES HERE
createGameCard("Arsenal", "https://your-arsenal-script.lua")
createGameCard("Blox Fruits", "https://your-bloxfruits-script.lua")
createGameCard("Pet Simulator", "https://your-petsim-script.lua")
createGameCard("Universal", "https://your-universal-script.lua")
