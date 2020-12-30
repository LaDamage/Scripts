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

farming:Toggle("Auto Sell", function(SellState)
    if SellState then
        _G.Sell = true
    else
        _G.Sell = false
    end
end)

farming:TextLabel("Teleports")
farming:Dropdown("Select Planet",
{"Ground", "Secret Island", "Planet Zephyr (1)", "Planet Inferno (2)", "Planet Omega (3)", "Planet Elemental (4)"},
function(TpOption)
    if TpOption == "Ground" then
        game.Workspace[plr.Name].HumanoidRootPart.CFrame = CFrame.new(-2, 113, 158)
    elseif TpOption == "Secret Island" then
        game.Workspace[plr.Name].HumanoidRootPart.CFrame = CFrame.new(2377, 132, 992)
    elseif TpOption == "Planet Zephyr (1)" then
        game.Workspace[plr.Name].HumanoidRootPart.CFrame = CFrame.new(9, 1467, 70)
    elseif TpOption == "Planet Inferno (2)" then
        game.Workspace[plr.Name].HumanoidRootPart.CFrame = CFrame.new(4, 3057, 99)
    elseif TpOption == "Planet Omega (3)" then
        game.Workspace[plr.Name].HumanoidRootPart.CFrame = CFrame.new(4, 4681, 99)
    elseif TpOption == "Planet Elemental (4)" then 
        game.Workspace[plr.Name].HumanoidRootPart.CFrame = CFrame.new(62, 6311, 101)
    end
end)

farming:Dropdown("Select Training Area",
{"Ancient Master Blade", "Soul Fusion Arena", "Forgotton Sanctuary"},
function(TpOption)
    if TpOption == "Ancient Master Blade" then
        game.Workspace[plr.Name].HumanoidRootPart.CFrame = CFrame.new(-228, 130, 352)
    elseif TpOption == "Soul Fusion Arena" then 
        game.Workspace[plr.Name].HumanoidRootPart.CFrame = CFrame.new(310, 170, -191)
    elseif TpOption == "Forgotton Sanctuary" then 
        game.Workspace[plr.Name].HumanoidRootPart.CFrame = CFrame.new(1152, 6272, 861)
    end
end)


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

pets:Dropdown("Select Egg",
{"Electro Orb", "Astral Orb", "Sky Tempest Orb", "Mystic Fusion Orb", "Dark Supernova Orb", "Omega Genesis Orb", "Secret Shadows Orb", "Forgotten Legends Orb"},
function(EggOption)
    if EggOption == "Electro Orb" then
        _G.SEGG = "Electro Orb"
    elseif EggOption == "Astral Orb" then
        _G.SEGG = "Astral Orb"
    elseif EggOption == "Sky Tempest Orb" then
        _G.SEGG = "Sky Tempest Orb"
    elseif EggOption == "Mystic Fusion Orb" then
        _G.SEGG = "Mystic Fusion Orb"
    elseif EggOption == "Dark Supernova Orb" then
        _G.SEGG = "Dark Supernova Orb"
    elseif EggOption == "Omega Genesis Orb" then
        _G.SEGG = "Omega Genesis Orb"
    elseif EggOption == "Secret Shadows Orb" then
        _G.SEGG = "Secret Shadows Orb"
    elseif EggOption == "Forgotten Legends Orb" then
        _G.SEGG = "Forgotten Legends Orb"
    end
end)

pets:Toggle("Auto Evolve", function(EvolveState)
    if EvolveState then
        _G.Evolve = true
    else
        _G.Evolve = false
    end
end)
pets:Toggle("Open 1 Egg", function(E1State)
    if E1State then
        _G.E1 = true
    else
        _G.E1 = false
    end
end)
pets:Toggle("Open 3 Eggs", function(E3State)
    if E3State then
        _G.E3 = true
    else
        _G.E3 = false
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
    while wait(.5) do
        if _G.Sell then
            for _, v in pairs(game:GetService("Workspace").sellAreaCircles:GetChildren()) do
                if v.whichPlanet.Value == "Planet Elemental" then
                    v.circleInner.CFrame = game.Workspace[plr.Name].HumanoidRootPart.CFrame
                    wait(.1)
                    v.circleInner.CFrame = CFrame.new(-75.0282364, 6314.25, 138.325836)
                end
            end
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

spawn(function()
    while wait(1) do
        if _G.E1 then
        local args = {
            [1] = "openOrb",
            [2] = workspace.petOrbs[_G.SEGG]
        }

        game:GetService("ReplicatedStorage").rEvents.openOrbRemote:InvokeServer(unpack(args))
        end
    end
end)

spawn(function()
    while wait(1) do
        if _G.E3 then
        local args = {
            [1] = "openOrb",
            [2] = workspace.petOrbs[_G.SEGG],
            [3] = true
        }

        game:GetService("ReplicatedStorage").rEvents.openOrbRemote:InvokeServer(unpack(args))
        end
    end
end)

spawn(function()
    while wait(1) do
        if _G.Evolve then
            local args = {
                [1] = "autoEvolvePets"
            }

            game:GetService("ReplicatedStorage").rEvents.autoEvolveRemote:InvokeServer(unpack(args))
        end
    end
end)

--// Anti Afk
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
