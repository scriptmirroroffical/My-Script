local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScreenGui"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game.CoreGui
screenGui.ResetOnSpawn = false

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
output.Size = UDim2.new(0, 507, 0, 580)
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
output_2.RichText = true 
output_2.BackgroundTransparency = 1
output_2.BorderSizePixel = 0
output_2.TextWrapped = true
output_2.TextXAlignment = Enum.TextXAlignment.Left
output_2.TextYAlignment = Enum.TextYAlignment.Top
output_2.TextSize = 18
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
exec.Size = UDim2.new(0, 857, 0, 574)
exec.Parent = screenGui

local uICorner_8 = Instance.new("UICorner")
uICorner_8.Name = "UICorner"
uICorner_8.Parent = exec

local mainExec = Instance.new("Frame")
mainExec.Name = "MainExec"
mainExec.BackgroundColor3 = Color3.new(1, 0.667, 0)
mainExec.Position = UDim2.new(0.011, 0, 0.113, 0)
mainExec.BorderColor3 = Color3.new()
mainExec.BorderSizePixel = 0
mainExec.Size = UDim2.new(0, 839, 0, 500)
mainExec.Parent = exec

local uICorner_9 = Instance.new("UICorner")
uICorner_9.Name = "UICorner"
uICorner_9.Parent = mainExec

-- 1. Khung chứa chính (Cố định kích thước)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 805, 0, 415)
mainFrame.Position = UDim2.new(0.0215, 0, 0.026, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(143, 143, 143)
mainFrame.Parent = mainExec

-- 1. Khung cuộn chính (Chứa cả số dòng và TextBox)
local scroll = Instance.new("ScrollingFrame")
scroll.Name = "CodeEditor"
scroll.Size = UDim2.new(0, 805, 0, 415)
scroll.Position = UDim2.new(0.0215, 0, 0.026, 0)
scroll.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scroll.BorderSizePixel = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.ScrollBarThickness = 8
scroll.Parent = mainExec

-- 2. Cột chứa số dòng (Line Numbers)
local lineCounter = Instance.new("TextLabel")
lineCounter.Name = "LineCounter"
lineCounter.Size = UDim2.new(0, 40, 1, 0) -- Độ rộng cột số dòng là 40
lineCounter.AutomaticSize = Enum.AutomaticSize.Y
lineCounter.BackgroundTransparency = 1
lineCounter.Text = "1"
lineCounter.TextColor3 = Color3.fromRGB(150, 150, 150)
lineCounter.TextSize = 14 -- Số dòng nhỏ xinh
lineCounter.Font = Enum.Font.Code
lineCounter.TextYAlignment = Enum.TextYAlignment.Top
lineCounter.TextXAlignment = Enum.TextXAlignment.Center
lineCounter.Parent = scroll

-- 3. TextBox để nhập Script
local inputSctipt = Instance.new("TextBox")
inputSctipt.Name = "InputSctipt"
inputSctipt.Size = UDim2.new(1, -45, 0, 0) -- Trừ ra khoảng trống cho cột số dòng
inputSctipt.Position = UDim2.new(0, 45, 0, 0)
inputSctipt.AutomaticSize = Enum.AutomaticSize.Y
inputSctipt.BackgroundTransparency = 1
inputSctipt.MultiLine = true
inputSctipt.ClearTextOnFocus = false
inputSctipt.TextWrapped = false -- Tắt cái này để code không bị xuống dòng linh tinh
inputSctipt.TextSize = 16 -- Kích thước vừa đủ đọc
inputSctipt.TextColor3 = Color3.new(1, 1, 1)
inputSctipt.Font = Enum.Font.Code
inputSctipt.TextXAlignment = Enum.TextXAlignment.Left
inputSctipt.TextYAlignment = Enum.TextYAlignment.Top
inputSctipt.Text = ""
inputSctipt.Parent = scroll

-- 4. Logic tự động cập nhật số dòng
local function updateLineNumbers()
	local _, lines = inputSctipt.Text:gsub("\n", "\n")
	local lineText = ""
	for i = 1, lines + 1 do
		lineText = lineText .. i .. "\n"
	end
	lineCounter.Text = lineText
end

-- Cập nhật mỗi khi gõ chữ
inputSctipt:GetPropertyChangedSignal("Text"):Connect(updateLineNumbers)

-- FIX LỖI NHẬP LIỆU: Đảm bảo TextBox luôn có thể nhấn vào
inputSctipt.Active = true 
inputSctipt.Selectable = true

local uICorner_10 = Instance.new("UICorner")
uICorner_10.Name = "UICorner"
uICorner_10.Parent = inputSctipt

local tABIN = Instance.new("Frame")
tABIN.Name = "TABIN"
tABIN.BackgroundTransparency = 1
tABIN.Position = UDim2.new(0.0105, 0, 0.0157, 0)
tABIN.BorderColor3 = Color3.new()
tABIN.BackgroundColor3 = Color3.new(1, 1, 1)
tABIN.BorderSizePixel = 0
tABIN.Size = UDim2.new(0, 838, 0, 42)
tABIN.Parent = exec

local uICorner = Instance.new("UICorner")
uICorner.Name = "UICorner"
uICorner.Parent = tABIN

local addTabBtn = Instance.new("TextButton")
addTabBtn.Name = "TextButton"
addTabBtn.FontFace = Font.new(
	"rbxasset://fonts/families/FredokaOne.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Italic
)
addTabBtn.TextColor3 = Color3.new()
addTabBtn.Text = "+"
addTabBtn.BackgroundColor3 = Color3.new(122, 122, 122)
addTabBtn.TextScaled = true
addTabBtn.BorderSizePixel = 0
addTabBtn.Position = UDim2.new(0.953, 0, 0.095, 0)
addTabBtn.TextWrapped = true
addTabBtn.BorderColor3 = Color3.new()
addTabBtn.TextSize = 14
addTabBtn.Size = UDim2.new(0, 40, 0, 37)
addTabBtn.Parent = tABIN

local uICorneraddTabBtn = Instance.new("UICorner")
uICorneraddTabBtn.Name = "UICorner"
uICorneraddTabBtn.Parent = addTabBtn

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
textButton_2.Name = "TextButton_2"
textButton_2.TextWrapped = true
textButton_2.TextColor3 = Color3.new()
textButton_2.BorderColor3 = Color3.new()
textButton_2.Text = "Scan SS"
textButton_2.BackgroundColor3 = Color3.new(1, 0.333, 0)
textButton_2.BorderSizePixel = 0
textButton_2.Position = UDim2.new(0.209, 0, 0.881, 0)
textButton_2.TextScaled = true
textButton_2.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Italic
)
textButton_2.TextSize = 14
textButton_2.Size = UDim2.new(0, 142, 0, 50)
textButton_2.Parent = mainExec

