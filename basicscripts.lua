print('Basic Scripts GUI, by butter dawg#8245 loaded!')
warn('I am not responsible for any bans you might recieve. I did not make the scripts featured in this GUI.')
--[[
Credits:
GUI made by butter dawg#8245, noob though he is.
Fly by ???
Noclip by ???
Infinite Yield by Edge#3467 | Moon#6245 | bluntbloomer#1259 | GodHOLINAILILIUS#9156
Anti-AFK by ???
Dex V4 by ???
Unnamed ESP by ic3w0lf22
SimpleSpy by exx#9394
Script Dumper by ??? (possibly Synapse devs)
BTools by ???
Infinite Jump by ???
--]]

--Basic Scripts GUI, by butter dawg#8245

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local BasicScripts = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local fly = Instance.new("TextButton")
local noclip = Instance.new("TextButton")
local infintieyield = Instance.new("TextButton")
local antiafk = Instance.new("TextButton")
local dex = Instance.new("TextButton")
local unnamedesp = Instance.new("TextButton")
local simplespy = Instance.new("TextButton")
local scriptdumper = Instance.new("TextButton")
local btools = Instance.new("TextButton")
local infjump = Instance.new("TextButton")
local closegui = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui

BasicScripts.Name = "BasicScripts"
BasicScripts.Parent = ScreenGui
BasicScripts.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
BasicScripts.Position = UDim2.new(0.0115207378, 0, 0.523926437, 0)
BasicScripts.Size = UDim2.new(0, 249, 0, 329)
BasicScripts.Active = true
BasicScripts.Draggable = true

TextLabel.Parent = BasicScripts
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
TextLabel.Size = UDim2.new(0, 249, 0, 19)
TextLabel.Font = Enum.Font.Ubuntu
TextLabel.Text = "Basic Scripts GUI"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14.000

fly.Name = "fly"
fly.Parent = BasicScripts
fly.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
fly.Position = UDim2.new(0.0321285129, 0, 0.116363637, 0)
fly.Size = UDim2.new(0, 99, 0, 28)
fly.Font = Enum.Font.Ubuntu
fly.Text = "Fly (press E)"
fly.TextColor3 = Color3.fromRGB(0, 0, 0)
fly.TextSize = 14.000
fly.MouseButton1Down:connect(function()
--Fly	
	repeat wait()
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
	local mouse = game.Players.LocalPlayer:GetMouse()
	repeat wait() until mouse
	local plr = game.Players.LocalPlayer
	local torso = plr.Character.Torso
	local flying = true
	local deb = true
	local ctrl = {f = 0, b = 0, l = 0, r = 0}
	local lastctrl = {f = 0, b = 0, l = 0, r = 0}
	local maxspeed = 50
	local speed = 0

	function Fly()
		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		repeat wait()
			plr.Character.Humanoid.PlatformStand = true
			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0.1,0)
			end
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		until not flying
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
	end
	mouse.KeyDown:connect(function(key)
		if key:lower() == "e" then
			if flying then flying = false
			else
				flying = true
				Fly()
			end
		elseif key:lower() == "w" then
			ctrl.f = 1
		elseif key:lower() == "s" then
			ctrl.b = -1
		elseif key:lower() == "a" then
			ctrl.l = -1
		elseif key:lower() == "d" then
			ctrl.r = 1
		end
	end)
	mouse.KeyUp:connect(function(key)
		if key:lower() == "w" then
			ctrl.f = 0
		elseif key:lower() == "s" then
			ctrl.b = 0
		elseif key:lower() == "a" then
			ctrl.l = 0
		elseif key:lower() == "d" then
			ctrl.r = 0
		end
	end)
	Fly()

end)

