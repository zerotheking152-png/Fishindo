local Rayfield=loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window=Rayfield:CreateWindow({Name="hamzHub Beta Tester",LoadingTitle="HamzHub Is Loading",LoadingSubtitle="Please Wait Hama",ConfigurationSaving={Enabled=true,FolderName="hamzHub",FileName="BetaKung"},Discord={Enabled=false},KeySystem=false})
local Tab=Window:CreateTab("main",4483362458)
local Section=Tab:CreateSection("MANCING MANUAL 1X BARU HIDUPIN BLATI")

local function InstantFish()
game:GetService("ReplicatedStorage"):WaitForChild("FishingCatchSuccess"):FireServer()
game:GetService("ReplicatedStorage"):WaitForChild("FishingSystem"):WaitForChild("PlayerCasted"):FireServer()
local args={Vector3.new(-174.57005310058594,0.15000000596046448,-943.540771484375)}
game:GetService("ReplicatedStorage"):WaitForChild("FishingSystem"):WaitForChild("FishGiver"):FireServer(unpack(args))
game:GetService("ReplicatedStorage"):WaitForChild("FishingSystem"):WaitForChild("CleanupCast"):FireServer()
end

Tab:CreateButton({Name="blati Catch 1",Callback=function()InstantFish()end})

Tab:CreateToggle({Name="blati Auto",CurrentValue=false,Flag="blatiAuto",Callback=function(Value)
getgenv().blatiAuto=Value
if Value then task.spawn(function()while getgenv().blatiAuto do InstantFish() task.wait(0.000001) end end)end
end})

Rayfield:LoadConfiguration()
