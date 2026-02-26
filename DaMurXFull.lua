local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ESP_System_FullEdition"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Hàm kéo thả
local function MakeDraggable(obj)
    local dragging, dragInput, dragStart, startPos
    obj.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = obj.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    obj.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

----------------------------------------------------------------
-- LOADING SCREEN
----------------------------------------------------------------
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
loadingFrame.Parent = screenGui

local loadingLabel = Instance.new("TextLabel")
loadingLabel.Size = UDim2.new(1, 0, 0.2, 0)
loadingLabel.Position = UDim2.new(0, 0, 0.4, 0)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "Loading Assets..."
loadingLabel.TextColor3 = Color3.new(1, 1, 1)
loadingLabel.Font = Enum.Font.GothamBold
loadingLabel.TextScaled = true
loadingLabel.Parent = loadingFrame

local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(0.6, 0, 0.05, 0)
progressBg.Position = UDim2.new(0.2, 0, 0.6, 0)
progressBg.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
progressBg.Parent = loadingFrame
Instance.new("UICorner", progressBg).CornerRadius = UDim.new(0, 6)

local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
progressFill.Parent = progressBg
Instance.new("UICorner", progressFill).CornerRadius = UDim.new(0, 6)

local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local goal = {Size = UDim2.new(1, 0, 1, 0)}
local tween = TweenService:Create(progressFill, tweenInfo, goal)

----------------------------------------------------------------
-- ROLES
----------------------------------------------------------------
local Roles = {
    Murderer   = {color = Color3.fromRGB(255, 0, 0), keywords = {"knife"}},
    Sheriff    = {color = Color3.fromRGB(135, 206, 250), keywords = {"gun","revolver"}},
    Slapper    = {color = Color3.fromRGB(255, 255, 153), keywords = {"slap"}},
    Thug       = {color = Color3.fromRGB(128, 0, 128), keywords = {"punch"}},
    Cop        = {color = Color3.fromRGB(173, 216, 230), keywords = {"handcuffs"}},
    Hacker     = {color = Color3.fromRGB(0, 200, 0), keywords = {"hacker"}},
    Detective  = {color = Color3.fromRGB(0, 0, 139), keywords = {"detect"}},
    Medic      = {color = Color3.fromRGB(255, 105, 180), keywords = {"revive"}},
    Taser      = {color = Color3.fromRGB(255, 165, 0), keywords = {"taser"}},
    Wizard     = {color = Color3.fromRGB(255, 182, 193), keywords = {"wizardorb"}},
    Clown      = {color = Color3.fromRGB(139, 69, 19), keywords = {"pie"}},
    Innocent   = {color = Color3.fromRGB(0, 255, 0), keywords = {}}
}

----------------------------------------------------------------
-- GUI CHÍNH (ẩn lúc đầu, hiện sau khi loading xong)
----------------------------------------------------------------
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 160, 0, 50)
MainFrame.Position = UDim2.new(0.5, -80, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Visible = false
MainFrame.Parent = screenGui
MakeDraggable(MainFrame)
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

local ESPButton = Instance.new("TextButton")
ESPButton.Size = UDim2.new(0.45, 0, 0.8, 0)
ESPButton.Position = UDim2.new(0.05, 0, 0.1, 0)
ESPButton.Text = "ESP: OFF"
ESPButton.Font = Enum.Font.GothamBold
ESPButton.TextColor3 = Color3.new(1, 1, 1)
ESPButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ESPButton.Parent = MainFrame
Instance.new("UICorner", ESPButton).CornerRadius = UDim.new(0, 6)

local TPListButton = Instance.new("TextButton")
TPListButton.Size = UDim2.new(0.45, 0, 0.8, 0)
TPListButton.Position = UDim2.new(0.5, 0, 0.1, 0)
TPListButton.Text = "TP List"
TPListButton.Font = Enum.Font.GothamBold
TPListButton.TextColor3 = Color3.new(1, 1, 1)
TPListButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
TPListButton.Parent = MainFrame
Instance.new("UICorner", TPListButton).CornerRadius = UDim.new(0, 6)

----------------------------------------------------------------
-- MINI FRAME (dấu +)
----------------------------------------------------------------
local MiniFrame = Instance.new("Frame")
MiniFrame.Size = UDim2.new(0, 40, 0, 40)
MiniFrame.Position = MainFrame.Position
MiniFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MiniFrame.Visible = false
MiniFrame.Active = true
MiniFrame.Parent = screenGui
MakeDraggable(MiniFrame)
Instance.new("UICorner", MiniFrame).CornerRadius = UDim.new(1, 0)

local PlusButton = Instance.new("TextButton")
PlusButton.Size = UDim2.new(1, 0, 1, 0)
PlusButton.Text = "+"
PlusButton.TextSize = 30
PlusButton.Font = Enum.Font.GothamBold
PlusButton.TextColor3 = Color3.fromRGB(0, 255, 0)
PlusButton.BackgroundTransparency = 1
PlusButton.Parent = MiniFrame

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0.15, 0, 0.8, 0)
MinimizeButton.Position = UDim2.new(0.8, 0, 0.1, 0)
MinimizeButton.Text = "_"
MinimizeButton.TextSize = 20
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.Parent = Main