local uICorner_12 = Instance.new("UICorner")
uICorner_12.Name = "UICorner"
uICorner_12.CornerRadius = UDim.new(1, 0)
uICorner_12.Parent = textButton_2

local resetModeBtn = Instance.new("TextButton")
resetModeBtn.Name = "resetModeBtn"
resetModeBtn.TextWrapped = true
resetModeBtn.TextColor3 = Color3.new()
resetModeBtn.BorderColor3 = Color3.new()
resetModeBtn.Text = "Return to cilent"
resetModeBtn.BackgroundColor3 = Color3.new(0.667, 0.667, 1)
resetModeBtn.BorderSizePixel = 0
resetModeBtn.Position = UDim2.new(0.39, 0, 0.881, 0)
resetModeBtn.TextScaled = true
resetModeBtn.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Italic
)
resetModeBtn.TextSize = 14
resetModeBtn.Size = UDim2.new(0, 133, 0, 50)
resetModeBtn.Parent = mainExec

local uICorner = Instance.new("UICorner")
uICorner.Name = "UICorner"
uICorner.CornerRadius = UDim.new(1, 0)
uICorner.Parent = resetModeBtn

local eXECButton = Instance.new("TextButton")
eXECButton.Name = "EXECButton"
eXECButton.TextWrapped = true
eXECButton.TextColor3 = Color3.new()
eXECButton.Parent = mainExec
eXECButton.BorderColor3 = Color3.new()
eXECButton.Text = "EXECUTE"
eXECButton.BackgroundColor3 = Color3.new(0, 0.667, 1)
eXECButton.BorderSizePixel = 0
eXECButton.Position = UDim2.new(0.0327, 0, 0.881, 0)
eXECButton.TextScaled = true
eXECButton.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Normal
)
eXECButton.TextSize = 14
eXECButton.Size = UDim2.new(0, 142, 0, 50)

local uICorner = Instance.new("UICorner")
uICorner.Name = "UICorner"
uICorner.CornerRadius = UDim.new(1, 0)
uICorner.Parent = eXECButton

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

local clearlog = Instance.new("TextButton")
clearlog.Name = "Clearlog"
clearlog.TextWrapped = true
clearlog.TextColor3 = Color3.new()
clearlog.BorderColor3 = Color3.new()
clearlog.Text = "Clear Log"
clearlog.BackgroundColor3 = Color3.new(0.455, 0.455, 0.455)
clearlog.BorderSizePixel = 0
clearlog.Position = UDim2.new(0.0217, 0, 0.901, 0)
clearlog.TextScaled = true
clearlog.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Normal
)
clearlog.TextSize = 14
clearlog.Size = UDim2.new(0, 200, 0, 50)
clearlog.Parent = output

local spyBtn = Instance.new("TextButton")
spyBtn.Name = "spyBtn"
spyBtn.TextWrapped = true
spyBtn.TextColor3 = Color3.new()
spyBtn.BorderColor3 = Color3.new()
spyBtn.Text = "Remote Spy"
spyBtn.BackgroundColor3 = Color3.new(0.82, 0, 0)
spyBtn.BorderSizePixel = 0
spyBtn.Position = UDim2.new(0.582, 0, 0.901, 0)
spyBtn.TextScaled = true
spyBtn.FontFace = Font.new(
	"rbxasset://fonts/families/PatrickHand.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Normal
)
spyBtn.TextSize = 14
spyBtn.Size = UDim2.new(0, 200, 0, 50)
spyBtn.Parent = output

