local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- === GIAO DIỆN ===
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Hitbox_Persistent_V15"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 250, 0, 350)
MainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "HITBOX V15 (NON-STOP)"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1
Title.Parent = MainFrame

local SizeInput = Instance.new("TextBox")
SizeInput.Size = UDim2.new(0.9, 0, 0, 35)
SizeInput.Position = UDim2.new(0.05, 0, 0.15, 0)
SizeInput.Text = "20"
SizeInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SizeInput.TextColor3 = Color3.new(1, 1, 1)
SizeInput.Parent = MainFrame

local PlayerList = Instance.new("ScrollingFrame")
PlayerList.Size = UDim2.new(0.9, 0, 0, 180)
PlayerList.Position = UDim2.new(0.05, 0, 0.28, 0)
PlayerList.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
PlayerList.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = PlayerList

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0.9, 0, 0, 40)
ToggleBtn.Position = UDim2.new(0.05, 0, 0.85, 0)
ToggleBtn.Text = "OFF"
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Parent = MainFrame

-- === LOGIC BÁM ĐUỔI KHÔNG DỪNG ===
local _G_Enabled = false
local SelectedPlayer = "Tất cả"

-- Hàm tạo Hitbox siêu tốc
local function CreatePersistentHitbox(p)
    if not p.Character then return end
    local char = p.Character
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local hit = char:FindFirstChild("SupremeHitboxV15")
    if not hit then
        hit = Instance.new("Part")
        hit.Name = "SupremeHitboxV15"
        hit.Parent = char
        hit.Anchored = true
        hit.CanCollide = false
        hit.CanTouch = true
        hit.CanQuery = true
        hit.Transparency = 0.5
        hit.Material = Enum.Material.Neon
        hit.BrickColor = BrickColor.new("Cyan")
        
        -- Thêm hiệu ứng viền để không bao giờ bị ẩn
        local selection = Instance.new("SelectionBox")
        selection.Adornee = hit
        selection.Color3 = Color3.fromRGB(0, 255, 255)
        selection.LineThickness = 0.08
        selection.Parent = hit
    end
    
    local sizeVal = tonumber(SizeInput.Text) or 20
    hit.Size = Vector3.new(sizeVal, sizeVal, sizeVal)
    hit.CFrame = root.CFrame
end

-- Chạy mỗi khung hình (RenderStepped) để đảm bảo không bị trễ nhịp
RunService.RenderStepped:Connect(function()
    if _G_Enabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and (SelectedPlayer == "Tất cả" or SelectedPlayer == p.Name) then
                CreatePersistentHitbox(p)
            end
        end
    end
end)

-- Giao diện Refresh
local function RefreshList()
    for _, child in pairs(PlayerList:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
    local function createEntry(name)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 30)
        btn.Text = name
        btn.BackgroundColor3 = (SelectedPlayer == name) and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(45, 45, 45)
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Parent = PlayerList
        btn.MouseButton1Click:Connect(function() SelectedPlayer = name RefreshList() end)
    end
    createEntry("Tất cả")
    for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then createEntry(p.Name) end end
end

ToggleBtn.MouseButton1Click:Connect(function()
    _G_Enabled = not _G_Enabled
    ToggleBtn.Text = _G_Enabled and "ON" or "OFF"
    ToggleBtn.BackgroundColor3 = _G_Enabled and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(0, 170, 127)
    
    if not _G_Enabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("SupremeHitboxV15") then
                p.Character.SupremeHitboxV15:Destroy()
            end
        end
    end
end)

Players.PlayerAdded:Connect(RefreshList)
Players.PlayerRemoving:Connect(RefreshList)
RefreshList()
