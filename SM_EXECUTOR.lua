local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScreenGui"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Name = "Main"
main.BackgroundColor3 = Color3.new(1, 0.667, 0)
main.Position = UDim2.new(0.266, 0, 0.0599, 0)
main.BorderColor3 = Color3.new()
main.BorderSizePixel = 0
main.Size = UDim2.new(0, 857, 0, 46)
main.Parent = screenGui

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.TextWrapped = true
minimizeButton.TextColor3 = Color3.new()
minimizeButton.Text = "_"
minimizeButton.BackgroundColor3 = Color3.new(0.561, 0.561, 0.561)
minimizeButton.BorderSizePixel = 0
minimizeButton.TextScaled = true
minimizeButton.Position = UDim2.new(0.862, 0, -0.0217, 0)
minimizeButton.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json")
minimizeButton.BorderColor3 = Color3.new()
minimizeButton.TextSize = 14
minimizeButton.Size = UDim2.new(0, 59, 0, 46)
minimizeButton.Parent = main

local uICorner = Instance.new("UICorner")
uICorner.Name = "UICorner"
uICorner.CornerRadius = UDim.new(1, 0)
uICorner.Parent = minimizeButton

local name_exec = Instance.new("TextLabel")
name_exec.Name = "Name.exec"
name_exec.FontFace = Font.new(
	"rbxasset://fonts/families/JosefinSans.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Italic
)
name_exec.TextColor3 = Color3.new()
name_exec.Text = "SM Executor"
name_exec.BackgroundColor3 = Color3.new(1, 0.667, 0)
name_exec.BorderSizePixel = 0
name_exec.TextScaled = true
name_exec.Position = UDim2.new(0.0595, 0, 0.174, 0)
name_exec.TextWrapped = true
name_exec.BorderColor3 = Color3.new()
name_exec.TextSize = 14
name_exec.Size = UDim2.new(0, 251, 0, 37)
name_exec.Parent = main

local uICorner_2 = Instance.new("UICorner")
uICorner_2.Name = "UICorner"
uICorner_2.CornerRadius = UDim.new(1, 0)
uICorner_2.Parent = name_exec

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.TextWrapped = true
closeButton.TextColor3 = Color3.new()
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.TextScaled = true
closeButton.Position = UDim2.new(0.931, 0, 0, 0)
closeButton.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json")
closeButton.BorderColor3 = Color3.new()
closeButton.TextSize = 14
closeButton.Size = UDim2.new(0, 59, 0, 47)
closeButton.Parent = main

local uICorner_3 = Instance.new("UICorner")
uICorner_3.Name = "UICorner"
uICorner_3.CornerRadius = UDim.new(1, 0)
uICorner_3.Parent = closeButton

local uICorner_4 = Instance.new("UICorner")
uICorner_4.Name = "UICorner"
uICorner_4.CornerRadius = UDim.new(1, 0)
uICorner_4.Parent = main

local logo = Instance.new("ImageLabel")
logo.Name = "Logo"
logo.Image = "rbxassetid://88774721887954"
logo.BackgroundColor3 = Color3.new(1, 1, 1)
logo.BorderColor3 = Color3.new()
logo.BorderSizePixel = 0
logo.Size = UDim2.new(0, 51, 0, 45)
logo.Parent = main

local uICorner_5 = Instance.new("UICorner")
uICorner_5.Name = "UICorner"
uICorner_5.CornerRadius = UDim.new(1, 0)
uICorner_5.Parent = logo

local output = Instance.new("Frame")
output.Name = "Output"
output.BackgroundColor3 = Color3.new()
output.Position = UDim2.new(0.523, 0, 0.101, 0)
output.BorderColor3 = Color3.new()
output.BorderSizePixel = 0
output.Size = UDim2.new(0, 507, 0, 517)
output.Parent = screenGui

local uICorner_6 = Instance.new("UICorner")
uICorner_6.Name = "UICorner"
uICorner_6.Parent = output

