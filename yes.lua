local lplr = game:GetService("Players").LocalPlayer
while true do fwait()
  fireclickdetector(game:GetService("Workspace").CoffeeGiver.CoffeeGiver.ClickDetector)
  local t = lplr.Backpack:WaitForChild("Coffee")
  t.CanBeDropped = true
  t.Parent = lplr.Character
end
