local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "⚡ Instant Fishing | By Grok for Kung",
    LoadingTitle = "Loading Instant Fishing...",
    LoadingSubtitle = "Full Auto • Rayfield GUI",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "GrokFishing",
        FileName = "InstantFish_Kung"
    },
    Discord = { Enabled = false },
    KeySystem = false
})

local Tab = Window:CreateTab("🎣 Fishing", 4483362458) -- fishing icon
local Section = Tab:CreateSection("🚀 Instant Fishing Farm")

local function InstantFish()
    -- Semua remote yang lu kasih digabung jadi 1 function
    game:GetService("ReplicatedStorage"):WaitForChild("FishingCatchSuccess"):FireServer()
    
    game:GetService("ReplicatedStorage"):WaitForChild("FishingSystem"):WaitForChild("PlayerCasted"):FireServer()
    
    local args = { Vector3.new(-174.57005310058594, 0.15000000596046448, -943.540771484375) }
    game:GetService("ReplicatedStorage"):WaitForChild("FishingSystem"):WaitForChild("FishGiver"):FireServer(unpack(args))
    
    game:GetService("ReplicatedStorage"):WaitForChild("FishingSystem"):WaitForChild("CleanupCast"):FireServer()
end

-- Button 1x klik
Tab:CreateButton({
    Name = "🎣 Catch 1 Fish Sekarang (Manual)",
    Callback = function()
        InstantFish()
        Rayfield:Notify({
            Title = "✅ Success!",
            Content = "1 ikan langsung didapet bro!",
            Duration = 3,
            Image = 4483362458
        })
    end,
})

-- Toggle Auto (super instant)
local AutoToggle = Tab:CreateToggle({
    Name = "🔥 AUTO Instant Fishing (Farm Tanpa Berhenti)",
    CurrentValue = false,
    Flag = "AutoFishKung",
    Callback = function(Value)
        getgenv().AutoFish = Value
        if Value then
            Rayfield:Notify({Title = "🚀 AUTO ON", Content = "Fishing non-stop mulai bro! Tekan toggle lagi buat stop", Duration = 5})
            task.spawn(function()
                while getgenv().AutoFish do
                    InstantFish()
                    task.wait(0.05) -- super cepet, ubah ke 0.1 kalo lag
                end
            end)
        else
            Rayfield:Notify({Title = "⛔ AUTO OFF", Content = "Fishing udah di-stop", Duration = 3})
        end
    end,
})

-- Bonus: Slider delay (kalo mau lebih pelan)
Tab:CreateSlider({
    Name = "⏱️ Delay Auto (detik)",
    Range = {0, 1},
    Increment = 0.05,
    CurrentValue = 0.05,
    Flag = "DelayFish",
    Callback = function(Value)
        -- delay diubah manual kalo mau
        print("Delay di-set ke: " .. Value)
    end,
})

Rayfield:LoadConfiguration()
Rayfield:Notify({
    Title = "✅ Loaded!",
    Content = "Instant Fishing GUI siap bro! Tekan K buat hide/show",
    Duration = 6,
    Image = "fish"
})

print("🎉 Instant Fishing by Grok loaded for Kung di Kuta Bali!")
