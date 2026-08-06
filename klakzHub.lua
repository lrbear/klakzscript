-- klakz Hub - Seki UI (Optimize Edilmiş ve Geliştirilmiş Sürüm)

if game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI") then
    game:GetService("CoreGui"):FindFirstChild("klakzHub_MainUI"):Destroy()
end

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "klakzHub_MainUI"
ScreenGui.Parent = CoreGui
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
        headerVip = "klakz Hub [👑 PREMIUM SEKI UI]"
    },
    EN = {
        loginTitle = "KLAKZ HUB LOGIN",
        placeholder = "Enter your key...",
        stdBtn = "Standard Login",
        vipBtn = "👑 Premium Login",
        errKey = "❌ Invalid Key!",
        errVipKey = "❌ Invalid Premium Key!",
        headerStd = "klakz Hub [Standard Edition]",
        headerVip = "klakz Hub [👑 PREMIUM SEKI UI]"
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

-- ==================== 2. SEKI UI PANELİ ====================
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

    -- Üst Başlık Çubuğu
    local TopBar = Instance.new("Frame")
    TopBar.Parent = Window
    TopBar.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    TopBar.Size = UDim2.new(1, 0, 0, 36)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

    local FixBar = Instance.new("Frame")
    FixBar.Parent = TopBar
    FixBar.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    FixBar.Position = UDim2.new(0, 0, 1, -5)
    FixBar.Size = UDim2.new(1, 0, 0, 5)
    FixBar.BorderSizePixel = 0

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = TopBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 15, 0, 0)
    TitleLabel.Size = UDim2.new(0, 350, 1, 0)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = isVIP and texts[currentLang].headerVip or texts[currentLang].headerStd
    TitleLabel.TextColor3 = isVIP and Color3.fromRGB(234, 179, 8) or Color3.fromRGB(240, 240, 250)
    TitleLabel.TextSize = 11
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = TopBar
    CloseBtn.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    CloseBtn.Position = UDim2.new(1, -32, 0, 6)
    CloseBtn.Size = UDim2.new(0, 24, 0, 24)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 10
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    -- Sol Sekme Listesi (Sidebar)
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
        TabButton.Font = Enum.Font.GothamMedium
        TabButton.Text = name
        TabButton.TextColor3 = Color3.fromRGB(180, 180, 200)
        TabButton.TextSize = 10
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

    local function AddScript(parent, label, url, customCall)
        if not parent then return end
        local ScriptBtn = Instance.new("TextButton")
        ScriptBtn.Parent = parent
        ScriptBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
        ScriptBtn.Size = UDim2.new(1, -8, 0, 34)
        ScriptBtn.Font = Enum.Font.Gotham
        ScriptBtn.Text = "   " .. label
        ScriptBtn.TextColor3 = Color3.fromRGB(235, 235, 245)
        ScriptBtn.TextSize = 10
        ScriptBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", ScriptBtn).CornerRadius = UDim.new(0, 6)

        ScriptBtn.MouseButton1Click:Connect(function()
            pcall(function()
                if customCall == 1 then
                    loadstring(game:HttpGet(url))("")
                elseif customCall == 2 then
                    loadstring(game:HttpGet(url))
                else
                    loadstring(game:HttpGet(url))()
                end
            end)
        end)
    end

    local function AddDirectCode(parent, label, codeFunc)
        if not parent then return end
        local ScriptBtn = Instance.new("TextButton")
        ScriptBtn.Parent = parent
        ScriptBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
        ScriptBtn.Size = UDim2.new(1, -8, 0, 34)
        ScriptBtn.Font = Enum.Font.Gotham
        ScriptBtn.Text = "   " .. label
        ScriptBtn.TextColor3 = Color3.fromRGB(235, 235, 245)
        ScriptBtn.TextSize = 10
        ScriptBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", ScriptBtn).CornerRadius = UDim.new(0, 6)

        ScriptBtn.MouseButton1Click:Connect(function()
            pcall(codeFunc)
        end)
    end

    -- SEKME 1: Araç Gereçler
    local TabTools = CreateTab("Araç Gereçler")
    AddScript(TabTools, "⚡ Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", 0)
    AddScript(TabTools, "🚀 Fly Gui V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt", 0)
    
    -- Fly V4
    AddDirectCode(TabTools, "✈️ Fly Hack v4.0", function()
        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")
        local RootPart = Character:WaitForChild("HumanoidRootPart")
        
        local UserInputService = game:GetService("UserInputService")
        local RunService = game:GetService("RunService")

        local FlyScreenGui = Instance.new("ScreenGui")
        if gethui then
            FlyScreenGui.Parent = gethui()
        elseif syn and syn.protect_gui then
            syn.protect_gui(FlyScreenGui)
            FlyScreenGui.Parent = CoreGui
        else
            FlyScreenGui.Parent = CoreGui
        end

        local Frame = Instance.new("Frame")
        local Title = Instance.new("TextLabel")
        local FlyButton = Instance.new("TextButton")
        local SpeedLabel = Instance.new("TextLabel")
        local SpeedBox = Instance.new("TextBox")
        local CloseButton = Instance.new("TextButton")

        FlyScreenGui.Name = "FlyGUI"
        FlyScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        Frame.Parent = FlyScreenGui
        Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        Frame.BorderColor3 = Color3.fromRGB(60, 60, 60)
        Frame.BorderSizePixel = 2
        Frame.Position = UDim2.new(0.75, 0, 0.3, 0)
        Frame.Size = UDim2.new(0, 220, 0, 200)
        Frame.Active = true
        Frame.Draggable = true

        Title.Parent = Frame
        Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        Title.Size = UDim2.new(1, 0, 0, 35)
        Title.Font = Enum.Font.GothamBold
        Title.Text = "✈️ Fly Hack v4.0"
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 18

        FlyButton.Parent = Frame
        FlyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        FlyButton.Position = UDim2.new(0.1, 0, 0.25, 0)
        FlyButton.Size = UDim2.new(0.8, 0, 0, 45)
        FlyButton.Font = Enum.Font.GothamBold
        FlyButton.Text = "🔄 TOGGLE FLY (X)"
        FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        FlyButton.TextSize = 16

        SpeedLabel.Parent = Frame
        SpeedLabel.BackgroundTransparency = 1
        SpeedLabel.Position = UDim2.new(0.1, 0, 0.55, 0)
        SpeedLabel.Size = UDim2.new(0.8, 0, 0, 20)
        SpeedLabel.Font = Enum.Font.Gotham
        SpeedLabel.Text = "🚀 Speed:"
        SpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        SpeedLabel.TextSize = 14
        SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left

        SpeedBox.Parent = Frame
        SpeedBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        SpeedBox.BorderColor3 = Color3.fromRGB(80, 80, 80)
        SpeedBox.Position = UDim2.new(0.1, 0, 0.7, 0)
        SpeedBox.Size = UDim2.new(0.8, 0, 0, 30)
        SpeedBox.Font = Enum.Font.Gotham
        SpeedBox.PlaceholderText = "Default: 50"
        SpeedBox.Text = "50"
        SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        SpeedBox.TextSize = 14

        CloseButton.Parent = Frame
        CloseButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
        CloseButton.Position = UDim2.new(0.85, 0, 0.02, 0)
        CloseButton.Size = UDim2.new(0, 25, 0, 25)
        CloseButton.Font = Enum.Font.GothamBold
        CloseButton.Text = "×"
        CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        CloseButton.TextSize = 18

        local Flying = false
        local FlySpeed = 50
        local BV, BG

        local function StartFlying()
            if Flying or not RootPart then return end
            Flying = true
            FlyButton.BackgroundColor3 = Color3.fromRGB(30, 150, 30)
            FlyButton.Text = "✅ FLYING (X)"

            local newSpeed = tonumber(SpeedBox.Text)
            if newSpeed and newSpeed > 0 and newSpeed <= 1000 then
                FlySpeed = newSpeed
            else
                FlySpeed = 50
                SpeedBox.Text = "50"
            end

            Humanoid.PlatformStand = true

            BV = Instance.new("BodyVelocity")
            BV.Name = "FlyBV"
            BV.MaxForce = Vector3.new(40000, 40000, 40000)
            BV.Velocity = Vector3.new(0, 0, 0)
            BV.Parent = RootPart

            BG = Instance.new("BodyGyro")
            BG.Name = "FlyBG"
            BG.MaxTorque = Vector3.new(40000, 40000, 40000)
            BG.P = 10000
            BG.D = 1000
            BG.CFrame = RootPart.CFrame
            BG.Parent = RootPart

            local connection
            connection = RunService.Heartbeat:Connect(function()
                if not Flying or not BV or not BG or not RootPart then
                    connection:Disconnect()
                    return
                end

                local camera = workspace.CurrentCamera
                local moveDir = Vector3.new(0, 0, 0)

                if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0, 1, 0) end

                if moveDir.Magnitude > 0 then
                    moveDir = moveDir.Unit * FlySpeed
                end

                BV.Velocity = Vector3.new(moveDir.X, moveDir.Y, moveDir.Z)
                BG.CFrame = camera.CFrame
            end)
        end

        local function StopFlying()
            if not Flying then return end
            Flying = false
            FlyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            FlyButton.Text = "🔄 TOGGLE FLY (X)"

            if BV then BV:Destroy() BV = nil end
            if BG then BG:Destroy() BG = nil end
            if Humanoid then Humanoid.PlatformStand = false end
        end

        local function ToggleFly()
            if Flying then StopFlying() else StartFlying() end
        end

        FlyButton.MouseButton1Click:Connect(ToggleFly)
        CloseButton.MouseButton1Click:Connect(function()
            StopFlying()
            FlyScreenGui:Destroy()
        end)

        UserInputService.InputBegan:Connect(function(input, processed)
            if not processed and input.KeyCode == Enum.KeyCode.X then
                ToggleFly()
            end
        end)

        Humanoid.Died:Connect(function() StopFlying() end)
    end)

    -- Square Cheat GUI Hub
    AddDirectCode(TabTools, "🔲 Square Cheat GUI Hub", function()
        local TweenService = game:GetService("TweenService")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local Lighting = game:GetService("Lighting")
        local Mouse = LocalPlayer:GetMouse()
        local Camera = workspace.CurrentCamera

        local toggles = {noclip = false, god = false, invisible = false, fullbright = false, infjump = false, nofall = false, esp = false}
        local connections = {}
        local flyEnabled = false
        local flySpeed = 50
        local flyBG, flyBV
        local espHighlights = {}
        local humanoid, rootPart

        local function cleanup()
            for _, conn in pairs(connections) do if conn then conn:Disconnect() end end
            connections = {}
            toggles = {noclip = false, god = false, invisible = false, fullbright = false, infjump = false, nofall = false, esp = false}
            flyEnabled = false
            if flyBG then flyBG:Destroy() end
            if flyBV then flyBV:Destroy() end
            flyBG, flyBV = nil, nil
            for _, hl in pairs(espHighlights) do hl:Destroy() end
            espHighlights = {}
            if humanoid then
                humanoid.WalkSpeed = 16
                humanoid.JumpPower = 50
                humanoid.PlatformStand = false
            end
        end

        LocalPlayer.CharacterAdded:Connect(function()
            task.wait(1)
            humanoid = LocalPlayer.Character:WaitForChild("Humanoid")
            rootPart = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
            cleanup()
        end)

        if LocalPlayer.Character then
            humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        end

        local function setWalkSpeed(speed) if humanoid then humanoid.WalkSpeed = speed end end
        local function setJumpPower(jp) if humanoid then humanoid.JumpPower = jp end end
        
        local function toggleNoclip()
            toggles.noclip = not toggles.noclip
            if toggles.noclip then
                connections.noclip = RunService.Stepped:Connect(function()
                    if LocalPlayer.Character then
                        for _, part in LocalPlayer.Character:GetDescendants() do
                            if part:IsA("BasePart") then part.CanCollide = false end
                        end
                    end
                end)
            else
                if connections.noclip then connections.noclip:Disconnect() end
            end
        end

        local function toggleGod()
            toggles.god = not toggles.god
            if humanoid and toggles.god then
                humanoid.MaxHealth = math.huge
                humanoid.Health = math.huge
                connections.god = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
                    humanoid.Health = math.huge
                end)
            end
        end

        local function toggleInvisible()
            toggles.invisible = not toggles.invisible
            if LocalPlayer.Character then
                for _, part in LocalPlayer.Character:GetDescendants() do
                    if part:IsA("BasePart") or part:IsA("MeshPart") then
                        part.LocalTransparencyModifier = toggles.invisible and 1 or 0
                    end
                end
            end
        end

        local function toggleFullbright()
            toggles.fullbright = not toggles.fullbright
            Lighting.Brightness = toggles.fullbright and 2 or 1
            Lighting.GlobalShadows = not toggles.fullbright
            Lighting.FogEnd = 100000
        end

        local function toggleInfJump()
            toggles.infjump = not toggles.infjump
            if toggles.infjump and humanoid then
                connections.infjump = UserInputService.JumpRequest:Connect(function()
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end)
            end
        end

        local function toggleNoFall()
            toggles.nofall = not toggles.nofall
            if toggles.nofall then
                connections.nofall = RunService.Stepped:Connect(function()
                    if rootPart and rootPart.AssemblyLinearVelocity.Y < -50 then
                        rootPart.AssemblyLinearVelocity = Vector3.new(rootPart.AssemblyLinearVelocity.X, 0, rootPart.AssemblyLinearVelocity.Z)
                    end
                end)
            end
        end

        local function toggleESP()
            toggles.esp = not toggles.esp
            if toggles.esp then
                for _, plr in Players:GetPlayers() do
                    if plr ~= LocalPlayer and plr.Character then
                        local hl = Instance.new("Highlight")
                        hl.Adornee = plr.Character
                        hl.FillColor = Color3.new(1,0,0)
                        hl.OutlineColor = Color3.new(1,1,0)
                        hl.FillTransparency = 0.5
                        hl.Parent = plr.Character
                        espHighlights[plr] = hl
                    end
                end
            else
                for _, hl in pairs(espHighlights) do hl:Destroy() end
                espHighlights = {}
            end
        end

        local function flingSelf(strength)
            if rootPart then
                rootPart.AssemblyLinearVelocity = Vector3.new(math.random(-strength, strength), strength * 2, math.random(-strength, strength))
            end
        end

        local function tpMouse()
            if rootPart and Mouse.Hit then rootPart.CFrame = Mouse.Hit + Vector3.new(0, 5, 0) end
        end

        local function tpSpawn()
            if LocalPlayer.Character then LocalPlayer.Character:PivotTo(workspace:FindFirstChild("SpawnLocation") or CFrame.new(0,50,0)) end
        end

        local function tpRandomPlayer()
            local others = {}
            for _, plr in Players:GetPlayers() do if plr ~= LocalPlayer and plr.Character then table.insert(others, plr) end end
            if #others > 0 then
                local target = others[math.random(1, #others)]
                if target.Character.PrimaryPart then rootPart.CFrame = target.Character.PrimaryPart.CFrame * CFrame.new(0,0,-5) end
            end
        end

        local function updateFly()
            if not flyEnabled or not rootPart or not humanoid then return end
            flyBG.CFrame = Camera.CFrame
            local camLook = Camera.CFrame.LookVector
            local camRight = Camera.CFrame.RightVector
            local moveVector = Vector3.new(0,0,0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVector = moveVector + camLook end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVector = moveVector - camLook end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVector = moveVector - camRight end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVector = moveVector + camRight end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveVector = moveVector + Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveVector = moveVector - Vector3.new(0,1,0) end
            flyBV.Velocity = (moveVector.Unit * flySpeed) * 16
        end

        local function enableFly(speed)
            flyEnabled = true
            flySpeed = speed or 50
            humanoid.PlatformStand = true
            flyBG = Instance.new("BodyGyro")
            flyBG.MaxTorque = Vector3.new(4000, 4000, 4000)
            flyBG.P = 2000
            flyBG.Parent = rootPart
            flyBV = Instance.new("BodyVelocity")
            flyBV.MaxForce = Vector3.new(4000, 4000, 4000)
            flyBV.Velocity = Vector3.new()
            flyBV.Parent = rootPart
            connections.fly = RunService.RenderStepped:Connect(updateFly)
        end

        local function disableFly()
            flyEnabled = false
            humanoid.PlatformStand = false
            if flyBG then flyBG:Destroy() end
            if flyBV then flyBV:Destroy() end
        end

        local SquareScreenGui = Instance.new("ScreenGui")
        SquareScreenGui.Name = "SquareCheatGUI"
        SquareScreenGui.ResetOnSpawn = false
        SquareScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

        local MainFrame = Instance.new("Frame")
        MainFrame.Size = UDim2.new(0, 600, 0, 600)
        MainFrame.Position = UDim2.new(0.5, -300, 0.5, -300)
        MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        MainFrame.BorderSizePixel = 0
        MainFrame.Active = true
        MainFrame.Draggable = true
        MainFrame.Parent = SquareScreenGui

        local FrameCorner = Instance.new("UICorner")
        FrameCorner.CornerRadius = UDim.new(0, 16)
        FrameCorner.Parent = MainFrame

        local TitleLabel = Instance.new("TextLabel")
        TitleLabel.Size = UDim2.new(1, 0, 0, 40)
        TitleLabel.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        TitleLabel.Text = "🔲 SQUARE CHEAT GUI (121+ Commands) - Mobile 🔲"
        TitleLabel.TextColor3 = Color3.new(1,1,1)
        TitleLabel.Font = Enum.Font.GothamBold
        TitleLabel.TextSize = 16
        TitleLabel.Parent = MainFrame

        local TitleCorner = Instance.new("UICorner")
        TitleCorner.CornerRadius = UDim.new(0, 16)
        TitleCorner.Parent = TitleLabel

        local GridLayout = Instance.new("UIGridLayout")
        GridLayout.CellSize = UDim2.new(0, 50, 0, 50)
        GridLayout.CellPadding = UDim2.new(0, 3, 0, 3)
        GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
        GridLayout.Parent = MainFrame

        local function createSquareButton(text, func)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, 0, 1, 0)
            Button.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
            Button.Text = text
            Button.TextColor3 = Color3.new(1,1,1)
            Button.Font = Enum.Font.Gotham
            Button.TextSize = 10
            Button.TextWrapped = true
            Button.Parent = MainFrame

            local BtnCorner = Instance.new("UICorner")
            BtnCorner.CornerRadius = UDim.new(0, 10)
            BtnCorner.Parent = Button

            Button.MouseButton1Click:Connect(func)
            Button.MouseEnter:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 80)}):Play()
            end)
            Button.MouseLeave:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 60)}):Play()
            end)
            return Button
        end

        for i = 1, 30 do
            local speed = 16 * i
            createSquareButton("Spd\n" .. speed, function() setWalkSpeed(speed) end)
        end
        for i = 1, 20 do
            local jp = 50 * i
            createSquareButton("Jmp\n" .. jp, function() setJumpPower(jp) end)
        end
        for i = 1, 15 do
            local fs = 25 * i
            createSquareButton("Fly\n" .. fs, function() enableFly(fs) end)
        end
        for i = 1, 10 do
            local f = 50 * i
            createSquareButton("Flg\n" .. f, function() flingSelf(f) end)
        end

        createSquareButton("Noclip", toggleNoclip)
        createSquareButton("God", toggleGod)
        createSquareButton("Invis", toggleInvisible)
        createSquareButton("Fullbrt", toggleFullbright)
        createSquareButton("InfJmp", toggleInfJump)
        createSquareButton("NoFall", toggleNoFall)
        createSquareButton("ESP", toggleESP)
        createSquareButton("No Fly", disableFly)
        createSquareButton("Reset", cleanup)
        createSquareButton("TP Mse", tpMouse)
        createSquareButton("TP Spwn", tpSpawn)
        createSquareButton("TP Rnd", tpRandomPlayer)
        createSquareButton("Spd x2", function() setWalkSpeed(humanoid.WalkSpeed * 2) end)
        createSquareButton("Jmp x2", function() setJumpPower(humanoid.JumpPower * 2) end)
        createSquareButton("Flg All", function() for _,p in Players:GetPlayers() do if p.Character and p~=LocalPlayer then p.Character.HumanoidRootPart.AssemblyLinearVelocity=Vector3.new(math.random(-200,200),500,math.random(-200,200)) end end end)
        createSquareButton("Clr ESP", function() toggleESP() end)
        createSquareButton("Dark", function() Lighting.Brightness=0 end)
        createSquareButton("Bright", function() Lighting.Brightness=5 end)
        createSquareButton("Mute", function() for _,s in Lighting:GetChildren() do if s:IsA("Sound") then s.Volume=0 end end end)

        for i=1,10 do
            createSquareButton("TP R" .. i, function()
                if rootPart then rootPart.CFrame = rootPart.CFrame + Vector3.new(math.random(-50,50),0,math.random(-50,50)) end
            end)
        end

        createSquareButton("No Fog", function() Lighting.FogEnd=math.huge end)
        createSquareButton("Shd Off", function() Lighting.GlobalShadows=false end)
        createSquareButton("No Team", function() for _,plr in Players:GetPlayers() do plr.TeamColor=BrickColor.new("White") end end)
        createSquareButton("Big Hd", function() if LocalPlayer.Character.Head then LocalPlayer.Character.Head.Size=Vector3.new(3,3,3) end end)
        createSquareButton("Sml Bdy", function() for _,p in LocalPlayer.Character:GetChildren() do if p:IsA("BasePart") and p.Name~="Head" then p.Size=p.Size*0.5 end end end)
        createSquareButton("Rainbow", function() connections.rainbow=RunService.Heartbeat:Connect(function() if rootPart then rootPart.Color=Color3.fromHSV(tick()%6/6,1,1) end end) end)
        createSquareButton("No Rnbw", function() if connections.rainbow then connections.rainbow:Disconnect() end end)
        createSquareButton("Frz Tm", function() Lighting.ClockTime=12 end)
        createSquareButton("Night", function() Lighting.ClockTime=0 end)
        createSquareButton("Day", function() Lighting.ClockTime=12 end)

        createSquareButton("Jmp 0", function() setJumpPower(0) end)
        createSquareButton("Spd 0", function() setWalkSpeed(0) end)
        createSquareButton("Unfly", disableFly)
        createSquareButton("Unclip", toggleNoclip)
        createSquareButton("Ungod", toggleGod)
        createSquareButton("Rejoin", function() game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer) end)
        createSquareButton("SrvHop", function()
            local success, res = pcall(function()
                return game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
            end)
            if success and res and res.data then
                for _, v in ipairs(res.data) do
                    if v.playing < v.maxPlayers and v.id ~= game.JobId then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
                        return
                    end
                end
            end
        end)

        TweenService:Create(MainFrame, TweenInfo.new(0.8, Enum.EasingStyle.Back), {
            Position = UDim2.new(0.5, -300, 0.5, -300)}):Play()
    end)

    AddScript(TabTools, "👁️ ESP Viewer", "https://raw.githubusercontent.com/GamingScripter/ESP-Viewer/main/ESP-Viewer.lua", 0)
    AddScript(TabTools, "🛠️ Ekstra Araç Hub", "https://api.luarmor.net/files/v4/loaders/a29177a0adbed682fcef60d92cc0f805.lua", 0)

    -- SEKME 2: Oyun Scriptleri
    local TabGames = CreateTab("Oyun Scriptleri")
    AddScript(TabGames, "🪵 Lumber Tycoon 2", "https://raw.githubusercontent.com/DevKron/Kron_Hub/refs/heads/main/version_1.0", 1)
    AddScript(TabGames, "💵 Counterfeit Tycoon", "https://raw.githubusercontent.com/generoushyena22/main/cft/script", 0)
    AddScript(TabGames, "⚡ Legends Of Speed", "https://pastebin.com/raw/zYLE0nF7", 0)
    AddScript(TabGames, "🎯 Throw a Coin", "https://api.luarmor.net/files/v4/loaders/51cbd56dd6497ff5298f046bffa93689.lua", 0)
    AddScript(TabGames, "🔥 Oyun Scripti 1", "https://relzhub.com/loader", 0)
    AddScript(TabGames, "🔥 Oyun Scripti 3", "https://pastefy.app/qEzptRNH/raw", 0)
    AddScript(TabGames, "🔥 Oyun Scripti 4", "https://pastebin.com/raw/wSuhUFTr", 2)
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
