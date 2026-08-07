-- klakz Hub - Temiz ve Kesin Çözüm V3.1
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Eskisini temizle
if CoreGui:FindFirstChild("klakzHub_MainUI") then
    CoreGui:FindFirstChild("klakzHub_MainUI"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "klakzHub_MainUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Ana Pencere
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
WinStroke.Color = Color3.fromRGB(99, 102, 241)
WinStroke.Thickness = 1.5
WinStroke.Parent = Window

-- Üst Bar
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
TitleLabel.Text = "klakz Hub [Tam Sürüm Aktif]"
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 250)
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

-- Sol Sekme Alanı
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

-- Sağ İçerik Alanı
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

local function AddButton(parent, label, callback)
    if not parent then return end
    local Btn = Instance.new("TextButton")
    Btn.Parent = parent
    Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    Btn.Size = UDim2.new(1, -8, 0, 34)
    Btn.Font = Enum.Font.FredokaOne
    Btn.Text = "    " .. label
    Btn.TextColor3 = Color3.fromRGB(235, 235, 245)
    Btn.TextSize = 11
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

    Btn.MouseButton1Click:Connect(callback)
end

-- Sekme 1: Araçlar
local TabTools = CreateTab("Ana Araçlar")
AddButton(TabTools, "⚡ Infinite Yield Aç", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
end)
AddButton(TabTools, "🚀 Fly Gui Aç", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))() end)
end)

-- Sekme 2: Bilgi
local TabInfo = CreateTab("Bilgi / Destek")
local InfoLbl = Instance.new("TextLabel")
InfoLbl.Parent = TabInfo
InfoLbl.BackgroundTransparency = 1
InfoLbl.Size = UDim2.new(1, -8, 0, 60)
InfoLbl.Font = Enum.Font.FredokaOne
InfoLbl.Text = "klakz Hub başarıyla yüklendi!\nSürüm: v3.1 Pro\nDurum: Sorunsuz Çalışıyor."
InfoLbl.TextColor3 = Color3.fromRGB(34, 197, 94)
InfoLbl.TextSize = 12
InfoLbl.TextXAlignment = Enum.TextXAlignment.Left

-- Tuş Kısayolu (Sağ Ctrl ile gizle/göster)
UserInputService.InputBegan:Connect(function(input, gp)
    if input.KeyCode == Enum.KeyCode.RightControl then
        Window.Visible = not Window.Visible
    end
end)
