-- klakz Hub - Saf & Hatasız Full Script Arşivi (VIP Yerine Devasa Liste)

-- Ana Ekran
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "klakzHub_Master"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- Ana Çerçeve (Menü)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
MainFrame.Size = UDim2.new(0, 450, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(88, 101, 242)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Başlık Çubuğu
local TitleBar = Instance.new("TextLabel")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.Font = Enum.Font.GothamBold
TitleBar.Text = "  ⚡ klakz Hub - Ultimate Script Arşivi"
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.TextSize = 15
TitleBar.TextXAlignment = Enum.TextXAlignment.Left

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleBar

-- Kapatma Butonu
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

-- Sol Sekme Listesi (ScrollingFrame)
local TabList = Instance.new("ScrollingFrame")
TabList.Parent = MainFrame
TabList.Position = UDim2.new(0, 10, 0, 50)
TabList.Size = UDim2.new(0, 130, 0, 290)
TabList.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
TabList.CanvasSize = UDim2.new(0, 0, 2, 0)
TabList.ScrollBarThickness = 4

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 6)
TabCorner.Parent = TabList

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = TabList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- Sağ İçerik Alanı
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Parent = MainFrame
ContentFrame.Position = UDim2.new(0, 150, 0, 50)
ContentFrame.Size = UDim2.new(0, 290, 0, 290)
ContentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
ContentFrame.CanvasSize = UDim2.new(0, 0, 3, 0)
ContentFrame.ScrollBarThickness = 4

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 6)
ContentCorner.Parent = ContentFrame

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Parent = ContentFrame
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Padding = UDim.new(0, 8)

-- Sekme Değiştirme Fonksiyonu
local currentContainer = nil
local function CreateTab(name)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = TabList
    TabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    TabBtn.Size = UDim2.new(1, -10, 0, 35)
    TabBtn.Font = Enum.Font.GothamMedium
    TabBtn.Text = name
    TabBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
    TabBtn.TextSize = 13
    
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

    if not currentContainer then
        Container.Visible = true
        currentContainer = true
    end

    return Container
end

-- Buton Ekleme Yardımcısı
local function AddButton(parent, text, callback)
    local Btn = Instance.new("TextButton")
    Btn.Parent = parent
    Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    Btn.Size = UDim2.new(1, -10, 0, 32)
    Btn.Font = Enum.Font.Gotham
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 12
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = Btn
    
    Btn.MouseButton1Click:Connect(callback)
end

-- ==================== SEKME 1: GENEL & HIZ ARAÇLARI ====================
local Tab1 = CreateTab("Genel Araçlar")

AddButton(Tab1, "Güvenli Fly (Uçma)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

AddButton(Tab1, "Infinite Yield (Admin)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

AddButton(Tab1, "Speed Hack (Hız: 50)", function()
    game:GetService("RunService").Stepped:Connect(function()
        local plr = game:GetService("Players").LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = 50
        end
    end)
end)

AddButton(Tab1, "Super Speed (Hız: 120)", function()
    game:GetService("RunService").Stepped:Connect(function()
        local plr = game:GetService("Players").LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = 120
        end
    end)
end)

AddButton(Tab1, "Normal Hıza Dön (16)", function()
    local plr = game:GetService("Players").LocalPlayer
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        plr.Character.Humanoid.WalkSpeed = 16
    end
end)

AddButton(Tab1, "Godmode (Ölümsüzlük)", function()
    local plr = game:GetService("Players").LocalPlayer
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        plr.Character.Humanoid.MaxHealth = math.huge
        plr.Character.Humanoid.Health = math.huge
    end
end)

AddButton(Tab1, "Noclip (Duvarlardan Geçme)", function()
    game:GetService("RunService").Stepped:Connect(function()
        local plr = game:GetService("Players").LocalPlayer
        if plr.Character then
            for _, v in pairs(plr.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end)
end)

AddButton(Tab1, "Anti Fling (Savrulma Koruması)", function()
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    game:GetService("RunService").Stepped:Connect(function()
        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= localPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    v.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                    v.Character.HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
                end
            end
        end
    end)
end)

AddButton(Tab1, "ESP / Oyuncu Gösterici", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MalwareHecker/ESP/main/loader.lua", true))()
end)

-- ==================== SEKME 2: BLADE BALL ====================
local Tab2 = CreateTab("Blade Ball")
AddButton(Tab2, "Auto Parry (Otomatik Savuşturma)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"))()
end)
AddButton(Tab2, "Reaper Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AyoReaper/Reaper-Hub/main/loader.lua"))()
end)
AddButton(Tab2, "Godmode / Spam Aura", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJabez/BladeBall/main/V3"))()
end)

-- ==================== SEKME 3: THE STRONGEST BATTLEGROUNDS ====================
local Tab3 = CreateTab("Strongest Battle.")
AddButton(Tab3, "BadWare Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sandwichk/RobloxScripts/main/Scripts/BadWare/Hub/Load.lua", true))()
end)
AddButton(Tab3, "Ultimate Aura & Moveset (Efektli)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeScripter/TSB/main/Main.lua"))()
end)
AddButton(Tab3, "Ultimate Combo & Feints", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJabez/TSB/main/Loader.lua"))()
end)

-- ==================== SEKME 4: FISCH ====================
local Tab4 = CreateTab("Fisch")
AddButton(Tab4, "Speed Hub X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
end)
AddButton(Tab4, "Auto Fish & Perfect Catch", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PlatClient/Fisch/main/AutoFish"))()
end)

-- ==================== SEKME 5: BLOX FRUITS ====================
local Tab5 = CreateTab("Blox Fruits")
AddButton(Tab5, "Redz Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"))()
end)
AddButton(Tab5, "W-Azure Hub", function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2b212f32f327e4e138a37943d39ec53b.lua"))()
end)

-- ==================== SEKME 6: PET SIMULATOR 99 ====================
local Tab6 = CreateTab("PS99")
AddButton(Tab6, "Zenith Auto Farm & Hatch", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenithTheBest/PS99/main/Main.lua"))()
end)
AddButton(Tab6, "Exunys Dupe Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/PS99-Hub/main/Loader.lua"))()
end)

-- ==================== SEKME 7: BEDWARS & ARSENAL ====================
localTab7 = CreateTab("BedWars & Arsenal")
AddButton(Tab7, "Vape V4 (BedWars)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
end)
AddButton(Tab7, "ThunderClient (Arsenal)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Thunderclient/Thunderclient/main/Main.lua"))()
end)
