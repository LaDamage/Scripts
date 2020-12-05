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
local main = Orion:CreateOrion("Orion | Science Simulator")

local farming = main:CreateSection("Farming")
local pets = main:CreateSection("Egg Open")
local settings = main:CreateSection("Settings")

--// Farming Tab Setup
farming:Dropdown("Rebirth Selected", {"1 Rebirth", "5 Rebirths", "25 Rebirths", "100 Rebirths", "500 Rebirths", "10k Rebirths", "80k Rebirths", "200k Rebirths", "400k Rebirths", "2M Rebirths", "4M Rebirths", "15M Rebirths", "75M Rebirths"}, function(RebOption)
    if RebOption == "1 Rebirth" then
        _G.SRebirth = 0
    elseif RebOption == "5 Rebirths" then
        _G.SRebirth = 1
    elseif RebOption == "25 Rebirths" then
        _G.SRebirth = 2
    elseif RebOption == "100 Rebirths" then
        _G.SRebirth = 3
    elseif RebOption == "500 Rebirths" then
        _G.SRebirth = 4
    elseif RebOption == "10k Rebirths" then
        _G.SRebirth = 5
    elseif RebOption == "80k Rebirths" then
        _G.SRebirth = 6
    elseif RebOption == "200k Rebirths" then
        _G.SRebirth = 7
    elseif RebOption == "400k Rebirths" then
        _G.SRebirth = 8
    elseif RebOption == "2M Rebirths" then
        _G.SRebirth = 9
    elseif RebOption == "4M Rebirths" then
        _G.SRebirth = 10
    elseif RebOption == "15M Rebirths" then
        _G.SRebirth = 11
    elseif RebOption == "75M Rebirths" then
        _G.SRebirth = 12
    end
end)
farming:Toggle("Auto Click", function(ClickState)
    if ClickState then
        _G.Click = true
    else
        _G.Click = false
    end
end)
farming:Toggle("Auto Rebirth", function(RebirthState)
    if RebirthState then
        _G.autorebirth = true
    else
        _G.autorebirth = false
    end
end)

--// Egg Open Tab Setup
pets:Dropdown("Egg Selected", {"Common Egg", "Altar Egg", "Faded Egg", "Frosty Egg", "Event Egg"}, function(Option)
    if Option == "Common Egg" then
        _G.SEGG = "Common Egg"
    elseif Option == "Altar Egg" then
        _G.SEGG = "Altar Egg"
    elseif Option == "Faded Egg" then
        _G.SEGG = "Faded Egg"
    elseif Option == "Frosty Egg" then
        _G.SEGG = "Frosty Egg"
    elseif Option == "Event Egg" then
        _G.SEGG = "Event Egg"
    end
end)
pets:Toggle("Auto Open 1 Egg", function(EggState)
    if EggState then
        _G.eggyopen = true
    else
        _G.eggyopen = false
    end
end)
pets:Toggle("Auto Open 3 Eggs (Gamepass)", function(Egg3State)
    if Egg3State then
        _G.eggy3open = true
    else
        _G.eggy3open = false
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
        if _G.Click then
            game:GetService("ReplicatedStorage").Remotes.Events["eb5ddfd4-0a1a-47d4-85db-c3130fb856a4"]:FireServer()
        end
    end
end)
spawn(function()
    while wait(.5) do
        if _G.autorebirth then
            local args = {
                [1] = _G.SRebirth
            }
            
            game:GetService("ReplicatedStorage").Remotes.Events["87cc8504-5969-4dff-b0cc-f0c1297e0b35"]:FireServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.eggyopen then
            local args = {
                [1] = {
                    ["eggName"] = _G.SEGG,
                    ["purchaseAmount"] = 1
                }
            }
            
            game:GetService("ReplicatedStorage").Remotes.Functions["e32eab1b-1ba1-4c85-898e-0a1f140f85d7"]:InvokeServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.eggy3open then
            local args = {
                [1] = {
                    ["eggName"] = _G.SEGG,
                    ["purchaseAmount"] = 3
                }
            }
            
            game:GetService("ReplicatedStorage").Remotes.Functions["e32eab1b-1ba1-4c85-898e-0a1f140f85d7"]:InvokeServer(unpack(args))
        end
    end
end)

--// Anti Afk
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
