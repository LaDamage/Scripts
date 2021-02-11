--// Variables
local VU = game:GetService("VirtualUser")

local AntiAFK = Instance.new("ScreenGui")
local Timer = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local Info = Instance.new("ImageLabel")
local TextButton = Instance.new("TextButton")
local NumberValue = Instance.new("NumberValue")

--// User Interface
AntiAFK.Name = "AntiAFK"
AntiAFK.Parent = game.CoreGui
AntiAFK.IgnoreGuiInset = true

Timer.Name = "Timer"
Timer.Parent = AntiAFK
Timer.AnchorPoint = Vector2.new(0.5, 0.5)
Timer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Timer.BackgroundTransparency = 1.000
Timer.Position = UDim2.new(0.94, 0, 0.02, 0)
Timer.Size = UDim2.new(0, 115, 0, 32)
Timer.Image = "rbxassetid://3570695787"
Timer.ImageColor3 = Color3.fromRGB(0, 0, 0)
Timer.ImageTransparency = 0.455
Timer.ScaleType = Enum.ScaleType.Slice
Timer.SliceCenter = Rect.new(100, 100, 100, 100)
Timer.SliceScale = 0.080

TextLabel.Parent = Timer
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.Text = "00:00:00"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 22.000

NumberValue.Parent = Timer
NumberValue.Name = "Time"

--// Functions
local function AntiAFK_Handler()
	local script = Instance.new('LocalScript', AntiAFK)

	local Time = script.Parent.Timer.Time
	local Label = script.Parent.Timer.TextLabel
	
	local function ToHMS(s)
		return ("%02i:%02i:%02i"):format(s/60^2,s/60%60,s%60)
	end
	local function AddTime()
		Time.Value = Time.Value + 1
	end
	
	while wait(1) do
		Label.Text = ToHMS(Time.Value)
		AddTime()
	end
end
coroutine.wrap(AntiAFK_Handler)()

--// Anti AFK
local VU = game:GetService("VirtualUser")
game:service'Players'.LocalPlayer.Idled:connect(function()
    VU:CaptureController()
    VU:ClickButton2(Vector2.new())
end)
