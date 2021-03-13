--// UI Detection
local OrionUI = game:GetService("CoreGui"):FindFirstChild("ScreenGui")
if OrionUI then 
    OrionUI:Destroy()
end

--// Setup Variables
local plr = game.Players.LocalPlayer
local WalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local JumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")

local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/OrionLibrary/Orion/main/source.lua"))()


--// UI Setup
local main = Orion:CreateOrion("Orion | Pet Swarm Simulator")

local farming = main:CreateSection("Farming")
local egghatch = main:CreateSection("Egg Hatching")
local settings = main:CreateSection("Settings")

farming:Dropdown("Selected Zone", {"The Commons", "Ancient Desert", "Frozen Valley", "Crystal Swamp", "Cloudy Islands", "The Underworld", "Atlantis"}, function(Option)
    if Option == "The Commons" then
        _G.SZone = "Zone1"
    elseif Option == "Ancient Desert" then
        _G.SZone = "Zone2"
    elseif Option == "Frozen Valley" then
        _G.SZone = "Zone3"
    elseif Option == "Crystal Swamp" then
        _G.SZone = "Zone4"
    elseif Option == "Cloudy Islands" then
        _G.SZone = "Zone5"
    elseif Option == "The Underworld" then
        _G.SZone = "Zone6"
    elseif Option == "Atlantis" then
        _G.SZone = "Zone7"
    end
end)

farming:Toggle("Auto Farm Food", function(FoodState)
    if FoodState then
        _G.Food = true
    else
        _G.Food = false
    end
end)

egghatch:TextBox("Egg Tier", "Value..", function(TierState)
    _G.STier = TierState
end)

egghatch:TextButton("Place", "Place Eggs", function()
    for i = 1, 9 do
        local A_1 = _G.STier
        local A_2 = tostring(i)
        local Event = game:GetService("ReplicatedStorage").Remotes.Events.PlantEggEvent
        Event:FireServer(A_1, A_2)
    end
end)

egghatch:Toggle("Auto Hatch Eggs", function(HatchState)
    if HatchState then
        _G.Hatched = true
    else
        _G.Hatched = false
    end
end)

egghatch:TextLabel("Miscellaneous")

egghatch:TextButton("Toggle", "Toggle Egg Animation", function()
    if game:GetService("Players").LordHeawin.PlayerGui.EggOpening.Frame.Visible == true then
        game:GetService("Players").LordHeawin.PlayerGui.EggOpening.Frame.Visible = false
    else
        game:GetService("Players").LordHeawin.PlayerGui.EggOpening.Frame.Visible = true
    end
end)

--// Settings Tab Setup
settings:Slider("WalkSpeed", WalkSpeed, 150, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
settings:Slider("JumpPower", JumpPower, 250, function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)
settings:KeyBind("Toggle UI", Enum.KeyCode.LeftAlt, function()
    if game:GetService("CoreGui").ScreenGui.Enabled == true then
        game:GetService("CoreGui").ScreenGui.Enabled = false
    else
        game:GetService("CoreGui").ScreenGui.Enabled = true
    end
end)
settings:TextButton("Destroy", "Destroy the UI", function()
    game:GetService("CoreGui"):FindFirstChild("ScreenGui"):Destroy()
end)

--// Functions
spawn(function()
    while wait() do
        if _G.Food then
            for _, Food in pairs(game:GetService("Workspace").Zones[_G.SZone].FoodSpawns:GetChildren())do
				local A_1 = "CollectFood"
				local A_2 = Food
				for _, Pets in pairs(game:GetService("Workspace")[plr.Name].Pets:GetChildren())do
					local A_3 = Pets
					local Event = game:GetService("ReplicatedStorage").Remotes.Functions.CollectionRF
					Event:InvokeServer(A_1, A_2, A_3)
				end
			end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.Hatched then
            game:GetService("ReplicatedStorage").Remotes.Events.HatchEggEvent:FireServer()
        end
    end
end)

--// Anti Afk
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
