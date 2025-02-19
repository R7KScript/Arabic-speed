-- لا تسرق ال GUI رجاءء
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.4, 0, 0.3, 0)
frame.Position = UDim2.new(0.3, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.1, 0)
uiCorner.Parent = frame

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0.15, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
titleBar.Parent = frame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0.1, 0)
titleCorner.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🚫 تنبيه هام!"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = titleBar

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, -20, 0.6, 0)
textLabel.Position = UDim2.new(0, 10, 0.2, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "⚠️ تم تعطيل السكربت.\nيرجى التواصل مع المطوّر للحصول على الإصدار الجديد:\n📌 تيليجرام: @D4DDZ\n📌 تيك توك: uvon"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextScaled = true
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextWrapped = true
textLabel.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.15, 0, 0.5, 0)
closeButton.Position = UDim2.new(0.825, 0, 0.25, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0.5, 0)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