local uICorneruiorent = Instance.new("UICorner")
uICorneruiorent.CornerRadius = UDim.new(0, 8)
uICorneruiorent = spyBtn

local uICorner = Instance.new("UICorner")
uICorner.Name = "UICorner"
uICorner.Parent = clearlog

-- ==========================================
-- SM AUTO-SCALE CORE (SM-SYSTEM) - OPTIMIZED
-- ==========================================

local ScaleContainer = Instance.new("Frame")
ScaleContainer.Name = "SM_ScaleContainer"
ScaleContainer.Size = UDim2.new(1, 0, 1, 0)
ScaleContainer.BackgroundTransparency = 1
ScaleContainer.Parent = screenGui

local uiScale = Instance.new("UIScale")
uiScale.Parent = ScaleContainer

if main then main.Parent = ScaleContainer end
if exec then exec.Parent = ScaleContainer end
if output then output.Parent = ScaleContainer end

local function handleScaling()
    local currentRes = workspace.CurrentCamera.ViewportSize
    if currentRes.X < 100 then return end
    local targetWidth = 857 / 0.45 
    local finalScale = currentRes.X / targetWidth
    uiScale.Scale = math.clamp(finalScale, 0.5, 1.2)
end

local resizeDebounce = false
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    if not resizeDebounce then
        resizeDebounce = true
        task.wait(0.1)
        handleScaling()
        resizeDebounce = false
    end
end)
handleScaling()

-- ==========================================
-- SM ENGINE CORE v4.7 (-BETA-) - ADVANCED SANDBOX & FULL SCAN
-- ==========================================
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

--!strict
-- ==========================================
-- 1. CẤU HÌNH & TRẠNG THÁI HỆ THỐNG (Đã Tối Ưu)
-- ==========================================

-- Tách biệt Cấu hình (không đổi) và Trạng thái (thay đổi liên tục)
local Config = table.freeze({
    MaxLogs = 150,
    AutoExecFile = "SMEngine_AutoExec_v45.txt",
    TweenDuration = 0.4
})

local EngineState = {
    IsAttached = false,
    IsMinimized = false,
    AutoExecEnabled = false,
    SSMode = false,
    SpyEnabled = false,
    SpyHooked = false
}

-- Sử dụng table.freeze để tránh vô tình ghi đè dữ liệu (rất quan trọng cho Executor)
local Colors = table.freeze({
    Info = Color3.fromRGB(0, 170, 255),
    Success = Color3.fromRGB(0, 255, 100),
    Warning = Color3.fromRGB(255, 170, 0),
    Error = Color3.fromRGB(255, 50, 50),
    Text = Color3.fromRGB(240, 240, 240),
    System = Color3.fromRGB(170, 85, 255)
})

local TrapKeywords = table.freeze({
    "ban", "kick", "detect", "anticheat", "security", "log", "report"
})

