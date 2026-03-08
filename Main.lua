-- RIZY V70.0: THE ULTIMATE VIP EDITION
local p = game.Players.LocalPlayer
local pGui = p:WaitForChild("PlayerGui")

local ValidKeys = {
    ["rizy-1d-01"] = true,
    ["rizy-7d-07"] = true,
    ["rizy-life"] = true
}

-- 1. AUTH SYSTEM
if pGui:FindFirstChild("RizyAuth") then pGui.RizyAuth:Destroy() end
local Auth = Instance.new("ScreenGui", pGui)
Auth.Name = "RizyAuth"

local Frame = Instance.new("Frame", Auth)
Frame.Size, Frame.Position = UDim2.new(0, 220, 0, 160), UDim2.new(0.5, -110, 0.4, 0)
Frame.BackgroundColor3, Frame.Active, Frame.Draggable = Color3.fromRGB(15, 15, 20), true, true
Instance.new("UICorner", Frame)

local Title = Instance.new("TextLabel", Frame)
Title.Size, Title.Text = UDim2.new(1, 0, 0, 40), "★ RIZY LOGIN ★"
Title.TextColor3, Title.TextScaled, Title.BackgroundTransparency = Color3.new(1,1,1), true, 1
Title.Font = Enum.Font.GothamBold

local Box = Instance.new("TextBox", Frame)
Box.Size, Box.Position = UDim2.new(0, 180, 0, 35), UDim2.new(0.5, -90, 0.35, 0)
Box.PlaceholderText, Box.Text = "Enter Key...", ""
Box.BackgroundColor3, Box.TextColor3 = Color3.fromRGB(30, 30, 40), Color3.new(1,1,1)
Instance.new("UICorner", Box)

local Login = Instance.new("TextButton", Frame)
Login.Size, Login.Position = UDim2.new(0, 140, 0, 35), UDim2.new(0.5, -70, 0.7, 0)
Login.Text, Login.BackgroundColor3 = "ACTIVATE", Color3.fromRGB(0, 150, 255)
Login.TextColor3, Login.Font = Color3.new(1, 1, 1), Enum.Font.GothamBold
Instance.new("UICorner", Login)

