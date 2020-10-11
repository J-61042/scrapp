if not is_cd_caller then loadstring(game:HttpGet("https://raw.githubusercontent.com/casualdegenerate/cd/master/Better%20Proto%20API"))() end
local lplr = game:GetService("Players").LocalPlayer
local Commands = {["c"] = function(args)
    local s = "cd/COM/\n"..lplr.Name..": "
    local msg = ""
    for _,v in pairs(args) do
        if _ ~= 1 then
            msg = msg..v.." "
        end
    end
    rchat("music "..s..msg:sub(1,msg:len()-1).."\n")
end,}
lplr.Chatted:connect(function(msg)
    local args = msg:lower():split(" ")
    for _,v in pairs(Commands) do
        if args[1] == _ then
            v(args)
        end
    end
end)
game:GetService("LogService").MessageOut:Connect(function(Message, Type)
	if Type == Enum.MessageType.MessageError and Message:find("cd/COM/") then
		game.StarterGui:SetCore("ChatMakeSystemMessage", {
			TextSize = 24, 
			Text = Message:split("\n")[2], 
			Color = Color3.new(0,0.5,0)
		});
	end
end)
