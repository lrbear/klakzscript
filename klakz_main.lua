-- klakz Hub - Modular Core System (Tam Sürüm)

if game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI") then
    game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI"):Destroy()
end

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "klakzHub_MainUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local STANDARD_KEY = "klakz123"
local PREMIUM_KEY = "klakz_vip_2026"
local toggleKey = Enum.KeyCode.RightControl

-- Bildirim Sistemi
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

-- Sohbet Komutu Entegrasyonu (/klakz)
task.spawn(function()
    pcall(function()
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local channels = TextChatService:WaitForChild("TextChannels", 5)
            if channels then
                local generalChannel = channels:WaitForChild("RBXGeneral", 5)
                if generalChannel then
                    generalChannel.OnIncomingMessage = function(message)
                        if message.TextSource and message.TextSource.UserId == LocalPlayer.UserId then
                            if message.Text == "/klakz" then
                                local win = ScreenGui:FindFirstChild("SekiUI_Window")
                                if win then
                                    win.Visible = not win.Visible
                                    ShowNotification("Menü durumu değiştirildi!", Color3.fromRGB(99, 102, 241))
                                end
                            end
                        end
                    end
                end
            end
        else
            LocalPlayer.Chatted:Connect(function(msg)
                if msg:lower() == "/klakz" then
                    local win = ScreenGui:FindFirstChild("SekiUI_Window")
                    if win then
                        win.Visible = not win.Visible
                        ShowNotification("Menü durumu değiştirildi!", Color3.fromRGB(99, 102, 241))
                    end
                end
            end)
        end
    end)
end)

-- ==================== LOGIN EKRANI ====================
local LoginCard = Instance.new("Frame")
LoginCard.Parent = ScreenGui
LoginCard.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
LoginCard.Position = UDim2.new(0.5, -170, 0.5, -145)
LoginCard.Size = UDim2.new(0, 340, 0, 240)
LoginCard.Active = true
LoginCard.Draggable = true
Instance.new("UICorner", LoginCard).CornerRadius = UDim.new(0, 12)

local CardStroke = Instance.new("UIStroke")
CardStroke.Color = Color3.fromRGB(99, 102, 241)
CardStroke.Thickness = 2
CardStroke.Parent = LoginCard

local LoginTitle = Instance.new("TextLabel")
LoginTitle.Parent = LoginCard
LoginTitle.BackgroundTransparency = 1
LoginTitle.Position = UDim2.new(0, 20, 0, 15)
LoginTitle.Size = UDim2.new(0, 300, 0, 40)
LoginTitle.Font = Enum.Font.FredokaOne
LoginTitle.Text = "⚡ KLAKZ HUB [PRO v3.0]"
LoginTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginTitle.TextSize = 14

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = LoginCard
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeyInput.Position = UDim2.new(0, 25, 0, 65)
KeyInput.Size = UDim2.new(0, 290, 0, 42)
KeyInput.Font = Enum.Font.FredokaOne
KeyInput.PlaceholderText = "Anahtarınızı (Key) girin..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderColor3 = Color3.fromRGB(110, 110, 130)
KeyInput.TextSize = 13
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)

local BtnStandard = Instance.new("TextButton")
BtnStandard.Parent = LoginCard
BtnStandard.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
BtnStandard.Position = UDim2.new(0, 25, 0, 120)
BtnStandard.Size = UDim2.new(0, 290, 0, 42)
BtnStandard.Font = Enum.Font.FredokaOne
BtnStandard.Text = "Standart Giriş"
BtnStandard.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnStandard.TextSize = 14
Instance.new("UICorner", BtnStandard).CornerRadius = UDim.new(0, 8)

local BtnVIP = Instance.new("TextButton")
BtnVIP.Parent = LoginCard
BtnVIP.BackgroundColor3 = Color3.fromRGB(234, 179, 8)
BtnVIP.Position = UDim2.new(0, 25, 0, 175)
BtnVIP.Size = UDim2.new(0, 290, 0, 42)
BtnVIP.Font = Enum.Font.FredokaOne
BtnVIP.Text = "👑 Premium Giriş"
BtnVIP.TextColor3 = Color3.fromRGB(20, 20, 25)
BtnVIP.TextSize = 14
Instance.new("UICorner", BtnVIP).CornerRadius = UDim.new(0, 8)

