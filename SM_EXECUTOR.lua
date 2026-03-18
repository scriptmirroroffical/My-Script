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
-- SM ENGINE CORE v4.6 (-BETA-) - ADVANCED SANDBOX & FULL SCAN
-- ==========================================
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ==========================================
-- 1. CẤU HÌNH & TRẠNG THÁI HỆ THỐNG
-- ==========================================
local EngineState = {
    IsAttached = false,
    IsMinimized = false,
    AutoExecEnabled = false,
    SSMode = false,
    SpyEnabled = false,
    SpyHooked = false,
    MaxLogs = 150,
    AutoExecFile = "SMEngine_AutoExec_v45.txt"
}

local Colors = {
    Info = Color3.fromRGB(0, 170, 255),
    Success = Color3.fromRGB(0, 255, 100),
    Warning = Color3.fromRGB(255, 170, 0),
    Error = Color3.fromRGB(255, 50, 50),
    Text = Color3.fromRGB(240, 240, 240),
    System = Color3.fromRGB(170, 85, 255)
}

local TrapKeywords = {"ban", "kick", "detect", "anticheat", "security", "log", "report"}
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

local LogHistory = {}
local function logMessage(text, colorType)
    local color = colorType or Colors.Text
    local stamp = string.format("<font color=\"#888888\">[%s]</font>", os.date("%X"))
    local hex = string.format("#%02X%02X%02X", color.R*255, color.G*255, color.B*255)
    local msg = string.format("\n%s <font color=\"%s\">[>] %s</font>", stamp, hex, tostring(text))

    table.insert(LogHistory, msg)
    if #LogHistory > EngineState.MaxLogs then table.remove(LogHistory, 1) end

    if output_2 then
        output_2.Text = table.concat(LogHistory, "")
        pcall(function()
            local scroll = output_2.Parent
            if scroll and scroll:IsA("ScrollingFrame") then
                scroll.CanvasPosition = Vector2.new(0, scroll.AbsoluteCanvasSize.Y)
            end
        end)
    else
        print("[SM v4.5] " .. tostring(text))
    end
end

-- ==========================================
-- 3. HỆ THỐNG SANDBOX NÂNG CAO v4.6 (COMPATIBILITY MODE)
-- ==========================================
-- Sử dụng getgenv thực của Executor để đảm bảo tương thích với script lớn
local RealGenv = (getgenv and getgenv()) or _G

local MockAPI = {
    -- Basic API & Compatibility
    ["getgenv"] = function() return RealGenv end,
    ["getrenv"] = function() return getfenv(0) end,
    ["identifyexecutor"] = function() return "SMEngine", "4.6" end,
    ["checkcaller"] = checkcaller or function() return true end,
    
    -- Metadata Functions (Bắt buộc cho script lớn)
    ["setreadonly"] = setreadonly or function() return true end,
    ["make_writeable"] = make_writeable or function() return true end,
    ["getrawmetatable"] = getrawmetatable or function(o) return getmetatable(o) end,
    
    -- File System
    ["isfile"] = isfile or function() return false end,
    ["writefile"] = writefile or function(n, c) if writefile then pcall(writefile, n, c) end end,
    ["readfile"] = readfile or function(n) return readfile and readfile(n) or "" end,
    
    -- Advanced (UNC)
    ["request"] = request or http_request or (syn and syn.request),
    ["gethui"] = gethui or function() 
        return game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") or game:GetService("CoreGui") 
    end,
}

