-- 🦈 HamzHub v2.1 by Email (Fish It OP Hub 2026 - Keyless - Tema Hijau Kuning)
-- PlaceId: Fish It! Confirmed 121864768012064
if game.PlaceId \~= 121864768012064 then 
    return game.Players.LocalPlayer:Kick("HamzHub: Join Fish It bro! 🔥 https://www.roblox.com/games/121864768012064/Fish-It") 
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Custom Theme Hijau Kuning (tropical neon vibe)
local CustomTheme = {
    TextColor = Color3.fromRGB(255, 255, 200),       -- Kuning muda cerah buat text utama
    Background = Color3.fromRGB(20, 50, 30),         -- Hijau gelap background utama
    Topbar = Color3.fromRGB(30, 80, 40),             -- Hijau lebih terang buat topbar
    Accent = Color3.fromRGB(255, 215, 0),            -- Kuning gold/accent buat button toggle/slider active
    ElementBackground = Color3.fromRGB(25, 60, 35),  -- Background section/toggle
    ElementBackgroundHover = Color3.fromRGB(40, 90, 50), -- Hover effect
    ElementStroke = Color3.fromRGB(100, 200, 100),   -- Border hijau neon
    ElementPlaceholder = Color3.fromRGB(180, 180, 150),
    ElementTransparency = 0.85,                      -- Transparansi biar ga terlalu solid
    Notifications = {
        Actions = {
            Color = Color3.fromRGB(255, 215, 0),     -- Kuning buat notif action
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
    Theme = CustomTheme  -- <-- Ini custom theme hijau kuning!
})

-- Sisanya sama persis seperti v2.0 (Auto Farm, Toggle, Button, dll)
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

-- (Copy sisanya dari code v2.0: Auto Sell, Sell Now Button, Auto Buy, Teleport Tab, Player Tab, Inf Jump, Anti-AFK, Notify, print akhir)
-- Biar ga panjang banget di sini, ambil dari pesan gw sebelumnya (dari local autoSellToggle sampe Rayfield:Notify dan print terakhir).
-- Kalau lu males copy manual, bilang "kirim full v2.1 lagi" gw paste lengkap.

Rayfield:Notify({
    Title = "HamzHub v2.1 Loaded!",
    Content = "Tema Hijau Kuning Bali OP! Toggle & farm gaspol 🦈🌴",
    Duration = 5,
    Image = 4483362458
})

print("🦈 HamzHub v2.1 Hijau Kuning Loaded! | Denpasar, Bali 2026 🔥")