-- Kế thừa từ Config để dễ dàng quản lý thông số animation tại một nơi
local tInfo = TweenInfo.new(Config.TweenDuration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

--!strict
-- ==========================================
-- 2. HỆ THỐNG FILE & LOGGER (Đã Tối Ưu)
-- ==========================================

-- 1. Tối ưu pcall: Truyền trực tiếp hàm vào pcall thay vì tạo hàm nặc danh (anonymous function)
local function safeWriteFile(name: string, content: string): boolean
    if writefile then 
        local success = pcall(writefile, name, content)
        return success
    end
    return false
end

local function safeReadFile(name: string): string?
    if isfile and isfile(name) and readfile then
        local success, content = pcall(readfile, name)
        if success then 
            return content 
        end
    end
    return nil
end

local LogHistory: {string} = {}

local function logMessage(text: any, colorType: Color3?)
    local color = colorType or Colors.Text
    local stamp = string.format("<font color=\"#888888\">[%s]</font>", os.date("%X"))
    
    -- 2. Tối ưu Color3: Sử dụng hàm ToHex() có sẵn của Luau (Nhanh và gọn hơn toán học thủ công)
    local hex = color:ToHex()
    local msg = string.format("\n%s <font color=\"#%s\">[>] %s</font>", stamp, hex, tostring(text))

    table.insert(LogHistory, msg)
    
    -- Lưu ý: Dùng Config.MaxLogs từ phần 1 đã tối ưu thay vì EngineState
    if #LogHistory > Config.MaxLogs then 
        table.remove(LogHistory, 1) 
    end

    if output_2 then
        output_2.Text = table.concat(LogHistory, "")
        
        -- 3. Tối ưu UI Scrolling: Dùng task.defer để tránh lỗi TextBounds cập nhật chậm
        task.defer(function()
            local scroll = output_2.Parent
            if scroll and scroll:IsA("ScrollingFrame") then
                -- Ép cuộn xuống đáy. Dùng 999999 an toàn và nhẹ hơn việc gọi AbsoluteCanvasSize.Y
                -- vì đôi khi UI chưa kịp render kích thước mới sau khi gán Text.
                scroll.CanvasPosition = Vector2.new(0, 999999)
            end
        end)
    else
        print(string.format("[SM v4.7 BETA] %s", tostring(text)))
    end
end

-- ==========================================
-- 3. HỆ THỐNG SANDBOX NÂNG CAO v4.7 (OPTIMIZED COMPATIBILITY MODE)
-- ==========================================
local RealGenv = (getgenv and getgenv()) or _G
local RealEnv = getfenv(0) -- Cache lại môi trường gốc để tránh gọi hàm nhiều lần

-- Cache sẵn các Services thường dùng
local RealGame = game
local CoreGui = RealGame:GetService("CoreGui")
local Players = RealGame:GetService("Players")

-- Tối ưu hóa request API
local httpRequest = request or http_request or (syn and syn.request)

local MockAPI = {
    -- Basic API & Compatibility
    ["getgenv"] = function() return RealGenv end,
    ["getrenv"] = function() return RealEnv end,
    ["identifyexecutor"] = function() return "SMEngine", "4.7" end,
    ["checkcaller"] = checkcaller or function() return true end,
    
    -- Metadata Functions
    ["setreadonly"] = setreadonly or function() return true end,
    ["make_writeable"] = make_writeable or function() return true end,
    ["getrawmetatable"] = getrawmetatable or function(o) return getmetatable(o) end,
    
    -- File System
    ["isfile"] = isfile or function() return false end,
    ["writefile"] = writefile or function(n, c) if writefile then pcall(writefile, n, c) end end,
    ["readfile"] = readfile or function(n) return readfile and readfile(n) or "" end,
    
    -- Advanced (UNC)
    ["request"] = httpRequest,
    ["gethui"] = gethui or function() 
        local lp = Players.LocalPlayer
        return (lp and lp:FindFirstChild("PlayerGui")) or CoreGui 
    end,
}

-- [QUAN TRỌNG] Cache MockGame thay vì tạo mới mỗi lần gọi
local MockGame = setmetatable({}, {
    __index = function(_, key)
        -- Chặn và custom các hàm nhạy cảm
        if key == "GetService" or key == "service" then
            return function(self, sName) return RealGame:GetService(sName) end
        elseif key == "HttpGet" or key == "HttpGetAsync" then
            return function(self, url, ...) return RealGame:HttpGet(url, ...) end
        elseif key == "GetObjects" then
            return function(self, asset) return RealGame:GetObjects(asset) end
        end
        
        -- Fallback về game thật an toàn, bảo toàn tham số 'self' (C Instance)
        local val = RealGame[key]
        if type(val) == "function" then
            return function(self, ...) return val(RealGame, ...) end
        end
        return val
    end,
    __newindex = function(_, key, val)
        RealGame[key] = val
    end,
    __metatable = "Locked"
})

-- Đưa MockGame vào MockAPI để tra cứu O(1)
MockAPI.game = MockGame

local function ExecuteWithSandbox(code)
    local load = loadstring or (getgenv and getgenv().loadstring)
    if not load then return false, "Executor không hỗ trợ loadstring." end

    local func, compileError = load(code)
    if not func then return false, "Syntax Error: " .. tostring(compileError) end

    -- Metatable Lookup siêu tốc
    local sandboxEnv = setmetatable({}, {
        __index = function(_, k)
            -- 1. Ưu tiên tìm trong MockAPI trước (O(1))
            local mocked = MockAPI[k]
            if mocked ~= nil then return mocked end
            
            -- 2. Tìm trong getgenv() thật
            local genvVal = RealGenv[k]
            if genvVal ~= nil then return genvVal end
            
            -- 3. Fallback cuối cùng về Roblox Environment
            return RealEnv[k]
        end,
        __newindex = function(_, k, v) 
            -- Vẫn giữ nguyên logic: lưu biến vào getgenv() thật
            RealGenv[k] = v 
        end
    })

    setfenv(func, sandboxEnv)
    
    -- Sử dụng xpcall thay vì pcall để lấy Traceback (Rất quan trọng khi chạy script lớn)
    local success, result = xpcall(func, function(err)
        return "Runtime Error: " .. tostring(err) .. "\n" .. debug.traceback()
    end)

    return success, result
end

-- ==========================================
-- 4. HỆ THỐNG KÉO THẢ TỐI ƯU (V4.9 SM-SMOOTH)
-- ==========================================
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function makeDraggableSmooth(mainFrame, arg2, arg3)
    if not mainFrame then return end
    
    -- Xử lý tham số linh hoạt
    local attachedObjects = type(arg2) == "table" and arg2 or {}
    local lerpSpeed = type(arg2) == "number" and arg2 or (type(arg3) == "number" and arg3 or 0.18)

    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    local targetPos = mainFrame.Position
    local attachedOffsets = {} -- Lưu khoảng cách tương đối của các object đi kèm

    -- Cập nhật mục tiêu di chuyển
    local function update(input)
        local delta = input.Position - dragStart
        -- Tính toán vị trí mới dựa trên vị trí bắt đầu + độ dời chuột
        targetPos = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X, 
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end

    -- Bắt đầu nhấn
    mainFrame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            
            -- Ghi nhớ vị trí tương đối của các con (nếu có)
            table.clear(attachedOffsets)
            for _, obj in ipairs(attachedObjects) do
                attachedOffsets[obj] = obj.Position
            end

            -- Vòng lặp Lerp mượt mà
            local connection
            connection = RunService.RenderStepped:Connect(function(dt)
                if not mainFrame or not mainFrame.Parent then 
                    connection:Disconnect() 
                    return 
                end

                -- Công thức Lerp chuẩn hóa theo Frame Time
                local alpha = 1 - math.pow(1 - lerpSpeed, dt * 60)
                
                -- Di chuyển Main Frame
                mainFrame.Position = mainFrame.Position:Lerp(targetPos, alpha)
                
                -- Di chuyển các Attached Objects theo tỉ lệ tương ứng
                for obj, originalPos in pairs(attachedOffsets) do
                    local deltaX = targetPos.X.Offset - startPos.X.Offset
                    local deltaY = targetPos.Y.Offset - startPos.Y.Offset
                    local objTarget = UDim2.new(
                        originalPos.X.Scale, originalPos.X.Offset + deltaX,
                        originalPos.Y.Scale, originalPos.Y.Offset + deltaY
                    )
                    obj.Position = obj.Position:Lerp(objTarget, alpha)
                end

                -- Tự dọn dẹp khi đã đứng yên và ngừng kéo
                if not dragging then
                    local mag = (Vector2.new(mainFrame.Position.X.Offset, mainFrame.Position.Y.Offset) - 
                                 Vector2.new(targetPos.X.Offset, targetPos.Y.Offset)).Magnitude
                    if mag < 0.1 then
                        mainFrame.Position = targetPos
                        connection:Disconnect()
                    end
                end
            end)
        end
    end)

    -- Lắng nghe di chuyển toàn cầu (Tránh lỗi tuột chuột)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)

    -- Ngừng kéo toàn cầu
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