-- Tạo ScrollingFrame thay cho TextLabel
local backout_2 = Instance.new("ScrollingFrame")
backout_2.Name = "Output"
backout_2.BackgroundColor3 = Color3.new(0.498, 0.498, 0.498)
backout_2.BorderSizePixel = 0
backout_2.BorderColor3 = Color3.new()
backout_2.Position = UDim2.new(0.00986, 0, 0.0155, 0)
backout_2.Size = UDim2.new(0, 496, 0, 500)
backout_2.CanvasSize = UDim2.new(0, 0, 0, 0) -- sẽ tự chỉnh theo nội dung
backout_2.ScrollBarThickness = 8
backout_2.Parent = output

-- Tạo TextLabel bên trong ScrollingFrame để hiển thị chữ
local output_2 = Instance.new("TextLabel")
output_2.Name = "TextInside"
output_2.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json")
output_2.TextColor3 = Color3.new()
output_2.Text = "Welcome to SM Executor"
output_2.BackgroundTransparency = 1
output_2.BorderSizePixel = 0
output_2.TextWrapped = true
output_2.TextXAlignment = Enum.TextXAlignment.Left
output_2.TextYAlignment = Enum.TextYAlignment.Top
output_2.TextSize = 35
output_2.Size = UDim2.new(1, -10, 0, 500) -- rộng bằng ScrollingFrame, trừ đi chút cho scrollbar
output_2.Position = UDim2.new(0, 5, 0, 0)
output_2.Parent = backout_2

-- Cập nhật CanvasSize theo nội dung
output_2:GetPropertyChangedSignal("TextBounds"):Connect(function()
	backout_2.CanvasSize = UDim2.new(0, 0, 0, output_2.TextBounds.Y + 20)
end)

-- Gọi lần đầu
backout_2.CanvasSize = UDim2.new(0, 0, 0, output_2.TextBounds.Y + 20)

local uICorner_7 = Instance.new("UICorner")
uICorner_7.Name = "UICorner"
uICorner_7.Parent = output_2

local exec = Instance.new("Frame")
exec.Name = "Exec"
exec.BackgroundColor3 = Color3.new()
exec.Position = UDim2.new(0.146, 0, 0.0998, 0)
exec.BorderColor3 = Color3.new()
exec.BorderSizePixel = 0
exec.Size = UDim2.new(0, 857, 0, 518)
exec.Parent = screenGui

local uICorner_8 = Instance.new("UICorner")
uICorner_8.Name = "UICorner"
uICorner_8.Parent = exec

local mainExec = Instance.new("Frame")
mainExec.Name = "MainExec"
mainExec.BackgroundColor3 = Color3.new(1, 0.667, 0)
mainExec.Position = UDim2.new(0.0105, 0, 0.0174, 0)
mainExec.BorderColor3 = Color3.new()
mainExec.BorderSizePixel = 0
mainExec.Size = UDim2.new(0, 839, 0, 500)
mainExec.Parent = exec

local uICorner_9 = Instance.new("UICorner")
uICorner_9.Name = "UICorner"
uICorner_9.Parent = mainExec

local inputSctipt = Instance.new("TextBox")
inputSctipt.Name = "InputSctipt"
inputSctipt.CursorPosition = -1
inputSctipt.TextColor3 = Color3.new()
inputSctipt.Text = ""
inputSctipt.BackgroundColor3 = Color3.new(0.561, 0.561, 0.561)
inputSctipt.BorderSizePixel = 0
inputSctipt.BorderColor3 = Color3.new()
inputSctipt.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json")
inputSctipt.TextXAlignment = Enum.TextXAlignment.Left
inputSctipt.Position = UDim2.new(0.0215, 0, 0.026, 0)
inputSctipt.TextYAlignment = Enum.TextYAlignment.Top
inputSctipt.TextSize = 14
inputSctipt.Size = UDim2.new(0, 805, 0, 415)
inputSctipt.Parent = mainExec

local uICorner_10 = Instance.new("UICorner")
uICorner_10.Name = "UICorner"
uICorner_10.Parent = inputSctipt

