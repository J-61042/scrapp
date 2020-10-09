if cdcom then return else getgenv().cdcom = true end
game:GetService("LogService").MessageOut:Connect(function(Message, Type)
	if not cdcom then return end
	if Type == Enum.MessageType.MessageError and Message:find("cd/COM/") then
		game.StarterGui:SetCore("ChatMakeSystemMessage", {
			TextSize = 24, 
			Text = Message:split("\n")[2], 
			Color = Color3.new(0,0.5,0)
		});
	end
end)
