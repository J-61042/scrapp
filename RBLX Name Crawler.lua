coroutine.wrap(function() --http.request needs to be in a coroutine and I won't want anything that yeilds to be skipped on.
local http = require("coro-http")
local Clock = require("clocktime")
local timer = require("timer")
local json = require("json")
local wait = timer.sleep

local censors = {"18","69","88","r34","420","455","8008"}
function censor(a) --This will make it skip any that are cache'd as names you can't take. So it pretty much speeds it up by a ton.
    for i,v in pairs(censors)do
        if a == v then
            return true
        end
        if string.find(a,v)then
            return true
        end
    end
    return false
end
function read(filename)
    local a = assert(io.open(filename,"rb"))
    local b = a:read("*all")a:close()
    return b
end
function write(filename,filecontent)
    local a = io.open(filename, "w+")
    a:write(filecontent)a:close()
end

---[[
    local ss = Clock.time()
    local counter = 50000 --predefined variable to add on it's self later.
    local name = "guest"
    local file = os.time().."-"..name.."-"..counter
    write(file..".txt","")
    while true do
        counter = counter+1 --This is why it's prefefined, so it won't error here. Also, I hate how the '' does double when I do a comment...
        local s,ms = Clock.time{ msec = true }
        p(s-ss.."."..ms)
        if not censor(name..counter)then
            local res,body = http.request("GET","https://api.roblox.com/users/get-by-username?username="..name..counter) --Number types combined with a string will be converted tostring so there is no need, unless you are paranoid about it and have a bad experience with errors I can't tell you want you can do.
            local bodyj1 = json.parse(body)
            if bodyj1 then
                if bodyj1.errorMessage == "User not found" then
                    if res.code == 200 then
                        local res1,body1 = http.request("GET","https://auth.roblox.com/v1/usernames/validate?birthday=2004-09-16T05:00:00.000Z&context=Signup&username="..name..counter)
                        local bodyj2 = json.parse(body1)
                        if bodyj2 then
                            if bodyj2.code then
                                p(counter,bodyj2.code)
            ---[[
                                --if bodyj.code == 0 then
                                write(file..".txt",read(file..".txt")..counter.."\t"..bodyj2.code.."\n") --So we can make something else to check what's inside(because I can't fucking do my job here as a scripter).
                                p(200,counter,res,body) --The 200 and number after is just for visualization on what is happening yk? so 200 is okay 403 taken 406 not allowed.
                                --else
                                --   p("wtf?",counter) --The API is broken so I have to check if it's real or not
                            end
                        end
                    else
                        counter=counter-10
                        p("Timed out...") --I think because it's too many request.
                        wait(5)
                    end
                else
                    p(403,counter)
                end
            else
                counter=counter-10
                p("Timed out...") --Same reason abovehhhh
                wait(5)
            end
        else
            p(406,counter)
        end
    end
--]]

end)()





--[[Was having issues because I forgot about secure-socket from luvit
coroutine.wrap(function()
    local head,body = http.request("GET", "https://ponger.glitch.me/",{{"Content-Type","text/plain"}})
    print(body)
end)()
--]]


--[[
coroutine.wrap(function()
    local res,body = http.request("GET","https://luvit.io")
    p(res,body)
end)()
--]]
