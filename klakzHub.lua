-- klakz Hub - Place ID Otomatik Algılamalı Akıllı Sistem

if game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI") then
    game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "klakzHub_MainUI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

local NORMAL_KEY = "klakz123"
local PREMIUM_KEY = "klakz_vip_2026"
local currentLang = "TR"
local currentPlaceId = game.PlaceId

-- Oyun Veritabanı (Place ID Eşleşmeleri ve Scriptleri)
local gameDatabase = {
    -- Popüler Dövüş / Anime
    [2753915549] = {name = "Blox Fruits", url = "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"},
    [10449761463] = {name = "The Strongest Battlegrounds", url = "https://raw.githubusercontent.com/skzu/TheStrongestBattlegrounds/main/Source.lua"},
    [1537690962] = {name = "Type Soul", url = "https://raw.githubusercontent.com/xu-dev/typesoul/main/loader.lua"},
    [16732694052] = {name = "Anime Vanguards", url = "https://raw.githubusercontent.com/scriptpastebin/raw/main/AnimeVanguards"},
    
    -- Simulator & Pet
    [8737899170] = {name = "Pet Simulator 99!", url = "https://raw.githubusercontent.com/XoAD2/PS99/main/Loader.lua"},
    [17260714902] = {name = "Fisch", url = "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua"},
    [10078438206] = {name = "Gym League", url = "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"},
    [16478940842] = {name = "Arm Wrestle Simulator", url = "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/ArmWrestle"},

    -- FPS & Yetenek
    [11520107397] = {name = "Blade Ball", url = "https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"},
    [142823291] = {name = "Murder Mystery 2", url = "https://raw.githubusercontent.com/sannin9000/Roblox/main/MM2"},
    [8554990801] = {name = "BedWars", url = "https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/loader.lua"},

    -- Korku & Hayatta Kalma
    [6516141723] = {name = "Doors", url = "https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"},
    [9872472334] = {name = "Evade", url = "https://raw.githubusercontent.com/RobloxScripts/Evade/main/Source.lua"},
    [286090429] = {name = "Arsenal", url = "https://raw.githubusercontent.com/fevse/Arsenal/main/Loader"}
}

local texts = {
    TR = {
        loginTitle = "KLAKZ HUB GİRİŞ",
        placeholder = "Anahtarınızı (Key) girin...",
        stdBtn = "Standart Giriş Yap",
        vipBtn = "👑 VIP / Premium Giriş",
        errKey = "❌ Geçersiz Anahtar!",
        errVipKey = "❌ Geçersiz VIP Anahtar!",
        alertText = "✅ Key Onaylandı! Sistem Yükleniyor...",
        stdHeader = "klakz Hub [Otomatik Algılama]",
        activeGame = "Algılanan Oyun ID: ",
        unknownGame = "⚠️ Bu oyun veritabanında yok (Genel Araçlar Aktif)"
    },
    EN = {
        loginTitle = "KLAKZ HUB LOGIN",
        placeholder = "Enter your key...",
        stdBtn = "Standard Login",
        vipBtn = "👑 VIP / Premium Login",
        errKey = "❌ Invalid Key!",
        errVipKey = "❌ Invalid VIP Key!",
        alertText = "✅ Key Verified! Loading System...",
        stdHeader = "klakz Hub [Auto Detect]",
        activeGame = "Detected Game ID: ",
        unknownGame = "⚠️ Game not in database (General Tools Active)"
    }
}

-- ==================== 1. LOGIN EKRANI ====================
local LoginCard = Instance.new("Frame")
LoginCard.Parent = ScreenGui
LoginCard.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
LoginCard.Position = UDim2.new(0.5, -170, 0.5, -135)
LoginCard.Size = UDim2.new(0, 340, 0, 270)
LoginCard.Active = true
LoginCard.Draggable = true
Instance.new("UICorner", LoginCard).CornerRadius = UDim.new(0, 12)

local CardStroke = Instance.new("UIStroke")
CardStroke.Color = Color3.fromRGB(99, 102, 241)
CardStroke.Thickness = 2
CardStroke.Parent = LoginCard

local LangTR = Instance.new("TextButton")
LangTR.Parent = LoginCard
LangTR.BackgroundColor3 = currentLang == "TR" and Color3.fromRGB(99, 102, 241) or Color3.fromRGB(35, 35, 45)
LangTR.Position = UDim2.new(1, -65, 0, 15)
LangTR.Size = UDim2.new(0, 22, 0, 22)
LangTR.Font = Enum.Font.GothamBold
LangTR.Text = "TR"
LangTR.TextColor3 = Color3.fromRGB(255, 255, 255)
LangTR.TextSize = 9
Instance.new("UICorner", LangTR).CornerRadius = UDim.new(0, 4)