local textButton = Instance.new("TextButton")
textButton.Name = "TextButton"
textButton.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Italic
)
textButton.TextColor3 = Color3.new()
textButton.Text = "ATTACH"
textButton.BackgroundColor3 = Color3.new(0.333, 1, 1)
textButton.TextScaled = true
textButton.BorderSizePixel = 0
textButton.Position = UDim2.new(0.722, 0, 0.881, 0)
textButton.TextWrapped = true
textButton.BorderColor3 = Color3.new()
textButton.TextSize = 14
textButton.Size = UDim2.new(0, 200, 0, 50)
textButton.Parent = mainExec

local uICorner_11 = Instance.new("UICorner")
uICorner_11.Name = "UICorner"
uICorner_11.CornerRadius = UDim.new(1, 0)
uICorner_11.Parent = textButton

local textButton_2 = Instance.new("TextButton")
textButton_2.Name = "TextButton"
textButton_2.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Normal
)
textButton_2.TextColor3 = Color3.new()
textButton_2.Text = "SCAN SS"
textButton_2.BackgroundColor3 = Color3.new(1, 0, 0)
textButton_2.TextScaled = true
textButton_2.BorderSizePixel = 0
textButton_2.Position = UDim2.new(0.28, 0, 0.882, 0)
textButton_2.TextWrapped = true
textButton_2.BorderColor3 = Color3.new()
textButton_2.TextSize = 14
textButton_2.Size = UDim2.new(0, 200, 0, 50)
textButton_2.Parent = mainExec

local uICorner_12 = Instance.new("UICorner")
uICorner_12.Name = "UICorner"
uICorner_12.CornerRadius = UDim.new(1, 0)
uICorner_12.Parent = textButton_2

local eXECButton = Instance.new("TextButton")
eXECButton.Name = "EXECButton"
eXECButton.TextWrapped = true
eXECButton.TextColor3 = Color3.new()
eXECButton.Text = "EXECUTE"
eXECButton.BackgroundColor3 = Color3.new(0, 0.667, 1)
eXECButton.BorderSizePixel = 0
eXECButton.TextScaled = true
eXECButton.Position = UDim2.new(0.0327, 0, 0.881, 0)
eXECButton.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Normal
)
eXECButton.BorderColor3 = Color3.new()
eXECButton.TextSize = 14
eXECButton.Size = UDim2.new(0, 200, 0, 50)
eXECButton.Parent = mainExec

local uICorner_13 = Instance.new("UICorner")
uICorner_13.Name = "UICorner"
uICorner_13.CornerRadius = UDim.new(1, 0)
uICorner_13.Parent = eXECButton

local lOGO_WHEN_ATTACHED = Instance.new("Frame")
lOGO_WHEN_ATTACHED.Name = "LOGO_WHEN_ATTACHED"
lOGO_WHEN_ATTACHED.BackgroundColor3 = Color3.new(1, 1, 1)
lOGO_WHEN_ATTACHED.BackgroundTransparency = 1
lOGO_WHEN_ATTACHED.Position = UDim2.new(0.0247, 0, 0.826, 0)
lOGO_WHEN_ATTACHED.BorderColor3 = Color3.new()
lOGO_WHEN_ATTACHED.BorderSizePixel = 0
lOGO_WHEN_ATTACHED.Size = UDim2.new(0, 162, 0, 162)
lOGO_WHEN_ATTACHED.Parent = screenGui

local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "ImageLabel"
imageLabel.BorderColor3 = Color3.new()
imageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
imageLabel.Image = "rbxassetid://124336823407341"
imageLabel.BackgroundTransparency = 1
imageLabel.Position = UDim2.new(-0.0163, 0, 0.0926, 0)
imageLabel.BorderSizePixel = 0
imageLabel.Size = UDim2.new(0, 162, 0, 131)
imageLabel.Parent = lOGO_WHEN_ATTACHED

local uICorner_14 = Instance.new("UICorner")
uICorner_14.Name = "UICorner"
uICorner_14.CornerRadius = UDim.new(1, 0)
uICorner_14.Parent = imageLabel

local imageLabel_2 = Instance.new("ImageLabel")
imageLabel_2.Name = "ImageLabel"
imageLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
imageLabel_2.Image = "rbxassetid://88774721887954"
imageLabel_2.Position = UDim2.new(0.426, 0, -0.0123, 0)
imageLabel_2.BorderColor3 = Color3.new()
imageLabel_2.BorderSizePixel = 0
imageLabel_2.Size = UDim2.new(0, 45, 0, 42)
imageLabel_2.Parent = lOGO_WHEN_ATTACHED

