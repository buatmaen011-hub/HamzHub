-- 🦈 HamzHub v2.1 by Email (Fish It OP Hub 2026 - Keyless - Tema Hijau Kuning)
-- PlaceId: Fish It! Confirmed 121864768012064
if game.PlaceId \~= 121864768012064 then 
    return game.Players.LocalPlayer:Kick("HamzHub: Join Fish It bro! 🔥 https://www.roblox.com/games/121864768012064/Fish-It") 
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Custom Theme Hijau Kuning (tropical neon vibe)
local CustomTheme = {
    TextColor = Color3.fromRGB(255, 255, 200),
    Background = Color3.fromRGB(20, 50, 30),
    Topbar = Color3.fromRGB(30, 80, 40),
    Accent = Color3.fromRGB(255, 215, 0),
    ElementBackground = Color3.fromRGB(25, 60, 35),
    ElementBackgroundHover = Color3.fromRGB(40, 90, 50),
    ElementStroke = Color3.fromRGB(100, 200, 100),
    ElementPlaceholder = Color3.fromRGB(180, 180, 150),
    ElementTransparency = 0.85,
    Notifications = {
        Actions = {
            Color = Color3.fromRGB(255, 215, 0),
            Stroke = Color3.fromRGB(200, 170, 0)
        }
    }
}

local Window = Rayfield:CreateWindow({
    Name = "🦈 HamzHub v2.1 - Fish It OP",
    LoadingTitle = "Loading by Email...",
    LoadingSubtitle = "from Bali with 💕",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "HamzHub",
        FileName = "FishIt"
    },
    Discord = { Enabled = false },
    KeySystem = false,
    Theme = CustomTheme
})

-- 🤖 Auto Farm Tab
local Tab1 = Window:CreateTab("🤖 Auto Farm", 4483362458)
local Section1 = Tab1:CreateSection("Fishing God Mode")

local autoFishToggle = false
Tab1:CreateToggle({
    Name = "Auto Fish Instant (Skip Minigame)",
    CurrentValue = false,
    Flag = "AutoFish",
    Callback = function(Value)
        autoFishToggle = Value
        task.spawn(function()
            while autoFishToggle do
                pcall(function()
                    local player = game.Players.LocalPlayer
                    local rod = player.Backpack:FindFirstChildOfClass("Tool") or player.Character:FindFirstChildOfClass("Tool")
                    if rod then rod.Parent = player.Character end
                    wait(0.1)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
                    wait(0.3)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 1)
                    wait(1)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 1)
                end)
                wait(0.5)
            end
        end)
    end
})

local autoSellToggle = false
Tab1:CreateToggle({
    Name = "Auto Sell (every 15s)",
    CurrentValue = false,
    Flag = "AutoSell",
    Callback = function(Value)
        autoSellToggle = Value
        task.spawn(function()
            while autoSellToggle do
                wait(15)
                pcall(function()
                    local ReplicatedStorage = game:GetService("ReplicatedStorage")
                    for _, rem in pairs(ReplicatedStorage:GetDescendants()) do
                        if rem:IsA("RemoteEvent") and (rem.Name:lower():find("sell") or rem.Name:find("Sell")) then
                            rem:FireServer("All")
                            break
                        end
                    end
                end)
            end
        end)
    end
})

Tab1:CreateButton({
    Name = "Sell Now + Dump Fish Remotes",
    Callback = function()
        pcall(function()
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            for _, rem in pairs(ReplicatedStorage:GetDescendants()) do
                if rem:IsA("RemoteEvent") and rem.Name:lower():find("sell") then 
                    rem:FireServer("All") 
                end
            end
        end)
        for _, v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
            if v:IsA("RemoteEvent") and (v.Name:lower():find("fish") or v.Name:lower():find("cast") or v.Name:lower():find("reel") or v.Name:lower():find("catch")) then
                print("🔥 FISH REMOTE:", v:GetFullName())
            end
        end
        print("🦈 HamzHub: Sell done! Check console for remotes.")
    end
})

local Section2 = Tab1:CreateSection("Auto Buy")
Tab1:CreateButton({
    Name = "Buy Best Rod + Bait (Adjust args from dump)",
    Callback = function()
        pcall(function()
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local buyRemote = ReplicatedStorage:FindFirstChild("PurchaseItem", true) or ReplicatedStorage:FindFirstChild("BuyItem", true)
            if buyRemote and buyRemote:IsA("RemoteEvent") then
                buyRemote:FireServer("BestRod")
                buyRemote:FireServer("BestBait")
            else
                print("Buy remote not found, use dump button first!")
            end
        end)
    end
})

-- 🚀 Teleport Tab
local Tab2 = Window:CreateTab("🚀 Teleport", 4483362458)
local Section3 = Tab2:CreateSection("Best Spots (Edit coords pake F3X/Dex)")
Tab2:CreateButton({
    Name = "TP Rare Fish Spot 1 (Crystal Depths)",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(150, 20, -300)
        end
    end
})
Tab2:CreateButton({
    Name = "TP Sell NPC",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0)
        end
    end
})

-- 💪 Player Tab
local Tab3 = Window:CreateTab("💪 Player", 4483362458)
local Section4 = Tab3:CreateSection("Boosts")
Tab3:CreateSlider({
    Name = "WalkSpeed (9x)",
    Range = {16, 500},
    Increment = 10,
    CurrentValue = 100,
    Flag = "WalkSpeed",
    Callback = function(Value)
        pcall(function()
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = Value
            end
        end)
    end
})
Tab3:CreateSlider({
    Name = "JumpPower",
    Range = {50, 500},
    Increment = 10,
    CurrentValue = 100,
    Flag = "JumpPower",
    Callback = function(Value)
        pcall(function()
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.JumpPower = Value
            end
        end)
    end
})
Tab3:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfJump",
    Callback = function(Value)
        if Value then
            local UserInputService = game:GetService("UserInputService")
            UserInputService.JumpRequest:Connect(function()
                local player = game.Players.LocalPlayer
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid:ChangeState(3)
                end
            end)
        end
    end
})

-- Anti-AFK Always On
game.Players.LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

Rayfield:Notify({
    Title = "HamzHub v2.1 Loaded!",
    Content = "Tema Hijau Kuning Bali OP! Klik 'Sell Now + Dump' dulu buat remotes. Lowkey no ban 🦈",
    Duration = 5,
    Image = 4483362458
})

print("🦈 HamzHub v2.1 Hijau Kuning Loaded! | Denpasar, Bali 2026 🔥")
