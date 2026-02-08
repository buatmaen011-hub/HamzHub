-- 🦈 HamzHub v1 by Hamz | Fish It Custom | Tema Hijau Kuning | Auto Execute 2026
-- No Key | Bali Exclusive | Instant Perfect Fish 🚀🐟

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Custom Tema Hijau Kuning OP! 🟢🟡
local HamzTheme = {
    SchemeColor = Color3.fromRGB(173, 255, 47),  -- Lime Green-Yellow Accent (glowy)
    Background = Color3.fromRGB(10, 20, 15),     -- Dark Green BG
    Header = Color3.fromRGB(20, 35, 25),         -- Darker Green Header
    TextColor = Color3.fromRGB(255, 255, 224),   -- Light Lemon Yellow Text
    ElementColor = Color3.fromRGB(25, 45, 35)    -- Mid Green Elements
}

local Window = Library.CreateLib("🦈 HamzHub v1 - Fish It OP!", HamzTheme)

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
local PurchaseWeather = Events:WaitForChild("PurchaseWeather") or nil

-- TP Positions Update 2026 (Event auto detect)
local TPs = {
    Spawn = CFrame.new(0, 15, 0),
    SellShop = CFrame.new(-50, 10, 0),
    Island1 = CFrame.new(100, 10, 100),
    Island2 = CFrame.new(-200, 10, 150),
    Event = CFrame.new(300, 5, -100),  -- Worm/Admin/Event
    Boat = CFrame.new(0, 5, 200)
}

local function tp(cf)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = cf
    end
end

getgenv().Hamz = {AutoFish = true, AutoSell = true, AutoBuyRod = true, AutoBuyBait = true, AutoWeather = true, Speed = 100, InfJump = true}

-- Auto Fish Perfect/Instant (Anti Detect)
local function autoFish()
    spawn(function()
        while getgenv().Hamz.AutoFish do
            pcall(function()
                CastRod:FireServer()
                local conn; conn = RunService.Heartbeat:Connect(function()
                    if player.Character:FindFirstChild("Rod") and player.Character.Rod:FindFirstChild("Bite") then
                        ReelRod:FireServer("Perfect")
                        conn:Disconnect()
                    end
                end)
                wait(1.5)
                if conn then conn:Disconnect() end
            end)
            wait(0.8)
        end
    end)
end

-- Auto Sell/Buy Loop
spawn(function()
    while true do
        wait(4)
        if getgenv().Hamz.AutoSell then pcall(function() SellFish:FireServer() end) end
        tp(TPs.SellShop)
        wait(1)
        if getgenv().Hamz.AutoBuyRod then pcall(function() PurchaseRod:FireServer("Diamond Rod") end) end  -- Best Rod
        if getgenv().Hamz.AutoBuyBait then pcall(function() PurchaseBait:FireServer("Mythical Bait") end) end  -- Best Bait
        if getgenv().Hamz.AutoWeather and PurchaseWeather then pcall(function() PurchaseWeather:FireServer("Storm") end) end
    end
end)

-- Player Hacks Loop
spawn(function()
    while true do
        wait()
        if player.Character then
            local hum = player.Character:FindFirstChild("Humanoid")
            if hum then
                hum.WalkSpeed = getgenv().Hamz.Speed
                hum.JumpPower = getgenv().Hamz.InfJump and 200 or 50
            end
        end
    end
end)

-- GUI HamzHub 🟢🟡
local FarmTab = Window:NewTab("🐟 Auto Farm")
local FarmSec = FarmTab:NewSection("HamzHub Farming")
FarmTab:NewToggle("Auto Fish Perfect", "Instant Catch", function(s)
    getgenv().Hamz.AutoFish = s
    if s then autoFish() end
end)
FarmTab:NewToggle("Auto Sell", "Jual otomatis", function(s) getgenv().Hamz.AutoSell = s end)
FarmTab:NewToggle("Auto Buy Diamond Rod", "Rod terbaik", function(s) getgenv().Hamz.AutoBuyRod = s end)
FarmTab:NewToggle("Auto Buy Mythical Bait", "Bait OP", function(s) getgenv().Hamz.AutoBuyBait = s end)
FarmTab:NewToggle("Auto Buy Weather", "Storm/Rain", function(s) getgenv().Hamz.AutoWeather = s end)

local TPTab = Window:NewTab("📍 Teleport")
local TPSec = TPTab:NewSection("Locations")
TPTab:NewButton("TP Sell Shop", function() tp(TPs.SellShop) end)
TPTab:NewButton("TP Spawn", function() tp(TPs.Spawn) end)
TPTab:NewButton("TP Island 1", function() tp(TPs.Island1) end)
TPTab:NewButton("TP Event/Worm", function() tp(TPs.Event) end)
TPTab:NewButton("TP Boat", function() tp(TPs.Boat) end)

local PlayerTab = Window:NewTab("👤 Player")
local PlayerSec = PlayerTab:NewSection("Hacks")
PlayerTab:NewSlider("Speed", "9x+", 500, 16, function(s) getgenv().Hamz.Speed = s end)
PlayerTab:NewSlider("Jump Power", "Inf Jump", 500, 50, function(s) getgenv().Hamz.InfJump = s > 50 end)
PlayerTab:NewToggle("Inf Stamina", "No capek", function(s)
    if player.Character then player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics) end
end)

local MiscTab = Window:NewTab("⚙️ Misc")
MiscTab:NewButton("Rejoin (Anti Ban)", function() TeleportService:Teleport(121864768012064) end)
MiscTab:NewButton("Anti AFK", function()
    local vu = game:GetService("VirtualUser")
    player.Idled:Connect(function() vu:CaptureController() vu:ClickButton2(Vector2.new()) end)
end)

-- AUTO EXECUTE ON LOAD! 🔥
autoFish()
print("🦈 HamzHub v1 Loaded! | Tema Hijau Kuning | Auto Farm ON 💎🐟 | GG Bali!")