local uICorner_15 = Instance.new("UICorner")
uICorner_15.Name = "UICorner"
uICorner_15.CornerRadius = UDim.new(1, 0)
uICorner_15.Parent = imageLabel_2

local uICorner_16 = Instance.new("UICorner")
uICorner_16.Name = "UICorner"
uICorner_16.Parent = lOGO_WHEN_ATTACHED

local imageLabel_3 = Instance.new("ImageLabel")
imageLabel_3.Name = "ImageLabel"
imageLabel_3.BorderColor3 = Color3.new()
imageLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
imageLabel_3.Image = "rbxassetid://124001967339217"
imageLabel_3.BackgroundTransparency = 1
imageLabel_3.Position = UDim2.new(-0.124, 0, -0.0123, 0)
imageLabel_3.BorderSizePixel = 0
imageLabel_3.Size = UDim2.new(0, 196, 0, 165)
imageLabel_3.Parent = lOGO_WHEN_ATTACHED

local camera = workspace.CurrentCamera
local masterFrame = script.Parent
local uiScale = Instance.new("UIScale", masterFrame)

-- Độ phân giải màn hình của BẠN lúc thiết kế (ví dụ 1920x1080)
local DESIGN_RES = Vector2.new(1920, 1080) 

local function resize()
	local viewportSize = camera.ViewportSize
	-- Tính tỷ lệ dựa trên chiều ngang màn hình hiện tại
	local scaleFactor = viewportSize.X / DESIGN_RES.X

	-- Giới hạn scale (không để nó quá nhỏ trên điện thoại)
	uiScale.Scale = math.clamp(scaleFactor, 0.4, 1.2) 
end

-- Cập nhật mỗi khi người chơi thay đổi kích thước màn hình
camera:GetPropertyChangedSignal("ViewportSize"):Connect(resize)
resize() -- Chạy ngay khi bắt đầu

-- ==========================================
-- SM ENGINE CORE v3.5 - FULL OPTIMIZED
-- ==========================================
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

-- [ KHAI BÁO BIẾN UI ] - Đảm bảo bạn đã map đúng các biến này với GUI của bạn
-- local screenGui = script.Parent
-- local main, exec, output = screenGui.Main, screenGui.Exec, screenGui.Output
-- local output_2 = output.LogTextLabel -- Label chứa text log, nhớ bật RichText = true
-- local inputSctipt = exec.InputBox
-- local textButton = main.AttachButton
-- local eXECButton = exec.ExecuteButton
-- local textButton_2 = main.ScanButton
-- local closeButton = main.CloseButton
-- local minimizeButton = main.MinimizeButton
-- local lOGO_WHEN_ATTACHED, imageLabel_2 = main.Logo, main.Logo.OrbitIcon
-- local clearButton = output.ClearButton
-- local autoExecToggle = exec.AutoExecToggle
-- local execSSButton = exec.ExecSSButton

-- ==========================================
-- 1. CẤU HÌNH & TRẠNG THÁI HỆ THỐNG
-- ==========================================
local EngineState = {
	IsAttached = false,
	IsMinimized = false,
	AutoExecEnabled = false,
	LogCount = 0,
	MaxLogs = 100,
	DragSpeed = 0.15,
	AutoExecFile = "SMEngine_AutoExec.txt"
}

local Colors = {
	Info = Color3.fromRGB(0, 170, 255),
	Success = Color3.fromRGB(0, 255, 100),
	Warning = Color3.fromRGB(255, 170, 0),
	Error = Color3.fromRGB(255, 50, 50),
	Text = Color3.fromRGB(240, 240, 240),
	System = Color3.fromRGB(170, 85, 255)
}

local tInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

-- ==========================================
-- 2. HỆ THỐNG FILE & LOGGER
-- ==========================================
local function safeWriteFile(name, content)
	if writefile then pcall(function() writefile(name, content) end) end
end

