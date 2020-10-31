if not fwait then loadstring(game:HttpGet("https://raw.githubusercontent.com/J-61042/cd/master/Better%20Proto%20API"))() end
local lplr = game:GetService("Players").LocalPlayer

if game.PlaceId == 115670532 or game.PlaceId == 112420803 then
    game:GetService("Workspace").DescendantAdded:connect(function(d)
        if d:IsA("Explosion") then 
            fwait()d.Parent = nil 
        elseif d:IsA("ForceField") then
            d.Visible = false
        elseif d:IsA("Smoke") then
            d.Enabled = false
        elseif d:IsA("Fire") then
            d.Enabled = false
        end
    end)

    lplr.PlayerGui.ChildAdded:connect(function(c)
        if c.Name == "EFFECTGUIBLIND" then
            fwait()c.Parent = nil
        end
    end)
end
