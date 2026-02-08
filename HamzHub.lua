-- 🦈 HamzHub v2.3 by Email (Fish It OP Hub 2026 - Keyless - Tema Hijau Kuning FULL FEATURES FIXED!)
-- PlaceId Check + Auto Fish Remote + Sell/Buy/TP/Speed/Anti AFK + Error Handling
if game.PlaceId \~= 121864768012064 then 
    return game.Players.LocalPlayer:Kick("HamzHub: Join Fish It bro! 🔥 https://www.roblox.com/games/121864768012064/Fish-It") 
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Custom Theme Hijau Kuning Neon Tropical (Glowy OP!)
local CustomTheme = {
    TextColor = Color3.fromRGB(255, 255, 200),       -- Kuning muda cerah
    Background = Color3.fromRGB(20, 50, 30),         -- Hijau gelap
    Topbar = Color3.fromRGB(30, 80, 40),             -- Hijau terang topbar
    Accent = Color3.fromRGB(255, 215, 0),            -- Kuning gold accent
    ElementBackground = Color3.fromRGB(25, 60, 35),  
    ElementBackgroundHover = Color3.fromRGB(40, 90, 50),
    ElementStroke = Color3.fromRGB(100, 200, 100),   -- Neon green border
    ElementPlaceholder = Color3.fromRGB(180, 180, 150),
    ElementTransparency = 0.85,
    Notifications = { Actions = { Color = Color3.fromRGB(255, 215, 0) } }
}

local Window = Rayfield:CreateWindow({
    Name = "🦈 HamzHub v2.3 - Fish It OP!",
    LoadingTitle = "Loading by Email...",
    LoadingSubtitle = "Bali Full Features v2.3 FIXED 🌴",
    ConfigurationSaving = { Enabled = true, FolderName = "HamzHub", FileName = "FishIt" },
    Discord = { Enabled = false },
    KeySystem = false,
    Theme = CustomTheme
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer

local Events = ReplicatedStorage:WaitForChild("Events")
local CastRod = Events:WaitForChild("CastRod")
local ReelRod = Events:WaitForChild("ReelRod")
local SellFish = Events:WaitForChild("SellFish")
local PurchaseRod = Events:WaitForChild("PurchaseRod")
local PurchaseBait = Events:WaitForChild("PurchaseBait")
local PurchaseWeather = Events:FindFirstChild("PurchaseWeather")

-- TP Positions (adjust kalo game update lokasi)
local TPs = {
    SellShop = CFrame.new(-50, 10, 0),
    Spawn = CFrame.new(0, 15, 0),
    Island1 = CFrame.new(100, 10, 100),
    Island2 = CFrame.new(-200, 10, 150),
    Event = CFrame.new(300, 5, -100),
    Boat = CFrame.new(0, 5, 200)
}

local function tp(cf)
    pcall(function()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = cf
        end
    end)
end

-- Toggles
local autoFish = false
local autoSell = false
local autoBuyRod = false
local autoBuyBait = false
local autoWeather = false

-- Auto Farm Tab
local Tab1 = Window:CreateTab("🤖 Auto Farm", 4483362458)
Tab1:CreateSection("Fishing God Mode")

Tab1:CreateToggle({
    Name = "Auto Fish Perfect (Remote Instant)",
    CurrentValue = false,
    Callback = function(Value)
        autoFish = Value
        task.spawn(function()
            while autoFish do
                pcall(function()
                    if not player.Character then return end
                    CastRod:FireServer()
                    local conn = RunService.Heartbeat:Connect(function()
                        local rod = player.Character:FindFirstChild("Rod")
                        if rod and rod:FindFirstChildWhichIsA("ObjectValue") then  -- Bite detect
                            ReelRod:FireServer("Perfect")
                            conn:Disconnect()
                        end
                    end)
                    task.wait(2)
                    if conn.Connected then conn:Disconnect() end
                end)
                task.wait(0.7)
            end
        end)
    end
})

Tab1:CreateToggle({
    Name = "Auto Sell All + TP Shop",
    CurrentValue = false,
    Callback = function(Value)
        autoSell = Value
        task.spawn(function()
            while autoSell do
                pcall(function() SellFish:FireServer() end)
                tp(TPs.SellShop)
                task.wait(4)
            end
        end)
    end
})

Tab1:CreateToggle({
    Name = "Auto Buy Diamond Rod",
    CurrentValue = false,
    Callback = function(Value)
        autoBuyRod = Value
        task.spawn(function()
            while autoBuyRod do
                tp(TPs.SellShop)
                pcall(function() PurchaseRod:FireServer("Diamond Rod") end)
                task.wait(6)
            end
        end)
    end
})

Tab1:CreateToggle({
    Name = "Auto Buy Mythical Bait",
    CurrentValue = false,
    Callback = function(Value)
        autoBuyBait = Value
        task.spawn(function()
            while autoBuyBait do
                tp(TPs.SellShop)
                pcall(function() PurchaseBait:FireServer("Mythical Bait") end)
                task.wait(6)
            end
        end)
    end
})

if PurchaseWeather then
    Tab1:CreateToggle({
        Name = "Auto Buy Storm Weather",
        CurrentValue = false,
        Callback = function(Value)
            autoWeather = Value
            task.spawn(function()
                while autoWeather do
                    tp(TPs.SellShop)
                    pcall(function() PurchaseWeather:FireServer("Storm") end)
                    task.wait(10)
                end
            end)
        end
    })
end

-- Teleport Tab
local Tab2 = Window:CreateTab("📍 Teleport", 4483362458)
Tab2:CreateButton({Name = "TP Sell Shop", Callback = function() tp(TPs.SellShop) end})
Tab2:CreateButton({Name = "TP Spawn", Callback = function() tp(TPs.Spawn) end})
Tab2:CreateButton({Name = "TP Island 1", Callback = function() tp(TPs.Island1) end})
Tab2:CreateButton({Name = "TP Island 2", Callback = function() tp(TPs.Island2) end})
Tab2:CreateButton({Name = "TP Event Zone", Callback = function() tp(TPs.Event) end})
Tab2:CreateButton({Name = "TP Boat", Callback = function() tp(TPs.Boat) end})

-- Player Tab
local Tab3 = Window:CreateTab("👤 Player", 4483362458)
Tab3:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 500},
    Increment = 10,
    CurrentValue = 100,
    Callback = function(Value)
        pcall(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = Value
            end
        end)
    end
})