local function safeReadFile(name)
	if readfile and isfile and isfile(name) then
		local s, c = pcall(function() return readfile(name) end)
		if s then return c end
	end
	return nil
end

local function logMessage(text, colorType)
	local color = colorType or Colors.Text
	local stamp = string.format("<font color=\"#888888\">[%s]</font>", os.date("%X"))
	local hex = string.format("#%02X%02X%02X", color.R*255, color.G*255, color.B*255)

	EngineState.LogCount = EngineState.LogCount + 1
	if EngineState.LogCount > EngineState.MaxLogs then
		local currentText = output_2.Text
		local firstLineBreak = currentText:find("\n")
		if firstLineBreak then
			output_2.Text = currentText:sub(firstLineBreak + 1)
			EngineState.LogCount = EngineState.LogCount - 1
		end
	end

	local msg = string.format("\n%s <font color=\"%s\">[>] %s</font>", stamp, hex, tostring(text))
	output_2.Text = output_2.Text .. msg

	pcall(function()
		local scroll = output_2.Parent
		if scroll and scroll:IsA("ScrollingFrame") then
			scroll.CanvasPosition = Vector2.new(0, scroll.AbsoluteWindowSize.Y + 9999)
		end
	end)
end

-- ==========================================
-- HỆ THỐNG KÉO THẢ TỐI ƯU (SMOOTH DRAG)
-- ==========================================
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function makeDraggableSmooth(mainFrame, attachedObjects, lerpSpeed)
	-- Kiểm tra nếu người dùng bỏ trống attachedObjects nhưng lại nhập lerpSpeed
	if type(attachedObjects) == "number" then
		lerpSpeed = attachedObjects
		attachedObjects = {}
	end

	attachedObjects = attachedObjects or {}
	lerpSpeed = lerpSpeed or 0.15

	local dragging = false
	local dragInput
	local dragStart
	local startPositions = {}
	local targetPositions = {}

	local function update(input)
		local delta = input.Position - dragStart

		-- Tính toán vị trí cho Frame chính
		local sPosMain = startPositions[mainFrame]
		targetPositions[mainFrame] = UDim2.new(
			sPosMain.X.Scale, sPosMain.X.Offset + delta.X, 
			sPosMain.Y.Scale, sPosMain.Y.Offset + delta.Y
		)

		-- Tính toán cho các object đi kèm
		for _, obj in ipairs(attachedObjects) do
			local sPos = startPositions[obj]
			if sPos then
				targetPositions[obj] = UDim2.new(
					sPos.X.Scale, sPos.X.Offset + delta.X, 
					sPos.Y.Scale, sPos.Y.Offset + delta.Y
				)
			end
		end
	end

	mainFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position

			startPositions[mainFrame] = mainFrame.Position
			for _, obj in ipairs(attachedObjects) do
				startPositions[obj] = obj.Position
			end

			local connection
			connection = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
					connection:Disconnect()
				end
			end)
		end
	end)

	mainFrame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and input == dragInput then
			update(input)
		end
	end)

	RunService.RenderStepped:Connect(function()
		if dragging then
			-- Chỉ Lerp khi đang kéo để tiết kiệm hiệu năng
			mainFrame.Position = mainFrame.Position:Lerp(targetPositions[mainFrame], lerpSpeed)
			for _, obj in ipairs(attachedObjects) do
				if targetPositions[obj] then
					obj.Position = obj.Position:Lerp(targetPositions[obj], lerpSpeed)
				end
			end
		end
	end)
end

-- CÁCH SỬ DỤNG ĐÚNG:
-- Nếu bạn muốn kéo main mà exec và output đi theo:
makeDraggableSmooth(main, {exec, output}, 0.2)
makeDraggableSmooth(exec, 0.2)
makeDraggableSmooth(output, 0.2)

-- ĐỪNG gọi thêm makeDraggableSmooth cho exec và output nếu chúng đã là con của main 
-- hoặc bạn đã khai báo chúng trong bảng attachedObjects ở trên.
-- Cách sử dụng:
-- Giả sử bạn có 'MainFrame', 'ExecFrame', 'OutputFrame'
-- makeDraggableSmooth(MainFrame, {ExecFrame, OutputFrame}, 0.2)