-- 2. THE ULTIMATE ENGINE
local function StartRizy()
    local rS, uis, vUser, lighting = game:GetService("RunService"), game:GetService("UserInputService"), game:GetService("VirtualUser"), game:GetService("Lighting")
    local tpS = game:GetService("TeleportService")

    if pGui:FindFirstChild("RizyV10") then pGui.RizyV10:Destroy() end
    local S = Instance.new("ScreenGui", pGui)
    S.Name = "RizyV10"
    S.ResetOnSpawn = false

    local M = Instance.new("Frame", S)
    M.Size, M.Position = UDim2.new(0, 210, 0, 440), UDim2.new(0.5, -105, 0.2, 0)
    M.BackgroundColor3, M.Active, M.Draggable = Color3.fromRGB(10, 10, 15), true, true
    Instance.new("UICorner", M)

    local Glow = Instance.new("Frame", M)
    Glow.Size, Glow.Position, Glow.ZIndex, Glow.BackgroundTransparency = UDim2.new(1, 4, 1, 4), UDim2.new(0, -2, 0, -2), 0, 0.5
    Instance.new("UICorner", Glow)

    local T = Instance.new("TextLabel", M)
    T.Size, T.Text, T.TextScaled, T.BackgroundTransparency = UDim2.new(1, 0, 0, 40), "★ RIZY ULTRA ★", true, 1
    T.Font = Enum.Font.GothamBold

    local OpenBtn = Instance.new("TextButton", S)
    OpenBtn.Size, OpenBtn.Position = UDim2.new(0, 65, 0, 35), UDim2.new(0, 10, 0.5, -17)
    OpenBtn.Text, OpenBtn.BackgroundColor3, OpenBtn.Visible = "OPEN", Color3.fromRGB(0, 150, 255), false
    Instance.new("UICorner", OpenBtn)

    local CloseBtn = Instance.new("TextButton", M)
    CloseBtn.Size, CloseBtn.Position, CloseBtn.Text = UDim2.new(0, 25, 0, 25), UDim2.new(1, -30, 0, 5), "X"
    CloseBtn.BackgroundColor3, CloseBtn.TextColor3 = Color3.fromRGB(200, 0, 0), Color3.new(1, 1, 1)
    Instance.new("UICorner", CloseBtn)

    CloseBtn.MouseButton1Click:Connect(function() M.Visible = false OpenBtn.Visible = true end)
    OpenBtn.MouseButton1Click:Connect(function() M.Visible = true OpenBtn.Visible = false end)

    task.spawn(function()
        while task.wait() do 
            local col = Color3.fromHSV(tick() % 5 / 5, 0.8, 1)
            T.TextColor3, Glow.BackgroundColor3 = col, col
            if OpenBtn.Visible then OpenBtn.BackgroundColor3 = col end
        end
    end)

    local TabBar = Instance.new("Frame", M)
    TabBar.Size, TabBar.Position, TabBar.BackgroundColor3 = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 40), Color3.fromRGB(20, 20, 30)

    local BoosterBtn = Instance.new("TextButton", TabBar)
    BoosterBtn.Size, BoosterBtn.Text, BoosterBtn.TextColor3 = UDim2.new(0.5, 0, 1, 0), "BOOSTER", Color3.new(1,1,1)
    BoosterBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)

    local SettingBtn = Instance.new("TextButton", TabBar)
    SettingBtn.Size, SettingBtn.Position, SettingBtn.Text, SettingBtn.TextColor3 = UDim2.new(0.5, 0, 1, 0), UDim2.new(0.5, 0, 0, 0), "SETTING", Color3.new(1,1,1)
    SettingBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 25)

    local BoosterP = Instance.new("Frame", M)
    BoosterP.Size, BoosterP.Position, BoosterP.BackgroundTransparency = UDim2.new(1, 0, 1, -70), UDim2.new(0, 0, 0, 70), 1

    local SettingP = Instance.new("Frame", M)
    SettingP.Size, SettingP.Position, SettingP.BackgroundTransparency, SettingP.Visible = UDim2.new(1, 0, 1, -70), UDim2.new(0, 0, 0, 70), 1, false

    local function mkBox(txt, pos, def, par)
        local l = Instance.new("TextLabel", par)
        l.Size, l.Position, l.Text, l.BackgroundTransparency = UDim2.new(1, 0, 0, 20), pos, txt, 1
        l.TextColor3 = Color3.new(0.7, 0.7, 0.9)
        local i = Instance.new("TextBox", par)
        i.Size, i.Position, i.Text = UDim2.new(0, 160, 0, 30), pos + UDim2.new(0.5, -80, 0, 22), def
        i.BackgroundColor3, i.TextColor3 = Color3.fromRGB(25, 25, 40), Color3.new(1, 1, 1)
        Instance.new("UICorner", i)
        return i
    end

    -- BOOSTER TAB
    local TravelIn = mkBox("TRAVEL SPEED", UDim2.new(0, 0, 0.02, 0), "60", BoosterP)
    local StealIn = mkBox("STEAL SPEED", UDim2.new(0, 0, 0.18, 0), "29", BoosterP)

    local function mkMode(txt, pos, tS, sS)
        local b = Instance.new("TextButton", BoosterP)
        b.Size, b.Position, b.Text = UDim2.new(0, 60, 0, 25), pos, txt
        b.BackgroundColor3, b.TextColor3, b.TextSize = Color3.fromRGB(35, 35, 50), Color3.new(1,1,1), 10
        Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() TravelIn.Text = tostring(tS) StealIn.Text = tostring(sS) end)
    end
    mkMode("LEGIT", UDim2.new(0.05, 0, 0.35, 0), 40, 20)
    mkMode("RAGE", UDim2.new(0.36, 0, 0.35, 0), 100, 50)
    mkMode("CUSTOM", UDim2.new(0.67, 0, 0.35, 0), 60, 29)

    local SpeedOn = false
    local TogS = Instance.new("TextButton", BoosterP)
    TogS.Size, TogS.Position = UDim2.new(0, 180, 0, 40), UDim2.new(0.5, -90, 0.5, 0)
    TogS.Text, TogS.BackgroundColor3, TogS.TextColor3 = "SPEED: OFF", Color3.fromRGB(40, 40, 60), Color3.new(1, 1, 1)
    Instance.new("UICorner", TogS)
    TogS.MouseButton1Click:Connect(function() 
        SpeedOn = not SpeedOn 
        TogS.Text = SpeedOn and "SPEED: ONLINE" or "SPEED: OFFLINE" 
        TogS.BackgroundColor3 = SpeedOn and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(40, 40, 60) 
    end)

    -- SETTING TAB
    local function mkS(txt, pos, cb)
        local b = Instance.new("TextButton", SettingP)
        b.Size, b.Position, b.Text = UDim2.new(0, 90, 0, 30), pos, txt
        b.BackgroundColor3, b.TextColor3, b.TextSize = Color3.fromRGB(20, 20, 35), Color3.new(1, 1, 1), 10
        Instance.new("UICorner", b)
        local s = false
        b.MouseButton1Click:Connect(function() s = not s b.BackgroundColor3 = s and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(20, 20, 35) cb(s) end)
    end

    local xray, fly, autoC, antiAfk, infJ, infS, aLag, fBright = false, false, false, false, false, false, false, false
    mkS("FORCE XRAY", UDim2.new(0.05, 0, 0.02, 0), function(v) xray = v end)
    mkS("FLY", UDim2.new(0.52, 0, 0.02, 0), function(v) fly = v end)
    mkS("AUTO CLICK", UDim2.new(0.05, 0, 0.11, 0), function(v) autoC = v end)
    mkS("ANTI-AFK", UDim2.new(0.52, 0, 0.11, 0), function(v) antiAfk = v end)
    mkS("INF JUMP", UDim2.new(0.05, 0, 0.2, 0), function(v) infJ = v end)
    mkS("INF STAMINA", UDim2.new(0.52, 0, 0.2, 0), function(v) infS = v end)
    mkS("FPS BOOST", UDim2.new(0.05, 0, 0.29, 0), function(v) aLag = v end)
    mkS("FULLBRIGHT", UDim2.new(0.52, 0, 0.29, 0), function(v) fBright = v end)
    
    local HopBtn = Instance.new("TextButton", SettingP)
    HopBtn.Size, HopBtn.Position, HopBtn.Text = UDim2.new(0, 180, 0, 30), UDim2.new(0.5, -90, 0.39, 0), "SERVER HOP"
    HopBtn.BackgroundColor3, HopBtn.TextColor3 = Color3.fromRGB(30, 30, 50), Color3.new(1,1,1)
    Instance.new("UICorner", HopBtn)
    HopBtn.MouseButton1Click:Connect(function() tpS:Teleport(game.PlaceId, p) end)

    local FOVBox = mkBox("FIELD OF VIEW", UDim2.new(0, 0, 0.5, 0), "70", SettingP)
    FOVBox.FocusLost:Connect(function() local f = tonumber(FOVBox.Text) if f then workspace.CurrentCamera.FieldOfView = f end end)

    -- PANIC KEY (Right Control)
    uis.InputBegan:Connect(function(i) if i.KeyCode == Enum.KeyCode.RightControl then S:Destroy() end end)

    rS.Heartbeat:Connect(function()
        if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp, h = p.Character.HumanoidRootPart, p.Character:FindFirstChildOfClass("Humanoid")
            if infS and p.Character:FindFirstChild("Stamina") then p.Character.Stamina.Value = 100 end
            if SpeedOn and h.MoveDirection.Magnitude > 0 then
                local tool = p.Character:FindFirstChildOfClass("Tool")
                local final = tool and (tonumber(StealIn.Text) or 29) or (tonumber(TravelIn.Text) or 60)
                hrp.AssemblyLinearVelocity = h.MoveDirection * final + Vector3.new(0, hrp.AssemblyLinearVelocity.Y, 0)
            end
            if fly then hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z) end
        end
        if fBright then lighting.Brightness, lighting.ClockTime, lighting.FogEnd, lighting.GlobalShadows = 2, 12, 99999, false end
        if xray then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("TouchTransmitter") then
                    local obj = v.Parent
                    if obj and obj:IsA("BasePart") and not obj:FindFirstChild("RizyX") then
                        local hl = Instance.new("Highlight", obj)
                        hl.Name, hl.FillTransparency, hl.FillColor = "RizyX", 0.5, Color3.new(0,1,0)
                    end
                end
            end
        end
    end)

    -- SUPER FPS BOOST (NO TEXTURES)
    task.spawn(function()
        while task.wait(5) do
            if aLag then
                for _, v in pairs(game:GetDescendants()) do
                    if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic v.Color = Color3.new(0.5, 0.5, 0.5) end
                    if v:IsA("Decal") or v:IsA("Texture") then v:Destroy() end
                end
            end
        end
    end)

    BoosterBtn.MouseButton1Click:Connect(function() BoosterP.Visible, SettingP.Visible = true, false end)
    SettingBtn.MouseButton1Click:Connect(function() BoosterP.Visible, SettingP.Visible = false, true end)
    uis.JumpRequest:Connect(function() if infJ and p.Character then p.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end end)
    p.Idled:Connect(function() if antiAfk then vUser:CaptureController() vUser:ClickButton2(Vector2.new()) end end)
    task.spawn(function() while task.wait(0.1) do if autoC then vUser:Button1Down(Vector2.new()) task.wait() vUser:Button1Up(Vector2.new()) end end end)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "RIZY ULTRA", Text = "License Active!", Duration = 5})
end

-- 3. LOGIN TRIGGER
Login.MouseButton1Click:Connect(function()
    local key = string.lower(string.gsub(Box.Text, "%s+", ""))
    if ValidKeys[key] then Auth:Destroy() StartRizy()
    else Box.Text = "" Box.PlaceholderText = "INVALID!" end
end)
mmin.lua
