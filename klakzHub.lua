-- klakz Hub - TR/EN Dil Desteği & Login Sonrası Bildirimli Sürüm

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

-- Aktif Dil Değişkeni ("TR" veya "EN")
local currentLang = "TR"

-- Metin Sözlüğü
local texts = {
    TR = {
        loginTitle = "⚡ KLAKZ HUB | GİRİŞ",
        placeholder = "Anahtarınızı (Key) girin...",
        stdBtn = "Standart Giriş Yap",
        vipBtn = "👑 VIP / Premium Giriş",
        stdTitle = "⚡ klakz Hub [Standart Sürüm]",
        vipTitle = "👑 klakz Hub [VIP Sürüm]",
        notifTitle = "Sistem Bilgilendirmesi",
        notifDesc = "klakz Hub başarıyla yüklendi! Key onaylandı.",
        notifBtn = "Tamam",
        tabs = {"Genel Araçlar", "Strongest Battle.", "Anime Vanguards", "Gym League", "Type Soul", "Arm Wrestle Sim", "Doors", "Blade Ball", "Fisch", "Blox Fruits"},
        errKey = "❌ Geçersiz Anahtar!",
        errVipKey = "❌ Geçersiz VIP Anahtar!"
    },
    EN = {
        loginTitle = "⚡ KLAKZ HUB | LOGIN",
        placeholder = "Enter your key...",
        stdBtn = "Standard Login",
        vipBtn = "👑 VIP / Premium Login",
        stdTitle = "⚡ klakz Hub [Standard Version]",
        vipTitle = "👑 klakz Hub [VIP Version]",
        notifTitle = "System Notification",
        notifDesc = "klakz Hub successfully loaded! Key verified.",
        notifBtn = "OK",
        tabs = {"General Tools", "Strongest Battle.", "Anime Vanguards", "Gym League", "Type Soul", "Arm Wrestle Sim", "Doors", "Blade Ball", "Fisch", "Blox Fruits"},
        errKey = "❌ Invalid Key!",
        errVipKey = "❌ Invalid VIP Key!"
    }
}

-- ==================== 1. LOGIN EKRANI ====================
local LoginCard = Instance.new("Frame")
LoginCard.Parent = ScreenGui
LoginCard.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
LoginCard.Position = UDim2.new(0.5, -170, 0.5, -120)
LoginCard.Size = UDim2.new(0, 340, 0, 240)
LoginCard.Active = true
LoginCard.Draggable = true

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 12)
CardCorner.Parent = LoginCard

local CardStroke = Instance.new("UIStroke")
CardStroke.Color = Color3.fromRGB(99, 102, 241)
CardStroke.Thickness = 2
CardStroke.Parent = LoginCard

local LoginTitle = Instance.new("TextLabel")
LoginTitle.Parent = LoginCard
LoginTitle.BackgroundTransparency = 1
LoginTitle.Position = UDim2.new(0, 0, 0, 15)
LoginTitle.Size = UDim2.new(1, 0, 0, 30)
LoginTitle.Font = Enum.Font.GothamBold
LoginTitle.Text = texts.TR.loginTitle
LoginTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginTitle.TextSize = 16

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = LoginCard
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeyInput.Position = UDim2.new(0, 25, 0, 65)
KeyInput.Size = UDim2.new(0, 290, 0, 42)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = texts.TR.placeholder
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderColor3 = Color3.fromRGB(110, 110, 130)
KeyInput.TextSize = 13

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

local BtnStandard = Instance.new("TextButton")
BtnStandard.Parent = LoginCard
BtnStandard.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
BtnStandard.Position = UDim2.new(0, 25, 0, 120)
BtnStandard.Size = UDim2.new(0, 290, 0, 42)
BtnStandard.Font = Enum.Font.GothamBold
BtnStandard.Text = texts.TR.stdBtn
BtnStandard.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnStandard.TextSize = 13

local StdCorner = Instance.new("UICorner")
StdCorner.CornerRadius = UDim.new(0, 8)
StdCorner.Parent = BtnStandard