-- Giriş Yapınca Paneli Yükleme (Tüm Özelliklerle Birlikte)
local function LoadDashboard(isVIP)
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

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = TopBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 15, 0, 0)
    TitleLabel.Size = UDim2.new(0, 320, 1, 0)
    TitleLabel.Font = Enum.Font.FredokaOne
    TitleLabel.Text = isVIP and "klakz Hub [👑 PREMIUM PRO]" or "klakz Hub [Standart Pro]"
    TitleLabel.TextColor3 = isVIP and Color3.fromRGB(234, 179, 8) or Color3.fromRGB(240, 240, 250)
    TitleLabel.TextSize = 12
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

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

    UserInputService.InputBegan:Connect(function(input, gp)
        if input.KeyCode == toggleKey then
            Window.Visible = not Window.Visible
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

    -- SEKME 1: Araç Gereçler
    local TabTools = CreateTab("Araç Gereçler")
    AddScript(TabTools, "⚡ Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
    AddScript(TabTools, "🚀 Fly Gui V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")

    -- SEKME 2: GitHub Scripts
    local TabScripts = CreateTab("GitHub Scriptleri")
    local scriptList = {
        "1SpeedBridgeBuildingUT", "1BackflipObbyEscapeUT", "1CrunchyButterEscapeUT",
        "1DMGPerReviveUT", "1DoubleJumpBikeEscapeUT", "1FatToFitUT",
        "1GunEvolutionUT", "1HealthPerClickUT", "1HeightSlideUT",
        "1JumpPogoClimbUT", "1LootEvoUT", "1MagicEvolutionUT",
        "1MinePerClickUT", "1MuscletoPushBoulderUT", "1MuscletoSlapFightingUT",
        "1PickaxeSwingEscapeUT", "1PlankUT", "1PoorToRichUT",
        "1PunchPerClickUT", "1RunforNEEDOHUT", "1SkillPointLegendsUT"
    }
    for _, scriptName in ipairs(scriptList) do
        AddScript(TabScripts, scriptName, "https://raw.githubusercontent.com/gumanba/Scripts/main/" .. scriptName)
    end

    -- SEKME 3: Müzik Çalar [BETA]
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

    local StopMusicBtn = Instance.new("TextButton")
    StopMusicBtn.Parent = TabMusic
    StopMusicBtn.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    StopMusicBtn.Size = UDim2.new(1, -8, 0, 32)
    StopMusicBtn.Font = Enum.Font.FredokaOne
    StopMusicBtn.Text = "⏹ Müziği Durdur"
    StopMusicBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    StopMusicBtn.TextSize = 11
    Instance.new("UICorner", StopMusicBtn).CornerRadius = UDim.new(0, 6)

    -- SEKME 4: Ayarlar
    local TabSettings = CreateTab("Ayarlar")
    local SettingsTitle = Instance.new("TextLabel")
    SettingsTitle.Parent = TabSettings
    SettingsTitle.BackgroundTransparency = 1
    SettingsTitle.Size = UDim2.new(1, -8, 0, 24)
    SettingsTitle.Font = Enum.Font.FredokaOne
    SettingsTitle.Text = "⚙️ Menü Ayarları"
    SettingsTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
    SettingsTitle.TextSize = 12
    SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left

    ShowNotification("Panel başarıyla yüklendi!", Color3.fromRGB(34, 197, 94))
end

BtnStandard.MouseButton1Click:Connect(function()
    if KeyInput.Text == STANDARD_KEY then
        LoadDashboard(false)
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "❌ Geçersiz Anahtar!"
    end
end)

BtnVIP.MouseButton1Click:Connect(function()
    if KeyInput.Text == PREMIUM_KEY then
        LoadDashboard(true)
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "❌ Geçersiz Premium Anahtar!"
    end
end)