-- Sử dụng thực tế
pcall(function()
    -- main, exec, output là các biến Frame của bạn
    makeDraggableSmooth(main, 0.18)
    makeDraggableSmooth(exec, 0.18)
    makeDraggableSmooth(output, 0.18)
end)

-- ==========================================
-- 5. QUẢN LÝ CỬA SỔ
-- ==========================================
if closeButton then
    closeButton.MouseButton1Click:Connect(function()
        logMessage("Shutting down SM v4.6...", Colors.Warning)
        if imageLabel_2 then imageLabel_2.Visible = false end
        if main then TweenService:Create(main, tInfo, {Size = UDim2.new(0,0,0,0), BackgroundTransparency = 1}):Play() end
        task.wait(0.5)
        if screenGui then screenGui:Destroy() end
    end)
end

if minimizeButton then
    minimizeButton.MouseButton1Click:Connect(function()
        EngineState.IsMinimized = not EngineState.IsMinimized
        local targetAlpha = EngineState.IsMinimized and 1 or 0
        local targetVis = not EngineState.IsMinimized

        local function toggleVis(frame)
            if frame then
                TweenService:Create(frame, tInfo, {BackgroundTransparency = targetAlpha}):Play()
                for _, v in pairs(frame:GetDescendants()) do 
                    if v:IsA("GuiObject") and v.Name ~= "ScaleContainer" then v.Visible = targetVis end 
                end
            end
        end

        toggleVis(exec)
        toggleVis(output)
        logMessage(EngineState.IsMinimized and "Windows Minimized." or "Windows Restored.", Colors.Info)
    end)
end

if autoExecToggle then
    autoExecToggle.MouseButton1Click:Connect(function()
        EngineState.AutoExecEnabled = not EngineState.AutoExecEnabled
        if EngineState.AutoExecEnabled then
            if inputSctipt and inputSctipt.Text ~= "" then safeWriteFile(EngineState.AutoExecFile, inputSctipt.Text) end
            logMessage("Auto-Exec ENABLED.", Colors.Success)
            autoExecToggle.BackgroundColor3 = Colors.Success
        else
            logMessage("Auto-Exec DISABLED.", Colors.Warning)
            autoExecToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        end
    end)
end

if clearlog then
    clearlog.MouseButton1Click:Connect(function()
        if output_2 then
            local originalColor = clearlog.BackgroundColor3
            clearlog.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            table.clear(LogHistory)
            output_2.Text = ""
            if backout_2 then backout_2.CanvasPosition = Vector2.new(0, 0) end
            logMessage("System Log Cleared.", Colors.System)
            task.wait(0.1)
            clearlog.BackgroundColor3 = originalColor
        end
    end)
end

-- ==========================================
-- 6. LÕI THỰC THI & QUÉT TỐI ƯU (V4.6 OPTIMIZED)
-- ==========================================