local BtnVIP = Instance.new("TextButton")
BtnVIP.Parent = LoginCard
BtnVIP.BackgroundColor3 = Color3.fromRGB(234, 179, 8)
BtnVIP.Position = UDim2.new(0, 25, 0, 172)
BtnVIP.Size = UDim2.new(0, 290, 0, 42)
BtnVIP.Font = Enum.Font.GothamBold
BtnVIP.Text = texts.TR.vipBtn
BtnVIP.TextColor3 = Color3.fromRGB(20, 20, 25)
BtnVIP.TextSize = 13

local VipCorner = Instance.new("UICorner")
VipCorner.CornerRadius = UDim.new(0, 8)
VipCorner.Parent = BtnVIP


-- ==================== 2. BİLGİLENDİRME (ALERT) PENCERESİ ====================
local function ShowNotification(callback)
    local NotifOverlay = Instance.new("Frame")
    NotifOverlay.Parent = ScreenGui
    NotifOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    NotifOverlay.BackgroundTransparency = 0.5
    NotifOverlay.Size = UDim2.new(1, 0, 1, 0)

    local NotifBox = Instance.new("Frame")
    NotifBox.Parent = NotifOverlay
    NotifBox.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    NotifBox.Position = UDim2.new(0.5, -140, 0.5, -75)
    NotifBox.Size = UDim2.new(0, 280, 0, 150)

    local BoxCorner = Instance.new("UICorner")
    BoxCorner.CornerRadius = UDim.new(0, 10)
    BoxCorner.Parent = NotifBox

    local BoxStroke = Instance.new("UIStroke")
    BoxStroke.Color = Color3.fromRGB(99, 102, 241)
    BoxStroke.Thickness = 2
    BoxStroke.Parent = NotifBox

    local Title = Instance.new("TextLabel")
    Title.Parent = NotifBox
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 0, 0, 12)
    Title.Size = UDim2.new(1, 0, 0, 25)
    Title.Font = Enum.Font.GothamBold
    Title.Text = texts[currentLang].notifTitle
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14

    local Desc = Instance.new("TextLabel")
    Desc.Parent = NotifBox
    Desc.BackgroundTransparency = 1
    Desc.Position = UDim2.new(0, 15, 0, 45)
    Desc.Size = UDim2.new(1, -30, 0, 45)
    Desc.Font = Enum.Font.Gotham
    Desc.Text = texts[currentLang].notifDesc
    Desc.TextColor3 = Color3.fromRGB(200, 200, 210)
    Desc.TextSize = 12
    Desc.TextWrapped = true

    local OkBtn = Instance.new("TextButton")
    OkBtn.Parent = NotifBox
    OkBtn.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
    OkBtn.Position = UDim2.new(0, 25, 0, 100)
    OkBtn.Size = UDim2.new(0, 230, 0, 32)
    OkBtn.Font = Enum.Font.GothamBold
    OkBtn.Text = texts[currentLang].notifBtn
    OkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    OkBtn.TextSize = 12

    local OkCorner = Instance.new("UICorner")
    OkCorner.CornerRadius = UDim.new(0, 6)
    OkCorner.Parent = OkBtn

    OkBtn.MouseButton1Click:Connect(function()
        NotifOverlay:Destroy()
        if callback then callback() end
    end)
end


