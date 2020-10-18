while true do fwait()
  fireclickdetector(game:GetService("Workspace").CoffeeGiver.CoffeeGiver.ClickDetector)
  local t = game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Coffee")
  t.CanBeDropped = true
  t.Parent = game:GetService("Players").LocalPlayer.Character
end
