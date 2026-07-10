local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

for _, oldGui in ipairs(playerGui:GetChildren()) do
    if oldGui.Name == "StatsController" then
        oldGui:Destroy()
    end
end

local function makeDraggable(gui)
    local dragging = false
    local dragInput = nil
    local dragStart = nil
    local startPos = nil
   
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
   
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
   
    RunService.RenderStepped:Connect(function()
        if dragging and dragInput then
            local delta = dragInput.Position - dragStart
            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

local stats = {
    speed = 16,
    jump = 50,
    health = 100
}

local mainGui = Instance.new("ScreenGui")
mainGui.Name = "StatsController"
mainGui.ResetOnSpawn = false
mainGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 300)
mainFrame.Position = UDim2.new(0.5, -110, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0.05, 0)
Instance.new("UIStroke", mainFrame).Color = Color3.fromRGB(0, 200, 255)
mainFrame.Parent = mainGui
makeDraggable(mainFrame)

local titleBar = Instance.new("Frame", mainFrame)
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0.05, 0)
Instance.new("UIStroke", titleBar).Color = Color3.fromRGB(0, 200, 255)
titleBar.ClipsDescendants = true

local titleText = Instance.new("TextLabel", titleBar)
titleText.Size = UDim2.new(0.7, 0, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.Text = "STATS CONTROLLER"
titleText.TextColor3 = Color3.fromRGB(0, 200, 255)
titleText.Font = Enum.Font.GothamBold
titleText.TextScaled = true
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.BackgroundTransparency = 1

local miniBtn = Instance.new("TextButton", titleBar)
miniBtn.Size = UDim2.new(0, 30, 0, 30)
miniBtn.Position = UDim2.new(1, -35, 0, 2.5)
miniBtn.Text = "-"
miniBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
miniBtn.TextColor3 = Color3.new(1, 1, 1)
miniBtn.Font = Enum.Font.GothamBold
miniBtn.TextScaled = true
Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(0.1, 0)
miniBtn.ZIndex = 10

local isMini = false
local scroll = Instance.new("ScrollingFrame", mainFrame)
scroll.Size = UDim2.new(1, -10, 1, -45)
scroll.Position = UDim2.new(0, 5, 0, 40)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0, 0, 0, 300)
scroll.ScrollBarThickness = 3
scroll.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 6)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

miniBtn.MouseButton1Click:Connect(function()
    isMini = not isMini
    if isMini then
        mainFrame:TweenSize(UDim2.new(0, 220, 0, 40), "Out", "Quad", 0.25, true)
        scroll.Visible = false
        miniBtn.Text = "+"
    else
        mainFrame:TweenSize(UDim2.new(0, 220, 0, 300), "Out", "Quad", 0.25, true)
        scroll.Visible = true
        miniBtn.Text = "-"
    end
end)

local function addInput(text, key, default)
    local container = Instance.new("Frame", scroll)
    container.Size = UDim2.new(0.95, 0, 0, 55)
    container.BackgroundTransparency = 1
   
    local lbl = Instance.new("TextLabel", container)
    lbl.Size = UDim2.new(1, 0, 0.4, 0)
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextScaled = true
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.BackgroundTransparency = 1
   
    local box = Instance.new("TextBox", container)
    box.Size = UDim2.new(0.5, 0, 0.35, 0)
    box.Position = UDim2.new(0, 0, 0.4, 0)
    box.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    box.Text = tostring(default)
    box.TextColor3 = Color3.new(1, 1, 1)
    box.Font = Enum.Font.GothamBold
    box.TextScaled = true
    Instance.new("UICorner", box).CornerRadius = UDim.new(0.1, 0)
   
    local applyBtn = Instance.new("TextButton", container)
    applyBtn.Size = UDim2.new(0.4, 0, 0.35, 0)
    applyBtn.Position = UDim2.new(0.55, 0, 0.4, 0)
    applyBtn.Text = "APPLY"
    applyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
    applyBtn.TextColor3 = Color3.new(1, 1, 1)
    applyBtn.Font = Enum.Font.GothamBold
    applyBtn.TextScaled = true
    Instance.new("UICorner", applyBtn).CornerRadius = UDim.new(0.1, 0)
   
    applyBtn.MouseButton1Click:Connect(function()
        local n = tonumber(box.Text)
        if n then
            stats[key] = n
            local char = player.Character
            local hum = char and char:FindFirstChild("Humanoid")
            if hum then
                if key == "speed" then
                    hum.WalkSpeed = n
                elseif key == "jump" then
                    hum.JumpPower = n
                elseif key == "health" then
                    hum.Health = math.min(n, hum.MaxHealth)
                end
            end
        else
            box.Text = tostring(stats[key])
        end
    end)
   
    box.FocusLost:Connect(function()
        local n = tonumber(box.Text)
        if n then
            stats[key] = n
        else
            box.Text = tostring(stats[key])
        end
    end)
