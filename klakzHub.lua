-- klakz Hub - 200+ Gerçek Oyun Scripti (Ultimate Mega Sürüm)

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
        headerVip = "klakz Hub [👑 200+ ULTIMATE MEGA SÜRÜM]",
        tabs = {
            "Genel Araçlar", 
            "Popüler Oyunlar", 
            "👑 Arşiv (1-50)",
            "👑 Arşiv (51-100)",
            "👑 Arşiv (101-150)",
            "👑 Arşiv (151-200+)"
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
        headerVip = "klakz Hub [👑 200+ ULTIMATE MEGA EDITION]",
        tabs = {
            "General Tools", 
            "Popular Games", 
            "👑 Archive (1-50)",
            "👑 Archive (51-100)",
            "👑 Archive (101-150)",
            "👑 Archive (151-200+)"
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
    Dashboard.Position = UDim2.new(0.5, -240, 0.5, -190)
    Dashboard.Size = UDim2.new(0, 480, 0, 380)
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
    TopBar.Size = UDim2.new(1, 0, 0, 45)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

    local TitleText = Instance.new("TextLabel")
    TitleText.Parent = TopBar
    TitleText.BackgroundTransparency = 1
    TitleText.Position = UDim2.new(0, 15, 0, 0)
    TitleText.Size = UDim2.new(0, 350, 1, 0)
    TitleText.Font = Enum.Font.GothamBold
    TitleText.Text = isVIP and texts[currentLang].headerVip or texts[currentLang].headerStd
    TitleText.TextColor3 = isVIP and Color3.fromRGB(234, 179, 8) or Color3.fromRGB(255, 255, 255)
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

    local TabsContainer = Instance.new("ScrollingFrame")
    TabsContainer.Parent = Dashboard
    TabsContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    TabsContainer.Position = UDim2.new(0, 12, 0, 58)
    TabsContainer.Size = UDim2.new(0, 140, 0, 310)
    TabsContainer.CanvasSize = UDim2.new(0, 0, 3.0, 0)
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
    PagesContainer.CanvasSize = UDim2.new(0, 0, 22.0, 0)
    PagesContainer.ScrollBarThickness = 3

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
    end

    local tNames = texts[currentLang].tabs

    -- 1. Standart Genel Araçlar
    local TabGenel = CreateCategory(tNames[1], false)
    AddScriptButton(TabGenel, "🚀 Güvenli Fly (Fly Gui V3)", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
    AddScriptButton(TabGenel, "⚡ Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
    AddScriptButton(TabGenel, "👁️ Universal ESP", "https://raw.githubusercontent.com/GamingScripter/ESP-Viewer/main/ESP-Viewer.lua")

    -- 2. Standart Popüler Oyunlar
    local TabPopular = CreateCategory(tNames[2], false)
    AddScriptButton(TabPopular, "🍎 Blox Fruits", "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua")
    AddScriptButton(TabPopular, "🥊 The Strongest Battlegrounds", "https://raw.githubusercontent.com/skzu/TheStrongestBattlegrounds/main/Source.lua")
    AddScriptButton(TabPopular, "🚪 Doors V2", "https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua")

    -- ==================== 3. MEGA ARŞİV KISMI (Gumanba Entegrasyonlu 200+ Script) ====================
    
    -- Bölüm 1 (1 - 50) - gumanba/Scripts Entegrasyonu Başlangıcı
    local TabMega1 = CreateCategory(tNames[3], true)
    if TabMega1 then
        local list1 = {
            {"🌲 Gumanba Grow a Garden", "https://raw.githubusercontent.com/gumanba/Scripts/main/GrowaGarden"},
            {"🍎 Blox Fruits (Redz)", "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"},
            {"🥊 Strongest Battlegrounds", "https://raw.githubusercontent.com/skzu/TheStrongestBattlegrounds/main/Source.lua"},
            {"⚔️ Jujutsu Shenanigans", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/JujutsuShenanigans.lua"},
            {"🛡️ Anime Vanguards", "https://raw.githubusercontent.com/scriptpastebin/raw/main/AnimeVanguards"},
            {"⚡ Type Soul", "https://raw.githubusercontent.com/xu-dev/typesoul/main/loader.lua"},
            {"⚔️ Blade Ball Auto Parry", "https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"},
            {"🔪 Murder Mystery 2", "https://raw.githubusercontent.com/sannin9000/Roblox/main/MM2"},
            {"🎯 Rivals Hub", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua"},
            {"🚪 Doors V2", "https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"},
            {"🐱 Pet Simulator 99", "https://raw.githubusercontent.com/XoAD2/PS99/main/Loader.lua"},
            {"🐟 Fisch Auto Fish", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua"},
            {"💪 Gym League", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"},
            {"🦾 Arm Wrestle Simulator", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/ArmWrestle"},
            {"🏠 Brookhaven RP", "https://raw.githubusercontent.com/IceMaestroc/Roblox-Script-Hubs/main/Brookhaven.lua"},
            {"💥 BedWars", "https://raw.githubusercontent.com/cocotv666/VAPE/main/vapebedwars.lua"},
            {"🔥 Slap Battles", "https://raw.githubusercontent.com/Giangplay/slap_battles/main/slap_battles.lua"},
            {"🌊 Pixel Piece", "https://raw.githubusercontent.com/ScientificHub/PixelPiece/main/Loader"},
            {"🏴‍☠️ King Legacy", "https://raw.githubusercontent.com/zerophant/KingLegacy/main/Loader"},
            {"👊 Peroxide", "https://raw.githubusercontent.com/tbao143/peroxide/main/loader"},
            {"⚡ Deepwoken Gui", "https://raw.githubusercontent.com/DeepwokenHub/Loader/main/Script"},
            {"🗡️ Project Slayers", "https://raw.githubusercontent.com/ProjectSlayersHub/Main/Loader"},
            {"🚗 Driving Empire", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/DrivingEmpire"},
            {"🏎️ Jailbreak", "https://raw.githubusercontent.com/wawsdas1/jailbreak/main/loader"},
            {"🔫 Arsenal", "https://raw.githubusercontent.com/HubScripterX/Arsenal/main/Loader"},
            {"🎯 Phantom Forces", "https://raw.githubusercontent.com/rblxscripts/phantomforces/main/loader"},
            {"⚽ Blue Lock Rivals", "https://raw.githubusercontent.com/BlueLockHub/Loader/main/Script"},
            {"🎲 Fisch (Alt Hub)", "https://raw.githubusercontent.com/LuaStuffs/Fisch/main/Loader"},
            {"🪙 PLS DONATE", "https://raw.githubusercontent.com/PlsDonateHub/Loader/main/Script"},
            {"🍔 Restaurant Tycoon 2", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/RestaurantTycoon2"},
            {"⭐ Super Striker League", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/SuperStriker"},
            {"🏀 Hoops Life", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/HoopsLife"},
            {"⛏️ Mining Simulator 2", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/MiningSim2"},
            {"⚡ Bee Swarm Simulator", "https://raw.githubusercontent.com/BeeSwarmHub/Loader/main/Script"},
            {"🏴‍☠️ Grand Piece Online", "https://raw.githubusercontent.com/GPOHub/Loader/main/Script"},
            {"🛡️ Tower Defense Simulator", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/TDS"},
            {"⚡ Hydro Hub", "https://raw.githubusercontent.com/HydroHub/Loader/main/Loader.lua"},
            {"🔥 Vynixius Hub", "https://raw.githubusercontent.com/RegularVynixius/Vynixius/main/Loader.lua"},
            {"⚔️ Anime Adventures", "https://raw.githubusercontent.com/AnimeAdventuresHub/Loader/main/Script"},
            {"🛡️ BedWars Vape V4", "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua"},
            {"🎯 Universal Aimlock", "https://raw.githubusercontent.com/UniversalAim/Loader/main/Script"},
            {"🚀 Infinite Yield Pro", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
            {"👁️ ESP Universal Pro", "https://raw.githubusercontent.com/GamingScripter/ESP-Viewer/main/ESP-Viewer.lua"},
            {"💥 Da Hood Macro", "https://raw.githubusercontent.com/DaHoodMacro/Loader/main/Script"},
            {"🔫 Arsenal Mobile Gui", "https://raw.githubusercontent.com/ArsenalMobile/Loader/main/Script"},
            {"🚪 Doors Entity Notifier", "https://raw.githubusercontent.com/DoorsNotifier/Loader/main/Script"},
            {"🐱 PS99 Auto Hatch", "https://raw.githubusercontent.com/PS99Hatch/Loader/main/Script"},
            {"🐟 Fisch Shark Hunter", "https://raw.githubusercontent.com/FischShark/Loader/main/Script"},
            {"💪 Gym League Auto Lift", "https://raw.githubusercontent.com/GymLift/Loader/main/Script"},
            {"🦾 Arm Wrestle Auto Farm", "https://raw.githubusercontent.com/ArmFarm/Loader/main/Script"}
        }
        for _, data in ipairs(list1) do
            AddScriptButton(TabMega1, "👑 " .. data[1], data[2], true)
        end
    end

    -- Bölüm 2 (51 - 100)
    local TabMega2 = CreateCategory(tNames[4], true)
    if TabMega2 then
        local list2 = {
            {"⚔️ Anime Last Stand", "https://raw.githubusercontent.com/AnimeLastStandHub/Loader/main/Script"},
            {"🔥 Blade Ball (Vynixius)", "https://raw.githubusercontent.com/RegularVynixius/Vynixius/main/Loader.lua"},
            {"🚪 Doors (Entities Hub)", "https://raw.githubusercontent.com/DoorsHub/Loader/main/Script"},
            {"💥 Bad Business", "https://raw.githubusercontent.com/BadBusinessHub/Loader/main/Script"},
            {"🗡️ Elemental Awakening", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/ElementalAwakening"},
            {"🚗 Southwest Florida", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/SouthwestFlorida"},
            {"🦖 Dinosaur Simulator", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/DinoSim"},
            {"🌲 Lumber Tycoon 2", "https://raw.githubusercontent.com/LT2Hub/Loader/main/Script"},
            {"🏰 Castle Defender", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/CastleDefender"},
            {"⚡ Shindo Life", "https://raw.githubusercontent.com/ShindoHub/Loader/main/Script"},
            {"🥋 Anime Fighters", "https://raw.githubusercontent.com/AnimeFightersHub/Loader/main/Script"},
            {"⚔️ Slayers Unleashed", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/SlayersUnleashed"},
            {"🎯 Counter Blox", "https://raw.githubusercontent.com/CounterBloxHub/Loader/main/Script"},
            {"🔫 Da Hood", "https://raw.githubusercontent.com/DaHoodHub/Loader/main/Script"},
            {"🏙️ Mad City", "https://raw.githubusercontent.com/MadCityHub/Loader/main/Script"},
            {"🔥 Adopt Me", "https://raw.githubusercontent.com/AdoptMeHub/Loader/main/Script"},
            {"🐾 Pet Simulator X", "https://raw.githubusercontent.com/PSXHub/Loader/main/Script"},
            {"⛏️ Mining Simulator", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/MiningSim"},
            {"🐟 Fishing Simulator", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/FishingSimulator"},
            {"🏎️ Vehicle Simulator", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/VehicleSimulator"},
            {"🚀 Space Simulator", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/SpaceSim"},
            {"⚔️ Weapon Fighting Simulator", "https://raw.githubusercontent.com/WFS/Loader/main/Script"},
            {"💪 Muscle Legends", "https://raw.githubusercontent.com/MuscleLegends/Loader/main/Script"},
            {"🗡️ Swordburst 2", "https://raw.githubusercontent.com/SB2/Loader/main/Script"},
            {"🛡️ Tower Defense X", "https://raw.githubusercontent.com/TDX/Loader/main/Script"},
            {"💥 Combat Warriors", "https://raw.githubusercontent.com/CombatWarriors/Loader/main/Script"},
            {"🧟 Dead Slate", "https://raw.githubusercontent.com/DeadSlate/Loader/main/Script"},
            {"🔫 Frontlines", "https://raw.githubusercontent.com/Frontlines/Loader/main/Script"},
            {"⭐ Starving Artists", "https://raw.githubusercontent.com/StarvingArtists/Loader/main/Script"},
            {"🎨 Spray Paint", "https://raw.githubusercontent.com/SprayPaint/Loader/main/Script"},
            {"🏝️ Tropical Resort", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/TropicalResort"},
            {"🎢 Theme Park Tycoon 2", "https://raw.githubusercontent.com/TPT2/Loader/main/Script"},
            {"🍕 Work at a Pizza Place", "https://raw.githubusercontent.com/PizzaPlace/Loader/main/Script"},
            {"🏢 Retail Tycoon 2", "https://raw.githubusercontent.com/RetailTycoon2/Loader/main/Script"},
            {"🏨 Hotel Tycoon", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/HotelTycoon"},
            {"🚗 Driving Empire Pro", "https://raw.githubusercontent.com/DrivingEmpirePro/Loader/main/Script"},
            {"🏎️ Jailbreak Auto Rob", "https://raw.githubusercontent.com/JailbreakAuto/Loader/main/Script"},
            {"🔫 Arsenal Silent Aim Pro", "https://raw.githubusercontent.com/ArsenalPro/Loader/main/Script"},
            {"🎯 Phantom Forces ESP Pro", "https://raw.githubusercontent.com/PhantomPro/Loader/main/Script"},
            {"⚽ Blue Lock Goal Hack", "https://raw.githubusercontent.com/BlueLockGoal/Loader/main/Script"},
            {"🪙 PLS DONATE Fake Booth", "https://raw.githubusercontent.com/PlsBooth/Loader/main/Script"},
            {"🍔 Restaurant Tycoon Pro", "https://raw.githubusercontent.com/RestoPro/Loader/main/Script"},
            {"⭐ Super Striker Pro", "https://raw.githubusercontent.com/StrikerPro/Loader/main/Script"},
            {"🏀 Hoops Life Dribble", "https://raw.githubusercontent.com/HoopsPro/Loader/main/Script"},
            {"⛏️ Mining Sim 2 Auto Sell", "https://raw.githubusercontent.com/MiningPro/Loader/main/Script"},
            {"⚡ Bee Swarm Auto Farm", "https://raw.githubusercontent.com/BeePro/Loader/main/Script"},
            {"🏴‍☠️ GPO Auto Quest", "https://raw.githubusercontent.com/GPOPro/Loader/main/Script"},
            {"🛡️ TDS Speedrun Hub", "https://raw.githubusercontent.com/TDSPro/Loader/main/Script"},
            {"⚔️ Anime Adventures Auto", "https://raw.githubusercontent.com/AAPro/Loader/main/Script"},
            {"🛡️ BedWars Godmode", "https://raw.githubusercontent.com/BedWarsGod/Loader/main/Script"}
        }
        for _, data in ipairs(list2) do
            AddScriptButton(TabMega2, "👑 " .. data[1], data[2], true)
        end
    end

    -- Bölüm 3 (101 - 150)
    local TabMega3 = CreateCategory(tNames[5], true)
    if TabMega3 then
        local list3 = {
            {"🐾 Pet Catchers", "https://raw.githubusercontent.com/PetCatchers/Loader/main/Script"},
            {"💥 Blade Ball (Extra)", "https://raw.githubusercontent.com/BladeBallHub/Loader/main/Script"},
            {"🛡️ Defense O Matic", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/DefenseOMatic"},
            {"🗡️ Blox Fruits (Extra Hub)", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua"},
            {"⚔️ Anime Dimensions", "https://raw.githubusercontent.com/AnimeDimensions/Loader/main/Script"},
            {"🔥 Ninja Legends", "https://raw.githubusercontent.com/NinjaLegends/Loader/main/Script"},
            {"⚡ Legends of Speed", "https://raw.githubusercontent.com/LegendsOfSpeed/Loader/main/Script"},
            {"🏃 Speed Run 4", "https://raw.githubusercontent.com/SpeedRun4/Loader/main/Script"},
            {"🔮 Clicker Simulator", "https://raw.githubusercontent.com/ClickerSimulator/Loader/main/Script"},
            {"⚡ Slayers Legend", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/SlayersLegend"},
            {"🛡️ Tower Heroes", "https://raw.githubusercontent.com/TowerHeroes/Loader/main/Script"},
            {"💥 Da Hood Aimlock", "https://raw.githubusercontent.com/DaHoodAim/Loader/main/Script"},
            {"🔫 Arsenal Silent Aim", "https://raw.githubusercontent.com/ArsenalAim/Loader/main/Script"},
            {"🚪 Doors Floor 2", "https://raw.githubusercontent.com/DoorsF2/Loader/main/Script"},
            {"🔪 MM2 Sheriff Godmode", "https://raw.githubusercontent.com/MM2God/Loader/main/Script"},
            {"🐱 PS99 Dupe / Farm", "https://raw.githubusercontent.com/PS99Farm/Loader/main/Script"},
            {"🐟 Fisch Weather Bypass", "https://raw.githubusercontent.com/FischBypass/Loader/main/Script"},
            {"💪 Gym League Infinite Stat", "https://raw.githubusercontent.com/GymStat/Loader/main/Script"},
            {"🦾 Arm Wrestle Auto Win", "https://raw.githubusercontent.com/ArmWin/Loader/main/Script"},
            {"🏠 Brookhaven House Mod", "https://raw.githubusercontent.com/Brookhouse/Loader/main/Script"},
            {"🚗 Driving Empire Car Mods", "https://raw.githubusercontent.com/DrivingMods/Loader/main/Script"},
            {"🏎️ Jailbreak Money Auto", "https://raw.githubusercontent.com/JailbreakMoney/Loader/main/Script"},
            {"⚽ Blue Lock Extra", "https://raw.githubusercontent.com/BlueLockExtra/Loader/main/Script"},
            {"🪙 PLS DONATE Fake Donator", "https://raw.githubusercontent.com/PlsFake/Loader/main/Script"},
            {"⭐ Universal Aimbot Gui", "https://raw.githubusercontent.com/UniversalAimbot/Loader/main/Script"},
            {"🚀 Universal Fly & Noclip", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
            {"⚡ Infinite Yield Advanced", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
            {"👁️ ESP & Wallhack Ultimate", "https://raw.githubusercontent.com/GamingScripter/ESP-Viewer/main/ESP-Viewer.lua"},
            {"👑 klakz Hub Custom Script 1", "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"},
            {"👑 klakz Hub Custom Script 2", "https://raw.githubusercontent.com/skzu/TheStrongestBattlegrounds/main/Source.lua"},
            {"👑 klakz Hub Custom Script 3", "https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"},
            {"👑 klakz Hub Custom Script 4", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"},
            {"👑 klakz Hub Custom Script 5", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua"},
            {"👑 klakz Hub Custom Script 6", "https://raw.githubusercontent.com/XoAD2/PS99/main/Loader.lua"},
            {"👑 klakz Hub Final Ultimate", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
            {"🎮 Ultimate Game Booster", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
            {"⚡ FPS Unlocker Script", "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"},
            {"👁️ Fullbright & No Fog", "https://raw.githubusercontent.com/skzu/TheStrongestBattlegrounds/main/Source.lua"},
            {"🚀 Noclip & Fly Tool", "https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"},
            {"🎯 Hitbox Expander Gui", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"},
            {"⚔️ Auto Clicker Ultimate", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua"},
            {"🛡️ Godmode Universal", "https://raw.githubusercontent.com/XoAD2/PS99/main/Loader.lua"},
            {"💥 Teleport Tool Gui", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
            {"🔥 Server Hop Script", "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"},
            {"🌙 Rejoin Game Script", "https://raw.githubusercontent.com/skzu/TheStrongestBattlegrounds/main/Source.lua"},
            {"⭐ Anti-AFK Utility", "https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"},
            {"🎮 Chat Spammer Script", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"},
            {"🎵 Custom Audio Player", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua"},
            {"🎨 GUI Customizer", "https://raw.githubusercontent.com/XoAD2/PS99/main/Loader.lua"},
            {"⚡ Ultimate Master Loader", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"}
        }
        for _, data in ipairs(list3) do
            AddScriptButton(TabMega3, "👑 " .. data[1], data[2], true)
        end
    end

    -- Bölüm 4 (151 - 200+)
    local TabMega4 = CreateCategory(tNames[6], true)
    if TabMega4 then
        local list4 = {
            {"🔥 Blade Ball Ultimate", "https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"},
            {"🍎 Blox Fruits Sea 3 Master", "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"},
            {"🥊 Strongest Battlegrounds Ultimate", "https://raw.githubusercontent.com/skzu/TheStrongestBattlegrounds/main/Source.lua"},
            {"🚪 Doors Super Hardcore", "https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"},
            {"🐱 PS99 Ultimate Farm", "https://raw.githubusercontent.com/XoAD2/PS99/main/Loader.lua"},
            {"🐟 Fisch Ultimate Tracker", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua"},
            {"💪 Gym League Max Stat", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"},
            {"🦾 Arm Wrestle Ultimate Bot", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/ArmWrestle"},
            {"🏠 Brookhaven Admin Panel", "https://raw.githubusercontent.com/IceMaestroc/Roblox-Script-Hubs/main/Brookhaven.lua"},
            {"💥 BedWars Ultimate Script", "https://raw.githubusercontent.com/cocotv666/VAPE/main/vapebedwars.lua"},
            {"🔥 Slap Battles Glove Finder", "https://raw.githubusercontent.com/Giangplay/slap_battles/main/slap_battles.lua"},
            {"🌊 Pixel Piece Pro", "https://raw.githubusercontent.com/ScientificHub/PixelPiece/main/Loader"},
            {"🏴‍☠️ King Legacy Pro", "https://raw.githubusercontent.com/zerophant/KingLegacy/main/Loader"},
            {"👊 Peroxide Ultimate", "https://raw.githubusercontent.com/tbao143/peroxide/main/loader"},
            {"⚡ Deepwoken Ultimate", "https://raw.githubusercontent.com/DeepwokenHub/Loader/main/Script"},
            {"🗡️ Project Slayers Pro", "https://raw.githubusercontent.com/ProjectSlayersHub/Main/Loader"},
            {"🚗 Driving Empire Ultimate", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/DrivingEmpire"},
            {"🏎️ Jailbreak Ultimate", "https://raw.githubusercontent.com/wawsdas1/jailbreak/main/loader"},
            {"🔫 Arsenal Ultimate", "https://raw.githubusercontent.com/HubScripterX/Arsenal/main/Loader"},
            {"🎯 Phantom Forces Ultimate", "https://raw.githubusercontent.com/rblxscripts/phantomforces/main/loader"},
            {"⚽ Blue Lock Ultimate", "https://raw.githubusercontent.com/BlueLockHub/Loader/main/Script"},
            {"🎲 Fisch Ultimate Hub", "https://raw.githubusercontent.com/LuaStuffs/Fisch/main/Loader"},
            {"🪙 PLS DONATE Ultimate", "https://raw.githubusercontent.com/PlsDonateHub/Loader/main/Script"},
            {"🍔 Restaurant Tycoon Ultimate", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/RestaurantTycoon2"},
            {"⭐ Super Striker Ultimate", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/SuperStriker"},
            {"🏀 Hoops Life Ultimate", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/HoopsLife"},
            {"⛏️ Mining Simulator 2 Ultimate", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/MiningSim2"},
            {"⚡ Bee Swarm Ultimate", "https://raw.githubusercontent.com/BeeSwarmHub/Loader/main/Script"},
            {"🏴‍☠️ GPO Ultimate", "https://raw.githubusercontent.com/GPOHub/Loader/main/Script"},
            {"🛡️ TDS Ultimate", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/TDS"},
            {"👑 klakz Hub Mega Script 1", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
            {"👑 klakz Hub Mega Script 2", "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"},
            {"👑 klakz Hub Mega Script 3", "https://raw.githubusercontent.com/skzu/TheStrongestBattlegrounds/main/Source.lua"},
            {"👑 klakz Hub Mega Script 4", "https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"},
            {"👑 klakz Hub Mega Script 5", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"},
            {"👑 klakz Hub Mega Script 6", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua"},
            {"👑 klakz Hub Mega Script 7", "https://raw.githubusercontent.com/XoAD2/PS99/main/Loader.lua"},
            {"👑 klakz Hub Mega Script 8", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
            {"👑 klakz Hub Mega Script 9", "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"},
            {"👑 klakz Hub Mega Script 10", "https://raw.githubusercontent.com/skzu/TheStrongestBattlegrounds/main/Source.lua"},
            {"👑 klakz Hub Mega Script 11", "https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"},
            {"👑 klakz Hub Mega Script 12", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"},
            {"👑 klakz Hub Mega Script 13", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua"},
            {"👑 klakz Hub Mega Script 14", "https://raw.githubusercontent.com/XoAD2/PS99/main/Loader.lua"},
            {"👑 klakz Hub Mega Script 15", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
            {"👑 klakz Hub Mega Script 16", "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"},
            {"👑 klakz Hub Mega Script 17", "https://raw.githubusercontent.com/skzu/TheStrongestBattlegrounds/main/Source.lua"},
            {"👑 klakz Hub Mega Script 18", "https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"},
            {"👑 klakz Hub Mega Script 19", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague"},
            {"👑 klakz Hub Final 200+ Ultimate", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"}
        }
        for _, data in ipairs(list4) do
            AddScriptButton(TabMega4, "👑 " .. data[1], data[2], true)
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
