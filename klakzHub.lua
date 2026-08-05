-- klakz Hub - Siyah Ekran / Çökme Düzeltilmiş Kararlı Sürüm

if game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI") then
    game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "klakzHub_MainUI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- Ana Panel
local Dashboard = Instance.new("Frame")
Dashboard.Parent = ScreenGui
Dashboard.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Dashboard.Position = UDim2.new(0.5, -275, 0.5, -200)
Dashboard.Size = UDim2.new(0, 550, 0, 400)
Dashboard.Active = true
Dashboard.Draggable = true

local DashCorner = Instance.new("UICorner")
DashCorner.CornerRadius = UDim.new(0, 10)
Dashboard.Parent = Dashboard

local DashStroke = Instance.new("UIStroke")
DashStroke.Color = Color3.fromRGB(99, 102, 241)
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

-- Logo
local SmallLogo = Instance.new("TextLabel")
SmallLogo.Parent = TopBar
SmallLogo.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
SmallLogo.Position = UDim2.new(0, 12, 0, 10)
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
TitleText.Position = UDim2.new(0, 48, 0, 0)
TitleText.Size = UDim2.new(0, 300, 1, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "klakz Hub | Universal & Speed Edition"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 13
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Kapatma Butonu
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

-- Sol Sekmeler (Kategoriler) Alanı
local TabsContainer = Instance.new("ScrollingFrame")
TabsContainer.Parent = Dashboard
TabsContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
TabsContainer.Position = UDim2.new(0, 12, 0, 58)
TabsContainer.Size = UDim2.new(0, 150, 0, 330)
TabsContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
TabsContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
TabsContainer.ScrollBarThickness = 3

local TabsLayout = Instance.new("UIListLayout")
TabsLayout.Parent = TabsContainer
TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabsLayout.Padding = UDim.new(0, 5)

-- Sağ Sayfalar Taşıyıcısı (Hatasız Çerçeve)
local PagesContainer = Instance.new("Frame")
PagesContainer.Parent = Dashboard
PagesContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
PagesContainer.Position = UDim2.new(0, 174, 0, 58)
PagesContainer.Size = UDim2.new(0, 364, 0, 330)
PagesContainer.BackgroundTransparency = 1

local firstTab = true
local activePage = nil

local function CreateCategory(name)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = TabsContainer
    TabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    TabBtn.Size = UDim2.new(1, -6, 0, 36)
    TabBtn.Font = Enum.Font.GothamMedium
    TabBtn.Text = name
    TabBtn.TextColor3 = Color3.fromRGB(210, 210, 220)
    TabBtn.TextSize = 12

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = TabBtn

    local Page = Instance.new("ScrollingFrame")
    Page.Parent = PagesContainer
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

    TabBtn.MouseButton1Click:Connect(function()
        if activePage then
            activePage.Visible = false
        end
        Page.Visible = true
        activePage = Page
    end)

    if firstTab then
        Page.Visible = true
        activePage = Page
        firstTab = false
    end

    return Page
end

local function AddScriptButton(parent, label, callback)
    local ScriptBtn = Instance.new("TextButton")
    ScriptBtn.Parent = parent
    ScriptBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 50)
    ScriptBtn.Size = UDim2.new(1, -10, 0, 36)
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

-- ==================== KATEGORİLER VE SCRIPTLER ====================

local TabMove = CreateCategory("🏃 Hareket / Fizik")
AddScriptButton(TabMove, "Güvenli Fly (Uçma V3)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))() end)
AddScriptButton(TabMove, "Speed Hack (50 Hız)", function() local p = game.Players.LocalPlayer if p.Character and p.Character:FindFirstChild("Humanoid") then p.Character.Humanoid.WalkSpeed = 50 end end)
AddScriptButton(TabMove, "Super Jump (Zıplama Gücü)", function() local p = game.Players.LocalPlayer if p.Character and p.Character:FindFirstChild("Humanoid") then p.Character.Humanoid.JumpPower = 120 end end)
AddScriptButton(TabMove, "Noclip (Duvarlardan Geçme)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Noclip-12345"))() end)
AddScriptButton(TabMove, "Infinite Jump (Sınırsız Zıplama)", function() game:GetService("UserInputService").JumpRequest:Connect(function() game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState("Jumping") end) end)

local TabVisual = CreateCategory("👁️ Görsel & ESP")
AddScriptButton(TabVisual, "Universal ESP (Oyuncuları Gör)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/PrivateUser202/ESP/main/UniversalESP.lua"))() end)
AddScriptButton(TabVisual, "Fullbright (Gece Görüşü / Işık)", function() local l = game:GetService("Lighting") l.Ambient = Color3.new(1,1,1) l.Brightness = 2 l.ClockTime = 14 end)
AddScriptButton(TabVisual, "FOV Changer (Görüş Açısı)", function() workspace.CurrentCamera.FieldOfView = 120 end)
AddScriptButton(TabVisual, "X-Ray (Duvar Şeffaflığı)", function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") and v.Transparency < 0.5 then v.Transparency = 0.5 end end end)

local TabAdmin = CreateCategory("🛠️ Admin Komutları")
AddScriptButton(TabAdmin, "Infinite Yield (En İyi Admin)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
AddScriptButton(TabAdmin, "Nameless Admin", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))() end)
AddScriptButton(TabAdmin, "Dex Explorer (Oyun Kodları)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Dark-Dex-V3-15638"))() end)
AddScriptButton(TabAdmin, "Remote Spy (Event Yakalayıcı)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Remote-Spy-Hub-6102"))() end)

local TabHubs = CreateCategory("⚡ Büyük Hublar")
AddScriptButton(TabHubs, "Speed Hub X (Genel Destekli)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))() end)
AddScriptButton(TabHubs, "Vape V4 (PvP / Combat)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))() end)
AddScriptButton(TabHubs, "Owl Hub (Aimbot & ESP)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))() end)

local TabTSB = CreateCategory("⚔️ Strongest Battle.")
AddScriptButton(TabTSB, "BadWare Hub", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/sandwichk/RobloxScripts/main/Scripts/BadWare/Hub/Load.lua", true))() end)

local TabBF = CreateCategory("🍒 Blox Fruits")
AddScriptButton(TabBF, "Redz Hub", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"))() end)
AddScriptButton(TabBF, "Quantum Hub", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/TrustSense/QuantumHub/main/BloxFruits.lua"))() end)

local TabDoors = CreateCategory("🚪 Doors")
AddScriptButton(TabDoors, "Doors ESP & Notifier", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Erchobacto/Doors/main/V2.lua"))() end)

local TabBB = CreateCategory("⚽ Blade Ball")
AddScriptButton(TabBB, "Auto Parry (Otomatik Savuşturma)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"))() end)

local TabFisch = CreateCategory("🎣 Fisch")
AddScriptButton(TabFisch, "Fisch Auto Fish & Hub", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))() end)
