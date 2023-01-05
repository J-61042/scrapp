local Index = 0
local Chat = game:GetService('Players').LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
local function rchat(Command)
	Chat:SetTextFromInput(Command..' '..Index)
	game:GetService('Players'):Chat(Command..' '..Index)
	Chat.Text=''
	Index += 1
end
local fwait = task.wait
getgenv().cdENV = {}
local lplr = game:GetService("Players").LocalPlayer
local cam = game:GetService("Workspace").Camera
lplr.Character.Archivable = true
getgenv().cdENV.RIG = lplr.Character:clone()
local f = Instance.new("ForceField",cdENV.RIG)
getgenv().updateRate = .1
getgenv().framewaits = false
getgenv().SPIN = true
getgenv().SPINV = 0
getgenv().SPINC = 1
--Modding RIG
cdENV.RIG.DescendantAdded:connect(function(d)
	if d:IsA("Humanoid")then
		d.DisplayDistanceType = "None"
	end
end)
cdENV.RIG.Name = "RIG"
for i,v in pairs(cdENV.RIG:GetDescendants())do
	if v:IsA("BasePart")then
		v.Color = Color3.new(.2,.2,.2)
		v.Material = Enum.Material.ForceField --[[I think this is not needed. It's not my taste so far I see...]]
		if v.Name == "HumanoidRootPart"then
			v.Transparency = 1
		else
			v.Transparency = 0.8
		end
	elseif v:IsA("Humanoid")then
		v.DisplayDistanceType = "None"
	end
end

cdENV.RIG.Parent = game:GetService("Workspace")
cam.CameraSubject = cdENV.RIG.Humanoid
lplr.Character = cdENV.RIG

cdENV.RIG.HumanoidRootPart.ChildAdded:connect(function(c)
	if c:IsA("Sound") then
		fwait()c:Destroy()
	end
end)
game:GetService('RunService').RenderStepped:connect(function()for _,v in next,cdENV.RIG:GetDescendants()do if v:IsA('BasePart') then v.CanCollide=false;print('RIG',v.Name)end;end;end)

lplr.CharacterAdded:connect(function(c) 
	if cdENV.RIG then
		local d = false
		game:GetService("RunService").RenderStepped:connect(function()
			if c.Parent ~= nil or c:FindFirstChild("Humanoid") then
				c.Humanoid.DisplayDistanceType = "None"
				for _, v in next, c:GetDescendants()do if v:IsA('BasePart')then v.CanCollide=false;print('AVA',v.Name)end;end
			end
		end)
		cam.CameraSubject = cdENV.RIG.Humanoid
		lplr.Character = cdENV.RIG
		while c do
			if c:FindFirstChild("HumanoidRootPart") then
				if SPIN then
					if SPINV > 360 then SPINV = 0 else SPINV = SPINV+SPINC end
					c.HumanoidRootPart.CFrame = CFrame.new(cdENV.RIG.HumanoidRootPart.Position) * CFrame.Angles(0,math.rad(SPINV),0)
				else
					c.HumanoidRootPart.CFrame = CFrame.new(cdENV.RIG.HumanoidRootPart.Position) * CFrame.Angles(0,math.rad(cdENV.RIG.HumanoidRootPart.Orientation.Y),0)
				end
			elseif c:FindFirstChildWhichIsA("BasePart")then
				local partReplacement = c:FindFirstChildWhichIsA("BasePart")
				if SPIN then
					if SPINV > 360 then SPINV = 0 else SPINV = SPINV+SPINC end
					partReplacement.CFrame = CFrame.new(cdENV.RIG.HumanoidRootPart.Position) * CFrame.Angles(0,math.rad(SPINV),0)
				else
					partReplacement.CFrame = CFrame.new(cdENV.RIG.HumanoidRootPart.Position) * CFrame.Angles(0,math.rad(cdENV.RIG.HumanoidRootPart.Orientation.Y),0)
				end
			end
			--[[Depricated method.(took too much of my powa)
			for i,v in pairs(c:GetChildren())do
				if v:IsA("BasePart")then
					if RIG:FindFirstChild(v.Name) then
						v.CFrame = CFrame.new(RIG[v.Name].Position)
					end
				end
			end
			--]]
			--[[
			local hr = c:WaitForChild("HumanoidRootPart",5)
			if hr then
				hr.CFrame = CFrame.new(RIG.HumanoidRootPart.Position)
			end
			--]]
		if framewaits then
			fwait()
		else
			wait(updateRate)end 
		end
	end
end)

local UIS = game:GetService("UserInputService")
local M = lplr:GetMouse()
UIS.InputBegan:connect(function(inputObject,gamep)
	if gamep then return end
	if inputObject.KeyCode.Name == "Space" then
		cdENV.RIG.Humanoid.Jump = true
	elseif inputObject.KeyCode.Name == "Q" then
		cdENV.RIG.HumanoidRootPart.CFrame = M.Hit
	elseif inputObject.KeyCode.Name == "E" then
		rchat('respawn me')
	end
end)
