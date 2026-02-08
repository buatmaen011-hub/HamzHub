-- 🦈 HamzHub Mini v1 - Test UI Hijau Kuning (Pasti Muncul!)
if game.PlaceId \~= 121864768012064 then 
    game.Players.LocalPlayer:Kick("Join Fish It bro!") 
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local CustomTheme = {
    TextColor = Color3.fromRGB(255, 255, 200),
    Background = Color3.fromRGB(20, 50, 30),
    Topbar = Color3.fromRGB(30, 80, 40),
    Accent = Color3.fromRGB(255, 215, 0),
    ElementBackground = Color3.fromRGB(25, 60, 35),
    ElementStroke = Color3.fromRGB(100, 200, 100),
    ElementTransparency = 0.9,
    Notifications = { Actions = { Color = Color3.fromRGB(255, 215, 0) } }
}

local Window = Rayfield:CreateWindow({
    Name = "🦈 HamzHub Mini - Fish It",
    LoadingTitle = "Loading Mini...",
    LoadingSubtitle = "Bali Style",
    KeySystem = false,
    Theme = CustomTheme
})

local Tab = Window:CreateTab("Test")

Tab:CreateLabel("HamzHub Mini Loaded! 🌴🟢🟡")

Tab:CreateToggle({
    Name = "Test Toggle (Klik aja)",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            print("Toggle ON bro!")
        else
            print("Toggle OFF")
        end
    end
})

Tab:CreateButton({
    Name = "Test Button - Print Hello",
    Callback = function()
        print("Hello from HamzHub Mini! 🔥")
        Rayfield:Notify({Title = "Test", Content = "Button clicked!", Duration = 3})
    end
})

print("HamzHub Mini UI Loaded! Cek GUI hijau kuning.")
