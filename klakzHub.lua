-- klakz Hub - Seki UI (Tam Donanımlı Sürüm v2.2)

if game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI") then
    game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI"):Destroy()
end

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "klakzHub_MainUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local STANDARD_KEY = "klakz123"
local PREMIUM_KEY = "klakz_vip_2026"
local currentLang = "TR"
local toggleKey = Enum.KeyCode.RightControl

local texts = {
    TR = {
        loginTitle = "KLAKZ HUB GİRİŞ",
        placeholder = "Anahtarınızı (Key) girin...",
        stdBtn = "Standart Giriş",
        vipBtn = "👑 Premium Giriş",
        errKey = "❌ Geçersiz Anahtar!",
        errVipKey = "❌ Geçersiz Premium Anahtar!",
        headerStd = "klakz Hub [Standart Sürüm]",
        headerVip = "klakz Hub [👑 PREMIUM SEKI UI]"
    },
    EN = {
        loginTitle = "KLAKZ HUB LOGIN",
        placeholder = "Enter your key...",
        stdBtn = "Standard Login",
        vipBtn = "👑 Premium Login",
        errKey = "❌ Invalid Key!",
        errVipKey = "❌ Invalid Premium Key!",
        headerStd = "klakz Hub [Standard Edition]",
        headerVip = "klakz Hub [👑 PREMIUM SEKI UI]"
    }
}

local LoadDashboard