-- ==========================================
-- 4. QUẢN LÝ CỬA SỔ & HOẠT ẢNH
-- ==========================================
if closeButton then
	closeButton.MouseButton1Click:Connect(function()
		logMessage("Shutting down engine...", Colors.Warning)

		-- Ẩn icon xoay trước để tránh lỗi hiển thị khi cha đang thu nhỏ
		if imageLabel_2 then imageLabel_2.Visible = false end

		local tMain = TweenService:Create(main, tInfo, {Size = UDim2.new(0,0,0,0), BackgroundTransparency = 1})
		-- ... (giữ nguyên phần code Tween các bảng khác của bạn)
		tMain:Play()
		tMain.Completed:Connect(function() if screenGui then screenGui:Destroy() end end)
	end)
end

if minimizeButton then
	minimizeButton.MouseButton1Click:Connect(function()
		EngineState.IsMinimized = not EngineState.IsMinimized
		local targetAlpha = EngineState.IsMinimized and 1 or 0
		local targetVis = not EngineState.IsMinimized

		if exec then
			TweenService:Create(exec, tInfo, {BackgroundTransparency = targetAlpha}):Play()
			for _, v in pairs(exec:GetDescendants()) do if v:IsA("GuiObject") then v.Visible = targetVis end end
		end
		if output then
			TweenService:Create(output, tInfo, {BackgroundTransparency = targetAlpha}):Play()
			for _, v in pairs(output:GetDescendants()) do if v:IsA("GuiObject") then v.Visible = targetVis end end
		end
		logMessage(EngineState.IsMinimized and "Windows Minimized." or "Windows Restored.", Colors.Info)
	end)
end

if clearButton then
	clearButton.MouseButton1Click:Connect(function()
		if output_2 then
			output_2.Text = ""
			EngineState.LogCount = 0
			logMessage("Output Cleared.", Colors.System)
		end
	end)
end

if autoExecToggle then
	autoExecToggle.MouseButton1Click:Connect(function()
		EngineState.AutoExecEnabled = not EngineState.AutoExecEnabled
		if EngineState.AutoExecEnabled then
			if inputSctipt.Text ~= "" then safeWriteFile(EngineState.AutoExecFile, inputSctipt.Text) end
			logMessage("Auto-Execute ENABLED.", Colors.Success)
			autoExecToggle.BackgroundColor3 = Colors.Success
		else
			logMessage("Auto-Execute DISABLED.", Colors.Warning)
			autoExecToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		end
	end)
end

-- ==========================================
-- 5. LÕI THỰC THI (ATTACH, EXECUTE, SS, SCAN)
-- ==========================================
if textButton then
	textButton.MouseButton1Click:Connect(function()
		if EngineState.IsAttached then logMessage("Already attached!", Colors.Warning) return end

		textButton.Text = "INJECTING..."
		textButton.BackgroundColor3 = Color3.fromRGB(200, 200, 0)
		logMessage("Bypassing Environment...", Colors.Warning)

		task.spawn(function()
			task.wait(1.2)
			EngineState.IsAttached = true
			textButton.Text = "ATTACHED"
			textButton.BackgroundColor3 = Colors.Success

			logMessage("Attached Successfully! System Ready.", Colors.Success)

			-- (Giữ nguyên phần Auto-Exec của bạn...)
			if EngineState.AutoExecEnabled then
				local savedScript = safeReadFile(EngineState.AutoExecFile)
				if savedScript and savedScript ~= "" then
					logMessage("Running Auto-Exec payload...", Colors.System)
					local func = loadstring(savedScript)
					if func then pcall(func) end
				end
			end
		end)
	end)
end