MinimizeButton.MouseButton1Click:Connect(function()
    MiniFrame.Position = MainFrame.Position
    MainFrame.Visible = false
    MiniFrame.Visible = true
end)

PlusButton.MouseButton1Click:Connect(function()
    MainFrame.Position = MiniFrame.Position
    MiniFrame.Visible = false
    MainFrame.Visible = true
end)

----------------------------------------------------------------
-- ESP LOGIC
----------------------------------------------------------------
local espEnabled = false

local function createESP(player, color, roleName)
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local root = char.HumanoidRootPart

        -- Box ESP
        local box = root:FindFirstChild("MyESP") or Instance.new("BoxHandleAdornment")
        box.Name = "MyESP"
        box.Adornee = root
        box.AlwaysOnTop = true
        box.ZIndex = 10
        box.Size = Vector3.new(3.5, 5, 3.5)
        box.Transparency = 0.5
        box.Color3 = color
        box.Parent = root

        -- Name + Role ESP
        local billboard = root:FindFirstChild("NameESP")
        if not billboard then
            billboard = Instance.new("BillboardGui")
            billboard.Name = "NameESP"
            billboard.Adornee = root
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 4, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = root

            local nameLabel = Instance.new("TextLabel")
            nameLabel.Name = "NameLabel"
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = player.Name .. " - " .. roleName
            nameLabel.TextColor3 = color
            nameLabel.Font = Enum.Font.GothamBold
            nameLabel.TextScaled = true
            nameLabel.Parent = billboard
        else
            local nameLabel = billboard:FindFirstChild("NameLabel")
            if nameLabel then
                nameLabel.Text = player.Name .. " - " .. roleName
                nameLabel.TextColor3 = color
            end
        end
    end
end

local function removeESP()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local root = player.Character.HumanoidRootPart
            local oldBox = root:FindFirstChild("MyESP")
            local oldName = root:FindFirstChild("NameESP")
            if oldBox then oldBox:Destroy() end
            if oldName then oldName:Destroy() end
        end
    end
end

ESPButton.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        ESPButton.Text = "ESP: ON"
        ESPButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    else
        ESPButton.Text = "ESP: OFF"
        ESPButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        removeESP()
    end
end)

local function getRole(player)
    local items = player.Backpack:GetChildren()
    for _, item in pairs(player.Character:GetChildren()) do
        if item:IsA("Tool") then table.insert(items, item) end
    end
    -- Debug: in case tool names differ
    for _, tool in pairs(items) do
        print(player.Name .. " has tool: " .. tool.Name)
    end
    for roleName, roleData in pairs(Roles) do
        for _, keyword in pairs(roleData.keywords) do
            for _, tool in pairs(items) do
                if tool.Name:lower():find(keyword) then
                    return roleName, roleData.color
                end
            end
        end
    end
    return "Innocent", Roles.Innocent.color
end

RunService.RenderStepped:Connect(function()
    if espEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local roleName, roleColor = getRole(player)
                createESP(player, roleColor, roleName)
            end
        end
    end
end)

----------------------------------------------------------------
-- TP LIST GUI
----------------------------------------------------------------
local TPFrame = Instance.new("Frame")
TPFrame.Size = UDim2.new(0, 160, 0, 250)
TPFrame.Position = UDim2.new(0.5, -80, 0.3, 0)
TPFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TPFrame.Visible = false
TPFrame.Parent = screenGui
Instance.new("UICorner", TPFrame).CornerRadius = UDim.new(0, 8)
MakeDraggable(TPFrame)

local CloseTPButton = Instance.new("TextButton")
CloseTPButton.Size = UDim2.new(0.2, 0, 0.1, 0)
CloseTPButton.Position = UDim2.new(0.75, 0, 0, 0)
CloseTPButton.Text = "X"
CloseTPButton.Font = Enum.Font.GothamBold
CloseTPButton.TextColor3 = Color3.new(1, 1, 1)
CloseTPButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseTPButton.Parent = TPFrame
Instance.new("UICorner", CloseTPButton).CornerRadius = UDim.new(0, 6)

CloseTPButton.MouseButton1Click:Connect(function()
    TPFrame.Visible = false
end)

TPListButton.MouseButton1Click:Connect(function()
    TPFrame.Visible = not TPFrame.Visible
end)

local function teleportToRole(roleName)
    local roleData = Roles[roleName]
    if not roleData then return end
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local root = player.Character.HumanoidRootPart
            local espBox = root:FindFirstChild("MyESP")
            if espBox and espBox.Color3 == roleData.color then
                LocalPlayer.Character.HumanoidRootPart.CFrame = root.CFrame + Vector3.new(0, 3, 0)
                break
            end
        end
    end
end

local yPos = 0.15
for roleName, roleData in pairs(Roles) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0.08, 0)
    btn.Position = UDim2.new(0.05, 0, yPos, 0)
    btn.Text = "TP " .. roleName
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = roleData.color
    btn.Parent = TPFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    btn.MouseButton1Click:Connect(function()
        teleportToRole(roleName)
    end)

    yPos = yPos + 0.09
end

----------------------------------------------------------------
-- KHI LOADING XONG THÌ HIỆN GUI
----------------------------------------------------------------
tween:Play()
tween.Completed:Connect(function()
    loadingFrame:Destroy()
    MainFrame.Visible = true
end)