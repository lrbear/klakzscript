-- klakz Hub - Login / Key Sistemli & Tam Oyun Arşivli Sürüm

-- Tekrarlayan UI açılmalarını önleme
if game:GetService("CoreGui"):FindFirstChild("klakzHub_Screen") then
    game:GetService("CoreGui"):FindFirstChild("klakzHub_Screen"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "klakzHub_Screen"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- Key Ayarları
local NORMAL_KEY = "klakz123"
local PREMIUM_KEY = "klakz_vip_2026"

-- ==================== 1. GİRİŞ (LOGIN) EKRANI ====================
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = ScreenGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
KeyFrame.Position = UDim2.new(0.5, -160, 0.5, -110)
KeyFrame.Size = UDim2.new(0, 320, 0, 220)
KeyFrame.Active = true
KeyFrame.Draggable = true

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 10)
KeyCorner.Parent = KeyFrame

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(88, 101, 242)
KeyStroke.Thickness = 2
KeyStroke.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Parent = KeyFrame
KeyTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Text = "⚡ klakz Hub - Giriş Yap"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = 15

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = KeyTitle

local TextBox = Instance.new("TextBox")
TextBox.Parent = KeyFrame
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
TextBox.Position = UDim2.new(0, 25, 0, 55)
TextBox.Size = UDim2.new(0, 270, 0, 40)
TextBox.Font = Enum.Font.Gotham
TextBox.PlaceholderText = "Key'inizi buraya girin..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
TextBox.TextSize = 13

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = TextBox

local NormalBtn = Instance.new("TextButton")
NormalBtn.Parent = KeyFrame
NormalBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
NormalBtn.Position = UDim2.new(0, 25, 0, 105)
NormalBtn.Size = UDim2.new(0, 270, 0, 45)
NormalBtn.Font = Enum.Font.GothamBold
NormalBtn.Text = "Standard Giriş"
NormalBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NormalBtn.TextSize = 14

local NormalCorner = Instance.new("UICorner")
NormalCorner.CornerRadius = UDim.new(0, 6)
NormalCorner.Parent = NormalBtn

local PremiumBtn = Instance.new("TextButton")
PremiumBtn.Parent = KeyFrame
PremiumBtn.BackgroundColor3 = Color3.fromRGB(212, 175, 55)
PremiumBtn.Position = UDim2.new(0, 25, 0, 160)
PremiumBtn.Size = UDim2.new(0, 270, 0, 45)
PremiumBtn.Font = Enum.Font.GothamBold
PremiumBtn.Text = "👑 Premium / VIP Giriş"
PremiumBtn.TextColor3 = Color3.fromRGB(20, 20, 20)
PremiumBtn.TextSize = 14

local PremCorner = Instance.new("UICorner")
PremCorner.CornerRadius = UDim.new(0, 6)
PremCorner.Parent = PremiumBtn

