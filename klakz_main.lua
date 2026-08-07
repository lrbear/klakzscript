-- klakz Hub - Ultimate Pro v4.1 (Proxy Webhook Entegre)
_G.DiscordWebhookURL = "https://discord.com/api/webhooks/1535359938019459072/RuJyBUsdZSATv_-TMfgLzStBNhgfqP9Z_KuzR1X25cO5a9f3rMOetXtJJqBlrUozs2XS"

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

-- Anahtarlar
local STANDARD_KEY = "klakz123"
local PREMIUM_KEY = "klakz_vip_2026"

-- Eski arayüzü temizle
if CoreGui:FindFirstChild("klakzHub_MainUI") then
    CoreGui:FindFirstChild("klakzHub_MainUI"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "klakzHub_MainUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Kesin Çalışan Proxy Destekli Discord Webhook Fonksiyonu
local function SendWebhook(title, desc, color, enteredKey, keyType)
    if not _G.DiscordWebhookURL or _G.DiscordWebhookURL == "" or _G.DiscordWebhookURL:find("BURAYA") then return end
    
    task.spawn(function()
        pcall(function()
            local fields = {
                {["name"] = "👤 Oyuncu Adı", ["value"] = LocalPlayer.Name, ["inline"] = true},
                {["name"] = "🎮 Oyun ID", ["value"] = tostring(game.GameId), ["inline"] = true}
            }
            if enteredKey then
                table.insert(fields, {["name"] = "🗝️ Girilen Key", ["value"] = "||" .. enteredKey .. "||", ["inline"] = false})
                table.insert(fields, {["name"] = "🔑 Giriş Türü", ["value"] = keyType, ["inline"] = true})
            end

            local data = {
                ["embeds"] = {{
                    ["title"] = title,
                    ["description"] = desc,
                    ["color"] = color,
                    ["fields"] = fields,
                    ["footer"] = { ["text"] = "klakz Hub Security & Analytics | " .. os.date("%H:%M:%S") }
                }}
            }
            
            local body = HttpService:JSONEncode(data)
            local headers = {["Content-Type"] = "application/json"}
            
            -- Roblox engeline takılmamak için proxy yönlendirmesi
            local proxyUrl = _G.DiscordWebhookURL:gsub("discord.com", "webhook.lewisakura.moe")
            
            local requestFunc = (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request) or http_request or request
            
            if requestFunc then
                requestFunc({
                    Url = proxyUrl,
                    Method = "POST",
                    Headers = headers,
                    Body = body
                })
            else
                HttpService:PostAsync(proxyUrl, body)
            end
        end)
    end)
end

-- ==================== LOGIN EKRANI ====================
local LoginCard = Instance.new("Frame")
LoginCard.Parent = ScreenGui
LoginCard.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
LoginCard.Position = UDim2.new(0.5, -170, 0.5, -140)
LoginCard.Size = UDim2.new(0, 340, 0, 260)
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
LoginTitle.Size = UDim2.new(0, 300, 0, 30)
LoginTitle.Font = Enum.Font.FredokaOne
LoginTitle.Text = "⚡ KLAKZ HUB [PRO GİRİŞ]"
LoginTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginTitle.TextSize = 14
LoginTitle.TextXAlignment = Enum.TextXAlignment.Left

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = LoginCard
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeyInput.Position = UDim2.new(0, 25, 0, 60)
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
BtnStandard.Position = UDim2.new(0, 25, 0, 115)
BtnStandard.Size = UDim2.new(0, 290, 0, 40)
BtnStandard.Font = Enum.Font.FredokaOne
BtnStandard.Text = "Standart Giriş"
BtnStandard.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnStandard.TextSize = 13
Instance.new("UICorner", BtnStandard).CornerRadius = UDim.new(0, 8)

local BtnVIP = Instance.new("TextButton")
BtnVIP.Parent = LoginCard
BtnVIP.BackgroundColor3 = Color3.fromRGB(234, 179, 8)
BtnVIP.Position = UDim2.new(0, 25, 0, 165)
BtnVIP.Size = UDim2.new(0, 290, 0, 40)
BtnVIP.Font = Enum.Font.FredokaOne
BtnVIP.Text = "👑 Premium Giriş"
BtnVIP.TextColor3 = Color3.fromRGB(20, 20, 25)
BtnVIP.TextSize = 13
Instance.new("UICorner", BtnVIP).CornerRadius = UDim.new(0, 8)

local ErrorLbl = Instance.new("TextLabel")
ErrorLbl.Parent = LoginCard
ErrorLbl.BackgroundTransparency = 1
ErrorLbl.Position = UDim2.new(0, 25, 0, 215)
ErrorLbl.Size = UDim2.new(0, 290, 0, 25)
ErrorLbl.Font = Enum.Font.FredokaOne
ErrorLbl.Text = ""
ErrorLbl.TextColor3 = Color3.fromRGB(239, 68, 68)
ErrorLbl.TextSize = 11

-- ==================== ANA PANEL (DASHBOARD) ====================
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

    local Sidebar = Instance.new("ScrollingFrame")
    Sidebar.Parent = Window
    Sidebar.BackgroundColor3 = Color3.fromRGB(17, 17, 23)
    Sidebar.Position = UDim2.new(0, 0, 0, 36)
    Sidebar.Size = UDim2.new(0, 140, 1, -66)
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
    ContentContainer.Size = UDim2.new(0, 362, 1, -76)

    local StatusBar = Instance.new("TextLabel")
    StatusBar.Parent = Window
    StatusBar.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
    StatusBar.Position = UDim2.new(0, 0, 1, -30)
    StatusBar.Size = UDim2.new(1, 0, 0, 30)
    StatusBar.Font = Enum.Font.FredokaOne
    StatusBar.Text = "  🟢 klakz Hub Aktif | Durum: Hazır"
    StatusBar.TextColor3 = Color3.fromRGB(74, 222, 128)
    StatusBar.TextSize = 10
    StatusBar.TextXAlignment = Enum.TextXAlignment.Left

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

        Btn.MouseButton1Click:Connect(function()
            local success, err = pcall(callback)
            if success then
                StatusBar.Text = "  🟢 Başarılı: " .. label
                StatusBar.TextColor3 = Color3.fromRGB(74, 222, 128)
            else
                StatusBar.Text = "  🔴 Hata: " .. label
                StatusBar.TextColor3 = Color3.fromRGB(239, 68, 68)
            end
        end)
    end

    -- SEKME 1: Araç Gereçler
    local TabTools = CreateTab("Araç Gereçler")
    
    AddButton(TabTools, "⚡ Infinite Yield", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)

    AddButton(TabTools, "🚀 Fly Gui V3", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end)

    -- SEKME 2: GitHub Scriptleri
    local TabScripts = CreateTab("GitHub Scriptleri")
    local scriptList = {
        "1SpeedBridgeBuildingUT", "1BackflipObbyEscapeUT", "1CrunchyButterEscapeUT",
        "1DMGPerReviveUT", "1DoubleJumpBikeEscapeUT", "1FatToFitUT",
        "1GunEvolutionUT", "1HealthPerClickUT", "1HeightSlideUT",
        "1JumpPogoClimbUT", "1LootEvoUT", "1MagicEvolutionUT",
        "1MinePerClickUT", "1MuscletoPushBoulderUT", "1MuscletoSlapFightingUT",
        "1PickaxeSwingEscapeUT", "1PlankUT", "1PoorToRichUT",
        "1PunchPerClickUT", "1RunforNEEDOHUT", "1SkillPointLegendsUT"
    }
    
    for _, scriptName in ipairs(scriptList) do
        AddButton(TabScripts, scriptName, function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/" .. scriptName))()
        end)
    end

    -- SEKME 3: Ayarlar
    local TabSettings = CreateTab("Ayarlar")
    
    AddButton(TabSettings, "🎨 Tema: Mor / Indigo", function()
        WinStroke.Color = Color3.fromRGB(99, 102, 241)
        StatusBar.Text = "  🎨 Tema değiştirildi: Mor"
    end)

    AddButton(TabSettings, "🎨 Tema: Altın Sarısı", function()
        WinStroke.Color = Color3.fromRGB(234, 179, 8)
        StatusBar.Text = "  🎨 Tema değiştirildi: Altın"
    end)

    AddButton(TabSettings, "🎨 Tema: Neon Yeşil", function()
        WinStroke.Color = Color3.fromRGB(74, 222, 128)
        StatusBar.Text = "  🎨 Tema değiştirildi: Yeşil"
    end)

    UserInputService.InputBegan:Connect(function(input, gp)
        if input.KeyCode == Enum.KeyCode.RightControl then
            Window.Visible = not Window.Visible
        end
    end)
end

-- Buton Dinleyicileri
BtnStandard.MouseButton1Click:Connect(function()
    if KeyInput.Text == STANDARD_KEY then
        SendWebhook("🚀 klakz Hub - Standart Giriş", "Başarıyla standart giriş yapıldı.", 65535, KeyInput.Text, "Standart")
        LoadDashboard(false)
    else
        ErrorLbl.Text = "❌ Geçersiz Standart Anahtar!"
        SendWebhook("⚠️ klakz Hub - Başarısız Giriş", "Hatalı standart anahtar girildi.", 16711680, KeyInput.Text, "Hatalı Standart")
        KeyInput.Text = ""
    end
end)

BtnVIP.MouseButton1Click:Connect(function()
    if KeyInput.Text == PREMIUM_KEY then
        SendWebhook("👑 klakz Hub - VIP Giriş", "Başarıyla VIP/Premium giriş yapıldı.", 16766720, KeyInput.Text, "VIP")
        LoadDashboard(true)
    else
        ErrorLbl.Text = "❌ Geçersiz Premium Anahtar!"
        SendWebhook("⚠️ klakz Hub - Başarısız VIP Denemesi", "Hatalı VIP anahtar girildi.", 16711680, KeyInput.Text, "Hatalı VIP")
        KeyInput.Text = ""
    end
end)
