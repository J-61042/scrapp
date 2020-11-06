repeat wait() until game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
repeat wait() until game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
loadstring(game:HttpGet("https://raw.githubusercontent.com/casualdegenerate/cd/master/Better%20Proto%20API"))()
local JSOND = function(a)return game:GetService("HttpService"):JSONDecode(a)end
local JSONE = function(a)return game:GetService("HttpService"):JSONEncode(a)end
if not rconsoleprint then
    lchat("Run it on SynX you idiot. Only works on SynX.",Color3.new(1,0,0))
    rchat("music 5648499584")
    return
end
local rconsoleprint = function(input,color)
    fspawn(function()
        if color then
            fspawn(function()rconsoleprint(color)end)
        else
            fspawn(function()rconsoleprint("@@WHITE@@")end)
        end
        fspawn(function()rconsoleprint(input.."\n")end)
        fwait()
        fspawn(function()rconsoleprint("@@WHITE@@")end)
    end)
end

if not isfile("cdss") then
    rconsoleprint("Welcome newcomer!","@@GREEN@@")
    makefolder("cdss")
    repeat wait() until isfile("cdss")
    makefolder("cdss/Config")
    repeat wait() until isfile("cdss/Config")
    writefile("cdss/Config/Stream Snipper.settings",[[{"autopdate":false,"antiloud":true,"servers":{"colorFriends":true,"nameOnlyFriends":true,"namePlayers":true}}]])
end

