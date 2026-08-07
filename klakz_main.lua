-- klakz Hub - Modular Core System

if game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI") then
    game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI"):Destroy()
end

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
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

-- Giriş Başarılı Olduğunda Paneli Yükleme
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

    -- Klavye Tuş Dinleyicisi
    UserInputService.InputBegan:Connect(function(input, gp)
        if input.KeyCode == toggleKey then
            Window.Visible = not Window.Visible
        end
    end)

    ShowNotification("Sistem başarıyla yüklendi! (/klakz yazabilirsin)", Color3.fromRGB(34, 197, 94))
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
