local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "PetsGo", HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest"})

local players = game:GetService("Players")
local localplayer = players.LocalPlayer
local character = localplayer.Character
local humanoid = character.Humanoid
local humanoidrootpart = character.HumanoidRootPart
local Thieving  = { 
    Vector3.new(194.7723846435547, 5.393672466278076, -1.0488529205322266),
    Vector3.new(220.02371215820312, 8.296595573425293, -10.974353790283203),
    Vector3.new(240.34519958496094, 8.2985200881958, -13.118978500366211),
    Vector3.new(274.0917663574219, 10.293213844299316, -41.420467376708984),
    Vector3.new(295.7476501464844, 10.351471900939941, -44.3170051574707),
    Vector3.new(321.22930908203125, 14.39346981048584, -23.170984268188477),
    Vector3.new(335.78338623046875, 14.409186363220215, -2.5764825344085693),
    Vector3.new(350.5539855957031, 19.969709396362305, 37.36346435546875),
    Vector3.new(301.1578369140625, 22.588266372680664, 64.06158447265625)
 }







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

local function AutoFarmThieving()
	while _G.AutoFarmThieving == true do
        for i = 1, #Thieving do
            humanoidrootpart.CFrame = CFrame.new(Thieving[i])
            wait(1)
            if _G.AutoFarmThieving == false then
                break
            end
        end
	end
end

local function AutoFarm()
	while _G.AutoFarm == true do wait(0.01)
        for _, folder in pairs(workspace.__THINGS.Breakables:GetChildren()) do
            if folder:IsA("Model") then
                for _, v in pairs(folder:GetChildren()) do
                    if v:IsA("MeshPart") and v.Name == "base" then
                        local PathfindingService = game:GetService("PathfindingService")
                        local path = PathfindingService:CreatePath()
                        path:ComputeAsync(humanoidrootpart.Position,v.Position)

                        for _, waypoint in pairs(path:GetWaypoints()) do
                            humanoid:MoveTo(waypoint.Position)
                            humanoid.MoveToFinished:Wait()
                        end
                    else
                        mypath = false
                    end
                end
            end
        end

        if mypath == false then
            for _, v in pairs(workspace.__THINGS.HiddenGifts:GetChildren()) do
                if v.Name == "Model" then
                    local PathfindingService = game:GetService("PathfindingService")
                    local path = PathfindingService:CreatePath()
                    path:ComputeAsync(humanoidrootpart.Position,v.Model.Position)

                    for _, waypoint in pairs(path:GetWaypoints()) do
                        humanoid:MoveTo(waypoint.Position)
                        humanoid.MoveToFinished:Wait()
                    end
                    mypath = true
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
	Name = "AutoFarmThieving",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmThieving = Value
		AutoFarmThieving()
	end    
})

Tab:AddToggle({
	Name = "AutoFarm",
	Default = false,
	Callback = function(Value)
		_G.AutoFarm = Value
		AutoFarm()
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