settings = JSOND(readfile("cdss/Config/Stream Snipper.settings"))
local lplr = game:GetService("Players").LocalPlayer or game:GetService("Players"):GetPropertyChangedSignal("LocalPlayer"):wait()
rconsolename("@casual_degenerate made this! #AGS #CD")
local lplr = game:GetService("Players").LocalPlayer
debug = true
function dprint(t)if debug --[[and lplr.UserId == 1090451412--]] then print(t)end end
local Fetch = {}
Fetch.Get = function(a)local succ,err = game:HttpGet(a) if err then return("err"..err) else return(succ)end end
function GetPlayer(a)local b={}local c=a:lower()if c=="all"then for d,e in pairs(game.Players:GetPlayers())do table.insert(b,e)end elseif c=="others"then for d,e in pairs(game.Players:GetPlayers())do if e.Name~=game.Players.LocalPlayer.Name then table.insert(b,e)end end elseif c=="me"then for d,e in pairs(game.Players:GetPlayers())do if e.Name==game.Players.LocalPlayer.Name then table.insert(b,e)end end else for d,e in pairs(game.Players:GetPlayers())do if e.Name:lower():sub(1,#a)==a:lower()then table.insert(b,e)end end end;if unpack(b) == nil then rconsoleprint("No players in-game goes by that name. If you are spelling their name right and this still pops up, DM @casual_degenerate#7475 586141923048161291 your issue and they will help.","@@RED@@") end return b end

--if OT then
--    getgenv().OT:Disable()
--end
--if active then
--    getgenv().active = false
--end
--wait(1)
--getgenv().active = true



Commands = {
	["servers"] = {
        toggle = true,
        funk = function(args)
            local h
            local asdf1
            local asdf2
            pcall(function()
                local r = Fetch.Get("https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/Public?sortOrder=Asc&limit=50")
                h = JSOND(r)
            end)
            for _,server in pairs(h.data) do if breaker then rbreaker = true break end
                if args[2] == server.id then 
                    if server.fps then
                        if server.fps > 50 then
                            rconsoleprint("FPS: "..server.fps,"@@GREEN@@")
                        elseif server.fps < 49 and server.fps > 30 then
                            rconsoleprint("FPS: "..server.fps,"@@LIGHT_RED@@")
                        elseif server.fps < 29 then
                            rconsoleprint("FPS: "..server.fps,"@@RED@@")
                        end
                    else
                        rconsoleprint("FPS: Undefined?","@@MAGENTA@@")
                    end
                    if server.ping then
                        if server.ping < 49 then
                            rconsoleprint("Ping: "..server.ping,"@@GREEN@@")
                        elseif server.ping > 50 and server.ping < 99 then
                            rconsoleprint("Ping: "..server.ping,"@@YELLOW@@")
                        elseif server.ping > 100 and server.ping < 199 then
                            rconsoleprint("Ping: "..server.ping,"@@LIGHT_RED@@")
                        elseif server.ping > 200 then
                            rconsoleprint("Ping: "..server.ping,"@@RED@@")
                        end
                    else
                        rconsoleprint("Ping: Undefined?","@@MAGENTA@@")
                    end
                    for _1,player in pairs(server.playerIds) do if breaker then rbreaker = true break end
                        if settings.servers.namePlayers then
                            pcall(function()
                                asdf1 = Fetch.Get("https://api.roblox.com/users/"..tostring(player))
                                asdf2 = JSOND(asdf1)
                            end)
                            if lplr:IsFriendsWith(player) and settings.servers.colorFriends then
                                rconsoleprint(asdf2.Username.."["..player.."]","@@MAGENTA@@")
                            else
                                rconsoleprint(asdf2.Username.."["..player.."]","@@LIGHT_BLUE@@")
                            end
                        elseif settings.servers.nameOnlyFriends and lplr:IsFriendsWith(player) then
                            pcall(function()
                                asdf1 = Fetch.Get("https://api.roblox.com/users/"..tostring(player))
                                asdf2 = JSOND(asdf1)
                            end)
                            rconsoleprint(asdf2.Username.."["..player.."]","@@MAGENTA@@")
                        else
                            if lplr:IsFriendsWith(player) and settings.servers.colorFriends then
                                rconsoleprint("["..player.."]","@@MAGENTA@@")
                            else
                                rconsoleprint("["..player.."]","@@LIGHT_BLUE@@")
                            end
                        end
                    end
                    break
                else
                    if server.id == game.JobId then
                        rconsoleprint("Server["..game.JobId.."]","@@LIGHT_GREEN@@")
                    else
                        rconsoleprint("Server["..server.id.."]")
                    end
                    if server.fps then
                        if server.fps > 50 then
                            rconsoleprint("FPS: "..server.fps,"@@GREEN@@")
                        elseif server.fps < 49 and server.fps > 30 then
                            rconsoleprint("FPS: "..server.fps,"@@LIGHT_RED@@")
                        elseif server.fps < 29 then
                            rconsoleprint("FPS: "..server.fps,"@@RED@@")
                        end
                    else
                        rconsoleprint("FPS: Undefined?","@@MAGENTA@@")
                    end
                    if server.ping then
                        if server.ping < 49 then
                            rconsoleprint("Ping: "..server.ping,"@@GREEN@@")
                        elseif server.ping > 50 and server.ping < 99 then
                            rconsoleprint("Ping: "..server.ping,"@@YELLOW@@")
                        elseif server.ping > 100 and server.ping < 199 then
                            rconsoleprint("Ping: "..server.ping,"@@LIGHT_RED@@")
                        elseif server.ping > 200 then
                            rconsoleprint("Ping: "..server.ping,"@@RED@@")
                        end
                    else
                        rconsoleprint("Ping: Undefined?","@@MAGENTA@@")
                    end
                    for _1,player in pairs(server.playerIds) do if breaker then rbreaker = true break end
                        if settings.servers.namePlayers then
                            pcall(function()
                                asdf1 = Fetch.Get("https://api.roblox.com/users/"..tostring(player))
                                asdf2 = JSOND(asdf1)
                            end)
                            if lplr:IsFriendsWith(player) and settings.servers.colorFriends then
                                rconsoleprint(asdf2.Username.."["..player.."]","@@MAGENTA@@")
                            else
                                rconsoleprint(asdf2.Username.."["..player.."]","@@LIGHT_BLUE@@")
                            end
                        elseif settings.servers.nameOnlyFriends and lplr:IsFriendsWith(player) then
                            pcall(function()
                                asdf1 = Fetch.Get("https://api.roblox.com/users/"..tostring(player))
                                asdf2 = JSOND(asdf1)
                            end)
                            rconsoleprint(asdf2.Username.."["..player.."]","@@MAGENTA@@")
                        else
                            if lplr:IsFriendsWith(player) and settings.servers.colorFriends then
                                rconsoleprint("["..player.."]","@@MAGENTA@@")
                            else
                                rconsoleprint("["..player.."]","@@LIGHT_BLUE@@")
                            end
                        end
                    end
                end
            end
        end,
    },
    ["serverhop"] = {
        allies = {"sh"},
        toggle = true, -- so it goes down before i rejoin.
        funk = function(args)
            if args[2] == nil then
                rconsoleprint("[cd.lua]: Hhhhh! You have to add <args2>(server GUID) you idiot! >_<")
            else
                tchat("GUID "..args[2])
                wait(.3)
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, args[2])
            end
        end
    },
	["info"] = {
        debug = true,
        description = "Tells you information about the user!",
        toggle = true,
        funk = function(args)
            if lplr.UserId ~= 1090451412 then 
                rconsoleprint("You're trying to run a developer command. This is only for devs of this script to use.","@@RED@@")
                return 
            end
            local id = tostring(GetPlayer(args[2])[1].UserId)
            local json
            local info = ""
            pcall(function()
                local h = Fetch.Get("https://users.roblox.com/v1/users/"..id)
                json = JSOND(h)
            end)
            for _,v in pairs(json) do
                if _ ~= "displayName" and _ ~= "isBanned" then
                    info = info.."[".._.."]: "..tostring(v):gsub("\n","\\n").."\n"
                end
            end
            rconsoleprint(info:sub(1,info:len()-1),"@@BLUE@@")
        end,
    },
	["break"] = {
        toggle = true,
		funk = function(args)
			breaker = true
            repeat wait() until rbreaker == true
            rbreaker = false
            breaker = false
            rconsoleprint("Dodge","@@RED@@")
		end,
	},
    ["server"] = {
        allies = {"status"},
        description = "Prints the server's FPS and ping in I/O.",
        funk = function(args)
            local last = 0
            local h = JSOND(Fetch.Get("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
            for _,server in pairs(h.data) do
                if server.id == game.JobId and last ~= server.fps then
                    last = server.fps
                    if server.fps > 50 then
                    rconsoleprint("FPS: "..server.fps,"@@GREEN@@")
                    elseif server.fps < 49 and server.fps > 30 then
                        rconsoleprint("FPS: "..server.fps,"@@LIGHT_RED@@")
                    elseif server.fps < 29 then
                        rconsoleprint("FPS: "..server.fps,"@@RED@@")
                    end
                    if server.ping < 49 then
                        rconsoleprint("Ping: "..server.ping,"@@GREEN@@")
                    elseif server.ping > 50 and server.ping < 99 then
                        rconsoleprint("Ping: "..server.ping,"@@YELLOW@@")
                    elseif server.ping > 100 and server.ping < 199 then
                        rconsoleprint("Ping: "..server.ping,"@@LIGHT_RED@@")
                    elseif server.ping > 200 then
                        rconsoleprint("Ping: "..server.ping,"@@RED@@")
                    end
                end
            end
        end,
    },
    ["discord"] = {
        allies = {"disc","d"},
        description = "Doxxes casual's own discord in-game chat.",
        funk = function(args)
            tchat("@casual_degenerate#7475")
        end,
    },
    ["rejoin"] = {
        allies = {"rj"},
        description = "Kicks you and puts you back in the same server.",
        funk = function()
            lplr:Kick("You have been kicked due to unexpected client behavior.")
            game:GetService("TeleportService"):Teleport(game.PlaceId, lplr)
        end,
    },
}

rconsoleprint("Loaded!","@@GREEN@@")
fspawn(function()
    while true do
        local args = rconsoleinput():lower():split(" ")
        --if args[1] == "exit" or args[1] == "stop" or args[1] == "restart" or args[1] == "reboot" or args[1] == "reload" then getgenv().active = false break end
        for _,v in pairs(Commands) do
            if type(v) == "function" then
                if args[1] == _ then
                    v(args)
                end
            elseif type(v) == "table" then
                if v.allies then
                    for _1,v1 in pairs(v.allies) do 
                        if args[1] == v1 then 
                            if v.toggle then
                                fspawn(function()v.funk(args)end)
                            else
                                v.funk(args)
                            end
                        end
                    end
                end
                if args[1] == _ then
                    if v.toggle then
                        fspawn(function()v.funk(args)end)
                    else
                        v.funk(args)
                    end
                end
            elseif type(v) == "nil" then
                rconsoleprint("nil","@@WHITE@@")
            else
                rconsoleprint("CRITICAL FLAW! THE SAID MESSAGE EXIST IN COMMANDS BUT DOES NOT FOLLOW RULES OF BEING A FUNCTION OR TABLE? NEW UPDATE WAS INCOMPATIBLE??\n\tTYPE: "..type(v).."\n\tINDEX: "..pe_,"@@RED@@")
            end
            --[[Old method I was working on...
            if args[1] == _ then
                --lchat("[cd/cmds.lua]: Running "..tostring(_),Color3.new(0,0,0))
                fspawn(function()
                    if type(v) == "function" then
                        v(args)
                    elseif type(v) == "table"
                        if v.allies then
                            for _1,v1 in pairs(v.allies) do
                                if args[1] == v1 v.funk(args)
                            end
                        else
                            v.funk(args)
                        end
                    else
                        rconsoleprint("CRITICAL FLAW! THE SAID MESSAGE EXIST IN COMMANDS BUT DOES NOT FOLLOW RULES OF BEING A FUNCTION OR TABLE? NEW UPDATE WAS INCOMPATIBLE??","@@RED@@")
                    end
                end)
            end
            --]]
        end
    end
    --loadstring(readfile("cdss/Server Info.lua"))()
end)


--fspawn(function()
--    lplr.OnTeleport:Connect(function(State)
--        if State == Enum.TeleportState.InProgress then
--            syn.queue_on_teleport("loadstring(readfile(\"cdss/Server Info.lua\"))()")
--        elseif State == Enum.TeleportState.Failed then
--            rconsoleprint("Server join failed?","@@RED@@")
--        end
--    end)
--    for i,connection in pairs(getconnections(lplr.OnTeleport)) do
--        if i==1 then getgenv().OT = connection end
--    end
--end)
