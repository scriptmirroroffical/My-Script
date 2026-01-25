local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- TẠO GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ESP_System_Fixed"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Hàm xử lý kéo thả mượt mà
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
-- GIAO DIỆN CHÍNH (MainFrame)
----------------------------------------------------------------
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 160, 0, 50)
MainFrame.Position = UDim2.new(0.5, -80, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = screenGui
MakeDraggable(MainFrame) -- Áp dụng kéo thả

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local ESPButton = Instance.new("TextButton")
ESPButton.Size = UDim2.new(0.7, 0, 0.8, 0)
ESPButton.Position = UDim2.new(0.05, 0, 0.1, 0)
ESPButton.Text = "ESP: OFF"
ESPButton.Font = Enum.Font.GothamBold
ESPButton.TextColor3 = Color3.new(1, 1, 1)
ESPButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ESPButton.Parent = MainFrame
Instance.new("UICorner", ESPButton).CornerRadius = UDim.new(0, 6)

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0.15, 0, 0.8, 0)
MinimizeButton.Position = UDim2.new(0.8, 0, 0.1, 0)
MinimizeButton.Text = "_"
MinimizeButton.TextSize = 20
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.Parent = MainFrame
Instance.new("UICorner", MinimizeButton).CornerRadius = UDim.new(0, 6)

----------------------------------------------------------------
-- GIAO DIỆN DẤU CỘNG (MiniFrame)
----------------------------------------------------------------
local MiniFrame = Instance.new("Frame")
MiniFrame.Size = UDim2.new(0, 40, 0, 40)
MiniFrame.Position = MainFrame.Position
MiniFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MiniFrame.Visible = false
MiniFrame.Active = true
MiniFrame.Parent = screenGui
MakeDraggable(MiniFrame) -- Áp dụng kéo thả cho dấu +
Instance.new("UICorner", MiniFrame).CornerRadius = UDim.new(1, 0) -- Làm dấu + hình tròn

local PlusButton = Instance.new("TextButton")
PlusButton.Size = UDim2.new(1, 0, 1, 0)
PlusButton.Text = "+"
PlusButton.TextSize = 30
PlusButton.Font = Enum.Font.GothamBold
PlusButton.TextColor3 = Color3.fromRGB(0, 255, 0)
PlusButton.BackgroundTransparency = 1
PlusButton.Parent = MiniFrame

----------------------------------------------------------------
-- LOGIC ẨN/HIỆN
----------------------------------------------------------------
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
-- LOGIC ESP
----------------------------------------------------------------
local espEnabled = false

local function createESP(player, color)
	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		local root = char.HumanoidRootPart
		local box = root:FindFirstChild("MyESP") or Instance.new("BoxHandleAdornment")
		box.Name = "MyESP"
		box.Adornee = root
		box.AlwaysOnTop = true
		box.ZIndex = 10
		box.Size = Vector3.new(3.5, 5, 3.5)
		box.Transparency = 0.5
		box.Color3 = color
		box.Parent = root
	end
end

local function removeESP()
	for _, player in pairs(Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local old = player.Character.HumanoidRootPart:FindFirstChild("MyESP")
			if old then old:Destroy() end
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

RunService.RenderStepped:Connect(function()
	if espEnabled then
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character then
				local finalColor = Color3.fromRGB(0, 255, 0) -- Innocent
				
				local items = player.Backpack:GetChildren()
				for _, item in pairs(player.Character:GetChildren()) do
					if item:IsA("Tool") then table.insert(items, item) end
				end

				for _, tool in pairs(items) do
					local name = tool.Name:lower()
					if name:find("knife") then
						finalColor = Color3.fromRGB(255, 0, 0) -- Murderer
						break
					elseif name:find("gun") or name:find("revolver") then
						finalColor = Color3.fromRGB(135, 206, 250) -- Sheriff (Xanh nhạt)
						break
					end
				end
				createESP(player, finalColor)
			end
		end
	end
end)