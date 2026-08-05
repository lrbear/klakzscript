-- klakz Hub - Key Sistemli

-- Kendi belirleyeceğin şifreyi buraya yaz:
local DOGRU_KEY = "klakz123" 

-- Ana Ekran (GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "klakz_Hub_KeySystem"

-- ==================== KEY PENCERESİ ====================
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = ScreenGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
KeyFrame.Size = UDim2.new(0, 250, 0, 150)
KeyFrame.Active = true
KeyFrame.Draggable = true

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Parent = KeyFrame
KeyTitle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyTitle.Size = UDim2.new(0, 250, 0, 35)
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.Text = "klakz Hub - Key Sistemi"
KeyTitle.TextColor3 = Color3.fromRGB(0, 255, 128)
KeyTitle.TextSize = 18

local TextBox = Instance.new("TextBox")
TextBox.Parent = KeyFrame
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.Position = UDim2.new(0, 25, 0, 50)
TextBox.Size = UDim2.new(0, 200, 0, 35)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Key'i buraya gir..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 16

local LoginBtn = Instance.new("TextButton")
LoginBtn.Parent = KeyFrame
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
LoginBtn.Position = UDim2.new(0, 25, 0, 100)
LoginBtn.Size = UDim2.new(0, 200, 0, 35)
LoginBtn.Font = Enum.Font.SourceSansBold
LoginBtn.Text = "Giriş Yap"
LoginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginBtn.TextSize = 16

-- ==================== ANA MENÜ (Gizli Başlar) ====================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
MainFrame.Size = UDim2.new(0, 300, 0, 350)
MainFrame.Visible = false -- Key girilene kadar görünmez
MainFrame.Active = true
MainFrame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.Size = UDim2.new(0, 300, 0, 40)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "klakz Hub"
Title.TextColor3 = Color3.fromRGB(0, 255, 128)
Title.TextSize = 22

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 45)
ScrollingFrame.Size = UDim2.new(0, 300, 0, 300)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- Buton Ekleme Fonksiyonu
local function AddButton(name, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = ScrollingFrame
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Button.Size = UDim2.new(0, 280, 0, 35)
    Button.Font = Enum.Font.SourceSansBold
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 16
    
    Button.MouseButton1Click:Connect(callback)
end

-- ==================== KEY KONTROLÜ ====================
LoginBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == DOGRU_KEY then
        KeyFrame:Destroy() -- Key penceresini kapat
        MainFrame.Visible = true -- Ana menüyü aç
    else
        LoginBtn.Text = "Yanlış Key!"
        LoginBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
        task.wait(1.5)
        LoginBtn.Text = "Giriş Yap"
        LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    end
end)

-- ==================== SCRIPT LİSTESİ ====================
AddButton("Örnek Oyun / Özellik 1", function()
    print("klakz Hub çalıştı!")
end)
