-- klakz Hub - TR / EN Dil Seçenekli, Logolu ve Bildirimli Gelişmiş Sürüm

if game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI") then
    game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "klakzHub_MainUI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- Key Tanımları
local NORMAL_KEY = "klakz123"
local PREMIUM_KEY = "klakz_vip_2026"

-- Aktif Dil Değişkeni (Varsayılan: Türkçe)
local currentLang = "TR"

-- Metin Sözlüğü (Dil Destekleri)
local texts = {
    TR = {
        loginTitle = "KLAKZ HUB GİRİŞ",
        placeholder = "Anahtarınızı (Key) girin...",
        stdBtn = "Standart Giriş Yap",
        vipBtn = "👑 VIP / Premium Giriş",
        errKey = "❌ Geçersiz Anahtar!",
        errVipKey = "❌ Geçersiz VIP Anahtar!",
        alertText = "✅ Key Onaylandı! Hub Yükleniyor...",
        stdHeader = "klakz Hub [Standart Sürüm]",
        vipHeader = "klakz Hub [VIP Sürüm]",
        tabs = {"Genel Araçlar", "Universal Hubs", "Strongest Battle.", "Anime Vanguards", "Gym League", "Type Soul", "Arm Wrestle Sim", "Doors", "Blade Ball", "Fisch", "Blox Fruits"},
        scripts = {
            fly = "Güvenli Fly (Uçma V3)",
            inf = "Infinite Yield (Admin)",
            speed = "Speed Hack (50 Hız)",
            god = "Godmode (Ölümsüzlük)",
            noclip = "Noclip (Duvarlardan Geçme)",
            esp = "Universal ESP (Oyuncuları Gör)",
            dex = "Dex Explorer (Oyun Kodları)",
            spy = "Remote Spy (Event Yakalayıcı)",
            speedhub = "Speed Hub X",
            vape = "Vape V4 (PvP / Combat)",
            owl = "Owl Hub (Aimbot & ESP)",
            badware = "BadWare Hub",
            vanguard = "Vanguard Auto Farm",
            gym = "Gym League Auto Train",
            typesoul = "Type Soul Auto Farm",
            arm = "Arm Wrestle Auto Clicker",
            doors = "Doors ESP & Notifier",
            parry = "Auto Parry (Otomatik Savuşturma)",
            fischhub = "Fisch Auto Fish & Hub",
            redz = "Redz Hub"
        }
    },
    EN = {
        loginTitle = "KLAKZ HUB LOGIN",
        placeholder = "Enter your key...",
        stdBtn = "Standard Login",
        vipBtn = "👑 VIP / Premium Login",
        errKey = "❌ Invalid Key!",
        errVipKey = "❌ Invalid VIP Key!",
        alertText = "✅ Key Verified! Hub Loading...",
        stdHeader = "klakz Hub [Standard Version]",
        vipHeader = "klakz Hub [VIP Version]",
        tabs = {"General Tools", "Universal Hubs", "Strongest Battle.", "Anime Vanguards", "Gym League", "Type Soul", "Arm Wrestle Sim", "Doors", "Blade Ball", "Fisch", "Blox Fruits"},
        scripts = {
            fly = "Safe Fly (Fly Gui V3)",
            inf = "Infinite Yield (Admin)",
            speed = "Speed Hack (50 Speed)",
            god = "Godmode",
            noclip = "Noclip",
            esp = "Universal ESP",
            dex = "Dex Explorer",
            spy = "Remote Spy",
            speedhub = "Speed Hub X",
            vape = "Vape V4",
            owl = "Owl Hub",
            badware = "BadWare Hub",
            vanguard = "Vanguard Auto Farm",
            gym = "Gym League Auto Train",
            typesoul = "Type Soul Auto Farm",
            arm = "Arm Wrestle Auto Clicker",
            doors = "Doors ESP & Notifier",
            parry = "Auto Parry",
            fischhub = "Fisch Auto Fish & Hub",
            redz = "Redz Hub"
        }
    }
}

-- ==================== 1. MODERN LOGIN EKRANI (LOGOLU & DİLLİ) ====================
local LoginCard = Instance.new("Frame")
LoginCard.Parent = ScreenGui
LoginCard.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
LoginCard.Position = UDim2.new(0.5, -170, 0.5, -135)
LoginCard.Size = UDim2.new(0, 340, 0, 270)
LoginCard.Active = true
LoginCard.Draggable = true

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 12)
CardCorner.Parent = LoginCard

