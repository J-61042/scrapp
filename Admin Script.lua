Commands = {
	["commands"] = {
		allies = {"cmds"},
		funk = function(plr,args)
			if plr.PlayerGui.Commands.Enabled == false then
				plr.PlayerGui.Commands.Enabled = true
			else
				plr.PlayerGui.Commands.Enabled = false
			end
		end,
		description = "List all commands.",
	},
	["teleport"] = {
		allies = {"tp"},
		description = "Not done yet.",
		funk = function(plr,args)
			if game:GetService("Workspace"):FindFirstChild("tp") then
				return
			else
				local h = Instance.new("Hint",workspace)
				h.Name = "tp"
				h.Text = "tp is not a command yet sorry :v"
			end
		end,
	},
	["glitch"] = {
		allies = {"glitcher"},
		funk = function(plr,args)
			for _,p1 in pairs(GetPlayer(args[2],plr)) do
				repeat wait()
					for _,part in pairs(p1.Character:GetDescendants()) do
						if part:IsA("Part") or part:IsA("MeshPart") then 
							part.Material = "ForceField"
							local x = math.random(0,359)
							part.Color = Color3.fromHSV(x/100, 1, 1)
						end
					end
				until p1.Character.Parent == nil
			end
		end,
	},
	["hint"] = {
		disabled = true,
		allies = {"h";"m","message","broadcast"},
		description = "creates a hint.",
		funk = function(plr,args)
			local s = ""
			for i,v in pairs(args) do print(v)
				s = s..v
			end
			print(s)
			local h = Instance.new("Hint",game:GetService("Workspace"))
			h.Name = "message"
			h.Text = getFilteredMessage(s)
			coroutine.resume(coroutine.create(function()
				wait(6.66)
				h.Name = "cd-OVERWRITEN"
				h.Text = "cd-OVERWRITEN"
				h.Parent = nil
			end))
		end,
	},
	["fogstart"] = {
		--allies = {""}
		funk = function(plr,args)
			Lighting.FogStart = args[2]
		end,
		allies = {"fs"},
	},
	["fogend"] = {
		--allies = {""}
		funk = function(plr,args)
			Lighting.FogEnd = args[2]
		end,
		allies = {"fe"},
	},
	["fogcolor"] = {
		funk = function(plr,args)
			for i,v in pairs(args) do
				if v:find("+new") then
					Lighting.FogColor = Color3.new(tonumber(args[2]),tonumber(args[3]),tonumber(args[4]))
				elseif v:find("+hsv") then
					Lighting.FogColor = Color3.fromHSV(tonumber(args[2]),tonumber(args[3]),tonumber(args[4]))
				else
					Lighting.FogColor = Color3.fromRGB(tonumber(args[2]),tonumber(args[3]),tonumber(args[4]))
				end
			end
		end,
		allies = {"fc"},
	},
	["kill"] = {
		allies = {"gameend","blox","oof"},
		funk = function(plr,args) dprint("funk kill")
			for _,p1 in pairs(GetPlayer(args[2],plr)) do dprint("kill",p1)
				if p1.Character.Parent == game:GetService("Workspace") then
					p1.Character.Humanoid.Health = 0 dprint("kill")
				end
			end
		end,
	},
	["music"] = {
		funk = function(plr,args) 
			if args[2] == "0" or args[2] == nil then game:GetService("Workspace"):FindFirstChild("Music").Parent = nil return elseif game:GetService("Workspace"):FindFirstChild("Music") then game:GetService("Workspace"):FindFirstChild("Music").Parent = nil end
			local s = Instance.new("Sound",game:GetService("Workspace"))
			s.Name = "Music"
			s.SoundId = "rbxassetid://"..args[2]
			s.Looped = true
			s.Playing = true
		end,
		description = "Say 'music' or 'music 0' to stop the music.",
	},
	["time"] = {
		funk = function(plr,args)
			Lighting.TimeOfDay = tonumber(args[2])
		end
	},
	
}
return Commands