-- ==================== 2. ANA MENÜ YÜKLEYİCİSİ ====================
local function LoadMainHub(isVIP)
    KeyFrame:Destroy()

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    MainFrame.Position = UDim2.new(0.5, -230, 0.5, -180)
    MainFrame.Size = UDim2.new(0, 460, 0, 360)
    MainFrame.Active = true
    MainFrame.Draggable = true

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 8)
    MainCorner.Parent = MainFrame

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = isVIP and Color3.fromRGB(212, 175, 55) or Color3.fromRGB(88, 101, 242)
    MainStroke.Thickness = 2
    MainStroke.Parent = MainFrame

    -- Başlık Çubuğu
    local TitleBar = Instance.new("TextLabel")
    TitleBar.Parent = MainFrame
    TitleBar.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.Font = Enum.Font.GothamBold
    TitleBar.Text = isVIP and "  👑 klakz Hub - VIP Sürüm" or "  ⚡ klakz Hub - Standard Sürüm"
    TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleBar.TextSize = 14
    TitleBar.TextXAlignment = Enum.TextXAlignment.Left

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = TitleBar
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseBtn.Position = UDim2.new(1, -35, 0, 8)
    CloseBtn.Size = UDim2.new(0, 25, 0, 24)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 12

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 4)
    CloseCorner.Parent = CloseBtn

    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Sol Sekme Listesi
    local TabList = Instance.new("ScrollingFrame")
    TabList.Parent = MainFrame
    TabList.Position = UDim2.new(0, 10, 0, 50)
    TabList.Size = UDim2.new(0, 135, 0, 300)
    TabList.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    TabList.CanvasSize = UDim2.new(0, 0, 3, 0)
    TabList.ScrollBarThickness = 4

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 6)
    TabCorner.Parent = TabList

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = TabList
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 4)

    -- Sağ İçerik Alanı
    local ContentFrame = Instance.new("ScrollingFrame")
    ContentFrame.Parent = MainFrame
    ContentFrame.Position = UDim2.new(0, 155, 0, 50)
    ContentFrame.Size = UDim2.new(0, 295, 0, 300)
    ContentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    ContentFrame.CanvasSize = UDim2.new(0, 0, 4, 0)
    ContentFrame.ScrollBarThickness = 4

    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 6)
    ContentCorner.Parent = ContentFrame

    -- Sekme Yapılandırıcı
    local isFirstTab = true
    local function CreateTab(name)
        local TabBtn = Instance.new("TextButton")
        TabBtn.Parent = TabList
        TabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        TabBtn.Size = UDim2.new(1, -8, 0, 32)
        TabBtn.Font = Enum.Font.GothamMedium
        TabBtn.Text = name
        TabBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
        TabBtn.TextSize = 12

        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 4)
        BtnCorner.Parent = TabBtn

        local Container = Instance.new("Frame")
        Container.Parent = ContentFrame
        Container.Size = UDim2.new(1, 0, 1, 0)
        Container.BackgroundTransparency = 1
        Container.Visible = false

        local ContainerLayout = Instance.new("UIListLayout")
        ContainerLayout.Parent = Container
        ContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContainerLayout.Padding = UDim.new(0, 6)

        TabBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(ContentFrame:GetChildren()) do
                if v:IsA("Frame") then v.Visible = false end
            end
            Container.Visible = true
        end)

        if isFirstTab then
            Container.Visible = true
            isFirstTab = false
        end

        return Container
    end

    local function AddButton(parent, text, callback)
        local Btn = Instance.new("TextButton")
        Btn.Parent = parent
        Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
        Btn.Size = UDim2.new(1, -10, 0, 30)
        Btn.Font = Enum.Font.Gotham
        Btn.Text = text
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        Btn.TextSize = 11

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 4)
        Corner.Parent = Btn

        Btn.MouseButton1Click:Connect(function()
            local success, err = pcall(callback)
            if not success then warn("Script çalıştırma hatası: " .. tostring(err)) end
        end)
    end

    -- ==================== KATEGORİLER & SCRIPT LİSTESİ ====================

    -- 1. Genel Araçlar
    local TabGenel = CreateTab("Genel Araçlar")
    AddButton(TabGenel, "Güvenli Fly (Uçma)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end)
    AddButton(TabGenel, "Infinite Yield (Admin)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    AddButton(TabGenel, "Speed Hack (Hız: 50)", function()
        local plr = game:GetService("Players").LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then plr.Character.Humanoid.WalkSpeed = 50 end
    end)
    AddButton(TabGenel, "Super Speed (Hız: 120)", function()
        local plr = game:GetService("Players").LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then plr.Character.Humanoid.WalkSpeed = 120 end
    end)
    AddButton(TabGenel, "Normal Hıza Dön (16)", function()
        local plr = game:GetService("Players").LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then plr.Character.Humanoid.WalkSpeed = 16 end
    end)
    AddButton(TabGenel, "Godmode (Ölümsüzlük)", function()
        local plr = game:GetService("Players").LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.MaxHealth = math.huge
            plr.Character.Humanoid.Health = math.huge
        end
    end)
    AddButton(TabGenel, "Noclip (Duvarlardan Geçme)", function()
        game:GetService("RunService").Stepped:Connect(function()
            local plr = game:GetService("Players").LocalPlayer
            if plr.Character then
                for _, v in pairs(plr.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
            end
        end)
    end)
    AddButton(TabGenel, "ESP / Player Highlighter", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MalwareHecker/ESP/main/loader.lua", true))()
    end)

    -- 2. Strongest Battlegrounds
    local TabTSB = CreateTab("Strongest Battle.")
    AddButton(TabTSB, "BadWare Hub", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sandwichk/RobloxScripts/main/Scripts/BadWare/Hub/Load.lua", true))()
    end)
    AddButton(TabTSB, "Ultimate Aura & Moveset (Efektli)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeScripter/TSB/main/Main.lua"))()
    end)
    AddButton(TabTSB, "Ultimate Combo & Feints", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJabez/TSB/main/Loader.lua"))()
    end)

    -- 3. Anime Vanguards
    local TabAV = CreateTab("Anime Vanguards")
    AddButton(TabAV, "Vanguard Auto Farm & Summon", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/AnimeVanguards"))()
    end)

    -- 4. Gym League
    local TabGym = CreateTab("Gym League")
    AddButton(TabGym, "Gym League Auto Train", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"))()
    end)

    -- 5. Type Soul
    local TabType = CreateTab("Type Soul")
    AddButton(TabType, "Type Soul Auto Farm", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xu-dev/typesoul/main/loader.lua"))()
    end)

    -- 6. Arm Wrestle Simulator
    local TabArm = CreateTab("Arm Wrestle Sim")
    AddButton(TabArm, "Arm Wrestle Auto Clicker", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/ArmWrestle"))()
    end)

    -- 7. Doors
    local TabDoors = CreateTab("Doors")
    AddButton(TabDoors, "Doors ESP & Notifier", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"))()
    end)

    -- 8. Blade Ball
    local TabBB = CreateTab("Blade Ball")
    AddButton(TabBB, "Auto Parry", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"))()
    end)
    AddButton(TabBB, "Reaper Hub", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AyoReaper/Reaper-Hub/main/loader.lua"))()
    end)

    -- 9. Fisch
    local TabFisch = CreateTab("Fisch")
    AddButton(TabFisch, "Speed Hub X", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end)
    AddButton(TabFisch, "Auto Fish & Catch", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PlatClient/Fisch/main/AutoFish"))()
    end)

    -- 10. Blox Fruits
    local TabBF = CreateTab("Blox Fruits")
    AddButton(TabBF, "Redz Hub", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"))()
    end)
    AddButton(TabBF, "W-Azure Hub", function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2b212f32f327e4e138a37943d39ec53b.lua"))()
    end)
end

-- ==================== LOGIN ETKİLEŞİMLERİ ====================
NormalBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == NORMAL_KEY then
        LoadMainHub(false)
    else
        NormalBtn.Text = "❌ Yanlış Key!"
        NormalBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.wait(1.5)
        NormalBtn.Text = "Standard Giriş"
        NormalBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    end
end)

PremiumBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == PREMIUM_KEY then
        LoadMainHub(true)
    else
        PremiumBtn.Text = "❌ Yanlış VIP Key!"
        PremiumBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.wait(1.5)
        PremiumBtn.Text = "👑 Premium / VIP Giriş"
        PremiumBtn.BackgroundColor3 = Color3.fromRGB(212, 175, 55)
    end
end)
