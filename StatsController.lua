local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Kiểm tra nếu GUI đã tồn tại thì xóa trước
if player:WaitForChild("PlayerGui"):FindFirstChild("vvahfvsdhfStatsGUIaytfgvhgf") then
    player.PlayerGui.vvahfvsdhfStatsGUIaytfgvhgf:Destroy()
end

-- ScreenGui mới
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.Name = "vvahfvsdhfStatsGUIaytfgvhgf"

-- Hàm tạo thông báo
local function showNotification(msg)
    local notify = Instance.new("TextLabel")
    notify.Parent = ScreenGui
    notify.Size = UDim2.new(0, 200, 0, 50)
    notify.Position = UDim2.new(0.5, -100, 0.9, 0)
    notify.BackgroundColor3 = Color3.fromRGB(0,0,0)
    notify.BackgroundTransparency = 0.3
    notify.TextColor3 = Color3.new(1,1,1)
    notify.Font = Enum.Font.SourceSansBold
    notify.TextScaled = true
    notify.Text = msg
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0.2,0)
    UICorner.Parent = notify
    task.delay(2, function() notify:Destroy() end)
end

-- Frame chính
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.05, 0, 0.05, 0)
Frame.Size = UDim2.new(0, 250, 0, 220)
Frame.Active = true
Frame.Draggable = true
local UICornerFrame = Instance.new("UICorner")
UICornerFrame.CornerRadius = UDim.new(0.1,0)
UICornerFrame.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Text = "Stats Controller"
Title.Size = UDim2.new(1, 0, 0.15, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextScaled = true

-- Nút X
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.Text = "X"
CloseButton.TextScaled = true
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
local UICornerClose = Instance.new("UICorner")
UICornerClose.CornerRadius = UDim.new(0.5,0)
UICornerClose.Parent = CloseButton

-- Nút +
local OpenButton = Instance.new("TextButton")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 40, 0, 40)
OpenButton.Text = "+"
OpenButton.TextScaled = true
OpenButton.Visible = false
OpenButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
OpenButton.TextColor3 = Color3.new(1,1,1)
OpenButton.Font = Enum.Font.SourceSansBold
local UICornerOpen = Instance.new("UICorner")
UICornerOpen.CornerRadius = UDim.new(1,0)
UICornerOpen.Parent = OpenButton

-- Drag cho nút +
local dragging = false
local dragStart, startPos
OpenButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = OpenButton.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
OpenButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        local delta = input.Position - dragStart
        OpenButton.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Đóng UI bằng nút X
CloseButton.MouseButton1Click:Connect(function()
    local tween = TweenService:Create(Frame, TweenInfo.new(0.5), {BackgroundTransparency = 1})
    tween:Play()
    tween.Completed:Wait()
    Frame.Visible = false
    Frame.BackgroundTransparency = 0
    OpenButton.Position = UDim2.new(0, Frame.AbsolutePosition.X, 0, Frame.AbsolutePosition.Y)
    OpenButton.Visible = true
    showNotification("UI đã đóng")
end)

-- Mở lại UI bằng nút +
OpenButton.MouseButton1Click:Connect(function()
    Frame.Position = OpenButton.Position
    Frame.Visible = true
    Frame.BackgroundTransparency = 1
    local tween = TweenService:Create(Frame, TweenInfo.new(0.5), {BackgroundTransparency = 0})
    tween:Play()
    tween.Completed:Wait()
    OpenButton.Visible = false
    showNotification("UI đã mở lại")
end)

-- Toggle bằng phím G
UIS.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.G then
        if Frame.Visible then
            CloseButton:Activate()
            showNotification("UI đã đóng bằng phím G")
        else
            OpenButton:Activate()
            showNotification("UI đã mở lại bằng phím G")
        end
    end
end)

-- Hiệu ứng cầu vồng
local function rainbowEffect(guiObject)
    local colors = {
        Color3.fromRGB(255,0,0),
        Color3.fromRGB(255,127,0),
        Color3.fromRGB(255,255,0),
        Color3.fromRGB(0,255,0),
        Color3.fromRGB(0,0,255),
        Color3.fromRGB(75,0,130),
        Color3.fromRGB(148,0,211)
    }
    local i = 1
    while guiObject.Parent do
        local nextColor = colors[i]
        local tween = TweenService:Create(guiObject, TweenInfo.new(2, Enum.EasingStyle.Linear), {BackgroundColor3 = nextColor})
        tween:Play()
        tween.Completed:Wait()
        i = i + 1
        if i > #colors then i = 1 end
    end
end
task.spawn(function() rainbowEffect(Frame) end)
task.spawn(function() rainbowEffect(OpenButton) end)

-- Speed/Jump controls
local SpeedBox = Instance.new("TextBox")
SpeedBox.Parent = Frame
SpeedBox.Position = UDim2.new(0.1, 0, 0.2, 0)
SpeedBox.Size = UDim2.new(0.8, 0, 0.15, 0)
SpeedBox.Text = "16"
SpeedBox.TextScaled = true

