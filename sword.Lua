--[[ 2025/2/10 
⠀⠀⠀⠀⠀⠀
░██████╗░█████╗░███╗░░██╗
██╔════╝██╔══██╗████╗░██║
╚█████╗░██║░░╚═╝██╔██╗██║
░╚═══██╗██║░░██╗██║╚████║
██████╔╝╚█████╔╝██║░╚███║
╚═════╝░░╚════╝░╚═╝░░╚══╝
]]



local TeleportService = game:GetService("TeleportService")
local SetClipboard = setclipboard or toclipboard or (Clipboard and Clipboard.set)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SCN_HUB_NOTICE"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = game:GetService("CoreGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 430, 0, 220)
Main.Position = UDim2.new(0.5, -215, 0.5, -110)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(50, 50, 50)
Stroke.Thickness = 1.5
Stroke.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundTransparency = 1
Title.Text = "⚠ تم تعطيل السكربت"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.Parent = Main

local Text = Instance.new("TextLabel")
Text.Size = UDim2.new(1, -30, 0, 80)
Text.Position = UDim2.new(0, 15, 0, 55)
Text.BackgroundTransparency = 1
Text.TextWrapped = true
Text.Text = "انضم إلى قناة التليجرام لمعرفة آخر الأخبار والتحديثات الخاصة بالسكربتات."
Text.TextColor3 = Color3.fromRGB(190,190,190)
Text.Font = Enum.Font.Gotham
Text.TextScaled = true
Text.Parent = Main

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.8, 0, 0, 45)
Button.Position = UDim2.new(0.1, 0, 1, -60)
Button.BackgroundColor3 = Color3.fromRGB(35,35,35)
Button.Text = "نسخ رابط قناة التليجرام"
Button.TextColor3 = Color3.new(1,1,1)
Button.Font = Enum.Font.GothamBold
Button.TextScaled = true
Button.Parent = Main

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0,10)
ButtonCorner.Parent = Button

Button.MouseButton1Click:Connect(function()
	if SetClipboard then
		SetClipboard("https://t.me/scn_hub")
		Button.Text = "✓ تم نسخ الرابط"
	else
		Button.Text = "المشغل لا يدعم النسخ"
	end
end)
