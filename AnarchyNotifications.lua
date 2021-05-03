if game.CoreGui:FindFirstChild("AnarchyNotification") then
	game.CoreGui:FindFirstChild("AnarchyNotification"):Destroy()
end

local Anarchy = {}
local AnarchyNotification = Instance.new("ScreenGui")
AnarchyNotification.Name = "AnarchyNotification"
AnarchyNotification.Parent = game.CoreGui
AnarchyNotification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local NotificationHolder = Instance.new("ScrollingFrame")
NotificationHolder.Name = "NotificationHolder"
NotificationHolder.Parent = AnarchyNotification
NotificationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotificationHolder.BackgroundTransparency = 1.000
NotificationHolder.BorderSizePixel = 0
NotificationHolder.Position = UDim2.new(0.85, 0, 0.87, 0)
NotificationHolder.Size = UDim2.new(0, 250, 0, 205)
NotificationHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
NotificationHolder.ScrollBarThickness = 0
NotificationHolder.ScrollingEnabled = false
NotificationHolder.BottomImage = ""
NotificationHolder.MidImage = ""
NotificationHolder.TopImage = ""

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = NotificationHolder
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout.Padding = UDim.new(0, 5)

function tick(element, time)
	element:FindFirstChild("Line"):TweenSize(UDim2.new(0, 250,0, 1), "Out", "Linear", time)
	wait(time)
	element.Parent:TweenSize(UDim2.new(0, 250,0, 0), "Out", "Quint", 1.5)
	wait(1)
	element.Parent:Destroy()
end


function Anarchy:Notification(title, message, duration, color)
	if title == nil then
		title = "Anarchy Notifications"
	end
	if message == nil then
		message = "Error: No message"
	end
	if duration == nil then
		duration = 5
	end
	if color == nil then
		color = Color3.fromRGB(153, 0, 255)
	end
	
	local Window = Instance.new("Frame")
	Window.Name = "Window"
	Window.Parent = NotificationHolder
	Window.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
	Window.ClipsDescendants = true
	Window.Size = UDim2.new(0, 250, 0, 100)

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Window

	local Line = Instance.new("Frame")
	Line.Name = "Line"
	Line.Parent = Window
	Line.BackgroundColor3 = Color3.fromRGB(153, 0, 255)
	Line.ClipsDescendants = true
	Line.Position = UDim2.new(0, 0, 0.970000029, 0)
	Line.Size = UDim2.new(0, 0, 0, 3)

	local UICorner_2 = Instance.new("UICorner")
	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = Line

	local MessageHolder = Instance.new("Frame")
	MessageHolder.Name = "MessageHolder"
	MessageHolder.Parent = Window
	MessageHolder.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
	MessageHolder.ClipsDescendants = true
	MessageHolder.Size = UDim2.new(0, 250, 0, 97)

	local UICorner_3 = Instance.new("UICorner")
	UICorner_3.CornerRadius = UDim.new(0, 4)
	UICorner_3.Parent = MessageHolder

	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.Parent = MessageHolder
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0, 0, 0.0412371121, 0)
	Title.Size = UDim2.new(0, 250, 0, 26)
	Title.Font = Enum.Font.GothamBold
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 20.000

	local Message = Instance.new("TextLabel")
	Message.Name = "Message"
	Message.Parent = MessageHolder
	Message.BackgroundColor3 = Color3.fromRGB(231, 231, 231)
	Message.BackgroundTransparency = 1.000
	Message.Position = UDim2.new(0, 0, 0.381443292, 0)
	Message.Size = UDim2.new(0, 250, 0, 60)
	Message.Font = Enum.Font.GothamSemibold
	Message.Text = message
	Message.TextColor3 = Color3.fromRGB(255, 255, 255)
	Message.TextSize = 18.000
	Message.TextYAlignment = Enum.TextYAlignment.Top
	
	coroutine.wrap(tick)(Window, duration)
end
return Anarchy
