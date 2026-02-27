--[[
    GOD MODE OMNI-HUB [ULTIMATE EDITION]
    Features:
    - Immortality (Infinite Health & Death State Disabled)
    - Ghost Collision (Anti-KillBrick & Disaster Immunity)
    - Physics Guard (Fixes freezing & Movement issues)
    - Smart Recovery (Restore normal state without resetting)
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- UI CREATION
local sg = Instance.new("ScreenGui", player.PlayerGui)
sg.Name = "OmniGodHub"
sg.ResetOnSpawn = false

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 260, 0, 140)
main.Position = UDim2.new(0.5, -130, 0.2, 0)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 45)
title.Text = "OMNI-GOD V.X"
title.TextColor3 = Color3.fromRGB(0, 170, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.BackgroundTransparency = 1

local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 0.3, 0)
status.Text = "STATUS: STANDBY"
status.TextColor3 = Color3.fromRGB(150, 150, 150)
status.Font = Enum.Font.GothamMedium
status.TextSize = 12
status.BackgroundTransparency = 1

local btn = Instance.new("TextButton", main)
btn.Size = UDim2.new(0.85, 0, 0, 45)
btn.Position = UDim2.new(0.075, 0, 0.5, 0)
btn.Text = "INITIALIZE GOD MODE"
btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.GothamBold
Instance.new("UICorner", btn)

-----------------------------------------------------------
-- CORE LOGIC (FIXED MOVEMENT)
-----------------------------------------------------------
local active = false
local loop = nil

local function RestoreNormal(char)
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
            p.CanCollide = true -- Khôi phục va chạm
        end
    end
end

local function Activate(char)
    local hum = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")
    
    hum.MaxHealth = 9e18
    hum.Health = 9e18
    hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
    
    local hl = Instance.new("Highlight", char)
    hl.Name = "GodHighlight"
    hl.FillColor = Color3.fromRGB(0, 170, 255)
    hl.FillTransparency = 0.5

    loop = RunService.Heartbeat:Connect(function()
        if not active then 
            if loop then loop:Disconnect() end
            return 
        end
        hum.Health = 9e18
        
        -- KỸ THUẬT FIX DI CHUYỂN: Chỉ tắt CanTouch của các chi, giữ nguyên RootPart
        for _, part in pairs(char:GetChildren()) do
            if part:IsA("BasePart") then
                -- BƯỚC QUAN TRỌNG: Giữ CanCollide = True để có ma sát di chuyển
                part.CanCollide = true
                
                -- Tắt CanTouch để né sát thương từ Kill Brick/Disaster
                if part.Name ~= "HumanoidRootPart" then
                    part.CanTouch = false
                end
            end
        end
        
        -- Anti-Void protection
        if root.Position.Y < -400 then
            root.CFrame = CFrame.new(root.Position.X, 150, root.Position.Z)
        end
    end)
end

-- Fix Jump
UserInputService.JumpRequest:Connect(function()
    if active and player.Character then
        local h = player.Character:FindFirstChildOfClass("Humanoid")
        if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

btn.MouseButton1Click:Connect(function()
    active = not active
    if active then
        btn.Text = "MODE: IMMORTAL"
        status.Text = "STATUS: ACTIVE"
        status.TextColor3 = Color3.fromRGB(0, 255, 150)
        TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 120, 255)}):Play()
        if player.Character then Activate(player.Character) end
    else
        btn.Text = "INITIALIZE GOD MODE"
        status.Text = "STATUS: STANDBY"
        status.TextColor3 = Color3.fromRGB(150, 150, 150)
        TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}):Play()
        if player.Character then RestoreNormal(player.Character) end
    end
end)

player.CharacterAdded:Connect(function(c)
    if active then task.wait(1) Activate(c) end
end)