if eXECButton then
	eXECButton.MouseButton1Click:Connect(function()
		if not EngineState.IsAttached then logMessage("CRITICAL: Not attached!", Colors.Error) return end

		local code = inputSctipt.Text
		if code == "" or code == " " then logMessage("Script is empty.", Colors.Warning) return end

		if EngineState.AutoExecEnabled then safeWriteFile(EngineState.AutoExecFile, code) end

		logMessage("Executing payload...", Colors.Info)
		task.spawn(function()
			local executorLoadstring = loadstring
			if not executorLoadstring then logMessage("Exploit lacks 'loadstring' support.", Colors.Error) return end

			local func, syntaxErr = executorLoadstring(code)
			if func then
				local success, runtimeErr = pcall(func)
				if success then logMessage("Execution Complete.", Colors.Success)
				else logMessage("Runtime Error: " .. tostring(runtimeErr), Colors.Error) end
			else
				logMessage("Syntax Error: " .. tostring(syntaxErr), Colors.Error)
			end
		end)
	end)
end

if execSSButton then
	execSSButton.MouseButton1Click:Connect(function()
		if not EngineState.IsAttached then logMessage("CRITICAL: Not attached!", Colors.Error) return end
		local code = inputSctipt.Text
		if code == "" then return end

		logMessage("Attempting SS Execution...", Colors.System)
		local foundSS = false

		task.spawn(function()
			for _, item in pairs(game:GetDescendants()) do
				if _ % 100 == 0 then RunService.Heartbeat:Wait() end 

				local isEvent = item:IsA("RemoteEvent")
				local isFunc = item:IsA("RemoteFunction")

				if isEvent or isFunc then
					local name = item.Name:lower()
					if name:find("runcode") or name:find("loadstring") or name:find("require") or name:find("execute") then
						logMessage("Payload sent to Remote: " .. item.Name, Colors.Info)
						pcall(function()
							if isEvent then item:FireServer(code) else item:InvokeServer(code) end
						end)
						foundSS = true
					end
				end
			end
			if not foundSS then logMessage("SS Failed: No vulnerable Remotes found.", Colors.Error)
			else logMessage("SS Execution sequence finished.", Colors.Success) end
		end)
	end)
end

if textButton_2 then
	textButton_2.MouseButton1Click:Connect(function()
		logMessage("Deep Scan Initiated...", Colors.Warning)
		local foundCount = 0
		local keywords = {"admin", "backdoor", "vulnerable", "loadstring", "require", "runcode", "execute", "servercmd"}

		task.spawn(function()
			for _, item in pairs(game:GetDescendants()) do
				if _ % 100 == 0 then RunService.Heartbeat:Wait() end 

				if item:IsA("RemoteEvent") or item:IsA("RemoteFunction") then
					if item.Name ~= "CharacterSoundEvent" and item.Name ~= "DefaultServerSoundEvent" then
						local name = item.Name:lower()
						for _, word in ipairs(keywords) do
							if name:find(word) then
								logMessage("Threat: " .. item.Name .. " (Key: " .. word .. ")", Colors.Error)
								print("Path: ", item:GetFullName())
								foundCount = foundCount + 1
								break
							end
						end
					end
				end
			end
			logMessage(foundCount > 0 and string.format("Scan Complete: %d threats found.", foundCount) or "Scan Complete: Clean.", foundCount > 0 and Colors.Error or Colors.Success)
		end)
	end)
end

logMessage("SM Engine Full Core Initialized. Awaiting Input...", Colors.Text)

local RunService = game:GetService("RunService")

-- Vòng lớn (Frame chính)
local circleFrame = lOGO_WHEN_ATTACHED

-- Cục số 2 (ImageLabel_2)
local orbitCircle2 = imageLabel_2

-- Bán kính quỹ đạo
local radius = 70
local angle = 0

RunService.RenderStepped:Connect(function(dt)
	-- Tăng góc để tạo chuyển động xoay quanh vòng lớn
	angle = angle + math.rad(90) * dt -- tốc độ xoay quanh vòng lớn

	-- Tính tâm vòng lớn
	local centerX = circleFrame.AbsoluteSize.X/2
	local centerY = circleFrame.AbsoluteSize.Y/2

	-- Tính vị trí mới theo quỹ đạo tròn
	local newX = centerX + math.cos(angle) * radius
	local newY = centerY + math.sin(angle) * radius

	-- Cập nhật vị trí (chỉ chạy vòng quanh, không xoay bản thân)
	orbitCircle2.Position = UDim2.fromOffset(newX - orbitCircle2.Size.X.Offset/2, newY - orbitCircle2.Size.Y.Offset/2)
end)
