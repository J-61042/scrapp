coroutine.resume(coroutine.create(function()
	if syn_checkcaller then print("I do not have a version of this for SynX.") return end --Only works on proto
	if not is_protosmasher_caller then print("Only works on Proto") return end --Only works on proto
	local last = 0
	while true do 
		local h = game:HttpGet("https://www.roblox.com/games/getgameinstancesjson?placeId="..tostring(game.PlaceId).."&startIndex=0")
		local j = game:GetService("HttpService"):JSONDecode(h)
		for _,v in pairs(j.Collection) do
			if v.Guid == game.JobId and v.Fps ~= last then
				last = v.Fps
				lchat(tostring(v.Fps))
			end
		end
	wait(1)end
end))