-- 1. XỬ LÝ ATTACH
if textButton then
    textButton.MouseButton1Click:Connect(function()
        if EngineState.IsAttached then 
            logMessage("Status: Already linked.", Colors.Info) 
            return 
        end
        
        textButton.Text = "INJECTING..."
        textButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
        
        task.delay(1, function()
            EngineState.IsAttached = true
            textButton.Text = "ATTACHED"
            textButton.BackgroundColor3 = Colors.Success
            logMessage("Bypass Environment v4.5 Active.", Colors.Success)

            if EngineState.AutoExecEnabled then
                local payload = safeReadFile(EngineState.AutoExecFile)
                if payload and #payload > 0 then
                    logMessage("Executing Auto-Exec...", Colors.System)
                    ExecuteWithSandbox(payload)
                end
            end
        end)
    end)
end

local RunService = game:GetService("RunService")
local ScannedRemotes = {} -- Danh sách các Remote đã xác minh thành công

-- 1. HÀM THỰC THI (Hỗ trợ nhiều kiểu truyền tham số)
local function runRemote(remote, code)
    if not remote or not code then return end
    pcall(function()
        if remote:IsA("RemoteEvent") then
            remote:FireServer(code) -- Kiểu trực tiếp
            remote:FireServer(remote.Name, code) -- Kiểu kèm tên
        elseif remote:IsA("RemoteFunction") then
            task.spawn(function() remote:InvokeServer(code) end)
        end
    end)
end

-- 2. HÀM KIỂM TRA ĐỘ TIN CẬY (Né hệ thống Roblox để an toàn)
local function isSystemRemote(remote)
    local path = remote:GetFullName()
    -- Chỉ né những thứ chắc chắn của Roblox/Chat/Admin để không bị Ban
    if path:find("RobloxReplicatedStorage") or path:find("ChatEvents") or path:find("DefaultChat") then
        return true
    end
    return false
end

-- 3. LOGIC QUÉT VÀ TEST MÙ (BLIND TEST)
if textButton_2 then
    textButton_2.MouseButton1Click:Connect(function()
        if not EngineState.IsAttached then logMessage("Attach first!", Colors.Error) return end
        
        logMessage("Blind Scan started (Testing ALL Remotes)...", Colors.Warning)
        table.clear(ScannedRemotes)
        local verifiedCount = 0
        
        task.spawn(function()
            local allObjects = game:GetDescendants()
            
            for i, item in ipairs(allObjects) do
                -- Chống lag
                if i % 300 == 0 then RunService.Heartbeat:Wait() end
                
                if (item:IsA("RemoteEvent") or item:IsA("RemoteFunction")) and not isSystemRemote(item) then
                    
                    -- TẠO MÃ TEST NGẪU NHIÊN
                    local testId = "TEST_" .. math.random(1000, 9999)
                    
                    -- GỬI LỆNH THỬ NGHIỆM (Bất kể tên nó là gì: HEX, Rác, hay Tên giả)
                    runRemote(item, "local m=Instance.new('Model', workspace); m.Name='"..testId.."'; task.wait(0.5); m:Destroy()")
                    
                    -- Đợi phản hồi cực ngắn để duy trì tốc độ quét
                    task.wait(0.3) 
                    
                    if workspace:FindFirstChild(testId) then
                        -- NẾU MODEL XUẤT HIỆN => ĐÂY LÀ BACKDOOR XỊN
                        table.insert(ScannedRemotes, item)
                        verifiedCount = verifiedCount + 1
                        logMessage("⭐ FOUND SS: " .. item.Name, Colors.Success)
                        
                        if eXECButton then
                            eXECButton.Text = "READY (SS: " .. verifiedCount .. ")"
                            eXECButton.BackgroundColor3 = Color3.fromRGB(0, 190, 0)
                        end
                    end
                end
            end

            logMessage("Scan Finish. Found " .. verifiedCount .. " functional remotes.", Colors.Success)
        end)
    end)
end

-- 3. THỰC THI (EXECUTE)
if eXECButton then
    eXECButton.MouseButton1Click:Connect(function()
        if not EngineState.IsAttached then logMessage("Please ATTACH first!", Colors.Error) return end
        local code = inputSctipt and inputSctipt.Text or ""
        if code:gsub("%s+", "") == "" then return end

        if EngineState.SSMode then
            if #ScannedRemotes == 0 then
                logMessage("No Remotes in cache. Rescan recommended.", Colors.Warning)
                return
            end

            logMessage("SS Infiltration: Sending Payload...", Colors.System)
            task.spawn(function()
                for _, remote in ipairs(ScannedRemotes) do
                    pcall(function()
                        if remote:IsA("RemoteEvent") then
                            remote:FireServer(code)
                        elseif remote:IsA("RemoteFunction") then
                            remote:InvokeServer(code)
                        end
                    end)
                end
                logMessage("Payload broadcasted to " .. #ScannedRemotes .. " remotes.", Colors.Success)
            end)
        else
            logMessage("Running in Local Sandbox...", Colors.Info)
            local success, err = ExecuteWithSandbox(code)
            if not success then logMessage("Error: " .. tostring(err), Colors.Error) end
        end
    end)
end

-- 4. REMOTE SPY (OPTIMIZED)
if spyBtn then
    spyBtn.MouseButton1Click:Connect(function()
        EngineState.SpyEnabled = not EngineState.SpyEnabled
        spyBtn.BackgroundColor3 = EngineState.SpyEnabled and Colors.Success or Colors.Error
        spyBtn.Text = EngineState.SpyEnabled and "Spying: ON" or "Remote Spy"

        if EngineState.SpyEnabled and not EngineState.SpyHooked then
            if hookmetamethod then
                local oldNamecall
                oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                    local method = getnamecallmethod()
                    if EngineState.SpyEnabled and not checkcaller() then
                        if method == "FireServer" or method == "InvokeServer" then
                            -- Ghi log tối giản nhưng hiệu quả
                            task.spawn(logMessage, string.format("[Spy] %s | Method: %s", self.Name, method), Colors.Warning)
                        end
                    end
                    return oldNamecall(self, ...)
                end)
                EngineState.SpyHooked = true
                logMessage("Namecall hook injected.", Colors.Success)
            else
                logMessage("Fail: Executor lacks hookmetamethod.", Colors.Error)
            end
        end
    end)