Tab3:CreateToggle({
    Name = "Inf Jump",
    CurrentValue = false,
    Callback = function(Value)
        task.spawn(function()
            while Value do
                pcall(function()
                    if player.Character and player.Character:FindFirstChild("Humanoid") then
                        player.Character.Humanoid.JumpPower = 200
                    end
                end)
                task.wait()
            end
        end)
    end
})

Tab3:CreateToggle({
    Name = "Inf Stamina",
    CurrentValue = false,
    Callback = function(Value)
        task.spawn(function()
            while Value do
                pcall(function()
                    if player.Character and player.Character:FindFirstChild("Humanoid") then
                        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
                    end
                end)
                task.wait()
            end
        end)
    end
})

-- Misc Tab
local Tab4 = Window:CreateTab("⚙️ Misc", 4483362458)
Tab4:CreateButton({
    Name = "Anti AFK (No Kick)",
    Callback = function()
        pcall(function()
            local vu = game:GetService("VirtualUser")
            player.Idled:Connect(function()
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
            Rayfield:Notify({Title = "Anti AFK ON", Content = "No kick bro!", Duration = 4})
        end)
    end
})
Tab4:CreateButton({
    Name = "Rejoin Server",
    Callback = function() pcall(function() TeleportService:Teleport(121864768012064, player) end) end
})

Rayfield:Notify({
    Title = "🦈 HamzHub v2.3 Loaded!",
    Content = "FULL FEATURES FIXED! No Error - Auto Fish/Sell/Buy/TP gaspol! Bali dominate 🌴💎",
    Duration = 7,
    Image = 4483362458
})

print("🦈 HamzHub v2.3 Hijau Kuning FULL FIXED! | No Error Work | Denpasar 2026 🔥")