local LangEN = Instance.new("TextButton")
LangEN.Parent = LoginCard
LangEN.BackgroundColor3 = currentLang == "EN" and Color3.fromRGB(99, 102, 241) or Color3.fromRGB(35, 35, 45)
LangEN.Position = UDim2.new(1, -38, 0, 15)
LangEN.Size = UDim2.new(0, 22, 0, 22)
LangEN.Font = Enum.Font.GothamBold
LangEN.Text = "EN"
LangEN.TextColor3 = Color3.fromRGB(255, 255, 255)
LangEN.TextSize = 9
Instance.new("UICorner", LangEN).CornerRadius = UDim.new(0, 4)

local LoginLogo = Instance.new("TextLabel")
LoginLogo.Parent = LoginCard
LoginLogo.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
LoginLogo.Position = UDim2.new(0, 15, 0, 15)
LoginLogo.Size = UDim2.new(0, 40, 0, 40)
LoginLogo.Font = Enum.Font.GothamBold
LoginLogo.Text = "⚡"
LoginLogo.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginLogo.TextSize = 18
Instance.new("UICorner", LoginLogo).CornerRadius = UDim.new(0, 10)

local LoginTitle = Instance.new("TextLabel")
LoginTitle.Parent = LoginCard
LoginTitle.BackgroundTransparency = 1
LoginTitle.Position = UDim2.new(0, 65, 0, 15)
LoginTitle.Size = UDim2.new(0, 180, 0, 40)
LoginTitle.Font = Enum.Font.GothamBold
LoginTitle.Text = texts[currentLang].loginTitle
LoginTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginTitle.TextSize = 13
LoginTitle.TextXAlignment = Enum.TextXAlignment.Left

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = LoginCard
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeyInput.Position = UDim2.new(0, 25, 0, 70)
KeyInput.Size = UDim2.new(0, 290, 0, 42)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = texts[currentLang].placeholder
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderColor3 = Color3.fromRGB(110, 110, 130)
KeyInput.TextSize = 13
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)

local BtnStandard = Instance.new("TextButton")
BtnStandard.Parent = LoginCard
BtnStandard.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
BtnStandard.Position = UDim2.new(0, 25, 0, 130)
BtnStandard.Size = UDim2.new(0, 290, 0, 42)
BtnStandard.Font = Enum.Font.GothamBold
BtnStandard.Text = texts[currentLang].stdBtn
BtnStandard.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnStandard.TextSize = 13
Instance.new("UICorner", BtnStandard).CornerRadius = UDim.new(0, 8)

local BtnVIP = Instance.new("TextButton")
BtnVIP.Parent = LoginCard
BtnVIP.BackgroundColor3 = Color3.fromRGB(234, 179, 8)
BtnVIP.Position = UDim2.new(0, 25, 0, 185)
BtnVIP.Size = UDim2.new(0, 290, 0, 42)
BtnVIP.Font = Enum.Font.GothamBold
BtnVIP.Text = texts[currentLang].vipBtn
BtnVIP.TextColor3 = Color3.fromRGB(20, 20, 25)
BtnVIP.TextSize = 13
Instance.new("UICorner", BtnVIP).CornerRadius = UDim.new(0, 8)

