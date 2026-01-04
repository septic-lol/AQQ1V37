local ScreenGui = Instance.new("ScreenGui", game.CoreGui)

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 520, 0, 360)
Frame.Position = UDim2.new(0.5, -260, 0.5, -180)
Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
Frame.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "EVEX Script Hub"
Title.TextColor3 = Color3.fromRGB(180, 120, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22

local function createButton(text, y, url)
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(0, 420, 0, 40)
    btn.Position = UDim2.new(0.5, -210, 0, y)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14

    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(url))()
    end)
end

-- ADD YOUR SCRIPTS HERE
createButton("Arsenal", 70, "https://your-script-link.lua")
createButton("Blox Fruits", 120, "https://your-script-link.lua")
createButton("Universal", 170, "https://your-script-link.lua")
