local JSOND = function(a)return game:GetService("HttpService"):JSONDecode(a)end
local d = game:HttpGet("https://friends.roblox.com/v1/users/135195046/friends")
local d = JSOND(d).data
local output = ""
for i,v in pairs(d)do
    output = output.."name\t"..v.name.."\n\tid\thttps://www.roblox.com/users/"..v.id.."/profile\n\n"
end
writefile("hhh.txt",output)
