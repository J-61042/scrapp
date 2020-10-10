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