end

addInput("Speed", "speed", 16)
addInput("Jump Power", "jump", 50)
addInput("Health Goal", "health", 100)

local healBtn = Instance.new("TextButton", scroll)
healBtn.Size = UDim2.new(0.8, 0, 0, 35)
healBtn.Text = "HEAL TO GOAL"
healBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
healBtn.TextColor3 = Color3.new(1, 1, 1)
healBtn.Font = Enum.Font.GothamBold
healBtn.TextScaled = true
Instance.new("UICorner", healBtn).CornerRadius = UDim.new(0.1, 0)

healBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    local hum = char and char:FindFirstChild("Humanoid")
    if hum then
        hum.Health = math.min(stats.health, hum.MaxHealth)
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if player.Character then
            local hum = player.Character:FindFirstChild("Humanoid")
            if hum and hum.Health > 0 and hum.Health < stats.health then
                hum.Health = math.min(hum.Health + 5, stats.health)
            end
        end
    end
end)
    
                hum.PlatformStand = true
            else
                -- Dọn dẹp khi tắt
                if hrp then
                    local bv = hrp:FindFirstChild("FlyVel")
                    local bg = hrp:FindFirstChild("FlyGyro")
                    if bv then bv:Destroy() end
                    if bg then bg:Destroy() end
                end
                
                if hum then
                    hum.PlatformStand = false
                    hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end
        end
    end)
end -- CHỖ NÀY LÚC TRƯỚC BỊ THIẾU END! ĐÃ ĐƯỢC FIX.

addToggle("NOCLIP", "noClip", Color3.fromRGB(180, 50, 50))
addToggle("FLY", "flying", Color3.fromRGB(120, 50, 180))
addToggle("AUTO MAINTAIN", "autoMaintain", Color3.fromRGB(0, 100, 200))
addToggle("SPAM STEAL", "spamSteal", Color3.fromRGB(0, 160, 80))

-- 4. LOGIC HỆ THỐNG
local cachedParts = {}
local function updateCache()
    cachedParts = {}
    if not player.Character then return end
    for _, p in ipairs(player.Character:GetDescendants()) do
        if p:IsA("BasePart") then table.insert(cachedParts, p) end
    end
end
player.CharacterAdded:Connect(function() task.wait(0.5) updateCache() end)
updateCache()

-- MAIN LOOP
RunService.Heartbeat:Connect(function()
    local char = player.Character
    local hum = char and char:FindFirstChild("Humanoid")
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end

    -- Maintain
    if stats.autoMaintain and not stats.flying then
        hum.WalkSpeed = stats.speed
        hum.JumpPower = stats.jump
    end

    -- Fly logic
    if stats.flying then
        local bv = hrp:FindFirstChild("FlyVel")
        local bg = hrp:FindFirstChild("FlyGyro")
        if bv and bg then
            local moveDir = hum.MoveDirection
            if moveDir.Magnitude > 0 then
                bv.Velocity = moveDir * stats.flySpeed
            else
                bv.Velocity = Vector3.new(0, 0.1, 0)
            end
            bg.CFrame = workspace.CurrentCamera.CFrame
            hum.PlatformStand = true
        end
    end -- Đã bỏ else hum.PlatformStand = false ở đây để tránh giật lag animation

    -- NoClip
    if stats.noClip then
        for _, p in ipairs(cachedParts) do 
            if p.CanCollide then
                p.CanCollide = false 
            end
        end
    end
end)

-- Spam Loop
task.spawn(function()
    while task.wait(0.3) do
        if stats.spamSteal and player.Character and player.Character:FindFirstChild("Humanoid") then
            local hum = player.Character.Humanoid
            -- Fix: Đảm bảo nhân vật còn sống mới chỉnh Health
            if hum.Health > 0 and hum.Health < stats.health then
                hum.Health = stats.health
            end
        end
    end
end)

print("⚡ Stats Controller V7.5: GUI Error Fixed & Optimized!")
