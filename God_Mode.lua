local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local active = false
local bypassLevel = 2 -- Mặc định là cấp 2
local connections = {}
local cachedParts = {}

-- Bảo vệ UI: Ưu tiên dùng CoreGui để né Anti-cheat quét PlayerGui
local targetGui = pcall(function() return CoreGui.Name end) and CoreGui or player:WaitForChild("PlayerGui")

-- Xóa UI cũ nếu tồn tại
if targetGui:FindFirstChild("OmniGodHub") then
    targetGui.OmniGodHub:Destroy()
end

-- UI CREATION
local sg = Instance.new("ScreenGui", targetGui)
sg.Name = "OmniGodHub"
sg.ResetOnSpawn = false

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 260, 0, 170)
main.Position = UDim2.new(0.5, -130, 0.2, 0)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "OMNI-GOD V.MAX"
title.TextColor3 = Color3.fromRGB(0, 200, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.BackgroundTransparency = 1

local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 0.25, 0)
status.Text = "STATUS: STANDBY"
status.TextColor3 = Color3.fromRGB(150, 150, 150)
status.Font = Enum.Font.GothamMedium
status.TextSize = 12
status.BackgroundTransparency = 1

local btnLevel = Instance.new("TextButton", main)
btnLevel.Size = UDim2.new(0.85, 0, 0, 30)
btnLevel.Position = UDim2.new(0.075, 0, 0.45, 0)
btnLevel.Text = "BYPASS LEVEL: " .. bypassLevel .. " (GHOST)"
btnLevel.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
btnLevel.TextColor3 = Color3.new(1, 1, 1)
btnLevel.Font = Enum.Font.GothamSemibold
Instance.new("UICorner", btnLevel).CornerRadius = UDim.new(0, 6)

local btnToggle = Instance.new("TextButton", main)
btnToggle.Size = UDim2.new(0.85, 0, 0, 40)
btnToggle.Position = UDim2.new(0.075, 0, 0.7, 0)
btnToggle.Text = "ACTIVATE"
btnToggle.BackgroundColor3 = Color3.fromRGB(20, 150, 80)
btnToggle.TextColor3 = Color3.new(1, 1, 1)
btnToggle.Font = Enum.Font.GothamBold
Instance.new("UICorner", btnToggle).CornerRadius = UDim.new(0, 6)

-----------------------------------------------------------
-- CORE LOGIC & OPTIMIZATION
-----------------------------------------------------------
local function ClearConnections()
    for _, conn in pairs(connections) do
        if conn then conn:Disconnect() end
    end
    table.clear(connections)
    table.clear(cachedParts)
end

local function RestoreNormal(char)
    ClearConnections()
    if not char then return end
    
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.MaxHealth = 100
        hum.Health = 100
        hum:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
    end
    
    if char:FindFirstChild("GodHighlight") then char.GodHighlight:Destroy() end
    
    for _, p in pairs(char:GetDescendants()) do
        if p:IsA("BasePart") then
            p.CanTouch = true
            p.CustomPhysicalProperties = nil -- Xóa Anti-Fling
        end
    end
end

local function ApplyGodMode(char)
    ClearConnections()
    if not char then return end

    local hum = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")

    -- Hiệu ứng hình ảnh
    local hl = Instance.new("Highlight", char)
    hl.Name = "GodHighlight"
    hl.FillColor = Color3.fromRGB(0, 200, 255)
    hl.FillTransparency = 0.6
    
    -- Caching Parts (Tối ưu hóa cực mạnh)
    for _, part in pairs(char:GetChildren()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            table.insert(cachedParts, part)
        end
    end

    -- [BYPASS CẤP 3]: CLONE HUMANOID (Vô hiệu hóa Server Kill Scripts)
    if bypassLevel == 3 then
        local cloneHum = hum:Clone()
        cloneHum.Parent = char
        cloneHum.Name = hum.Name
        workspace.CurrentCamera.CameraSubject = cloneHum
        hum:Destroy()
        hum = cloneHum
        
        -- Fix animation sau khi clone
        local animate = char:FindFirstChild("Animate")
        if animate then
            animate.Disabled = true
            task.wait(0.1)
            animate.Disabled = false
        end
        
        -- Anti-Fling siêu cứng
        root.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 0.5, 1, 1)
    end

    -- [BYPASS CẤP 1 & 2]: THIẾT LẬP MÁU
    if bypassLevel >= 2 then
        hum.MaxHealth = math.huge
        hum.Health = math.huge
    end
    hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)

    -- MAIN LOOP TỐI ƯU
    local loop = RunService.Heartbeat:Connect(function()
        if not active or not char or not char.Parent or not hum or not root then return end
        
        -- Hồi máu liên tục (An toàn cho Cấp 1)
        if bypassLevel == 1 and hum.Health < hum.MaxHealth then
            hum.Health = hum.MaxHealth
        elseif bypassLevel >= 2 then
            hum.Health = math.huge
        end

        -- Tắt Touch bằng mảng Cache (Không dùng GetChildren() mỗi frame)
        if bypassLevel >= 2 then
            for _, part in ipairs(cachedParts) do
                part.CanTouch = false
            end
        end

        -- Anti-Void & Anti-Fling (Giới hạn vận tốc)
        if root.Position.Y < -300 then
            root.Velocity = Vector3.new(0, 0, 0)
            root.CFrame = CFrame.new(root.Position.X, 100, root.Position.Z)
        end
        
        if bypassLevel == 3 then
            if root.Velocity.Magnitude > 250 then
                root.Velocity = Vector3.new(0,0,0) -- Triệt tiêu lực văng
            end
        end
    end)
    table.insert(connections, loop)

    -- Fix Jump (Chống lỗi khi spam nhảy)
    local jumpEvent = UserInputService.JumpRequest:Connect(function()
        if active and hum then 
            hum:ChangeState(Enum.HumanoidStateType.Jumping) 
        end
    end)
    table.insert(connections, jumpEvent)
end

-- Nút Chuyển Cấp Độ Bypass
btnLevel.MouseButton1Click:Connect(function()
    if active then return end -- Chỉ cho đổi khi đang tắt
    bypassLevel = bypassLevel + 1
    if bypassLevel > 3 then bypassLevel = 1 end
    
    local txt = ""
    if bypassLevel == 1 then txt = "1 (STEALTH HEAL)"
    elseif bypassLevel == 2 then txt = "2 (GHOST COLLISION)"
    elseif bypassLevel == 3 then txt = "3 (GOD CLONE + NO-FLING)"
    end
    btnLevel.Text = "BYPASS LEVEL: " .. txt
end)

-- Nút Bật/Tắt
btnToggle.MouseButton1Click:Connect(function()
    active = not active
    if active then
        btnToggle.Text = "DEACTIVATE"
        btnToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        status.Text = "STATUS: ACTIVE (LV " .. bypassLevel .. ")"
        status.TextColor3 = Color3.fromRGB(0, 255, 150)
        if player.Character then ApplyGodMode(player.Character) end
    else
        btnToggle.Text = "ACTIVATE"
        btnToggle.BackgroundColor3 = Color3.fromRGB(20, 150, 80)
        status.Text = "STATUS: STANDBY"
        status.TextColor3 = Color3.fromRGB(150, 150, 150)
        if player.Character then RestoreNormal(player.Character) end
    end
end)

player.CharacterAdded:Connect(function(c)
    if active then task.wait(0.5) ApplyGodMode(c) end
end)