-- ==================== 3. ANA KONTROL PANELİ ====================
local function LoadDashboard(isVIP)
    LoginCard:Destroy()

    ShowNotification(function()
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

        local TitleText = Instance.new("TextLabel")
        TitleText.Parent = TopBar
        TitleText.BackgroundTransparency = 1
        TitleText.Position = UDim2.new(0, 15, 0, 0)
        TitleText.Size = UDim2.new(0, 230, 1, 0)
        TitleText.Font = Enum.Font.GothamBold
        TitleText.Text = isVIP and texts[currentLang].vipTitle or texts[currentLang].stdTitle
        TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
        TitleText.TextSize = 13
        TitleText.TextXAlignment = Enum.TextXAlignment.Left

        -- Dil Değiştirme Butonları (TR / EN)
        local LangTR = Instance.new("TextButton")
        LangTR.Parent = TopBar
        LangTR.BackgroundColor3 = currentLang == "TR" and Color3.fromRGB(99, 102, 241) or Color3.fromRGB(35, 35, 45)
        LangTR.Position = UDim2.new(1, -100, 0, 10)
        LangTR.Size = UDim2.new(0, 26, 0, 25)
        LangTR.Font = Enum.Font.GothamBold
        LangTR.Text = "TR"
        LangTR.TextColor3 = Color3.fromRGB(255, 255, 255)
        LangTR.TextSize = 10

        local LangEN = Instance.new("TextButton")
        LangEN.Parent = TopBar
        LangEN.BackgroundColor3 = currentLang == "EN" and Color3.fromRGB(99, 102, 241) or Color3.fromRGB(35, 35, 45)
        LangEN.Position = UDim2.new(1, -70, 0, 10)
        LangEN.Size = UDim2.new(0, 26, 0, 25)
        LangEN.Font = Enum.Font.GothamBold
        LangEN.Text = "EN"
        LangEN.TextColor3 = Color3.fromRGB(255, 255, 255)
        LangEN.TextSize = 10

        LangTR.MouseButton1Click:Connect(function()
            currentLang = "TR"
            ScreenGui:Destroy()
            LoadDashboard(isVIP)
        end)

        LangEN.MouseButton1Click:Connect(function()
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

        CloseButton.MouseButton1Click:Connect(function()
            ScreenGui:Destroy()
        end)

        -- Sekmeler ve İçerik Alanı
        local TabsContainer = Instance.new("ScrollingFrame")
        TabsContainer.Parent = Dashboard
        TabsContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
        TabsContainer.Position = UDim2.new(0, 12, 0, 58)
        TabsContainer.Size = UDim2.new(0, 140, 0, 310)
        TabsContainer.CanvasSize = UDim2.new(0, 0, 3.2, 0)
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

            ScriptBtn.MouseButton1Click:Connect(function()
                local status, err = pcall(callback)
                if not status then warn("Çalıştırma hatası: " .. tostring(err)) end
            end)
        end

        -- Sekmeleri Oluşturma
        local tNames = texts[currentLang].tabs

        local TabGenel = CreateCategory(tNames[1])
        AddScriptButton(TabGenel, "Güvenli Fly (Uçma)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))() end)
        AddScriptButton(TabGenel, "Infinite Yield (Admin)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
        AddScriptButton(TabGenel, "Speed Hack (50 Hız)", function() local p = game.Players.LocalPlayer if p.Character and p.Character:FindFirstChild("Humanoid") then p.Character.Humanoid.WalkSpeed = 50 end end)
        AddScriptButton(TabGenel, "Godmode (Ölümsüzlük)", function() local p = game.Players.LocalPlayer if p.Character and p.Character:FindFirstChild("Humanoid") then p.Character.Humanoid.MaxHealth = math.huge p.Character.Humanoid.Health = math.huge end end)

        local TabTSB = CreateCategory(tNames[2])
        AddScriptButton(TabTSB, "BadWare Hub", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/sandwichk/RobloxScripts/main/Scripts/BadWare/Hub/Load.lua", true))() end)

        local TabAV = CreateCategory(tNames[3])
        AddScriptButton(TabAV, "Vanguard Auto Farm", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/AnimeVanguards"))() end)

        local TabGym = CreateCategory(tNames[4])
        AddScriptButton(TabGym, "Gym League Auto Train", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"))() end)

        local TabType = CreateCategory(tNames[5])
        AddScriptButton(TabType, "Type Soul Auto Farm", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/xu-dev/typesoul/main/loader.lua"))() end)

        local TabArm = CreateCategory(tNames[6])
        AddScriptButton(TabArm, "Arm Wrestle Auto Clicker", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/ArmWrestle"))() end)

        local TabDoors = CreateCategory(tNames[7])
        AddScriptButton(TabDoors, "Doors ESP & Notifier", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"))() end)

        local TabBB = CreateCategory(tNames[8])
        AddScriptButton(TabBB, "Auto Parry", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"))() end)

        local TabFisch = CreateCategory(tNames[9])
        AddScriptButton(TabFisch, "Speed Hub X", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))() end)

        local TabBF = CreateCategory(tNames[10])
        AddScriptButton(TabBF, "Redz Hub", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"))() end)
    end)
end

-- ==================== GİRİŞ BUTONLARI ====================
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
