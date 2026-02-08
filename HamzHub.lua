-- 🦈 HamzHub v2.2 by Email (Fish It OP Hub 2026 - Keyless - Tema Hijau Kuning FIXED!)
-- PlaceId Check + Full Features: Auto Fish Perfect, Sell, Buy, TP, Speed, Anti AFK
if game.PlaceId \~= 121864768012064 then 
    return game.Players.LocalPlayer:Kick("HamzHub: Join Fish It bro! 🔥 https://www.roblox.com/games/121864768012064/Fish-It") 
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Custom Theme Hijau Kuning Neon Tropical (Glowy OP!)
local CustomTheme = {
    TextColor = Color3.fromRGB(255, 255, 200),       -- Kuning muda cerah
    Background = Color3.fromRGB(20, 50, 30),         -- Hijau gelap
    Topbar = Color3.fromRGB(30, 80, 40),             -- Hijau terang
    Accent = Color3.fromRGB(255, 215, 0),            -- Kuning gold
    ElementBackground = Color3.fromRGB(25, 60, 35),  
    ElementBackgroundHover = Color3.fromRGB(40, 90, 50),
    ElementStroke = Color3.fromRGB(100, 200, 100),   -- Neon green border
    ElementPlaceholder = Color3.fromRGB(180, 180, 150),
    ElementTransparency = 0.85,
    Notifications = {
        Actions = { Color = Color3.fromRGB(255, 215, 0) }
    }
}