end

-- ==========================================
-- 7. ANIMATION VÒNG QUAY ORBIT
-- ==========================================
if lOGO_WHEN_ATTACHED and imageLabel_2 then
    local orbitAngle = 0
    local offsetX = imageLabel_2.Size.X.Offset / 2
    local offsetY = imageLabel_2.Size.Y.Offset / 2
    
    RunService.RenderStepped:Connect(function(dt)
        orbitAngle = orbitAngle + math.rad(90) * dt
        local centerX = lOGO_WHEN_ATTACHED.AbsoluteSize.X / 2
        local centerY = lOGO_WHEN_ATTACHED.AbsoluteSize.Y / 2
        
        imageLabel_2.Position = UDim2.fromOffset(
            (centerX + math.cos(orbitAngle) * 70) - offsetX, 
            (centerY + math.sin(orbitAngle) * 70) - offsetY
        )
    end)
end

-- ==========================================
-- 8. CORE QUẢN LÝ TAB v4.9 (AUTO-LOAD & REFRESH SYSTEM)
-- ==========================================

local TabSystem = {
    Tabs = {}, 
    CurrentTabIndex = 1,
    ConfigFolder = "SMEngine_Workspace",
    ActiveTabColor = Color3.fromRGB(70, 70, 70),
    InactiveTabColor = Color3.fromRGB(35, 35, 35)
}

-- Khởi tạo thư mục
if makefolder then pcall(makefolder, TabSystem.ConfigFolder) end

-- UI Elements Setup
tABIN:ClearAllChildren() 
local tabScroll = Instance.new("ScrollingFrame")
tabScroll.Size = UDim2.new(1, -45, 1, 0) 
tabScroll.BackgroundTransparency = 1
tabScroll.ScrollBarThickness = 2
tabScroll.ScrollingDirection = Enum.ScrollingDirection.X
tabScroll.AutomaticCanvasSize = Enum.AutomaticSize.X
tabScroll.Parent = tABIN

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 4)
tabLayout.Parent = tabScroll

-- 1. HÀM LƯU FILE (WRITE)
local function saveTabToFile(tabData)
    if writefile then
        local path = TabSystem.ConfigFolder .. "/" .. tabData.Name .. ".lua"
        pcall(writefile, path, tabData.Content)
    end
end

