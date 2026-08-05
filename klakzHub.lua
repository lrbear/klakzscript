-- klakz Hub - Tam ve Güncel Script Arşivi

local DOGRU_KEY = "klakz123" -- Buradan şifreni değiştirebilirsin

-- Ana Ekran (GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "klakz_Hub_Main"

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

-- ==================== ANA MENÜ YÜKLEYİCİSİ ====================
local function ArayuzuBaslat()
    local DiscordLib = loadstring(game:HttpGet("https://gitlab.com/HileciBabaYT/hbest/-/raw/main/hbscripthubui"))()

    local win = DiscordLib:Window("klakz Hub - Oyun Kontrollü")
    DiscordLib:Notification("Bildirim", "Oyun algılandı, sadece bu oyuna ait menüler yüklendi!", "Tamam")

    local serv = win:Server("Aktif Oyun Menüsü", "")

    -- ==================== OYUN KONTROL MERKEZİ ====================
    -- Sürekli her yerde çalışan genel araçlar (Fly, Admin vb.)
    local globalChannel = serv:Channel("Genel Araçlar")
    globalChannel:Button("Güvenli Fly (Uçma)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end)
    globalChannel:Button("Infinite Yield (Admin Komutları)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)

    -- SADECE BULUNDUĞUN OYUNA AİT SCRIPT KODLARI ÇALIŞIR
    if game.PlaceId == 12177325772 then
        -- Super League Soccer
        local btns = serv:Channel("Super League Soccer")
        btns:Button("Super League Soccer Scripti", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/SuperLeagueSoccer"))()
        end)

    elseif game.PlaceId == 13772394625 then
        -- Blade Ball
        local btns = serv:Channel("Blade Ball Özel")
        btns:Button("Auto Parry (Blade Ball)", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"))()
        end)
        btns:Button("Reaper Hub (Blade Ball)", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AyoReaper/Reaper-Hub/main/loader.lua"))()
        end)

    elseif game.PlaceId == 10449761463 then
        -- The Strongest Battlegrounds
        local btns = serv:Channel("Strongest Battlegrounds")
        btns:Button("BadWare Hub", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sandwichk/RobloxScripts/main/Scripts/BadWare/Hub/Load.lua", true))()
        end)

    elseif game.PlaceId == 16732694052 then
        -- Fisch
        local btns = serv:Channel("Fisch Özel")
        btns:Button("Speed Hub X (Fisch)", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
        end)

    elseif game.PlaceId == 13651239634 then
        -- Blocks n' Props
        local btns = serv:Channel("Blocks n' Props Özel")
        btns:Button("Exordum (Blocks n' Props)", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Booger-Aids-V2/Exordum/refs/heads/main/Blocks%20n'%20Props"))()
        end)

    elseif game.PlaceId == 112731528776884 or game.PlaceId == 120700541929930 then
        -- Knife Duels (Alternatif PlaceId'ler dahil)
        local btns = serv:Channel("Knife Duels Özel")
        btns:Button("Knife Duels Script 1", function()
            loadstring(game:HttpGet("https://pastefy.app/iizD2kA3/raw"))()
        end)

    else
        -- Hangi oyun olduğu listede yoksa sadece uyarı kanalı gösterir
        local uyari = serv:Channel("Durum")
        uyari:Label("Bu oyun için özel hile yok.")
        uyari:Label("Sadece 'Genel Araçlar' kullanılabilir.")
    end
end

-- ==================== KEY KONTROLÜ ====================
LoginBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == DOGRU_KEY then
        KeyFrame:Destroy()
        ArayuzuBaslat()
    else
        LoginBtn.Text = "Yanlış Key!"
        LoginBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
        task.wait(1.5)
        LoginBtn.Text = "Giriş Yap"
        LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    end
end)