local CardStroke = Instance.new("UIStroke")
CardStroke.Color = Color3.fromRGB(99, 102, 241)
CardStroke.Thickness = 2
CardStroke.Parent = LoginCard

-- Dil Değiştirme Butonları (Login Ekranı Sağ Üst)
local LangTR = Instance.new("TextButton")
LangTR.Parent = LoginCard
LangTR.BackgroundColor3 = currentLang == "TR" and Color3.fromRGB(99, 102, 241) or Color3.fromRGB(35, 35, 45)
LangTR.Position = UDim2.new(1, -65, 0, 15)
LangTR.Size = UDim2.new(0, 22, 0, 22)
LangTR.Font = Enum.Font.GothamBold
LangTR.Text = "TR"
LangTR.TextColor3 = Color3.fromRGB(255, 255, 255)
LangTR.TextSize = 9

local TRCorner = Instance.new("UICorner")
TRCorner.CornerRadius = UDim.new(0, 4)
TRCorner.Parent = LangTR

local LangEN = Instance.new("TextButton")
LangEN.Parent = LoginCard
LangEN.BackgroundColor3 = currentLang == "EN" and Color3.fromRGB(99, 102, 241) or Color3.fromRGB(35, 35, 45)
LangEN.Position = UDim2.new(1, -38, 0, 15)
LangEN.Size = UDim2.new(0, 22, 0, 22)
LangEN.Font = Enum.Font.GothamBold
LangEN.Text = "EN"
LangEN.TextColor3 = Color3.fromRGB(255, 255, 255)
LangEN.TextSize = 9

local ENCorner = Instance.new("UICorner")
ENCorner.CornerRadius = UDim.new(0, 4)
ENCorner.Parent = LangEN

-- Logo / İkon Alanı
local LoginLogo = Instance.new("TextLabel")
LoginLogo.Parent = LoginCard
LoginLogo.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
LoginLogo.Position = UDim2.new(0, 15, 0, 15)
LoginLogo.Size = UDim2.new(0, 40, 0, 40)
LoginLogo.Font = Enum.Font.GothamBold
LoginLogo.Text = "⚡"
LoginLogo.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginLogo.TextSize = 18

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 10)
LogoCorner.Parent = LoginLogo

-- Login Başlık
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

-- Key Kutusu
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

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

-- Standart Giriş Butonu
local BtnStandard = Instance.new("TextButton")
BtnStandard.Parent = LoginCard
BtnStandard.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
BtnStandard.Position = UDim2.new(0, 25, 0, 130)
BtnStandard.Size = UDim2.new(0, 290, 0, 42)
BtnStandard.Font = Enum.Font.GothamBold
BtnStandard.Text = texts[currentLang].stdBtn
BtnStandard.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnStandard.TextSize = 13

local StdCorner = Instance.new("UICorner")
StdCorner.CornerRadius = UDim.new(0, 8)
StdCorner.Parent = BtnStandard

-- VIP Giriş Butonu
local BtnVIP = Instance.new("TextButton")
BtnVIP.Parent = LoginCard
BtnVIP.BackgroundColor3 = Color3.fromRGB(234, 179, 8)
BtnVIP.Position = UDim2.new(0, 25, 0, 185)
BtnVIP.Size = UDim2.new(0, 290, 0, 42)
BtnVIP.Font = Enum.Font.GothamBold
BtnVIP.Text = texts[currentLang].vipBtn
BtnVIP.TextColor3 = Color3.fromRGB(20, 20, 25)
BtnVIP.TextSize = 13

local VipCorner = Instance.new("UICorner")
VipCorner.CornerRadius = UDim.new(0, 8)
VipCorner.Parent = BtnVIP


