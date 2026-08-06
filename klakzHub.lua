-- klakz Hub - Seki UI Sürümü (Login Ekranı Aktif)

if game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI") then
    game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "klakzHub_MainUI"
ScreenGui.Parent = game:GetService("CoreGui")
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
        headerVip = "klakz Hub [👑 SEKI UI SÜRÜMÜ]",
        searchPlaceholder = "🔍 Script Ara..."
    },
    EN = {
        loginTitle = "KLAKZ HUB LOGIN",
        placeholder = "Enter your key...",
        stdBtn = "Standard Login",
        vipBtn = "👑 Premium Login",
        errKey = "❌ Invalid Key!",
        errVipKey = "❌ Invalid Premium Key!",
        headerStd = "klakz Hub [Standard Edition]",
        headerVip = "klakz Hub [👑 SEKI UI EDITION]",
        searchPlaceholder = "🔍 Search Script..."
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

-- ==================== 2. SEKI UI PANELİ ====================
local function LoadDashboard(isVIP)
    LoginCard:Destroy()

    local Window = Instance.new("Frame")
    Window.Name = "SekiUI_Window"
    Window.Parent = ScreenGui
    Window.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    Window.Position = UDim2.new(0.5, -250, 0.5, -175)
    Window.Size = UDim2.new(0, 500, 0, 350)
    Window.Active = true
    Window.Draggable = true
    Instance.new("UICorner", Window).CornerRadius = UDim.new(0, 8)

    local WinStroke = Instance.new("UIStroke")
    WinStroke.Color = isVIP and Color3.fromRGB(234, 179, 8) or Color3.fromRGB(45, 45, 55)
    WinStroke.Thickness = 1
    WinStroke.Parent = Window

    -- Üst Seki UI Başlık Çubuğu
    local TopBar = Instance.new("Frame")
    TopBar.Parent = Window
    TopBar.BackgroundColor3 = Color3.fromRGB(18, 18, 23)
    TopBar.Size = UDim2.new(1, 0, 0, 32)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 8)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = TopBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 12, 0, 0)
    TitleLabel.Size = UDim2.new(0, 350, 1, 0)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = isVIP and texts[currentLang].headerVip or texts[currentLang].headerStd
    TitleLabel.TextColor3 = isVIP and Color3.fromRGB(234, 179, 8) or Color3.fromRGB(220, 220, 230)
    TitleLabel.TextSize = 11
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = TopBar
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Position = UDim2.new(1, -30, 0, 0)
    CloseBtn.Size = UDim2.new(0, 30, 1, 0)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(150, 150, 170)
    CloseBtn.TextSize = 11
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    -- Sol Sekme Listesi (Sidebar)
    local Sidebar = Instance.new("ScrollingFrame")
    Sidebar.Parent = Window
    Sidebar.BackgroundColor3 = Color3.fromRGB(17, 17, 22)
    Sidebar.Position = UDim2.new(0, 0, 0, 32)
    Sidebar.Size = UDim2.new(0, 130, 1, -32)
    Sidebar.CanvasSize = UDim2.new(0, 0, 2, 0)
    Sidebar.ScrollBarThickness = 2

    local SideLayout = Instance.new("UIListLayout")
    SideLayout.Parent = Sidebar
    SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SideLayout.Padding = UDim.new(0, 2)

    -- Sağ İçerik Alanı
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Parent = Window
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Position = UDim2.new(0, 138, 0, 42)
    ContentContainer.Size = UDim2.new(0, 352, 1, -50)

    local allScriptButtons = {}
    local firstTab = true

    local function CreateTab(name, isVipTab)
        if isVipTab and not isVIP then return nil end

        local TabButton = Instance.new("TextButton")
        TabButton.Parent = Sidebar
        TabButton.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
        TabButton.Size = UDim2.new(1, 0, 0, 30)
        TabButton.Font = Enum.Font.GothamMedium
        TabButton.Text = name
        TabButton.TextColor3 = isVipTab and Color3.fromRGB(234, 179, 8) or Color3.fromRGB(170, 170, 190)
        TabButton.TextSize = 10
        TabButton.TextXAlignment = Enum.TextXAlignment.Left

        local Padding = Instance.new("UIPadding")
        Padding.PaddingLeft = UDim.new(0, 12)
        Padding.Parent = TabButton

        local Page = Instance.new("ScrollingFrame")
        Page.Parent = ContentContainer
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.CanvasSize = UDim2.new(0, 0, 3, 0)
        Page.ScrollBarThickness = 3
        Page.Visible = false

        local PageLayout = Instance.new("UIListLayout")
        PageLayout.Parent = Page
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, 5)

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
        ScriptBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
        ScriptBtn.Size = UDim2.new(1, -6, 0, 30)
        ScriptBtn.Font = Enum.Font.Gotham
        ScriptBtn.Text = "   " .. label
        ScriptBtn.TextColor3 = Color3.fromRGB(230, 230, 240)
        ScriptBtn.TextSize = 10
        ScriptBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", ScriptBtn).CornerRadius = UDim.new(0, 5)

        ScriptBtn.MouseButton1Click:Connect(function()
            pcall(function()
                loadstring(game:HttpGet(url))()
            end)
        end)

        table.insert(allScriptButtons, ScriptBtn)
    end

    -- Seki UI Sekmeleri ve Çalışan Linkler
    local Tab1 = CreateTab("Genel Araçlar", false)
    AddScript(Tab1, "⚡ Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
    AddScript(Tab1, "🚀 Fly Gui V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
    AddScript(Tab1, "👁️ ESP Viewer", "https://raw.githubusercontent.com/GamingScripter/ESP-Viewer/main/ESP-Viewer.lua")

    local Tab2 = CreateTab("Popüler Oyunlar", false)
    AddScript(Tab2, "🍎 Blox Fruits", "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua")
    AddScript(Tab2, "🥊 The Strongest Battlegrounds", "https://raw.githubusercontent.com/skzu/TheStrongestBattlegrounds/main/Source.lua")
    AddScript(Tab2, "🚪 Doors V2", "https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua")
    AddScript(Tab2, "⚔️ Jujutsu Shenanigans", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/JujutsuShenanigans.lua")

    local Tab3 = CreateTab("👑 Aktif Hublar", true)
    if Tab3 then
        AddScript(Tab3, "🌲 Grow a Garden", "https://raw.githubusercontent.com/gumanba/Scripts/main/GrowaGarden")
        AddScript(Tab3, "🎯 Speed Hub X", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua")
        AddScript(Tab3, "🐱 Pet Simulator 99", "https://raw.githubusercontent.com/XoAD2/PS99/main/Loader.lua")
        AddScript(Tab3, "⚔️ Blade Ball", "https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly")
        AddScript(Tab3, "🛡️ Anime Vanguards", "https://raw.githubusercontent.com/scriptpastebin/raw/main/AnimeVanguards")
        AddScript(Tab3, "⚡ Type Soul", "https://raw.githubusercontent.com/xu-dev/typesoul/main/loader.lua")
        AddScript(Tab3, "🔪 Murder Mystery 2", "https://raw.githubusercontent.com/sannin9000/Roblox/main/MM2")
        AddScript(Tab3, "💥 BedWars Vape V4", "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua")
        AddScript(Tab3, "🔥 Slap Battles", "https://raw.githubusercontent.com/Giangplay/slap_battles/main/slap_battles.lua")
        AddScript(Tab3, "🚗 Driving Empire", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/DrivingEmpire")
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
    if KeyInput.Text == STANDARD_KEY then
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
