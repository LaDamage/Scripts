--// Variables
local Player = game.Players.LocalPlayer

--// Functions
function AutoClick()
    local args = {
        [1] = "klikniecie"
    }
    
    game:GetService("ReplicatedStorage").Main.Remotes.ClientRequest:FireServer(unpack(args))
end

function HatchEgg()
    local args = {
        [1] = "EggOpen",
        [2] = {
            ["EggName"] = _G.ScriptModule.Egg,
            ["Type"] = "Triple"
        }
    }
    
    game:GetService("ReplicatedStorage").Main.Remotes.EggOpen:InvokeServer(unpack(args))
end

--// Activation
while _G.ScriptModule.AutoClick == true do
    wait(0.1)
    AutoClick()
end

while _G.ScriptModule.AutoHatch == true do
    wait(0.1)
    HatchEgg()
end

--// Check Notifications
if _G.ScriptModule.AutoClick == true then
    warn("✅ - Auto Clicker Enabled!")
else
    warn("❎ - Auto Clicker Disabled!")
end 

if _G.ScriptModule.AutoHatch == true then
    warn("✅ - Auto Hatch Enabled!")
else
    warn("❎ - Auto Hatch Disabled!")
end 