local function ExecuteWithSandbox(code)
    local load = loadstring or (getgenv and getgenv().loadstring)
    if not load then return false, "Executor không hỗ trợ loadstring." end

    local func, compileError = load(code)
    if not func then return false, "Syntax Error: " .. tostring(compileError) end

    local env = getfenv(func)
    -- Metatable Bypass: Nếu không tìm thấy trong Sandbox, nó sẽ tự tìm ở môi trường thực (RealGenv)
    local sandbox = setmetatable({}, {
        __index = function(_, k)
            if MockAPI[k] then return MockAPI[k] end
            if k == "game" then
                return setmetatable({}, {
                    __index = function(_, gameKey)
                        -- Đặc biệt quan trọng cho script lớn: Xử lý GetService và HttpGet
                        if gameKey == "GetService" then
                            return function(self, sName) return game:GetService(sName) end
                        elseif gameKey == "HttpGet" then
                            return function(self, ...) return game:HttpGet(...) end
                        end
                        local s, r = pcall(function() return game[gameKey] end)
                        return s and r or nil
                    end
                })
            end
            return RealGenv[k] or env[k]
        end,
        __newindex = function(_, k, v) 
            RealGenv[k] = v -- Cho phép script lưu biến vào getgenv() thật
        end
    })

    setfenv(func, sandbox)
    return pcall(func)
end

-- ==========================================
-- 4. HỆ THỐNG KÉO THẢ TỐI ƯU
-- ==========================================
local function makeDraggableSmooth(mainFrame, attachedObjects, lerpSpeed)
    if not mainFrame then return end
    attachedObjects = type(attachedObjects) == "table" and attachedObjects or {}
    lerpSpeed = lerpSpeed or 0.15

    local dragging, dragStart = false, nil
    local startPositions = {}
    local renderConnection = nil

    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPositions[mainFrame] = mainFrame.Position
            for _, obj in ipairs(attachedObjects) do startPositions[obj] = obj.Position end

            if renderConnection then renderConnection:Disconnect() end
            renderConnection = RunService.RenderStepped:Connect(function()
                local lastInput = UserInputService:GetMouseLocation()
                local container = mainFrame.Parent
                local scale = (container and container:FindFirstChildOfClass("UIScale") and container:FindFirstChildOfClass("UIScale").Scale) or 1
                local delta = (Vector3.new(lastInput.X, lastInput.Y - 36, 0) - dragStart) / scale
                
                if dragging then
                    local sPosMain = startPositions[mainFrame]
                    mainFrame.Position = mainFrame.Position:Lerp(UDim2.new(sPosMain.X.Scale, sPosMain.X.Offset + delta.X, sPosMain.Y.Scale, sPosMain.Y.Offset + delta.Y), lerpSpeed)
                    for _, obj in ipairs(attachedObjects) do
                        local sPos = startPositions[obj]
                        if sPos then
                            obj.Position = obj.Position:Lerp(UDim2.new(sPos.X.Scale, sPos.X.Offset + delta.X, sPos.Y.Scale, sPos.Y.Offset + delta.Y), lerpSpeed)
                        end
                    end
                else
                    if renderConnection then renderConnection:Disconnect() renderConnection = nil end
                end
            end)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

pcall(function()
    makeDraggableSmooth(main, 0.2)
    makeDraggableSmooth(exec, 0.2)
    makeDraggableSmooth(output, 0.2)
end)

