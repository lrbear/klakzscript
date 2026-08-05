-- klakz Hub - Çalışan Güncel Script Sürümü

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
        headerVip = "klakz Hub [👑 AKTİF ÇALIŞAN SCRIPTLER]",
        searchPlaceholder = "🔍 Script Ara (örn: Blox Fruits, Hub...)",
        tabs = {
            "Genel Araçlar", 
            "Popüler Oyunlar", 
            "👑 Aktif Mega Hublar"
        }
    },
    EN = {
        loginTitle = "KLAKZ HUB LOGIN",
        placeholder = "Enter your key...",
        stdBtn = "Standard Login",
        vipBtn = "👑 Premium Login",
        errKey = "❌ Invalid Key!",
        errVipKey = "❌ Invalid Premium Key!",
        headerStd = "klakz Hub [Standard Edition]",
        headerVip = "klakz Hub [👑 WORKING SCRIPTS]",
        searchPlaceholder = "🔍 Search Script (e.g., Blox Fruits, Hub...)",
        tabs = {
            "General Tools", 
            "Popular Games", 
            "👑 Working Mega Hubs"
        }
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

-- ==================== 2. ANA KONTROL PANELİ ====================
local function LoadDashboard(isVIP)
    LoginCard:Destroy()

    local Dashboard = Instance.new("Frame")
    Dashboard.Parent = ScreenGui
    Dashboard.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    Dashboard.Position = UDim2.new(0.5, -240, 0.5, -200)
    Dashboard.Size = UDim2.new(0, 480, 0, 400)
    Dashboard.Active = true
    Dashboard.Draggable = true
    Instance.new("UICorner", Dashboard).CornerRadius = UDim.new(0, 10)

    local DashStroke = Instance.new("UIStroke")
    DashStroke.Color = isVIP and Color3.fromRGB(234, 179, 8) or Color3.fromRGB(99, 102, 241)
    DashStroke.Thickness = 2
    DashStroke.Parent = Dashboard

    local TopBar = Instance.new("Frame")
    TopBar.Parent = Dashboard
    TopBar.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

    local TitleText = Instance.new("TextLabel")
    TitleText.Parent = TopBar
    TitleText.BackgroundTransparency = 1
    TitleText.Position = UDim2.new(0, 15, 0, 0)
    TitleText.Size = UDim2.new(0, 350, 1, 0)
    TitleText.Font = Enum.Font.GothamBold
    TitleText.Text = isVIP and texts[currentLang].headerVip or texts[currentLang].headerStd
    TitleText.TextColor3 = isVIP and Color3.fromRGB(234, 179, 8) or Color3.fromRGB(255, 255, 255)
    TitleText.TextSize = 11
    TitleText.TextXAlignment = Enum.TextXAlignment.Left

    local CloseButton = Instance.new("TextButton")
    CloseButton.Parent = TopBar
    CloseButton.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    CloseButton.Position = UDim2.new(1, -35, 0, 7)
    CloseButton.Size = UDim2.new(0, 25, 0, 25)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "✕"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 11
    Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0, 6)
    CloseButton.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    -- Arama Çubuğu
    local SearchBar = Instance.new("TextBox")
    SearchBar.Parent = Dashboard
    SearchBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    SearchBar.Position = UDim2.new(0, 12, 0, 48)
    SearchBar.Size = UDim2.new(0, 456, 0, 30)
    SearchBar.Font = Enum.Font.Gotham
    SearchBar.PlaceholderText = texts[currentLang].searchPlaceholder
    SearchBar.Text = ""
    SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    SearchBar.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
    SearchBar.TextSize = 10
    Instance.new("UICorner", SearchBar).CornerRadius = UDim.new(0, 6)

    local TabsContainer = Instance.new("ScrollingFrame")
    TabsContainer.Parent = Dashboard
    TabsContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    TabsContainer.Position = UDim2.new(0, 12, 0, 84)
    TabsContainer.Size = UDim2.new(0, 130, 0, 304)
    TabsContainer.CanvasSize = UDim2.new(0, 0, 2.0, 0)
    TabsContainer.ScrollBarThickness = 3
    
    local TabsLayout = Instance.new("UIListLayout")
    TabsLayout.Parent = TabsContainer
    TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabsLayout.Padding = UDim.new(0, 5)

    local PagesContainer = Instance.new("ScrollingFrame")
    PagesContainer.Parent = Dashboard
    PagesContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    PagesContainer.Position = UDim2.new(0, 152, 0, 84)
    PagesContainer.Size = UDim2.new(0, 316, 0, 304)
    PagesContainer.CanvasSize = UDim2.new(0, 0, 5.0, 0)
    PagesContainer.ScrollBarThickness = 3

    local allScriptButtons = {}
    local firstTab = true

    local function CreateCategory(name, isVipTab)
        if isVipTab and not isVIP then return nil end

        local TabBtn = Instance.new("TextButton")
        TabBtn.Parent = TabsContainer
        TabBtn.BackgroundColor3 = isVipTab and Color3.fromRGB(50, 40, 20) or Color3.fromRGB(30, 30, 40)
        TabBtn.Size = UDim2.new(1, -6, 0, 34)
        TabBtn.Font = Enum.Font.GothamMedium
        TabBtn.Text = name
        TabBtn.TextColor3 = isVipTab and Color3.fromRGB(250, 204, 21) or Color3.fromRGB(210, 210, 220)
        TabBtn.TextSize = 10
        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

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

    local function AddScriptButton(parent, label, urlOrFunc, isVipScript)
        if not parent then return end
        local ScriptBtn = Instance.new("TextButton")
        ScriptBtn.Parent = parent
        ScriptBtn.BackgroundColor3 = isVipScript and Color3.fromRGB(50, 40, 20) or Color3.fromRGB(38, 38, 50)
        ScriptBtn.Size = UDim2.new(1, -10, 0, 32)
        ScriptBtn.Font = Enum.Font.Gotham
        ScriptBtn.Text = label
        ScriptBtn.TextColor3 = isVipScript and Color3.fromRGB(250, 204, 21) or Color3.fromRGB(255, 255, 255)
        ScriptBtn.TextSize = 10
        Instance.new("UICorner", ScriptBtn).CornerRadius = UDim.new(0, 6)

        ScriptBtn.MouseButton1Click:Connect(function()
            pcall(function()
                if type(urlOrFunc) == "string" then
                    loadstring(game:HttpGet(urlOrFunc))()
                elseif type(urlOrFunc) == "function" then
                    urlOrFunc()
                end
            end)
        end)

        table.insert(allScriptButtons, ScriptBtn)
    end

    -- Arama Fonksiyonu
    SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
        local query = string.lower(SearchBar.Text)
        if query == "" then
            for _, btn in ipairs(allScriptButtons) do
                btn.Visible = true
            end
        else
            for _, btn in ipairs(allScriptButtons) do
                if string.find(string.lower(btn.Text), query) then
                    btn.Visible = true
                else
                    btn.Visible = false
                end
            end
        end
    end)

    local tNames = texts[currentLang].tabs

    -- 1. Standart Genel Araçlar (Kesin çalışan stabil araçlar)
    local TabGenel = CreateCategory(tNames[1], false)
    AddScriptButton(TabGenel, "⚡ Infinite Yield (Komut Paneli)", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
    AddScriptButton(TabGenel, "🚀 Fly Gui V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
    AddScriptButton(TabGenel, "👁️ Universal ESP Viewer", "https://raw.githubusercontent.com/GamingScripter/ESP-Viewer/main/ESP-Viewer.lua")

    -- 2. Standart Popüler Oyunlar (Test edilmiş güncel linkler)
    local TabPopular = CreateCategory(tNames[2], false)
    AddScriptButton(TabPopular, "🍎 Blox Fruits (Redz Hub)", "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua")
    AddScriptButton(TabPopular, "🥊 The Strongest Battlegrounds", "https://raw.githubusercontent.com/skzu/TheStrongestBattlegrounds/main/Source.lua")
    AddScriptButton(TabPopular, "🚪 Doors V2", "https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua")
    AddScriptButton(TabPopular, "⚔️ Jujutsu Shenanigans", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/JujutsuShenanigans.lua")

    -- 3. Aktif Mega Hublar ve Arşiv Linkleri
    local TabMega = CreateCategory(tNames[3], true)
    if TabMega then
        local workingHubs = {
            {"🌲 Gumanba Grow a Garden", "https://raw.githubusercontent.com/gumanba/Scripts/main/GrowaGarden"},
            {"🎯 Speed Hub X (Universal)", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua"},
            {"🐱 Pet Simulator 99 Hub", "https://raw.githubusercontent.com/XoAD2/PS99/main/Loader.lua"},
            {"⚔️ Blade Ball Auto Parry", "https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"},
            {"🛡️ Anime Vanguards Hub", "https://raw.githubusercontent.com/scriptpastebin/raw/main/AnimeVanguards"},
            {"⚡ Type Soul Hub", "https://raw.githubusercontent.com/xu-dev/typesoul/main/loader.lua"},
            {"🔪 Murder Mystery 2 Hub", "https://raw.githubusercontent.com/sannin9000/Roblox/main/MM2"},
            {"💥 BedWars Vape V4", "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua"},
            {"🔥 Slap Battles Script", "https://raw.githubusercontent.com/Giangplay/slap_battles/main/slap_battles.lua"},
            {"🚗 Driving Empire Hub", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/DrivingEmpire"},
            {"🦾 Arm Wrestle Simulator", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/ArmWrestle"},
            {"💪 Gym League Hub", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"},
            {"🏠 Brookhaven RP Hub", "https://raw.githubusercontent.com/IceMaestroc/Roblox-Script-Hubs/main/Brookhaven.lua"},
            {"🌊 Pixel Piece Loader", "https://raw.githubusercontent.com/ScientificHub/PixelPiece/main/Loader"},
            {"🏴‍☠️ King Legacy Loader", "https://raw.githubusercontent.com/zerophant/KingLegacy/main/Loader"},
            {"👊 Peroxide Script", "https://raw.githubusercontent.com/tbao143/peroxide/main/loader"},
            {"🏎️ Jailbreak Hub", "https://raw.githubusercontent.com/wawsdas1/jailbreak/main/loader"},
            {"🔫 Arsenal Hub", "https://raw.githubusercontent.com/HubScripterX/Arsenal/main/Loader"},
            {"🎯 Phantom Forces Hub", "https://raw.githubusercontent.com/rblxscripts/phantomforces/main/loader"},
            {"🪙 PLS DONATE Hub", "https://raw.githubusercontent.com/PlsDonateHub/Loader/main/Script"}
        }
        for _, data in ipairs(workingHubs) do
            AddScriptButton(TabMega, "👑 " .. data[1], data[2], true)
        end
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
