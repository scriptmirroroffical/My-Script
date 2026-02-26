-- StatsController.lua (Full Edition - No Limit + Reset + Auto Maintain + Loading UI)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local humanoid = player.Character:WaitForChild("Humanoid")

-- Default values
local defaultSpeed = humanoid.WalkSpeed
local defaultJump = humanoid.JumpPower
local defaultHealth = humanoid.MaxHealth

-- GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "StatsController"

-- Main Frame (ẩn khi loading)
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 320, 0, 320)
frame.Position = UDim2.new(0.5, -160, 0.5, -160)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Active = true
frame.Draggable = true
frame.Visible = false

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.Text = "⚡ Stats Controller ⚡"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Control function (InputBox only, no limit)
local function createControl(name, default, posY)
    local controlFrame = Instance.new("Frame", frame)
    controlFrame.Size = UDim2.new(1, -20, 0, 50)
    controlFrame.Position = UDim2.new(0, 10, 0, posY)
    controlFrame.BackgroundTransparency = 1

    local label = Instance.new("TextLabel", controlFrame)
    label.Size = UDim2.new(0.4,0,1,0)
    label.Text = name..": "..default
    label.TextColor3 = Color3.new(1,1,1)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.TextScaled = true

    local inputBox = Instance.new("TextBox", controlFrame)
    inputBox.Size = UDim2.new(0.6,0,1,0)
    inputBox.Position = UDim2.new(0.4,0,0,0)
    inputBox.Text = tostring(default)
    inputBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
    inputBox.TextColor3 = Color3.new(1,1,1)
    inputBox.Font = Enum.Font.Gotham
    inputBox.TextScaled = true

    local inputCorner = Instance.new("UICorner", inputBox)
    inputCorner.CornerRadius = UDim.new(0,8)

    local value = default

    inputBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local num = tonumber(inputBox.Text)
            if num and num >= 0 then
                value = num
                label.Text = name..": "..value
            else
                inputBox.Text = tostring(value)
            end
        end
    end)

    return function() return value end, function(v)
        value = v
        label.Text = name..": "..value
        inputBox.Text = tostring(value)
    end
end

-- Controls
local getSpeed, setSpeed = createControl("Speed", defaultSpeed, 40)
local getJump, setJump = createControl("Jump", defaultJump, 100)
local getHealth, setHealth = createControl("Health (Beta)", defaultHealth, 160)

-- Loading UI
local loadingFrame = Instance.new("Frame", screenGui)
loadingFrame.Size = UDim2.new(0, 300, 0, 80)
loadingFrame.Position = UDim2.new(0.5, -150, 0.5, -40)
loadingFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
loadingFrame.Visible = true

local loadingCorner = Instance.new("UICorner", loadingFrame)
loadingCorner.CornerRadius = UDim.new(0,12)

local loadingLabel = Instance.new("TextLabel", loadingFrame)
loadingLabel.Size = UDim2.new(1,0,0.5,0)
loadingLabel.Text = "Loading Assets..."
loadingLabel.TextColor3 = Color3.new(1,1,1)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Font = Enum.Font.GothamBold
loadingLabel.TextScaled = true

local progressBar = Instance.new("Frame", loadingFrame)
progressBar.Size = UDim2.new(0,0,0.3,0)
progressBar.Position = UDim2.new(0,10,0.6,0)
progressBar.BackgroundColor3 = Color3.fromRGB(0,170,255)

local progressCorner = Instance.new("UICorner", progressBar)
progressCorner.CornerRadius = UDim.new(0,8)

-- Animate loading bar (startup)
local tween = TweenService:Create(progressBar, TweenInfo.new(3), {Size = UDim2.new(1,-20,0.3,0)})
tween:Play()
tween.Completed:Connect(function()
    loadingFrame.Visible = false
    frame.Visible = true
end)

-- Apply button
local applyBtn = Instance.new("TextButton", frame)
applyBtn.Size = UDim2.new(1, -20, 0, 40)
applyBtn.Position = UDim2.new(0, 10, 0, 220)
applyBtn.Text = "Apply Stats"
applyBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
applyBtn.TextColor3 = Color3.new(1,1,1)
applyBtn.Font = Enum.Font.GothamBold
applyBtn.TextScaled = true

local applyCorner = Instance.new("UICorner", applyBtn)
applyCorner.CornerRadius = UDim.new(0,10)

applyBtn.MouseButton1Click:Connect(function()
    loadingFrame.Visible = true
    progressBar.Size = UDim2.new(0,0,0.3,0)
    loadingLabel.Text = "Applying Stats..."

    local tweenApply = TweenService:Create(progressBar, TweenInfo.new(2), {Size = UDim2.new(1,-20,0.3,0)})
    tweenApply:Play()
    tweenApply.Completed:Connect(function()
        humanoid.MaxHealth = getHealth()
        humanoid.Health = getHealth()
        humanoid.WalkSpeed = getSpeed()
        humanoid.JumpPower = getJump()
        loadingFrame.Visible = false
    end)
end)

-- Reset button
local resetBtn = Instance.new("TextButton", frame)
resetBtn.Size = UDim2.new(1, -20, 0, 40)
resetBtn.Position = UDim2.new(0, 10, 0, 270)
resetBtn.Text = "Reset Defaults"
resetBtn.BackgroundColor3 = Color3.fromRGB(255,80,80)
resetBtn.TextColor3 = Color3.new(1,1,1)
resetBtn.Font = Enum.Font.GothamBold
resetBtn.TextScaled = true

local resetCorner = Instance.new("UICorner", resetBtn)
resetCorner.CornerRadius = UDim.new(0,10)

resetBtn.MouseButton1Click:Connect(function()
    humanoid.WalkSpeed = defaultSpeed
    humanoid.JumpPower = defaultJump
    humanoid.MaxHealth = defaultHealth
    humanoid.Health = defaultHealth
    setSpeed(defaultSpeed)
    setJump(defaultJump)
    setHealth(defaultHealth)
end)

-- Auto maintain stats (pseudo-bypass)
RunService.RenderStepped:Connect(function()
    humanoid.WalkSpeed = getSpeed()
    humanoid.JumpPower = getJump()
    if humanoid.Health < getHealth() then
        humanoid.MaxHealth = getHealth()
        humanoid.Health = getHealth()
    end
end)