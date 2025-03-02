local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "PetsGo", HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest"})

local players = game:GetService("Players")
local localplayer = players.LocalPlayer
local character = localplayer.Character
local humanoid = character.Humanoid
local humanoidrootpart = character.HumanoidRootPart








-- AntiAFK --
while not game:IsLoaded() do wait() end
repeat wait() until game.Players.LocalPlayer.Character
Players = game:GetService("Players")
local GC = getconnections or get_signal_cons
if GC then
	for i,v in pairs(GC(Players.LocalPlayer.Idled)) do
		if v["Disable"] then v["Disable"](v)
		elseif v["Disconnect"] then v["Disconnect"](v)
		end
	end
else
Players.LocalPlayer.Idled:Connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
  	end)
end

-- Functions --
function WalkSpeed()
	while _G.WalkSpeed do game:GetService("RunService").RenderStepped:wait()
	    humanoid.WalkSpeed = _G.WalkSpeed
    end
end

function JumpPower()
	while _G.JumpPower do game:GetService("RunService").RenderStepped:wait()
	    humanoid.JumpPower = _G.JumpPower
    end
end

local function AutoFarmFruits()
	while _G.AutoFarmFruits == true do wait(0.01)
        for _, v in pairs(workspace.__THINGS.Breakables:GetChildren()) do
            









        end
	end
end

local function AutoFarmGifts()
	while _G.AutoFarmGifts == true do wait(0.01)
        for _, v in pairs(workspace.__THINGS.HiddenGifts:GetChildren()) do
            local PathfindingService = game:GetService("PathfindingService")
			local path = PathfindingService:CreatePath()
			path:ComputeAsync(humanoidrootpart.Position,v.Model.Position)

			for _, waypoint in pairs(path:GetWaypoints()) do
				humanoid:MoveTo(waypoint.Position)
				humanoid.MoveToFinished:Wait()
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
	Name = "AutoFarmFruits",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmFruits = Value
		AutoFarmFruits()
	end    
})

Tab:AddToggle({
	Name = "AutoFarmGifts",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmGifts = Value
		AutoFarmGifts()
	end    
})

local Tab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "WalkSpeed",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		_G.WalkSpeed = Value
		WalkSpeed()
	end
})

Tab:AddTextbox({
	Name = "JumpPower",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		_G.JumpPower = Value
		JumpPower()
	end
})
