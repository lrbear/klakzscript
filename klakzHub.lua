-- klakz Hub - Sekmeli Tüm Oyun Arşivi + Standart ve Premium Key Sistemi

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
        headerVip = "klakz Hub [👑 PREMIUM VİP SÜRÜM]",
        tabs = {
            "Genel Araçlar", 
            "RP & Yaşam", 
            "Anime & Dövüş", 
            "FPS & Nişancı", 
            "Korku & Hayatta Kalma", 
            "Simülasyon & Pet", 
            "Spor & Simulator", 
            "İnşa & Sandbox", 
            "Parkur & Eğlence", 
            "Yarış & Araba", 
            "Trendler",
            "👑 Premium Özel"
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
        headerVip = "klakz Hub [👑 PREMIUM VIP EDITION]",
        tabs = {
            "General Tools", 
            "RP & Life", 
            "Anime & Fight", 
            "FPS & Shooter", 
            "Horror & Survival", 
            "Simulator & Pet", 
            "Sports & Sim", 
            "Build & Sandbox", 
            "Obby & Fun", 
            "Racing & Cars", 
            "Trends",
            "👑 Premium Exclusive"
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
    TabsContainer.CanvasSize = UDim2.new(0, 0, 5.0, 0)
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
    PagesContainer.CanvasSize = UDim2.new(0, 0, 15.0, 0)
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
        TabBtn.TextSize = 11
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
        ScriptBtn.TextSize = 11
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

    -- 1. Genel Araçlar
    local TabGenel = CreateCategory(tNames[1], false)
    AddScriptButton(TabGenel, "🚀 Güvenli Fly (Fly Gui V3)", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
    AddScriptButton(TabGenel, "⚡ Infinite Yield (Admin)", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
    AddScriptButton(TabGenel, "👁️ Universal ESP", "https://raw.githubusercontent.com/GamingScripter/ESP-Viewer/main/ESP-Viewer.lua")
    AddScriptButton(TabGenel, "🛠️ Blok (Part) Oluştur", function()
        local p = game.Players.LocalPlayer
        if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local part = Instance.new("Part")
            part.Size = Vector3.new(4, 1, 4)
            part.Position = p.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
            part.BrickColor = BrickColor.random()
            part.Parent = workspace
        end
    end)
    AddScriptButton(TabGenel, "✨ Yerçekimini Kaldır (0)", function() workspace.Gravity = 0 end)
    AddScriptButton(TabGenel, "🌍 Normal Yerçekimi", function() workspace.Gravity = 196.2 end)

    -- 2. RP & Yaşam
    local TabRP = CreateCategory(tNames[2], false)
    AddScriptButton(TabRP, "🏠 Brookhaven RP Hub", "https://raw.githubusercontent.com/IceMaestroc/Roblox-Script-Hubs/main/Brookhaven.lua")
    AddScriptButton(TabRP, "🐾 Adopt Me! Farm", "https://raw.githubusercontent.com/jLn003/AdoptMe/main/Main.lua")
    AddScriptButton(TabRP, "🍔 Bloxburg GUI", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/Bloxburg.lua")
    AddScriptButton(TabRP, "🌟 Royale High Farm", "https://raw.githubusercontent.com/MeowExecuting/RoyaleHigh/main/Source.lua")

    -- 3. Anime & Dövüş
    local TabAnime = CreateCategory(tNames[3], false)
    AddScriptButton(TabAnime, "🍎 Blox Fruits", "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua")
    AddScriptButton(TabAnime, "🥊 The Strongest Battlegrounds", "https://raw.githubusercontent.com/skzu/TheStrongestBattlegrounds/main/Source.lua")
    AddScriptButton(TabAnime, "⚔️ Jujutsu Shenanigans", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/JujutsuShenanigans.lua")
    AddScriptButton(TabAnime, "🛡️ Anime Vanguards", "https://raw.githubusercontent.com/scriptpastebin/raw/main/AnimeVanguards")
    AddScriptButton(TabAnime, "⚡ Type Soul Loader", "https://raw.githubusercontent.com/xu-dev/typesoul/main/loader.lua")
    AddScriptButton(TabAnime, "🌀 Shindo Life GUI", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/Shindo")

    -- 4. FPS & Nişancı
    local TabFPS = CreateCategory(tNames[4], false)
    AddScriptButton(TabFPS, "⚔️ Blade Ball Auto Parry", "https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly")
    AddScriptButton(TabFPS, "🔪 Murder Mystery 2", "https://raw.githubusercontent.com/sannin9000/Roblox/main/MM2")
    AddScriptButton(TabFPS, "🎯 Rivals Hub", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua")
    AddScriptButton(TabFPS, "🧱 BedWars Vulnyx", "https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/loader.lua")
    AddScriptButton(TabFPS, "🔫 Arsenal Hub", "https://raw.githubusercontent.com/fevse/Arsenal/main/Loader")

    -- 5. Korku & Hayatta Kalma
    local TabHorror = CreateCategory(tNames[5], false)
    AddScriptButton(TabHorror, "🚪 Doors V2", "https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua")
    AddScriptButton(TabHorror, "🐷 Piggy GUI", "https://raw.githubusercontent.com/jLn003/Piggy/main/Main.lua")
    AddScriptButton(TabHorror, "🛒 3008 SCP Hub", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/SCP3008.lua")
    AddScriptButton(TabHorror, "🏃 Evade ESP", "https://raw.githubusercontent.com/RobloxScripts/Evade/main/Source.lua")

    -- 6. Simülasyon & Pet
    local TabSim = CreateCategory(tNames[6], false)
    AddScriptButton(TabSim, "🐱 Pet Simulator 99!", "https://raw.githubusercontent.com/XoAD2/PS99/main/Loader.lua")
    AddScriptButton(TabSim, "🐟 Fisch Auto Fish", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua")
    AddScriptButton(TabSim, "🐝 Bee Swarm Simulator", "https://raw.githubusercontent.com/HubScripter/BeeSwarm/main/Main.lua")
    AddScriptButton(TabSim, "🌿 Grow a Garden", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/GrowAGarden.lua")

    -- 7. Spor & Simulator
    local TabSports = CreateCategory(tNames[7], false)
    AddScriptButton(TabSports, "💪 Gym League", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/GymLeague")
    AddScriptButton(TabSports, "🦾 Arm Wrestle Simulator", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/ArmWrestle")
    AddScriptButton(TabSports, "⚡ Muscle Legends", "https://raw.githubusercontent.com/ahmadsgaming/speedhubx/main/loader.lua")
    AddScriptButton(TabSports, "🎲 Sol's RNG", "https://raw.githubusercontent.com/solsrng/solsrng/main/loader.lua")

    -- 8. İnşa & Sandbox
    local TabBuild = CreateCategory(tNames[8], false)
    AddScriptButton(TabBuild, "⛵ Build a Boat for Treasure", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/BuildABoat.lua")
    AddScriptButton(TabBuild, "🌪️ Natural Disaster Survival", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/NaturalDisaster.lua")
    AddScriptButton(TabBuild, "🍕 Work at a Pizza Place", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/PizzaPlace.lua")

    -- 9. Parkur & Eğlence
    local TabFun = CreateCategory(tNames[9], false)
    AddScriptButton(TabFun, "🗼 Tower of Hell", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/TowerOfHell.lua")
    AddScriptButton(TabFun, "👗 Dress to Impress", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/DressToImpress.lua")
    AddScriptButton(TabFun, "🎮 Epic Minigames", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/EpicMinigames.lua")

    -- 10. Yarış & Araba
    local TabCar = CreateCategory(tNames[10], false)
    AddScriptButton(TabCar, "🚓 Jailbreak Auto Farm", "https://raw.githubusercontent.com/wawsdas/jailbreak/main/loader.lua")
    AddScriptButton(TabCar, "🏎️ Driving Empire", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/DrivingEmpire.lua")
    AddScriptButton(TabCar, "🚗 Vehicle Simulator", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/VehicleSimulator.lua")

    -- 11. Trendler
    local TabTrend = CreateCategory(tNames[11], false)
    AddScriptButton(TabTrend, "🎨 Dandy's World", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/DandysWorld.lua")
    AddScriptButton(TabTrend, "🧠 Steal a Brainrot", "https://raw.githubusercontent.com/ScriptBlox/Scripts/main/Brainrot.lua")

    -- 12. 👑 Premium Özel Sekmesi (Sadece VIP Key ile açılır)
    local TabVIPExclusive = CreateCategory(tNames[12], true)
    if TabVIPExclusive then
        AddScriptButton(TabVIPExclusive, "👑 [VIP] Özel Admin Komut Paneli", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true)
        AddScriptButton(TabVIPExclusive, "👑 [VIP] Ultra Hız & Godmode", function()
            pcall(function()
                local p = game.Players.LocalPlayer
                if p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.WalkSpeed = 100
                    p.Character.Humanoid.JumpPower = 150
                end
            end)
        end, true)
        AddScriptButton(TabVIPExclusive, "👑 [VIP] Tüm Oyunlar İçin Aimbot", "https://raw.githubusercontent.com/GamingScripter/ESP-Viewer/main/ESP-Viewer.lua", true)
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
