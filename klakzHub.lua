-- klakz Hub | Seki UI (Tam ve Eksiksiz Sürüm)

if game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI") then
    game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI"):Destroy()
end

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "klakzHub_MainUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local STANDARD_KEY = "klakz123"
local PREMIUM_KEY = "klakz_vip_2026"
local currentLang = "TR"

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
KeyInput.Position = UDim2.new(0, 25, 0, 75)
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
    TitleLabel.Size = UDim2.new(0, 350, 1, 0)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = isVIP and texts[currentLang].headerVip or texts[currentLang].headerStd
    TitleLabel.TextColor3 = isVIP and Color3.fromRGB(234, 179, 8) or Color3.fromRGB(240, 240, 250)
    TitleLabel.TextSize = 11
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = TopBar
    CloseBtn.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    CloseBtn.Position = UDim2.new(1, -32, 0, 6)
    CloseBtn.Size = UDim2.new(0, 24, 0, 24)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 10
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

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

    local firstTab = true

    local function CreateTab(name)
        local TabButton = Instance.new("TextButton")
        TabButton.Parent = Sidebar
        TabButton.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
        TabButton.Size = UDim2.new(1, 0, 0, 34)
        TabButton.Font = Enum.Font.GothamMedium
        TabButton.Text = name
        TabButton.TextColor3 = Color3.fromRGB(180, 180, 200)
        TabButton.TextSize = 10
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
        ScriptBtn.Font = Enum.Font.Gotham
        ScriptBtn.Text = "    " .. label
        ScriptBtn.TextColor3 = Color3.fromRGB(235, 235, 245)
        ScriptBtn.TextSize = 10
        ScriptBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", ScriptBtn).CornerRadius = UDim.new(0, 6)

        ScriptBtn.MouseButton1Click:Connect(function()
            pcall(function()
                loadstring(game:HttpGet(url))()
            end)
        end)
    end

    -- SEKME 1: Araç Gereçler
    local TabTools = CreateTab("Araç Gereçler")
    AddScript(TabTools, "⚡ Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
    AddScript(TabTools, "🚀 Fly Gui V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")

    -- SEKME 2: GitHub Scripts (UT Serisi)
    local TabScripts = CreateTab("GitHub Scriptleri")
    local scriptList = {
        "1SpeedBridgeBuildingUT",
        "1BackflipObbyEscapeUT",
        "1CrunchyButterEscapeUT",
        "1DMGPerReviveUT",
        "1DoubleJumpBikeEscapeUT",
        "1FatToFitUT",
        "1GunEvolutionUT",
        "1HealthPerClickUT",
        "1HeightSlideUT",
        "1JumpPogoClimbUT",
        "1LootEvoUT",
        "1MagicEvolutionUT",
        "1MinePerClickUT",
        "1MuscletoPushBoulderUT",
        "1MuscletoSlapFightingUT",
        "1PickaxeSwingEscapeUT",
        "1PlankUT",
        "1PoorToRichUT",
        "1PunchPerClickUT",
        "1RunforNEEDOHUT",
        "1SkillPointLegendsUT",
        "1SpeedBeaLuckyBlockUT",
        "1SpeedBikeEscapeUT",
        "1SpeedBoatTsunamiUT",
        "1SpeedCarEscapeUT",
        "1SpeedCollectMinionUT",
        "1SpeedDinosaurEscapeUT",
        "1SpeedEscapeforBrainrotsUT"
    }

    for _, scriptName in ipairs(scriptList) do
        AddScript(TabScripts, scriptName, "https://raw.githubusercontent.com/gumanba/Scripts/main/" .. scriptName)
    end

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
end
