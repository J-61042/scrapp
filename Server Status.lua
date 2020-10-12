while true do 
	local h = game:HttpGet("https://www.roblox.com/games/getgameinstancesjson?placeId="..tostring(game.PlaceId).."&startIndex=0")
	local j = game:GetService("HttpService"):JSONDecode(h)
	for _,v in pairs(j.Collection) do
		if v.Guid == game.JobId then
			print(v.Fps)
		end
	end
wait(15)end