-- 2. HÀM VẼ LẠI TOÀN BỘ TAB (REFRESH UI)
local function refreshTabs()
    -- Xóa các nút cũ
    for _, child in ipairs(tabScroll:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end

    for index, data in ipairs(TabSystem.Tabs) do
        local btn = Instance.new("TextButton")
        btn.Name = "Tab_" .. index
        btn.Size = UDim2.new(0, 110, 0, 30)
        btn.BackgroundColor3 = (TabSystem.CurrentTabIndex == index) and TabSystem.ActiveTabColor or TabSystem.InactiveTabColor
        btn.Text = data.Name
        btn.TextColor3 = (TabSystem.CurrentTabIndex == index) and Color3.new(1,1,1) or Color3.fromRGB(180, 180, 180)
        btn.Font = Enum.Font.SourceSansBold
        btn.TextTruncate = Enum.TextTruncate.AtEnd
        btn.Parent = tabScroll
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

        -- Click: Chuyển Tab
        btn.MouseButton1Click:Connect(function()
            -- Lưu nội dung tab cũ trước khi chuyển
            if TabSystem.Tabs[TabSystem.CurrentTabIndex] then
                TabSystem.Tabs[TabSystem.CurrentTabIndex].Content = inputSctipt.Text
            end
            
            TabSystem.CurrentTabIndex = index
            inputSctipt.Text = data.Content
            refreshTabs() -- Cập nhật màu sắc
            contextMenu.Visible = false
        end)

        -- Chuột phải: Mở Menu
        btn.MouseButton2Click:Connect(function()
            contextMenu.Position = UDim2.new(0, btn.AbsolutePosition.X, 0, btn.AbsolutePosition.Y + 35)
            contextMenu.Visible = true
            
            -- Gán sự kiện cho nút trong Menu (Dùng Connection tạm thời)
            local renameConn, deleteConn
            
            renameConn = renameBtn.MouseButton1Click:Connect(function()
                renameConn:Disconnect()
                deleteConn:Disconnect()
                contextMenu.Visible = false
                
                local newName = inputSctipt.Text:sub(1, 15):gsub("[^%w%s]", "") -- Lấy 15 ký tự đầu làm tên
                if newName == "" then newName = "Untitled" end
                
                -- Xóa file cũ, tạo file mới
                if delfile then pcall(delfile, TabSystem.ConfigFolder .. "/" .. data.Name .. ".lua") end
                data.Name = newName
                saveTabToFile(data)
                refreshTabs()
                logMessage("Renamed to: " .. newName, Colors.Success)
            end)

            deleteConn = deleteBtn.MouseButton1Click:Connect(function()
                renameConn:Disconnect()
                deleteConn:Disconnect()
                contextMenu.Visible = false
                
                if #TabSystem.Tabs > 1 then
                    if delfile then pcall(delfile, TabSystem.ConfigFolder .. "/" .. data.Name .. ".lua") end
                    table.remove(TabSystem.Tabs, index)
                    if TabSystem.CurrentTabIndex > #TabSystem.Tabs then TabSystem.CurrentTabIndex = #TabSystem.Tabs end
                    inputSctipt.Text = TabSystem.Tabs[TabSystem.CurrentTabIndex].Content
                    refreshTabs()
                else
                    logMessage("Cannot delete the last tab!", Colors.Error)
                end
            end)
        end)
    end
end

-- 3. HÀM THÊM TAB MỚI
local function addNewTab(name, content, skipSave)
    local tabData = {
        Name = name or "Script " .. (#TabSystem.Tabs + 1),
        Content = content or "-- New Script",
    }
    table.insert(TabSystem.Tabs, tabData)
    if not skipSave then saveTabToFile(tabData) end
    refreshTabs()
end

-- 4. AUTO-LOAD TỪ FOLDER (CỰC KỲ HỮU ÍCH)
local function loadSavedTabs()
    if listfiles then
        local files = listfiles(TabSystem.ConfigFolder)
        if #files > 0 then
            for _, path in ipairs(files) do
                if path:sub(-4) == ".lua" then
                    local name = path:gsub(TabSystem.ConfigFolder.."/", ""):gsub(".lua", "")
                    local content = readfile(path)
                    addNewTab(name, content, true)
                end
            end
        else
            addNewTab("Main.lua", "-- Welcome to SM Engine")
        end
    else
        addNewTab("Main.lua", "-- No File System Support")
    end
    -- Set tab đầu tiên làm mặc định
    if TabSystem.Tabs[1] then
        inputSctipt.Text = TabSystem.Tabs[1].Content
        refreshTabs()
    end
end

-- 5. NÚT ADD (+) CỐ ĐỊNH
addTabBtn.MouseButton1Click:Connect(function()
    addNewTab()
    logMessage("New tab created.", Colors.Info)
end)

-- Chạy khởi động
loadSavedTabs()

-- ==========================================
-- 8.1. AUTO-LOAD TỪ WORKSPACE (V4.9.1 OPTIMIZED)
-- ==========================================

local function loadWorkspaceFiles()
    if not listfiles then
        addNewTab("Main", "-- Executor doesn't support listfiles")
        return
    end

    logMessage("Scanning Workspace...", Colors.Info)
    
    local success, files = pcall(listfiles, TabSystem.ConfigFolder)
    if not success or #files == 0 then
        addNewTab("Main", "-- Welcome to SMEngine\n-- Start coding here!")
        return
    end

    -- Sắp xếp file theo tên (A-Z) để UI trông gọn gàng
    table.sort(files)

    for _, filePath in ipairs(files) do
        -- Kiểm tra đúng đuôi .lua
        if filePath:lower():sub(-4) == ".lua" then
            -- Tách tên file: Xử lý linh hoạt cho mọi loại đường dẫn (/) hoặc (\)
            local fileName = filePath:match("([^\\/]+)%.lua$") or "Untitled"
            
            local readSuccess, content = pcall(readfile, filePath)
            if readSuccess then
                -- false ở tham số thứ 3 để không ghi đè lại chính nó khi đang load
                addNewTab(fileName, content, true)
            end
        end
    end
    
    logMessage("Loaded " .. #TabSystem.Tabs .. " scripts from workspace.", Colors.Success)
end

-- Khởi chạy load file (Bọc trong spawn để không chặn luồng UI chính)
task.spawn(function()
    loadWorkspaceFiles()
    -- Sau khi load xong file, hiển thị nội dung tab đầu tiên
    if TabSystem.Tabs[1] and inputSctipt then
        inputSctipt.Text = TabSystem.Tabs[1].Content
    end
end)

logMessage("SM Engine v4.7 (-BETA-) Ready.", Colors.Text)
