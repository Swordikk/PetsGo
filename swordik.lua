local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Build a boat for Treasure", HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest"})

local players = game:GetService("Players")
local localplayer = players.LocalPlayer
local character = localplayer.Character
local humanoid = character.Humanoid
local humanoidrootpart = character.HumanoidRootPart

-- Functions --
local function AutoFarmFruits()
	while _G.AutoFarmFruits == true do wait(1)
        if humanoid and humanoidrootpart then
            for _, v in pairs(game:GetDescendants()) do
                if v.Name == "Hitbox" and v.Parent.Name == "base" then
                    humanoidrootpart.CFrame = v.CFrame
                end
            end
        end
	end
end


local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab = Window:MakeTab({
	Name = "AutoFarm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "AutoFarmMoney",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmFruits = Value
		AutoFarmFruits()
	end    
})

local Tab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
