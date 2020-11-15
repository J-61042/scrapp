if not fwait() then loadstring(game:HttpGet("https://raw.githubusercontent.com/casualdegenerate/cd/master/Better Proto API"))() end
local lplr = game:GetService("Players").LocalPlayer
local cam = game:GetService("Workspace").Camera
lplr.Character.Archivable = true
local RIG = lplr.Character:clone()
local f = Instance.new("ForceField",RIG)
getgenv().updateRate = .1
getgenv().framewaits = false
local ylock = true

RIG.Parent = game:GetService("Workspace")
cam.CameraSubject = RIG.Humanoid
lplr.Character = RIG

RIG.HumanoidRootPart.ChildAdded:connect(function(c)
	if c:IsA("Sound") then
		fwait()c:Destroy()
	end
end)

lplr.CharacterAdded:connect(function(c) 
    if RIG then
		game:GetService("RunService").RenderStepped:connect(function()
			if c.Parent ~= nil or not c.Humanoid then
				c.Humanoid:ChangeState(11)
			end
		end)
        cam.CameraSubject = RIG.Humanoid
        lplr.Character = RIG
        while c do
            local hr = c:WaitForChild("HumanoidRootPart",5)
            if hr then
				if ylock then
					hr.CFrame = CFrame.new(Vector3.new(RIG.HumanoidRootPart.X,0,))
				else
					hr.CFrame = CFrame.new(RIG.HumanoidRootPart.Position)
				end
            end
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
		RIG.Humanoid.Jump = true
	elseif inputObject.KeyCode.Name == "Q" then
		RIG.HumanoidRootPart.CFrame = M.Hit
	elseif inputObject.KeyCode.Name == "E" then
		if ylock then 
			ylock = false
		else
			ylock = true
		end
	end
end)
--[[
fspawn(function()
	local last = game:GetService("Workspace").Camera.CFrame
	while true do
		if game:GetService("Workspace").Camera.CFrame.X-last.X < 5 then
			game:GetService("Workspace").Camera.CFrame = last
		else
			last = game:GetService("Workspace").Camera.CFrame
		end
	fwait()end
end)
--]]
