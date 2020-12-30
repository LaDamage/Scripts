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

local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/LaDamage/Orion/main/UILibrary"))()


--// UI Setup
local main = Orion:CreateOrion("Orion | Ninja Legends 2")

local farming = main:CreateSection("Farming")
local autoBuy = main:CreateSection("Auto Buy")
local pets = main:CreateSection("Pets")
local settings = main:CreateSection("Settings")

farming:Toggle("Auto Swing", function(SwingState)
    if SwingState then
        _G.Swing = true
    else
        _G.Swing = false
    end
end)

farming:TextLabel("Auto Sell Soon!")

autoBuy:Toggle("Buy Swords", function(SwordState)
    if SwordState then
        _G.Swords = true
    else
        _G.Swords = false
    end
end)

autoBuy:Toggle("Buy Crystals", function(CrystalState)
    if CrystalState then
        _G.Crystals = true
    else
        _G.Crystals = false
    end
end)

autoBuy:Toggle("Buy Powers", function(PowerState)
    if PowerState then
        _G.Powers = true
    else
        _G.Powers = false
    end
end)

pets:TextLabel("Coming Soon!")

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
    while wait(.5) do
        if _G.Swing then
            local args = {
                [1] = "swingBlade"
            }
            
            game:GetService("Players").LocalPlayer.saberEvent:FireServer(unpack(args))
        end
    end
end)

spawn(function()
    while wait(1) do
        if _G.Swords then
            local args = {
                [1] = "buyAllItems",
                [2] = {
                    ["whichItems"] = "Swords",
                    ["whichPlanet"] = "Planet Elemental"
                }
            }
            
            game:GetService("Players").LocalPlayer.saberEvent:FireServer(unpack(args))
        end
    end
end)

spawn(function()
    while wait(1) do
        if _G.Crystals then
            local args = {
                [1] = "buyAllItems",
                [2] = {
                    ["whichItems"] = "Crystals",
                    ["whichPlanet"] = "Planet Elemental"
                }
            }
            
            game:GetService("Players").LocalPlayer.saberEvent:FireServer(unpack(args))
        end
    end
end)

spawn(function()
    while wait(1) do
        if _G.Powers then
            local args = {
                [1] = "buyAllItems",
                [2] = {
                    ["whichItems"] = "Powers",
                    ["whichPlanet"] = "Planet Elemental"
                }
            }
            
            game:GetService("Players").LocalPlayer.saberEvent:FireServer(unpack(args))
        end
    end
end)

--// Anti Afk
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