noclip.Name = "noclip"
noclip.Parent = BasicScripts
noclip.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
noclip.Position = UDim2.new(0.570281148, 0, 0.116363637, 0)
noclip.Size = UDim2.new(0, 99, 0, 28)
noclip.Font = Enum.Font.Ubuntu
noclip.Text = "Noclip (press F)"
noclip.TextColor3 = Color3.fromRGB(0, 0, 0)
noclip.TextSize = 14.000
noclip.MouseButton1Down:connect(function()
	--Noclip
	noclip = false
	game:GetService('RunService').Stepped:connect(function()
		if noclip then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
	plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()
	mouse.KeyDown:connect(function(key)

		if key == "g" then
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
	print('Loaded')
	print('Press "G" to noclip')
end)

infintieyield.Name = "infintieyield"
infintieyield.Parent = BasicScripts
infintieyield.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
infintieyield.Position = UDim2.new(0.0321285129, 0, 0.301055521, 0)
infintieyield.Size = UDim2.new(0, 99, 0, 28)
infintieyield.Font = Enum.Font.Ubuntu
infintieyield.Text = "Infinite Yield FE"
infintieyield.TextColor3 = Color3.fromRGB(0, 0, 0)
infintieyield.TextSize = 14.000
infintieyield.MouseButton1Down:connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

antiafk.Name = "antiafk"
antiafk.Parent = BasicScripts
antiafk.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
antiafk.Position = UDim2.new(0.570281148, 0, 0.298016012, 0)
antiafk.Size = UDim2.new(0, 99, 0, 28)
antiafk.Font = Enum.Font.Ubuntu
antiafk.Text = "Anti-AFK"
antiafk.TextColor3 = Color3.fromRGB(0, 0, 0)
antiafk.TextSize = 14.000
antiafk.MouseButton1Down:connect(function()
	local virtualUser = game:GetService('VirtualUser')
	virtualUser:CaptureController()
	while true do
		wait()
		virtualUser:SetKeyDown('0x1f')
		wait(2)
		virtualUser:SetKeyUp('0x1f')
	end
end)

dex.Name = "dex"
dex.Parent = BasicScripts
dex.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
dex.Position = UDim2.new(0.0321285129, 0, 0.486465871, 0)
dex.Size = UDim2.new(0, 99, 0, 28)
dex.Font = Enum.Font.Ubuntu
dex.Text = "Dex V4"
dex.TextColor3 = Color3.fromRGB(0, 0, 0)
dex.TextSize = 14.000
dex.MouseButton1Down:connect(function()
	loadstring(game:GetObjects("rbxassetid://418957341")[1].Source)()
end)

unnamedesp.Name = "unnamedesp"
unnamedesp.Parent = BasicScripts
unnamedesp.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
unnamedesp.Position = UDim2.new(0.570281148, 0, 0.486465961, 0)
unnamedesp.Size = UDim2.new(0, 99, 0, 28)
unnamedesp.Font = Enum.Font.Ubuntu
unnamedesp.Text = "Unnamed ESP"
unnamedesp.TextColor3 = Color3.fromRGB(0, 0, 0)
unnamedesp.TextSize = 14.000
unnamedesp.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
end)

simplespy.Name = "simplespy"
simplespy.Parent = BasicScripts
simplespy.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
simplespy.Position = UDim2.new(0.0321285129, 0, 0.671876252, 0)
simplespy.Size = UDim2.new(0, 99, 0, 28)
simplespy.Font = Enum.Font.Ubuntu
simplespy.Text = "Simple-Spy"
simplespy.TextColor3 = Color3.fromRGB(0, 0, 0)
simplespy.TextSize = 14.000
simplespy.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
end)

scriptdumper.Name = "scriptdumper"
scriptdumper.Parent = BasicScripts
scriptdumper.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
scriptdumper.Position = UDim2.new(0.570281148, 0, 0.671876252, 0)
scriptdumper.Size = UDim2.new(0, 99, 0, 28)
scriptdumper.Font = Enum.Font.Ubuntu
scriptdumper.Text = "Script Dumper"
scriptdumper.TextColor3 = Color3.fromRGB(0, 0, 0)
scriptdumper.TextSize = 14.000
scriptdumper.MouseButton1Down:connect(function()
    print('Script Dumper has been removed for now.')
end)

btools.Name = "btools"
btools.Parent = BasicScripts
btools.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
btools.Position = UDim2.new(0.570281148, 0, 0.851207554, 0)
btools.Size = UDim2.new(0, 99, 0, 28)
btools.Font = Enum.Font.Ubuntu
btools.Text = "BTools"
btools.TextColor3 = Color3.fromRGB(0, 0, 0)
btools.TextSize = 14.000
btools.MouseButton1Down:connect(function()
	local tool1 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
	local tool2 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
	local tool3 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
	local tool4 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
	local tool5 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
	tool1.BinType = "Clone" tool2.BinType = "GameTool" tool3.BinType = "Hammer" tool4.BinType = "Script" tool5.BinType = "Grab"


end)

infjump.Name = "infjump"
infjump.Parent = BasicScripts
infjump.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
infjump.Position = UDim2.new(0.0321285129, 0, 0.851207554, 0)
infjump.Size = UDim2.new(0, 99, 0, 28)
infjump.Font = Enum.Font.Ubuntu
infjump.Text = "Infinite Jump"
infjump.TextColor3 = Color3.fromRGB(0, 0, 0)
infjump.TextSize = 14.000
infjump.MouseButton1Down:connect(function()
	-- //~ F to toggle ~\ --
	-- I have no idea who made this! 
	_G.infinjump = true

	local Player = game:GetService("Players").LocalPlayer
	local Mouse = Player:GetMouse()
	Mouse.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
				Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
				Humanoid:ChangeState("Jumping")
				wait(0.1)
				Humanoid:ChangeState("Seated")
			end
		end
	end)

	local Player = game:GetService("Players").LocalPlayer
	local Mouse = Player:GetMouse()
	Mouse.KeyDown:connect(function(k)
		k = k:lower()
		if k == "f" then
			if _G.infinjump == true then
				_G.infinjump = false
			else
				_G.infinjump = true
			end
		end
	end)
end)

closegui.Name = "closegui"
closegui.Parent = BasicScripts
closegui.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
closegui.Position = UDim2.new(0.919678688, 0, 0, 0)
closegui.Size = UDim2.new(0, 20, 0, 19)
closegui.Font = Enum.Font.GothamBold
closegui.Text = "X"
closegui.TextColor3 = Color3.fromRGB(0, 0, 0)
closegui.TextSize = 14.000
closegui.MouseButton1Down:connect(function()
	BasicScripts.Visible = false
end)