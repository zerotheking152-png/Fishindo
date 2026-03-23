local Rayfield=loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window=Rayfield:CreateWindow({Name="hamzHub Beta Tester",LoadingTitle="hamzHub",LoadingSubtitle="BlaWit",ConfigurationSaving={Enabled=true,FolderName="hamzHub",FileName="BetaKung"},Discord={Enabled=false},KeySystem=false})
local Tab=Window:CreateTab("BlaWit",4483362458)
local Section=Tab:CreateSection("BlaWit")

local function InstantFish()
game:GetService("ReplicatedStorage"):WaitForChild("FishingCatchSuccess"):FireServer()
game:GetService("ReplicatedStorage"):WaitForChild("FishingSystem"):WaitForChild("PlayerCasted"):FireServer()
local args={Vector3.new(-174.57005310058594,0.15000000596046448,-943.540771484375)}
game:GetService("ReplicatedStorage"):WaitForChild("FishingSystem"):WaitForChild("FishGiver"):FireServer(unpack(args))
game:GetService("ReplicatedStorage"):WaitForChild("FishingSystem"):WaitForChild("CleanupCast"):FireServer()
end

Tab:CreateButton({Name="BlaWit Catch 1",Callback=function()InstantFish()end})

Tab:CreateToggle({Name="BlaWit Auto",CurrentValue=false,Flag="BlaWitAuto",Callback=function(Value)
getgenv().BlaWitAuto=Value
if Value then task.spawn(function()while getgenv().BlaWitAuto do InstantFish() task.wait(0.0001) end end)end
end})

Rayfield:LoadConfiguration()