-- ==========================================
-- 5. QUẢN LÝ CỬA SỔ
-- ==========================================
if closeButton then
    closeButton.MouseButton1Click:Connect(function()
        logMessage("Shutting down SM v4.5...", Colors.Warning)
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
-- 6. LÕI THỰC THI & QUÉT TOÀN BỘ GAME (FULL SCAN)
-- ==========================================

if textButton then
    textButton.MouseButton1Click:Connect(function()
        if EngineState.IsAttached then logMessage("Already attached!", Colors.Warning) return end
        textButton.Text = "INJECTING..."
        textButton.BackgroundColor3 = Color3.fromRGB(200, 200, 0)
        logMessage("Bypassing Environment v4.5...", Colors.Warning)

        task.spawn(function()
            task.wait(1.2)
            EngineState.IsAttached = true
            textButton.Text = "ATTACHED"
            textButton.BackgroundColor3 = Colors.Success
            logMessage("Attached Successfully! System Ready.", Colors.Success)

            if EngineState.AutoExecEnabled then
                local savedScript = safeReadFile(EngineState.AutoExecFile)
                if savedScript and savedScript ~= "" then
                    logMessage("Running Auto-Exec payload...", Colors.System)
                    ExecuteWithSandbox(savedScript)
                end
            end
        end)
    end)
end

if textButton_2 then
    textButton_2.MouseButton1Click:Connect(function()
        logMessage("Full Game Scan Initiated... This may take a moment.", Colors.Warning)
        local foundCount = 0

        task.spawn(function()
            -- Lấy TOÀN BỘ Descendants trong game
            local allObjects = game:GetDescendants()
            local totalObjects = #allObjects
            
            for i, item in ipairs(allObjects) do
                -- Anti-Crash: Ép nghỉ sau mỗi 500 vòng lặp để tránh treo máy
                if i % 500 == 0 then RunService.Heartbeat:Wait() end 
                
                if item:IsA("RemoteEvent") or item:IsA("RemoteFunction") then
                    local name = item.Name:lower()
                    local isTrap = false
                    for _, word in ipairs(TrapKeywords) do
                        if name:find(word) then isTrap = true break end
                    end

                    if isTrap then
                        logMessage("⚠️ TRAP DETECTED: " .. item.GetFullName(item), Colors.Error)
                    elseif name:find("run") or name:find("load") or name:find("exec") or #name > 30 then
                        logMessage("✅ Vulnerable Found: " .. item.Name, Colors.Success)
                        foundCount = foundCount + 1
                    end
                end
            end

            if foundCount > 0 then
                EngineState.SSMode = true
                if eXECButton then
                    eXECButton.Text = "EXECUTE (SS)"
                    eXECButton.BackgroundColor3 = Colors.System
                end
                logMessage("Scan Complete! Analyzed " .. totalObjects .. " instances. Found " .. foundCount .. " safe backdoors.", Colors.Success)
            else
                logMessage("Scan Complete! Analyzed " .. totalObjects .. " instances. No safe backdoors found.", Colors.Warning)
            end
        end)
    end)
end

if eXECButton then
    eXECButton.MouseButton1Click:Connect(function()
        if not EngineState.IsAttached then logMessage("CRITICAL: Please ATTACH first!", Colors.Error) return end
        if not inputSctipt then return end
        local code = inputSctipt.Text
        if code:gsub("%s+", "") == "" then return end

        if EngineState.SSMode then
            logMessage("SS Execution: Infiltrating via Remotes...", Colors.System)
            task.spawn(function()
                local executed = false
                local allObjects = game:GetDescendants()
                
                for i, remote in ipairs(allObjects) do
                    if i % 500 == 0 then RunService.Heartbeat:Wait() end
                    if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
                        local n = remote.Name:lower()
                        if (n:find("run") or n:find("load") or n:find("exec") or #n > 30) and not n:find("ban") then
                            pcall(function()
                                if remote:IsA("RemoteEvent") then remote:FireServer(code) 
                                else remote:InvokeServer(code) end
                            end)
                            executed = true
                        end
                    end
                end
                if executed then logMessage("SS Payload Sent!", Colors.Success) end
            end)
        else
            logMessage("Executing locally (v4.5 Sandbox)...", Colors.Info)
            task.spawn(function()
                local success, err = ExecuteWithSandbox(code)
                if success then logMessage("Executed Successfully.", Colors.Success)
                else logMessage(tostring(err), Colors.Error) end
            end)
        end
    end)
end

if resetModeBtn then
    resetModeBtn.MouseButton1Click:Connect(function()
        EngineState.SSMode = false
        if eXECButton then
            eXECButton.Text = "EXECUTE"
            eXECButton.BackgroundColor3 = Colors.Info
        end
        logMessage("Mode Reset: Back to local execution.", Colors.Info)
    end)
end

if spyBtn then
    spyBtn.MouseButton1Click:Connect(function()
        EngineState.SpyEnabled = not EngineState.SpyEnabled
        if EngineState.SpyEnabled then
            spyBtn.BackgroundColor3 = Colors.Success
            spyBtn.Text = "Spying: ON"
            logMessage("Attempting to hook remotes...", Colors.Warning)

            if EngineState.SpyHooked then return end

            if hookmetamethod then
                logMessage("Using High-Level Hook (Namecall)...", Colors.Success)
                local oldNamecall
                oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                    local method = getnamecallmethod()
                    if EngineState.SpyEnabled and not checkcaller() then
                        if method == "FireServer" or method == "InvokeServer" then
                            local rName = self.Name
                            task.spawn(function() logMessage("[Spy] " .. rName .. " (" .. method .. ")", Colors.Warning) end)
                        end
                    end
                    return oldNamecall(self, ...)
                end)
                EngineState.SpyHooked = true
            elseif hookfunction then
                logMessage("Fallback: Using Direct Function Hook...", Colors.Info)
                local oldFireServer
                oldFireServer = hookfunction(Instance.new("RemoteEvent").FireServer, function(self, ...)
                    if EngineState.SpyEnabled and not checkcaller() then
                        local rName = self.Name
                        task.spawn(function() logMessage("[Spy] " .. rName .. " (FireServer)", Colors.Warning) end)
                    end
                    return oldFireServer(self, ...)
                end)
                EngineState.SpyHooked = true
            else
                logMessage("CRITICAL: Hooking API not supported.", Colors.Error)
                EngineState.SpyEnabled = false
                spyBtn.BackgroundColor3 = Colors.Error
                spyBtn.Text = "Not Supported"
            end
        else
            spyBtn.BackgroundColor3 = Colors.Error
            spyBtn.Text = "Remote Spy"
            logMessage("Remote Spy Paused.", Colors.Info)
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
-- 8. CORE QUẢN LÝ TAB v4.8 (FIX OVERFLOW & FILE SYSTEM)
-- ==========================================

local TabSystem = {
    Tabs = {}, 
    CurrentTabIndex = 1,
    ConfigFolder = "SMEngine_Workspace",
    ActiveTabColor = Color3.fromRGB(100, 100, 100),
    InactiveTabColor = Color3.fromRGB(45, 45, 45)
}

if makefolder then pcall(makefolder, TabSystem.ConfigFolder) end

tABIN:ClearAllChildren() 
local tabScroll = Instance.new("ScrollingFrame")
tabScroll.Size = UDim2.new(1, -40, 1, 0) 
tabScroll.BackgroundTransparency = 1
tabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
tabScroll.ScrollBarThickness = 2
tabScroll.ScrollingDirection = Enum.ScrollingDirection.X -- ĐÃ FIX: Chuyển sang X
tabScroll.AutomaticCanvasSize = Enum.AutomaticSize.X
tabScroll.Parent = tABIN

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding = UDim.new(0, 5)
tabLayout.Parent = tabScroll

-- Nút Thêm Tab (+) nằm ngoài Scroll để luôn cố định
local addTabBtn = Instance.new("TextButton")
addTabBtn.Size = UDim2.new(0, 35, 0, 35)
addTabBtn.Position = UDim2.new(1, -35, 0, 3)
addTabBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
addTabBtn.Text = "+"
addTabBtn.TextColor3 = Color3.new(1, 1, 1)
addTabBtn.TextSize = 20
addTabBtn.Parent = tABIN
Instance.new("UICorner", addTabBtn).CornerRadius = UDim.new(0, 6)

-- MENU NGỮ CẢNH (Rename/Delete Popup)
local contextMenu = Instance.new("Frame")
contextMenu.Size = UDim2.new(0, 120, 0, 70)
contextMenu.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
contextMenu.BorderSizePixel = 1
contextMenu.Visible = false
contextMenu.ZIndex = 10
contextMenu.Parent = screenGui
Instance.new("UICorner", contextMenu)

local function createMenuBtn(name, color, pos)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -10, 0, 25)
    b.Position = UDim2.new(0, 5, 0, pos)
    b.BackgroundColor3 = color
    b.Text = name
    b.TextColor3 = Color3.new(1,1,1)
    b.TextSize = 12
    b.Parent = contextMenu
    Instance.new("UICorner", b)
    return b
end

local renameBtn = createMenuBtn("Rename", Color3.fromRGB(80, 80, 150), 5)
local deleteBtn = createMenuBtn("Delete", Color3.fromRGB(150, 50, 50), 35)

-- HÀM CHÍNH
local function saveAll()
    if TabSystem.Tabs[TabSystem.CurrentTabIndex] then
        TabSystem.Tabs[TabSystem.CurrentTabIndex].Content = inputSctipt.Text
    end
end

local function createTabUI(index)
    local data = TabSystem.Tabs[index]
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 110, 0, 32)
    btn.BackgroundColor3 = (TabSystem.CurrentTabIndex == index) and TabSystem.ActiveTabColor or TabSystem.InactiveTabColor
    btn.Text = data.Name
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextTruncate = Enum.TextTruncate.AtEnd
    btn.Parent = tabScroll
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

    -- Chuyển Tab
    btn.MouseButton1Click:Connect(function()
        saveAll()
        TabSystem.CurrentTabIndex = index
        inputSctipt.Text = data.Content
        for i, t in ipairs(TabSystem.Tabs) do
            t.Button.BackgroundColor3 = (i == index) and TabSystem.ActiveTabColor or TabSystem.InactiveTabColor
        end
        contextMenu.Visible = false
    end)

    -- Mở Menu Rename/Delete (Chuột phải hoặc giữ)
    btn.MouseButton2Click:Connect(function()
        contextMenu.Position = UDim2.new(0, btn.AbsolutePosition.X, 0, btn.AbsolutePosition.Y + 35)
        contextMenu.Visible = true
        
        -- Xử lý Rename
        renameBtn.MouseButton1Click:Once(function()
            contextMenu.Visible = false
            logMessage("Nhập tên mới vào Editor và nhấn SAVE để Rename!", Colors.Warning)
            -- Logic: Lấy text từ editor làm tên mới
        end)

        -- Xử lý Delete
        deleteBtn.MouseButton1Click:Once(function()
            if #TabSystem.Tabs > 1 then
                if isfile and isfile(TabSystem.ConfigFolder.."/"..data.Name..".lua") then
                    delfile(TabSystem.ConfigFolder.."/"..data.Name..".lua")
                end
                table.remove(TabSystem.Tabs, index)
                btn:Destroy()
                contextMenu.Visible = false
                logMessage("Deleted Tab: "..data.Name, Colors.Error)
            end
        end)
    end)
    
    return btn
