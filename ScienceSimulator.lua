--// idfk anymore
local UILol = game:GetService("CoreGui"):FindFirstChild("ScreenGui")
if UILol then 
    UILol:Destroy()
end

--// Other Important Stuff
local library = loadstring(game:HttpGet("https://zypher.wtf/UI-Lib"))()
local main = library:CreateMain("ScreenGui")
local players = game.Players:GetPlayers()
local plr = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local rs = RunService.RenderStepped
local VirtualUser = game:GetService("VirtualUser")
local WalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local JumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower

--// Categories
local stuff = main:CreateCategory("Farming")
local pets = main:CreateCategory("Egg Open")
local settings = main:CreateCategory("Settings")

--// Sections
local rselect = stuff:CreateSection("Selector")
local farming = stuff:CreateSection("Farming Section")

local pselect = pets:CreateSection("Selector")
local openeggs = pets:CreateSection("Pet Open Section")

local ssection = settings:CreateSection("UI Stuff")
local csection = settings:CreateSection("Character")

--// Farming Tab
farming:Create(
    "Toggle",
    "Auto Click",
    function(ClickState)
        if ClickState then
            _G.Click = true
        else
            _G.Click = false
        end
    end,
    {
        default = false,
    }
)

farming:Create(
    "Toggle",
    "Auto Rebirth",
    function(RebirthState)
        if RebirthState then
            _G.autorebirth = true
        else
            _G.autorebirth = false
        end
    end,
    {
        default = false,
    }
)

rselect:Create(
  "Dropdown",
  "Rebirth Selector",
  function(RebOption)
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
end,
{
  options = {
      "Rebirth Selector",
      "1 Rebirth",
      "5 Rebirths",
      "25 Rebirths",
      "100 Rebirths",
      "500 Rebirths",
      "10k Rebirths",
      "80k Rebirths",
      "200k Rebirths",
      "400k Rebirths",
      "2M Rebirths",
      "4M Rebirths",
      "15M Rebirths",
      "75M Rebirths",

  },
  default = "Rebirth Selector",
  search = false,
}
)

--// Egg Tab
pselect:Create(
  "Dropdown",
  "Egg Selector",
  function(Option)
    if Option == "Common Egg" then
        _G.SEGG = "Common Egg"
    elseif Option == "Altar Egg" then
        _G.SEGG = "Altar Egg"
    elseif Option == "Faded Egg" then
        _G.SEGG = "Faded Egg"
    elseif Option == "Frosty Egg" then
        _G.SEGG = "Frosty Egg"
    elseif Option == "Event Egg" then
        _G.SEGG = "Vial Egg"
    end
end,
{
  options = {
      "Egg Selector",
      "Common Egg",
      "Altar Egg",
      "Faded Egg",
      "Frosty Egg",
      "Event Egg",
  },
  default = "Egg Selector",
  search = false,
}
)

openeggs:Create(
    "Toggle",
    "Auto Open 1 Egg",
    function(EggState)
        if EggState then
            _G.eggyopen = true
        else
            _G.eggyopen = false
        end
    end,
    {
        default = false,
    }
)
openeggs:Create(
    "Toggle",
    "Auto Open 3 Eggs (Gamepass)",
    function(Egg3State)
        if Egg3State then
            _G.eggy3open = true
        else
            _G.eggy3open = false
        end
    end,
    {
        default = false,
    }
)

--// Setting Tab
csection:Create(
  "Slider",
  "WalkSpeed",
  function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(value)
  end,
  {
      min = WalkSpeed,
      max = 150,
      -- Optional
      default = WalkSpeed,
      precise = true,
      changablevalue = true
  }
)
csection:Create(
  "Slider",
  "JumpPower",
  function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(value)
  end,
  {
      min = JumpPower,
      max = 250,
      -- Optional
      default = JumpPower,
      precise = true, -- ex: 0.1, 0.2, 0.3
      changablevalue = true
  }
)
ssection:Create(
    "KeyBind",
    "Toggle UI", 
    function()
        if game:GetService("CoreGui").ScreenGui.Enabled == true then
            game:GetService("CoreGui").ScreenGui.Enabled = false
        else
            game:GetService("CoreGui").ScreenGui.Enabled = true
        end
    end,
    {
        default = Enum.KeyCode.P
    }
)
ssection:Create(
    "Button",
    "Destroy UI",
    function()
        game:GetService("CoreGui"):FindFirstChild("ScreenGui"):Destroy()

        _G.Click = false
        _G.autorebirth = false
        _G.eggyopen = false
        _G.eggy3open = false
    end,
    {
        animated = true,
    }
)

--// Functions
spawn(function()
    while wait() do
        if _G.Click then
            game:GetService("ReplicatedStorage").Remotes.Events["f1f0c2a6-7b58-4b19-893a-2ed788519af0"]:FireServer()
        end
    end
end)
spawn(function()
    while wait(.5) do
        if _G.autorebirth then
            local args = {
                [1] = _G.SRebirth
            }
            
            game:GetService("ReplicatedStorage").Remotes.Events["49554d92-c3af-4b2d-bda3-de28a5f01bde"]:FireServer(unpack(args))
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
            
            game:GetService("ReplicatedStorage").Remotes.Functions["9e7a790b-c47e-4c46-8c6e-dfa6606b05b5"]:InvokeServer(unpack(args))
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
            
            game:GetService("ReplicatedStorage").Remotes.Functions["9e7a790b-c47e-4c46-8c6e-dfa6606b05b5"]:InvokeServer(unpack(args))
        end
    end
end)

--// Anti Afk
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