-- ==================== BİLDİRİM SİSTEMİ (TOAST) ====================
local function ShowNotification(message, color)
    task.spawn(function()
        local Notif = Instance.new("Frame")
        Notif.Parent = ScreenGui
        Notif.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
        Notif.Position = UDim2.new(1, 10, 0.85, 0)
        Notif.Size = UDim2.new(0, 240, 0, 45)
        Instance.new("UICorner", Notif).CornerRadius = UDim.new(0, 8)

        local Stroke = Instance.new("UIStroke")
        Stroke.Color = color or Color3.fromRGB(99, 102, 241)
        Stroke.Thickness = 1.5
        Stroke.Parent = Notif

        local Label = Instance.new("TextLabel")
        Label.Parent = Notif
        Label.BackgroundTransparency = 1
        Label.Position = UDim2.new(0, 12, 0, 0)
        Label.Size = UDim2.new(1, -24, 1, 0)
        Label.Font = Enum.Font.FredokaOne
        Label.Text = message
        Label.TextColor3 = Color3.fromRGB(240, 240, 250)
        Label.TextSize = 11
        Label.TextXAlignment = Enum.TextXAlignment.Left

        Notif:TweenPosition(UDim2.new(1, -255, 0.85, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        task.wait(3)
        Notif:TweenPosition(UDim2.new(1, 10, 0.85, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true)
        task.wait(0.3)
        Notif:Destroy()
    end)
end

-- ==================== 1. LOGIN EKRANI ====================
local LoginCard = Instance.new("Frame")
LoginCard.Parent = ScreenGui
LoginCard.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
LoginCard.Position = UDim2.new(0.5, -170, 0.5, -145)
LoginCard.Size = UDim2.new(0, 340, 0, 280)
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
LangTR.Font = Enum.Font.FredokaOne
LangTR.Text = "TR"
LangTR.TextColor3 = Color3.fromRGB(255, 255, 255)
LangTR.TextSize = 10
Instance.new("UICorner", LangTR).CornerRadius = UDim.new(0, 4)

local LangEN = Instance.new("TextButton")
LangEN.Parent = LoginCard
LangEN.BackgroundColor3 = currentLang == "EN" and Color3.fromRGB(99, 102, 241) or Color3.fromRGB(35, 35, 45)
LangEN.Position = UDim2.new(1, -38, 0, 15)
LangEN.Size = UDim2.new(0, 22, 0, 22)
LangEN.Font = Enum.Font.FredokaOne
LangEN.Text = "EN"
LangEN.TextColor3 = Color3.fromRGB(255, 255, 255)
LangEN.TextSize = 10
Instance.new("UICorner", LangEN).CornerRadius = UDim.new(0, 4)

local LoginLogo = Instance.new("TextLabel")
LoginLogo.Parent = LoginCard
LoginLogo.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
LoginLogo.Position = UDim2.new(0, 15, 0, 15)
LoginLogo.Size = UDim2.new(0, 40, 0, 40)
LoginLogo.Font = Enum.Font.FredokaOne
LoginLogo.Text = "⚡"
LoginLogo.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginLogo.TextSize = 18
Instance.new("UICorner", LoginLogo).CornerRadius = UDim.new(0, 10)

local LoginTitle = Instance.new("TextLabel")
LoginTitle.Parent = LoginCard
LoginTitle.BackgroundTransparency = 1
LoginTitle.Position = UDim2.new(0, 65, 0, 15)
LoginTitle.Size = UDim2.new(0, 180, 0, 40)
LoginTitle.Font = Enum.Font.FredokaOne
LoginTitle.Text = texts[currentLang].loginTitle
LoginTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginTitle.TextSize = 14
LoginTitle.TextXAlignment = Enum.TextXAlignment.Left

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = LoginCard
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeyInput.Position = UDim2.new(0, 25, 0, 75)
KeyInput.Size = UDim2.new(0, 290, 0, 42)
KeyInput.Font = Enum.Font.FredokaOne
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
BtnStandard.Font = Enum.Font.FredokaOne
BtnStandard.Text = texts[currentLang].stdBtn
BtnStandard.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnStandard.TextSize = 14
Instance.new("UICorner", BtnStandard).CornerRadius = UDim.new(0, 8)

local BtnVIP = Instance.new("TextButton")
BtnVIP.Parent = LoginCard
BtnVIP.BackgroundColor3 = Color3.fromRGB(234, 179, 8)
BtnVIP.Position = UDim2.new(0, 25, 0, 185)
BtnVIP.Size = UDim2.new(0, 290, 0, 42)
BtnVIP.Font = Enum.Font.FredokaOne
BtnVIP.Text = texts[currentLang].vipBtn
BtnVIP.TextColor3 = Color3.fromRGB(20, 20, 25)
BtnVIP.TextSize = 14
Instance.new("UICorner", BtnVIP).CornerRadius = UDim.new(0, 8)

-- ==================== 2. SEKI UI PANELİ ====================
LoadDashboard = function(isVIP)
    LoginCard:Destroy()

    local Window = Instance.new("Frame")
    Window.Name = "SekiUI_Window"
    Window.Parent = ScreenGui
    Window.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    Window.Position = UDim2.new(0.5, -260, 0.5, -190)
    Window.Size = UDim2.new(0, 520, 0, 380)
    Window.Active = true
    Window.Draggable = true
    Instance.new("UICorner", Window).CornerRadius = UDim.new(0, 10)

    local WinStroke = Instance.new("UIStroke")
    WinStroke.Color = isVIP and Color3.fromRGB(234, 179, 8) or Color3.fromRGB(99, 102, 241)
    WinStroke.Thickness = 1.5
    WinStroke.Parent = Window

    local TopBar = Instance.new("Frame")
    TopBar.Parent = Window
    TopBar.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    TopBar.Size = UDim2.new(1, 0, 0, 36)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

    local FixBar = Instance.new("Frame")
    FixBar.Parent = TopBar
    FixBar.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    FixBar.Position = UDim2.new(0, 0, 1, -5)
    FixBar.Size = UDim2.new(1, 0, 0, 5)
    FixBar.BorderSizePixel = 0

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = TopBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 15, 0, 0)
    TitleLabel.Size = UDim2.new(0, 320, 1, 0)
    TitleLabel.Font = Enum.Font.FredokaOne
    TitleLabel.Text = isVIP and texts[currentLang].headerVip or texts[currentLang].headerStd
    TitleLabel.TextColor3 = isVIP and Color3.fromRGB(234, 179, 8) or Color3.fromRGB(240, 240, 250)
    TitleLabel.TextSize = 12
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local MinimizeBtn = Instance.new("TextButton")
    MinimizeBtn.Parent = TopBar
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(234, 179, 8)
    MinimizeBtn.Position = UDim2.new(1, -60, 0, 6)
    MinimizeBtn.Size = UDim2.new(0, 24, 0, 24)
    MinimizeBtn.Font = Enum.Font.FredokaOne
    MinimizeBtn.Text = "-"
    MinimizeBtn.TextColor3 = Color3.fromRGB(20, 20, 25)
    MinimizeBtn.TextSize = 12
    Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 6)

    local TopCloseBtn = Instance.new("TextButton")
    TopCloseBtn.Parent = TopBar
    TopCloseBtn.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    TopCloseBtn.Position = UDim2.new(1, -32, 0, 6)
    TopCloseBtn.Size = UDim2.new(0, 24, 0, 24)
    TopCloseBtn.Font = Enum.Font.FredokaOne
    TopCloseBtn.Text = "❌"
    TopCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TopCloseBtn.TextSize = 10
    Instance.new("UICorner", TopCloseBtn).CornerRadius = UDim.new(0, 6)

    TopCloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Küçük FPS/Ping Widget'ı
    local MiniIndicator = Instance.new("Frame")
    MiniIndicator.Name = "MiniIndicator"
    MiniIndicator.Parent = ScreenGui
    MiniIndicator.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    MiniIndicator.Position = UDim2.new(0, 20, 0, 20)
    MiniIndicator.Size = UDim2.new(0, 160, 0, 36)
    MiniIndicator.Visible = false
    MiniIndicator.Active = true
    MiniIndicator.Draggable = true
    Instance.new("UICorner", MiniIndicator).CornerRadius = UDim.new(0, 8)

    local MiniStroke = Instance.new("UIStroke")
    MiniStroke.Color = isVIP and Color3.fromRGB(234, 179, 8) or Color3.fromRGB(99, 102, 241)
    MiniStroke.Thickness = 1.5
    MiniStroke.Parent = MiniIndicator

    local MiniText = Instance.new("TextLabel")
    MiniText.Parent = MiniIndicator
    MiniText.BackgroundTransparency = 1
    MiniText.Size = UDim2.new(1, 0, 1, 0)
    MiniText.Font = Enum.Font.FredokaOne
    MiniText.Text = "⚡ klakz | FPS: 60 | Ping: 0ms"
    MiniText.TextColor3 = Color3.fromRGB(240, 240, 250)
    MiniText.TextSize = 10

    local lastTick = tick()
    local frameCount = 0
    local currentFps = 60
    local currentPing = 0

    RunService.RenderStepped:Connect(function()
        frameCount = frameCount + 1
        local now = tick()
        if now - lastTick >= 1 then
            currentFps = math.floor(frameCount / (now - lastTick))
            frameCount = 0
            lastTick = now
            
            pcall(function()
                currentPing = math.floor(LocalPlayer:GetNetworkPing() * 1000)
            end)

            if MiniIndicator.Visible then
                MiniText.Text = "⚡ klakz | FPS: " .. currentFps .. " | Ping: " .. currentPing .. "ms"
            end
        end
    end)

    local Sidebar = Instance.new("ScrollingFrame")
    Sidebar.Parent = Window
    Sidebar.BackgroundColor3 = Color3.fromRGB(17, 17, 23)
    Sidebar.Position = UDim2.new(0, 0, 0, 36)
    Sidebar.Size = UDim2.new(0, 140, 1, -36)
    Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
    Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Sidebar.ScrollBarThickness = 2

    local SideLayout = Instance.new("UIListLayout")
    SideLayout.Parent = Sidebar
    SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SideLayout.Padding = UDim.new(0, 4)

    local ContentContainer = Instance.new("Frame")
    ContentContainer.Parent = Window
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Position = UDim2.new(0, 148, 0, 46)
    ContentContainer.Size = UDim2.new(0, 362, 1, -56)

    local isMinimized = false
    MinimizeBtn.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        Sidebar.Visible = not isMinimized
        ContentContainer.Visible = not isMinimized
        if isMinimized then
            Window:TweenSize(UDim2.new(0, 520, 0, 36), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
            MinimizeBtn.Text = "+"
        else
            Window:TweenSize(UDim2.new(0, 520, 0, 380), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
            MinimizeBtn.Text = "-"
        end
    end)

    -- Şık Tween Açılış/Kapanış Efekti
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == toggleKey then
            if Window.Visible then
                Window.Visible = false
                MiniIndicator.Visible = true
            else
                Window.Visible = true
                MiniIndicator.Visible = false
                Window.Size = UDim2.new(0, 0, 0, 0)
                Window:TweenSize(UDim2.new(0, 520, 0, 380), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.3, true)
            end
        end
    end)

    local firstTab = true

    local function CreateTab(name)
        local TabButton = Instance.new("TextButton")
        TabButton.Parent = Sidebar
        TabButton.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
        TabButton.Size = UDim2.new(1, 0, 0, 34)
        TabButton.Font = Enum.Font.FredokaOne
        TabButton.Text = name
        TabButton.TextColor3 = Color3.fromRGB(180, 180, 200)
        TabButton.TextSize = 11
        TabButton.TextXAlignment = Enum.TextXAlignment.Left

        local Padding = Instance.new("UIPadding")
        Padding.PaddingLeft = UDim.new(0, 14)
        Padding.Parent = TabButton

        local Page = Instance.new("ScrollingFrame")
        Page.Parent = ContentContainer
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
        Page.ScrollBarThickness = 3
        Page.Visible = false

        local PageLayout = Instance.new("UIListLayout")
        PageLayout.Parent = Page
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, 6)

        TabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(ContentContainer:GetChildren()) do
                if v:IsA("ScrollingFrame") then v.Visible = false end
            end
            Page.Visible = true
        end)

        if firstTab then
            Page.Visible = true
            firstTab = false
        end

        return Page
    end

    local function AddScript(parent, label, url)
        if not parent then return end
        local ScriptBtn = Instance.new("TextButton")
        ScriptBtn.Parent = parent
        ScriptBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
        ScriptBtn.Size = UDim2.new(1, -8, 0, 34)
        ScriptBtn.Font = Enum.Font.FredokaOne
        ScriptBtn.Text = "    " .. label
        ScriptBtn.TextColor3 = Color3.fromRGB(235, 235, 245)
        ScriptBtn.TextSize = 11
        ScriptBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", ScriptBtn).CornerRadius = UDim.new(0, 6)

        ScriptBtn.MouseButton1Click:Connect(function()
            pcall(function()
                loadstring(game:HttpGet(url))()
            end)
            ShowNotification("Çalıştırıldı: " .. label, Color3.fromRGB(34, 197, 94))
        end)
    end

    -- SEKME 1: Araç Gereçler (Hız & Zıplama eklendi)
    local TabTools = CreateTab("Araç Gereçler")
    AddScript(TabTools, "⚡ Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
    AddScript(TabTools, "🚀 Fly Gui V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")

    local SpeedTitle = Instance.new("TextLabel")
    SpeedTitle.Parent = TabTools
    SpeedTitle.BackgroundTransparency = 1
    SpeedTitle.Size = UDim2.new(1, -8, 0, 24)
    SpeedTitle.Font = Enum.Font.FredokaOne
    SpeedTitle.Text = "🏃‍♂️ Karakter Hızı (WalkSpeed)"
    SpeedTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
    SpeedTitle.TextSize = 12
    SpeedTitle.TextXAlignment = Enum.TextXAlignment.Left

    local SpeedBox = Instance.new("TextBox")
    SpeedBox.Parent = TabTools
    SpeedBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    SpeedBox.Size = UDim2.new(1, -8, 0, 36)
    SpeedBox.Font = Enum.Font.FredokaOne
    SpeedBox.PlaceholderText = "Normal: 16 (Değiştirmek için yazın ve Enter'a basın)"
    SpeedBox.Text = ""
    SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedBox.PlaceholderColor3 = Color3.fromRGB(110, 110, 130)
    SpeedBox.TextSize = 11
    Instance.new("UICorner", SpeedBox).CornerRadius = UDim.new(0, 6)

    SpeedBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local val = tonumber(SpeedBox.Text)
            if val and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = val
                ShowNotification("Hız ayarlandı: " .. val, Color3.fromRGB(99, 102, 241))
            end
        end
    end)

    local JumpTitle = Instance.new("TextLabel")
    JumpTitle.Parent = TabTools
    JumpTitle.BackgroundTransparency = 1
    JumpTitle.Size = UDim2.new(1, -8, 0, 24)
    JumpTitle.Font = Enum.Font.FredokaOne
    JumpTitle.Text = "🦘 Zıplama Gücü (JumpPower)"
    JumpTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
    JumpTitle.TextSize = 12
    JumpTitle.TextXAlignment = Enum.TextXAlignment.Left

    local JumpBox = Instance.new("TextBox")
    JumpBox.Parent = TabTools
    JumpBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    JumpBox.Size = UDim2.new(1, -8, 0, 36)
    JumpBox.Font = Enum.Font.FredokaOne
    JumpBox.PlaceholderText = "Normal: 50 (Değiştirmek için yazın ve Enter'a basın)"
    JumpBox.Text = ""
    JumpBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    JumpBox.PlaceholderColor3 = Color3.fromRGB(110, 110, 130)
    JumpBox.TextSize = 11
    Instance.new("UICorner", JumpBox).CornerRadius = UDim.new(0, 6)

    JumpBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local val = tonumber(JumpBox.Text)
            if val and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character.Humanoid.UseJumpPower = true
                LocalPlayer.Character.Humanoid.JumpPower = val
                ShowNotification("Zıplama ayarlandı: " .. val, Color3.fromRGB(99, 102, 241))
            end
        end
    end)

    -- SEKME 2: GitHub Scripts (UT Serisi)
    local TabScripts = CreateTab("GitHub Scriptleri")
    local scriptList = {
        "1SpeedBridgeBuildingUT", "1BackflipObbyEscapeUT", "1CrunchyButterEscapeUT",
        "1DMGPerReviveUT", "1DoubleJumpBikeEscapeUT", "1FatToFitUT",
        "1GunEvolutionUT", "1HealthPerClickUT", "1HeightSlideUT",
        "1JumpPogoClimbUT", "1LootEvoUT", "1MagicEvolutionUT",
        "1MinePerClickUT", "1MuscletoPushBoulderUT", "1MuscletoSlapFightingUT",
        "1PickaxeSwingEscapeUT", "1PlankUT", "1PoorToRichUT",
        "1PunchPerClickUT", "1RunforNEEDOHUT", "1SkillPointLegendsUT",
        "1SpeedBeaLuckyBlockUT", "1SpeedBikeEscapeUT", "1SpeedBoatTsunamiUT",
        "1SpeedCarEscapeUT", "1SpeedCollectMinionUT", "1SpeedDinosaurEscapeUT",
        "1SpeedEscapeforBrainrotsUT"
    }

    for _, scriptName in ipairs(scriptList) do
        AddScript(TabScripts, scriptName, "https://raw.githubusercontent.com/gumanba/Scripts/main/" .. scriptName)
    end

    -- SEKME 3: Müzik Çalar [BETA] (Ses Seviyesi Kontrolü Eklendi)
    local TabMusic = CreateTab("Müzik Çalar [BETA]")

    local MusicTitle = Instance.new("TextLabel")
    MusicTitle.Parent = TabMusic
    MusicTitle.BackgroundTransparency = 1
    MusicTitle.Size = UDim2.new(1, -8, 0, 24)
    MusicTitle.Font = Enum.Font.FredokaOne
    MusicTitle.Text = "🎵 Kesintisiz Müzik Çalar [BETA]"
    MusicTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
    MusicTitle.TextSize = 12
    MusicTitle.TextXAlignment = Enum.TextXAlignment.Left

    local playingLabel = Instance.new("TextLabel")
    playingLabel.Parent = TabMusic
    playingLabel.BackgroundTransparency = 1
    playingLabel.Size = UDim2.new(1, -8, 0, 22)
    playingLabel.Font = Enum.Font.FredokaOne
    playingLabel.Text = "Durum: Müzikler yükleniyor..."
    playingLabel.TextColor3 = Color3.fromRGB(150, 150, 180)
    playingLabel.TextSize = 10
    playingLabel.TextXAlignment = Enum.TextXAlignment.Left

    local activePlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local soundObjects = {}
    local globalVolume = 5

    local function createPreloadedSound(id, name)
        local sound = Instance.new("Sound")
        sound.Name = "KlakzSong_" .. name
        sound.SoundId = "rbxassetid://" .. id
        sound.Volume = globalVolume
        sound.Looped = true
        sound.Parent = activePlayerGui
        return sound
    end

    local musicList = {
        {Name = "Chill Lofi Beats", ID = "9046835171"},
        {Name = "Synthwave Retro", ID = "5410086218"},
        {Name = "Epic Action Remix", ID = "1838573171"},
        {Name = "Space Ambient", ID = "1841261548"}
    }

    local currentPlayingSound = nil

    task.spawn(function()
        for _, song in ipairs(musicList) do
            local snd = createPreloadedSound(song.ID, song.Name)
            soundObjects[song.ID] = snd
            
            snd.Volume = 0
            snd:Play()
            task.wait(0.2)
            snd:Stop()
            snd.Volume = globalVolume
        end
        playingLabel.Text = "Durum: Tüm müzikler hazır!"
    end)

    local VolTitle = Instance.new("TextLabel")
    VolTitle.Parent = TabMusic
    VolTitle.BackgroundTransparency = 1
    VolTitle.Size = UDim2.new(1, -8, 0, 22)
    VolTitle.Font = Enum.Font.FredokaOne
    VolTitle.Text = "🔊 Ses Seviyesi (0 - 10)"
    VolTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
    VolTitle.TextSize = 11
    VolTitle.TextXAlignment = Enum.TextXAlignment.Left

    local VolBox = Instance.new("TextBox")
    VolBox.Parent = TabMusic
    VolBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    VolBox.Size = UDim2.new(1, -8, 0, 32)
    VolBox.Font = Enum.Font.FredokaOne
    VolBox.PlaceholderText = "Varsayılan: 5 (Yazıp Enter'a basın)"
    VolBox.Text = "5"
    VolBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    VolBox.PlaceholderColor3 = Color3.fromRGB(110, 110, 130)
    VolBox.TextSize = 11
    Instance.new("UICorner", VolBox).CornerRadius = UDim.new(0, 6)

    VolBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local val = tonumber(VolBox.Text)
            if val and val >= 0 and val <= 10 then
                globalVolume = val
                for _, snd in pairs(soundObjects) do
                    snd.Volume = globalVolume
                end
                ShowNotification("Ses seviyesi güncellendi: " .. val, Color3.fromRGB(99, 102, 241))
            end
        end
    end)

    local CustomIdBox = Instance.new("TextBox")
    CustomIdBox.Parent = TabMusic
    CustomIdBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    CustomIdBox.Size = UDim2.new(1, -8, 0, 36)
    CustomIdBox.Font = Enum.Font.FredokaOne
    CustomIdBox.PlaceholderText = "Audio ID yazın (Örn: 9046835171)"
    CustomIdBox.Text = ""
    CustomIdBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    CustomIdBox.PlaceholderColor3 = Color3.fromRGB(110, 110, 130)
    CustomIdBox.TextSize = 11
    Instance.new("UICorner", CustomIdBox).CornerRadius = UDim.new(0, 6)

    local PlayCustomBtn = Instance.new("TextButton")
    PlayCustomBtn.Parent = TabMusic
    PlayCustomBtn.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
    PlayCustomBtn.Size = UDim2.new(1, -8, 0, 34)
    PlayCustomBtn.Font = Enum.Font.FredokaOne
    PlayCustomBtn.Text = "▶ Özel ID'yi Çal"
    PlayCustomBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    PlayCustomBtn.TextSize = 11
    Instance.new("UICorner", PlayCustomBtn).CornerRadius = UDim.new(0, 6)

    PlayCustomBtn.MouseButton1Click:Connect(function()
        local idText = CustomIdBox.Text:gsub("%D", "")
        if idText ~= "" then
            if currentPlayingSound then
                currentPlayingSound:Stop()
            end
            
            if not soundObjects[idText] then
                soundObjects[idText] = createPreloadedSound(idText, "Custom")
            end
            
            currentPlayingSound = soundObjects[idText]
            currentPlayingSound:Play()
            playingLabel.Text = "Çalan ID: " .. idText
            ShowNotification("Müzik çalınıyor!", Color3.fromRGB(34, 197, 94))
        end
    end)

    local PresetTitle = Instance.new("TextLabel")
    PresetTitle.Parent = TabMusic
    PresetTitle.BackgroundTransparency = 1
    PresetTitle.Size = UDim2.new(1, -8, 0, 24)
    PresetTitle.Font = Enum.Font.FredokaOne
    PresetTitle.Text = "📂 Hazır Müzik Listesi"
    PresetTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
    PresetTitle.TextSize = 12
    PresetTitle.TextXAlignment = Enum.TextXAlignment.Left

    for _, song in ipairs(musicList) do
        local SongBtn = Instance.new("TextButton")
        SongBtn.Parent = TabMusic
        SongBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
        SongBtn.Size = UDim2.new(1, -8, 0, 32)
        SongBtn.Font = Enum.Font.FredokaOne
        SongBtn.Text = "  ▶ " .. song.Name
        SongBtn.TextColor3 = Color3.fromRGB(235, 235, 245)
        SongBtn.TextSize = 11
        SongBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", SongBtn).CornerRadius = UDim.new(0, 6)

        SongBtn.MouseButton1Click:Connect(function()
            if currentPlayingSound then
                currentPlayingSound:Stop()
            end
            
            if soundObjects[song.ID] then
                currentPlayingSound = soundObjects[song.ID]
                currentPlayingSound:Play()
                playingLabel.Text = "Çalan: " .. song.Name
                ShowNotification("Oynatılıyor: " .. song.Name, Color3.fromRGB(34, 197, 94))
            end
        end)
    end

    local StopMusicBtn = Instance.new("TextButton")
    StopMusicBtn.Parent = TabMusic
    StopMusicBtn.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    StopMusicBtn.Size = UDim2.new(1, -8, 0, 32)
    StopMusicBtn.Font = Enum.Font.FredokaOne
    StopMusicBtn.Text = "⏹ Müziği Durdur"
    StopMusicBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    StopMusicBtn.TextSize = 11
    Instance.new("UICorner", StopMusicBtn).CornerRadius = UDim.new(0, 6)

    StopMusicBtn.MouseButton1Click:Connect(function()
        if currentPlayingSound then
            currentPlayingSound:Stop()
        end
        playingLabel.Text = "Durum: Müzik durduruldu"
        ShowNotification("Müzik durduruldu.", Color3.fromRGB(239, 68, 68))
    end)

    -- SEKME 4: Ayarlar
    local TabSettings = CreateTab("Ayarlar")

    local SettingsTitle = Instance.new("TextLabel")
    SettingsTitle.Parent = TabSettings
    SettingsTitle.BackgroundTransparency = 1
    SettingsTitle.Size = UDim2.new(1, -8, 0, 24)
    SettingsTitle.Font = Enum.Font.FredokaOne
    SettingsTitle.Text = "⚙️ Menü Kontrol & Tema Ayarları"
    SettingsTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
    SettingsTitle.TextSize = 12
    SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left

    local KeyBindBtn = Instance.new("TextButton")
    KeyBindBtn.Parent = TabSettings
    KeyBindBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    KeyBindBtn.Size = UDim2.new(1, -8, 0, 36)
    KeyBindBtn.Font = Enum.Font.FredokaOne
    KeyBindBtn.Text = "  Menü Kapatma/Açma Tuşu: [ RightControl ]"
    KeyBindBtn.TextColor3 = Color3.fromRGB(235, 235, 245)
    KeyBindBtn.TextSize = 11
    KeyBindBtn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", KeyBindBtn).CornerRadius = UDim.new(0, 6)

    local listeningForKey = false
    KeyBindBtn.MouseButton1Click:Connect(function()
        if listeningForKey then return end
        listeningForKey = true
        KeyBindBtn.Text = "  Bir tuşa basın..."
        
        local connection
        connection = UserInputService.InputBegan:Connect(function(input, gp)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                toggleKey = input.KeyCode
                KeyBindBtn.Text = "  Menü Kapatma/Açma Tuşu: [ " .. input.KeyCode.Name .. " ]"
                listeningForKey = false
                connection:Disconnect()
                ShowNotification("Tuş değiştirildi: " .. input.KeyCode.Name, Color3.fromRGB(99, 102, 241))
            end
        end)
    end)

    local ColorTitle = Instance.new("TextLabel")
    ColorTitle.Parent = TabSettings
    ColorTitle.BackgroundTransparency = 1
    ColorTitle.Size = UDim2.new(1, -8, 0, 24)
    ColorTitle.Font = Enum.Font.FredokaOne
    ColorTitle.Text = "🎨 Tema Rengi Seç"
    ColorTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
    ColorTitle.TextSize = 12
    ColorTitle.TextXAlignment = Enum.TextXAlignment.Left

    local ColorContainer = Instance.new("Frame")
    ColorContainer.Parent = TabSettings
    ColorContainer.BackgroundTransparency = 1
    ColorContainer.Size = UDim2.new(1, -8, 0, 40)

    local ColorLayout = Instance.new("UIListLayout")
    ColorLayout.Parent = ColorContainer
    ColorLayout.FillDirection = Enum.FillDirection.Horizontal
    ColorLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ColorLayout.Padding = UDim.new(0, 8)

    local colors = {
        {Name = "Mor", Color = Color3.fromRGB(99, 102, 241)},
        {Name = "Yeşil", Color = Color3.fromRGB(34, 197, 94)},
        {Name = "Kırmızı", Color = Color3.fromRGB(239, 68, 68)},
        {Name = "Mavi", Color = Color3.fromRGB(59, 130, 246)},
        {Name = "Pembe", Color = Color3.fromRGB(236, 72, 153)}
    }

    for _, colData in ipairs(colors) do
        local ColorBtn = Instance.new("TextButton")
        ColorBtn.Parent = ColorContainer
        ColorBtn.BackgroundColor3 = colData.Color
        ColorBtn.Size = UDim2.new(0, 32, 0, 32)
        ColorBtn.Font = Enum.Font.FredokaOne
        ColorBtn.Text = ""
        Instance.new("UICorner", ColorBtn).CornerRadius = UDim.new(0, 8)

        ColorBtn.MouseButton1Click:Connect(function()
            WinStroke.Color = colData.Color
            MiniStroke.Color = colData.Color
            LoginLogo.BackgroundColor3 = colData.Color
            ShowNotification("Tema değiştirildi!", colData.Color)
        end)
    end
end

-- Login Tuş Olayları
BtnStandard.MouseButton1Click:Connect(function()
    if KeyInput.Text == STANDARD_KEY then
        LoadDashboard(false)
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = texts[currentLang].errKey
    end
end)

BtnVIP.MouseButton1Click:Connect(function()
    if KeyInput.Text == PREMIUM_KEY then
        LoadDashboard(true)
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = texts[currentLang].errVipKey
    end
end)