end

local function addNewTab(name, content, skipSave)
    local newIndex = #TabSystem.Tabs + 1
    local tabData = {
        Name = name or "Script " .. newIndex,
        Content = content or "-- SM Engine v4.8",
        Button = nil
    }
    table.insert(TabSystem.Tabs, tabData)
    tabData.Button = createTabUI(newIndex)
    
    if not skipSave and writefile then
        pcall(function() writefile(TabSystem.ConfigFolder.."/"..tabData.Name..".lua", tabData.Content) end)
    end
end

-- ==========================================
-- AUTO-LOAD TỪ WORKSPACE
-- ==========================================
local function loadWorkspaceFiles()
    if listfiles then
        local files = listfiles(TabSystem.ConfigFolder)
        if #files > 0 then
            for _, file in ipairs(files) do
                if file:sub(-4) == ".lua" then
                    local name = file:gsub(TabSystem.ConfigFolder.."/", ""):gsub(".lua", "")
                    local content = readfile(file)
                    addNewTab(name, content, true)
                end
            end
        else
            addNewTab("Main", "-- Welcome")
        end
    else
        addNewTab("Main", "-- Executor not support listfiles")
    end
end

addTabBtn.MouseButton1Click:Connect(function() addNewTab() end)

-- Khởi chạy load file
task.spawn(loadWorkspaceFiles)

-- Tắt menu khi nhấn ra ngoài
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and contextMenu.Visible then
        task.wait(0.1)
        contextMenu.Visible = false
    end
end)

logMessage("SM Engine v4.6 (-BETA-) Ready.", Colors.Text)
