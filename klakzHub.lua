-- klakz Hub - Temiz Logo, Bildirim ve Sabit Login Sürümü

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

-- ==================== 1. MODERN LOGIN EKRANI (LOGOLU) ====================
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

-- Logo / İkon Alanı
local LoginLogo = Instance.new("TextLabel")
LoginLogo.Parent = LoginCard
LoginLogo.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
LoginLogo.Position = UDim2.new(0.5, -22, 0, 15)
LoginLogo.Size = UDim2.new(0, 44, 0, 44)
LoginLogo.Font = Enum.Font.GothamBold
LoginLogo.Text = "⚡"
LoginLogo.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginLogo.TextSize = 20

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 10)
LogoCorner.Parent = LoginLogo

-- Login Başlık
local LoginTitle = Instance.new("TextLabel")
LoginTitle.Parent = LoginCard
LoginTitle.BackgroundTransparency = 1
LoginTitle.Position = UDim2.new(0, 0, 0, 65)
LoginTitle.Size = UDim2.new(1, 0, 0, 25)
LoginTitle.Font = Enum.Font.GothamBold
LoginTitle.Text = "KLAKZ HUB GİRİŞ"
LoginTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginTitle.TextSize = 15

-- Key Kutusu
local KeyInput = Instance.new("TextBox")
KeyInput.Parent = LoginCard
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeyInput.Position = UDim2.new(0, 25, 0, 100)
KeyInput.Size = UDim2.new(0, 290, 0, 42)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = "Anahtarınızı (Key) girin..."
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
BtnStandard.Position = UDim2.new(0, 25, 0, 152)
BtnStandard.Size = UDim2.new(0, 290, 0, 42)
BtnStandard.Font = Enum.Font.GothamBold
BtnStandard.Text = "Standart Giriş Yap"
BtnStandard.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnStandard.TextSize = 13

local StdCorner = Instance.new("UICorner")
StdCorner.CornerRadius = UDim.new(0, 8)
StdCorner.Parent = BtnStandard

-- VIP Giriş Butonu
local BtnVIP = Instance.new("TextButton")
BtnVIP.Parent = LoginCard
BtnVIP.BackgroundColor3 = Color3.fromRGB(234, 179, 8)
BtnVIP.Position = UDim2.new(0, 25, 0, 204)
BtnVIP.Size = UDim2.new(0, 290, 0, 42)
BtnVIP.Font = Enum.Font.GothamBold
BtnVIP.Text = "👑 VIP / Premium Giriş"
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
    AlertText.Text = "✅ Key Onaylandı! Hub Yükleniyor..."
    AlertText.TextColor3 = Color3.fromRGB(255, 255, 255)
    AlertText.TextSize = 13

    -- Banner Animasyonu (Aşağı kaydır, bekle, yukarı çek ve Paneli aç)
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

        -- Üst Bar Küçük Logo
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
        TitleText.Size = UDim2.new(0, 300, 1, 0)
        TitleText.Font = Enum.Font.GothamBold
        TitleText.Text = isVIP and "klakz Hub [VIP Sürüm]" or "klakz Hub [Standart Sürüm]"
        TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
        TitleText.TextSize = 13
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
                if not status then warn("Çalıştırma hatası: " .. tostring(err)) end
            end)
        end

        -- Sekmeler ve Oyunlar
        local TabGenel = CreateCategory("Genel Araçlar")
        AddScriptButton(TabGenel, "Güvenli Fly (Uçma)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))() end)
        AddScriptButton(TabGenel, "Infinite Yield (Admin)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
        AddScriptButton(TabGenel, "Speed Hack (50 Hız)", function() local p = game.Players.LocalPlayer if p.Character and p.Character:FindFirstChild("Humanoid") then p.Character.Humanoid.WalkSpeed = 50 end end)
        AddScriptButton(TabGenel, "Godmode (Ölümsüzlük)", function() local p = game.Players.LocalPlayer if p.Character and p.Character:FindFirstChild("Humanoid") then p.Character.Humanoid.MaxHealth = math.huge p.Character.Humanoid.Health = math.huge end end)

        local TabTSB = CreateCategory("Strongest Battle.")
        AddScriptButton(TabTSB, "BadWare Hub", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/sandwichk/RobloxScripts/main/Scripts/BadWare/Hub/Load.lua", true))() end)

        local TabAV = CreateCategory("Anime Vanguards")
        AddScriptButton(TabAV, "Vanguard Auto Farm", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/AnimeVanguards"))() end)

        local TabGym = CreateCategory("Gym League")
        AddScriptButton(TabGym, "Gym League Auto Train", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"))() end)

        local TabType = CreateCategory("Type Soul")
        AddScriptButton(TabType, "Type Soul Auto Farm", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/xu-dev/typesoul/main/loader.lua"))() end)

        local TabArm = CreateCategory("Arm Wrestle Sim")
        AddScriptButton(TabArm, "Arm Wrestle Auto Clicker", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/ArmWrestle"))() end)

        local TabDoors = CreateCategory("Doors")
        AddScriptButton(TabDoors, "Doors ESP & Notifier", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"))() end)

        local TabBB = CreateCategory("Blade Ball")
        AddScriptButton(TabBB, "Auto Parry", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"))() end)

        local TabFisch = CreateCategory("Fisch")
        AddScriptButton(TabFisch, "Speed Hub X", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))() end)

        local TabBF = CreateCategory("Blox Fruits")
        AddScriptButton(TabBF, "Redz Hub", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"))() end)
    end)
end

-- ==================== GİRİŞ KONTROLLERİ ====================
BtnStandard.MouseButton1Click:Connect(function()
    if KeyInput.Text == NORMAL_KEY then
        LoadDashboard(false)
    else
        BtnStandard.Text = "❌ Geçersiz Anahtar!"
        BtnStandard.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
        task.wait(1.5)
        BtnStandard.Text = "Standart Giriş Yap"
        BtnStandard.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
    end
end)

BtnVIP.MouseButton1Click:Connect(function()
    if KeyInput.Text == PREMIUM_KEY then
        LoadDashboard(true)
    else
        BtnVIP.Text = "❌ Geçersiz VIP Anahtar!"
        BtnVIP.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
        task.wait(1.5)
        BtnVIP.Text = "👑 VIP / Premium Giriş"
        BtnVIP.BackgroundColor3 = Color3.fromRGB(234, 179, 8)
    end
end)