local SpeedButton = Instance.new("TextButton")
SpeedButton.Parent = Frame
SpeedButton.Position = UDim2.new(0.1, 0, 0.37, 0)
SpeedButton.Size = UDim2.new(0.35, 0, 0.15, 0)
SpeedButton.Text = "Apply Speed"
SpeedButton.TextScaled = true

local SpeedToggle = Instance.new("TextButton")
SpeedToggle.Parent = Frame
SpeedToggle.Position = UDim2.new(0.55, 0, 0.37, 0)
SpeedToggle.Size = UDim2.new(0.35, 0, 0.15, 0)
SpeedToggle.Text = "ON"
SpeedToggle.TextScaled = true
SpeedToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)

local JumpBox = Instance.new("TextBox")
JumpBox.Parent = Frame
JumpBox.Position = UDim2.new(0.1, 0, 0.55, 0)
JumpBox.Size = UDim2.new(0.8, 0, 0.15, 0)
JumpBox.Text = "10"
JumpBox.TextScaled = true

local JumpButton = Instance.new("TextButton")
JumpButton.Parent = Frame
JumpButton.Position = UDim2.new(0.1, 0, 0.72, 0)
JumpButton.Size = UDim2.new(0.35, 0, 0.15, 0)
JumpButton.Text = "Apply Jump"
JumpButton.TextScaled = true

local JumpToggle = Instance.new("TextButton")
JumpToggle.Parent = Frame
JumpToggle.Position = UDim2.new(0.55, 0, 0.72, 0)
JumpToggle.Size = UDim2.new(0.35, 0, 0.15, 0)
JumpToggle.Text = "ON"
JumpToggle.TextScaled = true
JumpToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)

-- Biến lưu trạng thái
local desiredSpeed = tonumber(SpeedBox.Text) or 16
local desiredJump = tonumber(JumpBox.Text) or 10
local speedEnabled = true
local jumpEnabled = true
local defaultSpeed = 16
local defaultJump = 10

-- Lấy giá trị mặc định từ Humanoid khi spawn
player.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    defaultSpeed = hum.WalkSpeed
    defaultJump = hum.JumpPower
end)

-- Toggle Speed
SpeedToggle.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    SpeedToggle.Text = speedEnabled and "ON" or "OFF"
    SpeedToggle.BackgroundColor3 = speedEnabled and Color3.fromRGB(0,170,0) or Color3.fromRGB(170,0,0)

    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
    if hum then
        if speedEnabled then
            hum.WalkSpeed = desiredSpeed
        else
            hum.WalkSpeed = defaultSpeed
        end
    end
end)

-- Toggle Jump
JumpToggle.MouseButton1Click:Connect(function()
    jumpEnabled = not jumpEnabled
    JumpToggle.Text = jumpEnabled and "ON" or "OFF"
    JumpToggle.BackgroundColor3 = jumpEnabled and Color3.fromRGB(0,170,0) or Color3.fromRGB(170,0,0)

    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
    if hum then
        if jumpEnabled then
            -- Khi ON: áp dụng giá trị nhập
            if hum.UseJumpPower then
                hum.JumpPower = desiredJump
            else
                hum.JumpHeight = desiredJump
            end
        else
            -- Khi OFF: trả về mặc định game ngay lập tức
            if hum.UseJumpPower then
                hum.JumpPower = defaultJump
            else
                hum.JumpHeight = defaultJump
            end
        end
    end
end)

-- Apply Speed
SpeedButton.MouseButton1Click:Connect(function()
    local val = tonumber(SpeedBox.Text)
    if val then
        desiredSpeed = val
        local hum = player.Character and player.Character:FindFirstChild("Humanoid")
        if hum and speedEnabled then
            hum.WalkSpeed = desiredSpeed -- áp dụng ngay khi ON
        end
    else
        SpeedBox.Text = tostring(desiredSpeed)
    end
end)

-- Apply Jump
JumpButton.MouseButton1Click:Connect(function()
    local val = tonumber(JumpBox.Text)
    if val then
        desiredJump = val
        local hum = player.Character and player.Character:FindFirstChild("Humanoid")
        if hum then
            if jumpEnabled then
                -- Nếu toggle đang ON thì áp dụng ngay
                if hum.UseJumpPower then
                    hum.JumpPower = desiredJump
                else
                    hum.JumpHeight = desiredJump
                end
            else
                -- Nếu toggle OFF thì giữ mặc định
                if hum.UseJumpPower then
                    hum.JumpPower = defaultJump
                else
                    hum.JumpHeight = defaultJump
                end
            end
        end
    else
        JumpBox.Text = tostring(desiredJump)
    end
end)

-- Luôn giữ giá trị khi bật toggle
RunService.RenderStepped:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        if speedEnabled then
            player.Character.Humanoid.WalkSpeed = desiredSpeed
        end
        if jumpEnabled then
            player.Character.Humanoid.JumpPower = desiredJump
        end
    end
end)