-- klakz Hub - Premium & Normal Tier System

-- ==================== KEYLER ====================
local NORMAL_KEY = "klakz123"
local PREMIUM_KEY = "klakz_vip_2026"

-- Ana Ekran (GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "klakz_Hub_Main"

-- ==================== GÜZELLEŞTİRİLMİŞ LOGIN / KEY PENCERESİ ====================
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = ScreenGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
KeyFrame.Position = UDim2.new(0.5, -160, 0.5, -110)
KeyFrame.Size = UDim2.new(0, 320, 0, 220)
KeyFrame.Active = true
KeyFrame.Draggable = true

-- Köşe yuvarlatma ve kenarlık
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = KeyFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(88, 101, 242)
UIStroke.Thickness = 2
UIStroke.Parent = KeyFrame

-- Başlık
local TitleBar = Instance.new("Frame")
TitleBar.Parent = KeyFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
TitleBar.Size = UDim2.new(1, 0, 0, 45)

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

local FixFrame = Instance.new("Frame")
FixFrame.Parent = TitleBar
FixFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
FixFrame.BorderSizePixel = 0
FixFrame.Position = UDim2.new(0, 0, 0.7, 0)
FixFrame.Size = UDim2.new(1, 0, 0.3, 0)

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Parent = TitleBar
KeyTitle.BackgroundTransparency = 1
KeyTitle.Size = UDim2.new(1, 0, 1, 0)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Text = "⚡ klakz Hub - Yetkilendirme"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = 16

-- TextBox (Key Girişi)
local TextBox = Instance.new("TextBox")
TextBox.Parent = KeyFrame
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
TextBox.Position = UDim2.new(0, 25, 0, 60)
TextBox.Size = UDim2.new(0, 270, 0, 40)
TextBox.Font = Enum.Font.Gotham
TextBox.PlaceholderText = "Key'inizi buraya girin..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
TextBox.TextSize = 14

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = TextBox

local BoxStroke = Instance.new("UIStroke")
BoxStroke.Color = Color3.fromRGB(50, 50, 65)
BoxStroke.Thickness = 1
BoxStroke.Parent = TextBox

-- Normal Giriş Butonu
local NormalBtn = Instance.new("TextButton")
NormalBtn.Parent = KeyFrame
NormalBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
NormalBtn.Position = UDim2.new(0, 25, 0, 110)
NormalBtn.Size = UDim2.new(0, 270, 0, 40)
NormalBtn.Font = Enum.Font.GothamBold
NormalBtn.Text = "Normal Giriş (Standard)"
NormalBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NormalBtn.TextSize = 14

local NormalCorner = Instance.new("UICorner")
NormalCorner.CornerRadius = UDim.new(0, 6)
NormalCorner.Parent = NormalBtn

-- Premium Giriş Butonu
local PremiumBtn = Instance.new("TextButton")
PremiumBtn.Parent = KeyFrame
PremiumBtn.BackgroundColor3 = Color3.fromRGB(212, 175, 55)
PremiumBtn.Position = UDim2.new(0, 25, 0, 160)
PremiumBtn.Size = UDim2.new(0, 270, 0, 40)
PremiumBtn.Font = Enum.Font.GothamBold
PremiumBtn.Text = "👑 Premium Giriş (VIP)"
PremiumBtn.TextColor3 = Color3.fromRGB(20, 20, 20)
PremiumBtn.TextSize = 14

local PremCorner = Instance.new("UICorner")
PremCorner.CornerRadius = UDim.new(0, 6)
PremCorner.Parent = PremiumBtn

-- ==================== ANA MENÜ YÜKLEYİCİSİ ====================
local function ArayuzuBaslat(isPremium)
    local DiscordLib = loadstring(game:HttpGet("https://gitlab.com/HileciBabaYT/hbest/-/raw/main/hbscripthubui"))()

    local titleText = isPremium and "klakz Hub [👑 PREMIUM VIP]" or "klakz Hub [Normal Sürüm]"
    local win = DiscordLib:Window(titleText)
    
    local notifMsg = isPremium and "Hoş geldin VIP Üye! Tüm Premium özellikler aktif." or "Normal sürüm yüklendi."
    DiscordLib:Notification("Bildirim", notifMsg, "Tamam")

    local serv = win:Server("Aktif Oyun Menüsü", "")

    -- ==================== GENEL ARAÇLAR ====================
    local globalChannel = serv:Channel("Genel Araçlar")
    globalChannel:Button("Güvenli Fly (Uçma)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end)
    globalChannel:Button("Infinite Yield (Admin Komutları)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    globalChannel:Button("Anti Fling (Uçmaya Karşı Koruma)", function()
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local localPlayer = Players.LocalPlayer
        RunService.Stepped:Connect(function()
            if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= localPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        v.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                        v.Character.HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
                    end
                end
            end
        end)
    end)

    -- PREMIUM ÖZEL GENEL ARAÇLAR
    if isPremium then
        local premChannel = serv:Channel("👑 Premium Araçlar")
        premChannel:Label("VIP Kullanıcılara Özel Ekstra Araçlar:")
        premChannel:Button("ESP / Player Highlighter", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/MalwareHecker/ESP/main/loader.lua", true))()
        end)
        premChannel:Button("FPS Booster & Lag Silici", function()
            local terrain = workspace.Terrain
            terrain.WaterWaveSize = 0
            terrain.WaterWaveSpeed = 0
            terrain.WaterTransparency = 0
            settings().Rendering.QualityLevel = 1
            print("FPS Boost aktif edildi!")
        end)
    end

    -- ==================== OYUN ÖZEL SCRIPTLERİ ====================
    if game.PlaceId == 12177325772 then
        -- Super League Soccer
        local btns = serv:Channel("Super League Soccer")
        btns:Button("Super League Soccer Scripti", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/SuperLeagueSoccer"))()
        end)
        if isPremium then
            btns:Button("👑 SLS Pro Aimbot & Curve", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/SuperLeagueSoccerPremium"))()
            end)
        end

    elseif game.PlaceId == 13772394625 then
        -- Blade Ball
        local btns = serv:Channel("Blade Ball Özel")
        btns:Button("Auto Parry (Blade Ball)", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"))()
        end)
        btns:Button("Reaper Hub (Blade Ball)", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AyoReaper/Reaper-Hub/main/loader.lua"))()
        end)
        if isPremium then
            btns:Button("👑 Blade Ball Godmode / Spam Aura", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJabez/BladeBall/main/V3"))()
            end)
        end

    elseif game.PlaceId == 10449761463 then
        -- The Strongest Battlegrounds
        local btns = serv:Channel("Strongest Battlegrounds")
        btns:Button("BadWare Hub", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sandwichk/RobloxScripts/main/Scripts/BadWare/Hub/Load.lua", true))()
        end)
        if isPremium then
            btns:Button("👑 TSB Ultimate Combo & Moveset", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeScripter/TSB/main/Main.lua"))()
            end)
        end

    elseif game.PlaceId == 16732694052 then
        -- Fisch
        local btns = serv:Channel("Fisch Özel")
        btns:Button("Speed Hub X (Fisch)", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
        end)
        if isPremium then
            btns:Button("👑 Fisch Auto Fish & Perfect Catch", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/PlatClient/Fisch/main/AutoFish"))()
            end)
        end

    elseif game.PlaceId == 13651239634 then
        -- Blocks n' Props
        local btns = serv:Channel("Blocks n' Props Özel")
        btns:Button("Exordum (Blocks n' Props)", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Booger-Aids-V2/Exordum/refs/heads/main/Blocks%20n'%20Props"))()
        end)

    elseif game.PlaceId == 112731528776884 or game.PlaceId == 120700541929930 then
        -- Knife Duels
        local btns = serv:Channel("Knife Duels Özel")
        btns:Button("Knife Duels Script 1", function()
            loadstring(game:HttpGet("https://pastefy.app/iizD2kA3/raw"))()
        end)
        if isPremium then
            btns:Button("👑 Knife Duels VIP Hitbox / Aim", function()
                loadstring(game:HttpGet("https://pastefy.app/iizD2kA3/raw"))()
            end)
        end

    else
        local uyari = serv:Channel("Durum")
        uyari:Label("Bu oyun için özel hile yok.")
        uyari:Label("Sadece 'Genel Araçlar' kullanılabilir.")
    end
end

-- ==================== BUTON ETKİLEŞİMLERİ ====================
NormalBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == NORMAL_KEY then
        KeyFrame:Destroy()
        ArayuzuBaslat(false)
    else
        NormalBtn.Text = "❌ Yanlış Normal Key!"
        NormalBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        task.wait(1.5)
        NormalBtn.Text = "Normal Giriş (Standard)"
        NormalBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    end
end)

PremiumBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == PREMIUM_KEY then
        KeyFrame:Destroy()
        ArayuzuBaslat(true)
    else
        PremiumBtn.Text = "❌ Yanlış Premium Key!"
        PremiumBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        task.wait(1.5)
        PremiumBtn.Text = "👑 Premium Giriş (VIP)"
        PremiumBtn.BackgroundColor3 = Color3.fromRGB(212, 175, 55)
    end
end)