local Window = Rayfield:CreateWindow({
    Name = "🦈 HamzHub v2.2 - Fish It OP!",
    LoadingTitle = "Loading by Email...",
    LoadingSubtitle = "Bali Fixed v2.2 - Full Features ON! 🌴",
    ConfigurationSaving = { Enabled = true, FolderName = "HamzHub", FileName = "FishIt" },
    Discord = { Enabled = false },
    KeySystem = false,
    Theme = CustomTheme
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local player = Players.LocalPlayer

local Events = ReplicatedStorage:WaitForChild("Events")
local CastRod = Events:WaitForChild("CastRod")
local ReelRod = Events:WaitForChild("ReelRod")
local SellFish = Events:WaitForChild("SellFish")
local PurchaseRod = Events:WaitForChild("PurchaseRod")
local PurchaseBait = Events:WaitForChild("PurchaseBait")
local PurchaseWeather = Events:FindFirstChild("PurchaseWeather")

-- TP Positions (Update 2026 - Adjust if needed)
local TPs = {
    SellShop = CFrame.new(-50, 10, 0),
    Spawn = CFrame.new(0, 15, 0),
    Island1 = CFrame.new(100, 10, 100),
    Island2 = CFrame.new(-200, 10, 150),
    Event = CFrame.new(300, 5, -100),
    Boat = CFrame.new(0, 5, 200)
}

local function tp(cf)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = cf
    end
end

-- Variables
local autoFishToggle = false
local autoSellToggle = false
local autoBuyRodToggle = false
local autoBuyBaitToggle = false
local autoWeatherToggle = false

-- 🤖 Auto Farm Tab
local Tab1 = Window:CreateTab("🤖 Auto Farm", 4483362458)
local Section1 = Tab1:CreateSection("Fishing God Mode")

Tab1:CreateToggle({
    Name = "Auto Fish Instant Perfect (Remote Bypass)",
    CurrentValue = false,
    Flag = "AutoFish",
    Callback = function(Value)
        autoFishToggle = Value
        if Value then
            task.spawn(function()
                while autoFishToggle do
                    pcall(function()
                        CastRod:FireServer()
                        -- Detect Bite & Perfect Reel
                        local rodConn = player.Character.ChildAdded:Connect(function(child)
                            if child.Name == "Rod" then
                                local biteConn = child.ChildAdded:Connect(function(bite)
                                    if string.find(bite.Name:lower(), "bite") or bite.Name == "Bite" then
                                        ReelRod:FireServer("Perfect")
                                        biteConn:Disconnect()
                                    end
                                end)
                                task.wait(3)
                                biteConn:Disconnect()
                            end
                        end)
                        task.wait(2)
                        rodConn:Disconnect()
                    end)
                    task.wait(0.8)  -- Anti detect
                end
            end)
        end
    end
})

Tab1:CreateToggle({
    Name = "Auto Sell All",
    CurrentValue = false,
    Callback = function(Value)
        autoSellToggle = Value
        task.spawn(function()
            while autoSellToggle do
                pcall(function() SellFish:FireServer() end)
                tp(TPs.SellShop)
                task.wait(3)
            end
        end)
    end
})

Tab1:CreateToggle({
    Name = "Auto Buy Diamond Rod",
    CurrentValue = false,
    Callback = function(Value)
        autoBuyRodToggle = Value
        task.spawn(function()
            while autoBuyRodToggle do
                tp(TPs.SellShop)
                pcall(function() PurchaseRod:FireServer("Diamond Rod") end)
                task.wait(5)
            end
        end)
    end
})

Tab1:CreateToggle({
    Name = "Auto Buy Mythical Bait",
    CurrentValue = false,
    Callback = function(Value)
        autoBuyBaitToggle = Value
        task.spawn(function()
            while autoBuyBaitToggle do
                tp(TPs.SellShop)
                pcall(function() PurchaseBait:FireServer("Mythical Bait") end)
                task.wait(5)
            end
        end)
    end
})

if PurchaseWeather then
    Tab1:CreateToggle({
        Name = "Auto Buy Storm Weather",
        CurrentValue = false,
        Callback = function(Value)
            autoWeatherToggle = Value
            task.spawn(function()
                while autoWeatherToggle do
                    tp(TPs.SellShop)
                    pcall(function() PurchaseWeather:FireServer("Storm") end)
                    task.wait(10)
                end
            end)
        end
    })
end

-- 📍 Teleport Tab
local Tab2 = Window:CreateTab("📍 Teleport", 4483362458)
Tab2:CreateButton({
    Name = "TP Sell Shop",
    Callback = function() tp(TPs.SellShop) end
})
Tab2:CreateButton({
    Name = "TP Spawn",
    Callback = function() tp(TPs.Spawn) end
})
Tab2:CreateButton({
    Name = "TP Island 1",
    Callback = function() tp(TPs.Island1) end
})
Tab2:CreateButton({
    Name = "TP Island 2",
    Callback = function() tp(TPs.Island2) end
})
Tab2:CreateButton({
    Name = "TP Event Zone",
    Callback = function() tp(TPs.Event) end
})
Tab2:CreateButton({
    Name = "TP Boat",
    Callback = function() tp(TPs.Boat) end
})

-- 👤 Player Tab
local Tab3 = Window:CreateTab("👤 Player", 4483362458)
Tab3:CreateSlider({
    Name = "Walk Speed (9x+)",
    Range = {16, 500},
    Increment = 10,
    CurrentValue = 100,
    Callback = function(Value)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
    end
})
Tab3:CreateToggle({
    Name = "Inf Jump",
    CurrentValue = false,
    Callback = function(Value)
        task.spawn(function()
            while Value do
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.JumpPower = 200
                end
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
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
                end
                task.wait()
            end
        end)
    end
})

-- ⚙️ Misc Tab
local Tab4 = Window:CreateTab("⚙️ Misc", 4483362458)
Tab4:CreateButton({
    Name = "Anti AFK (No Kick)",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        player.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        Rayfield:Notify({Title = "Anti AFK ON", Content = "No kick lagi bro!", Duration = 3})
    end
})
Tab4:CreateButton({
    Name = "Rejoin Server (Anti Ban)",
    Callback = function()
        TeleportService:Teleport(121864768012064, player)
    end
})

Rayfield:Notify({
    Title = "🦈 HamzHub v2.2 Loaded!",
    Content = "Full features ON! Auto Farm gaspol - No more UI only! Bali OP 🌴💎",
    Duration = 6,
    Image = 4483362458
})

print("🦈 HamzHub v2.2 Hijau Kuning FIXED! | Auto Everything Work | Denpasar 2026 🔥")