-- ==================== 2. ANA KONTROL PANELİ ====================
local function LoadDashboard(isVIP)
    LoginCard:Destroy()

    -- Giriş Sonrası Şık Bilgilendirme Banner'ı
    local AlertBanner = Instance.new("Frame")
    AlertBanner.Parent = ScreenGui
    AlertBanner.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    AlertBanner.Position = UDim2.new(0.5, -160, 0, -60)
    AlertBanner.Size = UDim2.new(0, 320, 0, 50)

    local AlertCorner = Instance.new("UICorner")
    AlertCorner.CornerRadius = UDim.new(0, 8)
    AlertCorner.Parent = AlertBanner

    local AlertStroke = Instance.new("UIStroke")
    AlertStroke.Color = Color3.fromRGB(34, 197, 94)
    AlertStroke.Thickness = 2
    AlertStroke.Parent = AlertBanner

    local AlertText = Instance.new("TextLabel")
    AlertText.Parent = AlertBanner
    AlertText.BackgroundTransparency = 1
    AlertText.Size = UDim2.new(1, 0, 1, 0)
    AlertText.Font = Enum.Font.GothamBold
    AlertText.Text = texts[currentLang].alertText
    AlertText.TextColor3 = Color3.fromRGB(255, 255, 255)
    AlertText.TextSize = 13

    AlertBanner:TweenPosition(UDim2.new(0.5, -160, 0, 30), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)

    task.delay(1.5, function()
        AlertBanner:TweenPosition(UDim2.new(0.5, -160, 0, -60), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true)
        task.wait(0.3)
        AlertBanner:Destroy()

        -- Ana Panel
        local Dashboard = Instance.new("Frame")
        Dashboard.Parent = ScreenGui
        Dashboard.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
        Dashboard.Position = UDim2.new(0.5, -240, 0.5, -190)
        Dashboard.Size = UDim2.new(0, 480, 0, 380)
        Dashboard.Active = true
        Dashboard.Draggable = true

        local DashCorner = Instance.new("UICorner")
        DashCorner.CornerRadius = UDim.new(0, 10)
        DashCorner.Parent = Dashboard

        local DashStroke = Instance.new("UIStroke")
        DashStroke.Color = isVIP and Color3.fromRGB(234, 179, 8) or Color3.fromRGB(99, 102, 241)
        DashStroke.Thickness = 2
        DashStroke.Parent = Dashboard

        -- Üst Bilgi Barı
        local TopBar = Instance.new("Frame")
        TopBar.Parent = Dashboard
        TopBar.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
        TopBar.Size = UDim2.new(1, 0, 0, 45)

        local TopCorner = Instance.new("UICorner")
        TopCorner.CornerRadius = UDim.new(0, 10)
        TopCorner.Parent = TopBar

        -- Üst Bar Logo
        local SmallLogo = Instance.new("TextLabel")
        SmallLogo.Parent = TopBar
        SmallLogo.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
        SmallLogo.Position = UDim2.new(0, 10, 0, 10)
        SmallLogo.Size = UDim2.new(0, 25, 0, 25)
        SmallLogo.Font = Enum.Font.GothamBold
        SmallLogo.Text = "⚡"
        SmallLogo.TextColor3 = Color3.fromRGB(255, 255, 255)
        SmallLogo.TextSize = 12

        local SLogoCorner = Instance.new("UICorner")
        SLogoCorner.CornerRadius = UDim.new(0, 6)
        SLogoCorner.Parent = SmallLogo

        local TitleText = Instance.new("TextLabel")
        TitleText.Parent = TopBar
        TitleText.BackgroundTransparency = 1
        TitleText.Position = UDim2.new(0, 45, 0, 0)
        TitleText.Size = UDim2.new(0, 240, 1, 0)
        TitleText.Font = Enum.Font.GothamBold
        TitleText.Text = isVIP and texts[currentLang].vipHeader or texts[currentLang].stdHeader
        TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
        TitleText.TextSize = 12
        TitleText.TextXAlignment = Enum.TextXAlignment.Left

        -- İçeride Dil Değiştirme Butonları (Sağ Üst)
        local DashLangTR = Instance.new("TextButton")
        DashLangTR.Parent = TopBar
        DashLangTR.BackgroundColor3 = currentLang == "TR" and Color3.fromRGB(99, 102, 241) or Color3.fromRGB(35, 35, 45)
        DashLangTR.Position = UDim2.new(1, -98, 0, 10)
        DashLangTR.Size = UDim2.new(0, 25, 0, 25)
        DashLangTR.Font = Enum.Font.GothamBold
        DashLangTR.Text = "TR"
        DashLangTR.TextColor3 = Color3.fromRGB(255, 255, 255)
        DashLangTR.TextSize = 9

        local DLTRCorner = Instance.new("UICorner")
        DLTRCorner.CornerRadius = UDim.new(0, 5)
        DLTRCorner.Parent = DashLangTR

        local DashLangEN = Instance.new("TextButton")
        DashLangEN.Parent = TopBar
        DashLangEN.BackgroundColor3 = currentLang == "EN" and Color3.fromRGB(99, 102, 241) or Color3.fromRGB(35, 35, 45)
        DashLangEN.Position = UDim2.new(1, -68, 0, 10)
        DashLangEN.Size = UDim2.new(0, 25, 0, 25)
        DashLangEN.Font = Enum.Font.GothamBold
        DashLangEN.Text = "EN"
        DashLangEN.TextColor3 = Color3.fromRGB(255, 255, 255)
        DashLangEN.TextSize = 9

        local DLENCorner = Instance.new("UICorner")
        DLENCorner.CornerRadius = UDim.new(0, 5)
        DLENCorner.Parent = DashLangEN

        DashLangTR.MouseButton1Click:Connect(function()
            currentLang = "TR"
            ScreenGui:Destroy()
            LoadDashboard(isVIP)
        end)

        DashLangEN.MouseButton1Click:Connect(function()
            currentLang = "EN"
            ScreenGui:Destroy()
            LoadDashboard(isVIP)
        end)

        local CloseButton = Instance.new("TextButton")
        CloseButton.Parent = TopBar
        CloseButton.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
        CloseButton.Position = UDim2.new(1, -38, 0, 10)
        CloseButton.Size = UDim2.new(0, 26, 0, 25)
        CloseButton.Font = Enum.Font.GothamBold
        CloseButton.Text = "✕"
        CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        CloseButton.TextSize = 12

        local CloseCorner = Instance.new("UICorner")
        CloseCorner.CornerRadius = UDim.new(0, 6)
        CloseCorner.Parent = CloseButton

        CloseButton.MouseButton1Click:Connect(function()
            ScreenGui:Destroy()
        end)

        -- Sekmeler ve İçerik Alanı
        local TabsContainer = Instance.new("ScrollingFrame")
        TabsContainer.Parent = Dashboard
        TabsContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
        TabsContainer.Position = UDim2.new(0, 12, 0, 58)
        TabsContainer.Size = UDim2.new(0, 140, 0, 310)
        TabsContainer.CanvasSize = UDim2.new(0, 0, 3.5, 0)
        TabsContainer.ScrollBarThickness = 3

        local TabsLayout = Instance.new("UIListLayout")
        TabsLayout.Parent = TabsContainer
        TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabsLayout.Padding = UDim.new(0, 5)

        local PagesContainer = Instance.new("ScrollingFrame")
        PagesContainer.Parent = Dashboard
        PagesContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
        PagesContainer.Position = UDim2.new(0, 162, 0, 58)
        PagesContainer.Size = UDim2.new(0, 306, 0, 310)
        PagesContainer.CanvasSize = UDim2.new(0, 0, 4.5, 0)
        PagesContainer.ScrollBarThickness = 3

        local firstTab = true
        local function CreateCategory(name)
            local TabBtn = Instance.new("TextButton")
            TabBtn.Parent = TabsContainer
            TabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
            TabBtn.Size = UDim2.new(1, -6, 0, 34)
            TabBtn.Font = Enum.Font.GothamMedium
            TabBtn.Text = name
            TabBtn.TextColor3 = Color3.fromRGB(210, 210, 220)
            TabBtn.TextSize = 11

            local BtnCorner = Instance.new("UICorner")
            BtnCorner.CornerRadius = UDim.new(0, 6)
            BtnCorner.Parent = TabBtn

            local Page = Instance.new("Frame")
            Page.Parent = PagesContainer
            Page.Size = UDim2.new(1, 0, 1, 0)
            Page.BackgroundTransparency = 1
            Page.Visible = false

            local PageLayout = Instance.new("UIListLayout")
            PageLayout.Parent = Page
            PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
            PageLayout.Padding = UDim.new(0, 6)

            TabBtn.MouseButton1Click:Connect(function()
                for _, v in pairs(PagesContainer:GetChildren()) do
                    if v:IsA("Frame") then v.Visible = false end
                end
                Page.Visible = true
            end)

            if firstTab then
                Page.Visible = true
                firstTab = false
            end

            return Page
        end

        local function AddScriptButton(parent, label, callback)
            local ScriptBtn = Instance.new("TextButton")
            ScriptBtn.Parent = parent
            ScriptBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 50)
            ScriptBtn.Size = UDim2.new(1, -10, 0, 34)
            ScriptBtn.Font = Enum.Font.Gotham
            ScriptBtn.Text = label
            ScriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            ScriptBtn.TextSize = 12

            local ScriptCorner = Instance.new("UICorner")
            ScriptCorner.CornerRadius = UDim.new(0, 6)
            ScriptCorner.Parent = ScriptBtn

            ScriptBtn.MouseButton1Click:Connect(function()
                local status, err = pcall(callback)
                if not status then warn("Error: " .. tostring(err)) end
            end)
        end

        -- Sekmeler ve Çevrilmiş Script İsimleri
        local tNames = texts[currentLang].tabs
        local sNames = texts[currentLang].scripts

        -- 1. Genel Araçlar
        local TabGenel = CreateCategory(tNames[1])
        AddScriptButton(TabGenel, sNames.fly, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))() end)
        AddScriptButton(TabGenel, sNames.inf, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
        AddScriptButton(TabGenel, sNames.speed, function() local p = game.Players.LocalPlayer if p.Character and p.Character:FindFirstChild("Humanoid") then p.Character.Humanoid.WalkSpeed = 50 end end)
        AddScriptButton(TabGenel, sNames.god, function() local p = game.Players.LocalPlayer if p.Character and p.Character:FindFirstChild("Humanoid") then p.Character.Humanoid.MaxHealth = math.huge p.Character.Humanoid.Health = math.huge end end)
        AddScriptButton(TabGenel, sNames.noclip, function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Noclip-12345"))() end)

        -- 2. Universal Hubs (Yeni Eklenen Geniş Kapsamlı Scriptler)
        local TabUniversal = CreateCategory(tNames[2])
        AddScriptButton(TabUniversal, sNames.esp, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/PrivateUser202/ESP/main/UniversalESP.lua"))() end)
        AddScriptButton(TabUniversal, sNames.speedhub, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))() end)
        AddScriptButton(TabUniversal, sNames.vape, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))() end)
        AddScriptButton(TabUniversal, sNames.owl, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))() end)
        AddScriptButton(TabUniversal, sNames.dex, function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Dark-Dex-V3-15638"))() end)
        AddScriptButton(TabUniversal, sNames.spy, function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Remote-Spy-Hub-6102"))() end)

        -- 3. Oyun Sekmeleri
        local TabTSB = CreateCategory(tNames[3])
        AddScriptButton(TabTSB, sNames.badware, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/sandwichk/RobloxScripts/main/Scripts/BadWare/Hub/Load.lua", true))() end)

        local TabAV = CreateCategory(tNames[4])
        AddScriptButton(TabAV, sNames.vanguard, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/AnimeVanguards"))() end)

        local TabGym = CreateCategory(tNames[5])
        AddScriptButton(TabGym, sNames.gym, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"))() end)

        local TabType = CreateCategory(tNames[6])
        AddScriptButton(TabType, sNames.typesoul, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/xu-dev/typesoul/main/loader.lua"))() end)

        local TabArm = CreateCategory(tNames[7])
        AddScriptButton(TabArm, sNames.arm, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/ArmWrestle"))() end)

        local TabDoors = CreateCategory(tNames[8])
        AddScriptButton(TabDoors, sNames.doors, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"))() end)

        local TabBB = CreateCategory(tNames[9])
        AddScriptButton(TabBB, sNames.parry, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"))() end)

        local TabFisch = CreateCategory(tNames[10])
        AddScriptButton(TabFisch, sNames.fischhub, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))() end)

        local TabBF = CreateCategory(tNames[11])
        AddScriptButton(TabBF, sNames.redz, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"))() end)
    end)
end

-- Login Ekranı Dil Değiştirme Butonu Olayları
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

-- ==================== GİRİŞ KONTROLLERİ ====================
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