-- ==================== 2. ANA KONTROL PANELİ ====================
local function LoadDashboard(isVIP)
    LoginCard:Destroy()

    local Dashboard = Instance.new("Frame")
    Dashboard.Parent = ScreenGui
    Dashboard.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    Dashboard.Position = UDim2.new(0.5, -200, 0.5, -150)
    Dashboard.Size = UDim2.new(0, 400, 0, 300)
    Dashboard.Active = true
    Dashboard.Draggable = true
    Instance.new("UICorner", Dashboard).CornerRadius = UDim.new(0, 10)

    local DashStroke = Instance.new("UIStroke")
    DashStroke.Color = Color3.fromRGB(99, 102, 241)
    DashStroke.Thickness = 2
    DashStroke.Parent = Dashboard

    local TopBar = Instance.new("Frame")
    TopBar.Parent = Dashboard
    TopBar.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
    TopBar.Size = UDim2.new(1, 0, 0, 45)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

    local TitleText = Instance.new("TextLabel")
    TitleText.Parent = TopBar
    TitleText.BackgroundTransparency = 1
    TitleText.Position = UDim2.new(0, 15, 0, 0)
    TitleText.Size = UDim2.new(0, 300, 1, 0)
    TitleText.Font = Enum.Font.GothamBold
    TitleText.Text = texts[currentLang].stdHeader
    TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleText.TextSize = 12
    TitleText.TextXAlignment = Enum.TextXAlignment.Left

    local CloseButton = Instance.new("TextButton")
    CloseButton.Parent = TopBar
    CloseButton.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    CloseButton.Position = UDim2.new(1, -38, 0, 10)
    CloseButton.Size = UDim2.new(0, 26, 0, 25)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "✕"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 12
    Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0, 6)
    CloseButton.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    -- Bilgi Ekranı (Place ID Göstergesi)
    local InfoLabel = Instance.new("TextLabel")
    InfoLabel.Parent = Dashboard
    InfoLabel.BackgroundTransparency = 1
    InfoLabel.Position = UDim2.new(0, 15, 0, 55)
    InfoLabel.Size = UDim2.new(1, -30, 0, 30)
    InfoLabel.Font = Enum.Font.GothamMedium
    InfoLabel.Text = texts[currentLang].activeGame .. tostring(currentPlaceId)
    InfoLabel.TextColor3 = Color3.fromRGB(150, 150, 170)
    InfoLabel.TextSize = 12
    InfoLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- İçerik Alanı (ScrollingFrame)
    local Container = Instance.new("ScrollingFrame")
    Container.Parent = Dashboard
    Container.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    Container.Position = UDim2.new(0, 15, 0, 95)
    Container.Size = UDim2.new(1, -30, 1, -110)
    Container.CanvasSize = UDim2.new(0, 0, 2.0, 0)
    Container.ScrollBarThickness = 3

    local Layout = Instance.new("UIListLayout")
    Layout.Parent = Container
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0, 8)

    local function AddButton(label, callback)
        local Btn = Instance.new("TextButton")
        Btn.Parent = Container
        Btn.BackgroundColor3 = Color3.fromRGB(38, 38, 50)
        Btn.Size = UDim2.new(1, 0, 0, 38)
        Btn.Font = Enum.Font.GothamBold
        Btn.Text = label
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        Btn.TextSize = 12
        Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)

        Btn.MouseButton1Click:Connect(function()
            pcall(callback)
        end)
    end

    -- Her Oyunda Çalışan Genel Araçlar
    AddButton("🚀 Güvenli Fly (Uçma V3)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end)
    AddButton("⚡ Infinite Yield (Admin Komutları)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    AddButton("👁️ Universal ESP (Oyuncuları Gör)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/ESP-Viewer/main/ESP-Viewer.lua"))()
    end)

    -- Place ID Eşleşmesine Göre Oyuna Özel Scripti Getir
    local detectedGame = gameDatabase[currentPlaceId]
    if detectedGame then
        AddButton("⭐ [" .. detectedGame.name .. "] Özel Scriptini Çalıştır", function()
            loadstring(game:HttpGet(detectedGame.url))()
        end)
    else
        local WarnLabel = Instance.new("TextLabel")
        WarnLabel.Parent = Container
        WarnLabel.BackgroundTransparency = 1
        WarnLabel.Size = UDim2.new(1, 0, 0, 35)
        WarnLabel.Font = Enum.Font.Gotham
        WarnLabel.Text = texts[currentLang].unknownGame
        WarnLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
        WarnLabel.TextSize = 11
    end
end

LangTR.MouseButton1Click:Connect(function()
    currentLang = "TR"
    LangTR.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
    LangEN.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    LoginTitle.Text = texts.TR.loginTitle
    KeyInput.PlaceholderText = texts.TR.placeholder
    BtnStandard.Text = texts.TR.stdBtn
    BtnVIP.Text = texts.TR.vipBtn
end)

LangEN.MouseButton1Click:Connect(function()
    currentLang = "EN"
    LangEN.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
    LangTR.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    LoginTitle.Text = texts.EN.loginTitle
    KeyInput.PlaceholderText = texts.EN.placeholder
    BtnStandard.Text = texts.EN.stdBtn
    BtnVIP.Text = texts.EN.vipBtn
end)

BtnStandard.MouseButton1Click:Connect(function()
    if KeyInput.Text == NORMAL_KEY then
        LoadDashboard(false)
    else
        BtnStandard.Text = texts[currentLang].errKey
        BtnStandard.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
        task.wait(1.5)
        BtnStandard.Text = texts[currentLang].stdBtn
        BtnStandard.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
    end
end)

BtnVIP.MouseButton1Click:Connect(function()
    if KeyInput.Text == PREMIUM_KEY then
        LoadDashboard(true)
    else
        BtnVIP.Text = texts[currentLang].errVipKey
        BtnVIP.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
        task.wait(1.5)
        BtnVIP.Text = texts[currentLang].vipBtn
        BtnVIP.BackgroundColor3 = Color3.fromRGB(234, 179, 8)
    end
end)
