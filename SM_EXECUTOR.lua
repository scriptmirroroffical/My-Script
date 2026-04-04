-- [OMNI-GOD CORE GENERATED]
-- Author: son171020
-- Mode: Smart Relay (_G.OmniStorage)
local _STORAGE = _G.OmniStorage or {}

local ScreenGui = Instance.new("ScreenGui")
_STORAGE["ScreenGui"] = ScreenGui
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.CoreGui

local BtnTgleGui = Instance.new("Frame")
_STORAGE["BtnTgleGui"] = BtnTgleGui
BtnTgleGui.Name = "BtnTgleGui"
BtnTgleGui.Size = UDim2.new(0.0440270044, 0, 0.0868055522, 0)
BtnTgleGui.Position = UDim2.new(0.0505376346, 0, 0.803819418, 0)
BtnTgleGui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BtnTgleGui.BackgroundTransparency = 1
BtnTgleGui.Visible = true
BtnTgleGui.ZIndex = 1
BtnTgleGui.BorderSizePixel = 0
BtnTgleGui.ClipsDescendants = false
BtnTgleGui.Parent = _STORAGE["ScreenGui"] or ScreenGui

local BackGO = Instance.new("Frame")
_STORAGE["BackGO"] = BackGO
BackGO.Name = "BackGO"
BackGO.Size = UDim2.new(1.16354823, 0, 1.16354823, 0)
BackGO.Position = UDim2.new(-0.0935479701, 0, -0.0874328613, 0)
BackGO.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
BackGO.BackgroundTransparency = 0.4000000059604645
BackGO.Visible = true
BackGO.ZIndex = 999
BackGO.BorderSizePixel = 0
BackGO.ClipsDescendants = false
BackGO.Parent = _STORAGE["BtnTgleGui"] or BtnTgleGui

local UICorner = Instance.new("UICorner")
_STORAGE["UICorner"] = UICorner
UICorner.Name = "UICorner"
UICorner.Parent = _STORAGE["BackGO"] or BackGO

local ImageButton = Instance.new("ImageButton")
_STORAGE["ImageButton"] = ImageButton
ImageButton.Name = "ImageButton"
ImageButton.Size = UDim2.new(1.00763404, 0, 1.00691593, 0)
ImageButton.Position = UDim2.new(-0.00763397198, 0, -0.00785278343, 0)
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 0
ImageButton.Image = "rbxassetid://88774721887954"
ImageButton.ImageTransparency = 0
ImageButton.Visible = true
ImageButton.ZIndex = 1000
ImageButton.BorderSizePixel = 0
ImageButton.ClipsDescendants = false
ImageButton.Parent = _STORAGE["BtnTgleGui"] or BtnTgleGui

local UICorner_2 = Instance.new("UICorner")
_STORAGE["UICorner_2"] = UICorner_2
UICorner_2.Name = "UICorner"
UICorner_2.Parent = _STORAGE["ImageButton"] or ImageButton

local MainMenu = Instance.new("Frame")
_STORAGE["MainMenu"] = MainMenu
MainMenu.Name = "MainMenu"
MainMenu.Size = UDim2.new(0.154534787, 0, 0.25, 0)
MainMenu.Position = UDim2.new(0.0462283567, 0, 0.535590291, 0)
MainMenu.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
MainMenu.BackgroundTransparency = 0.5
MainMenu.Visible = true
MainMenu.ZIndex = 1
MainMenu.BorderSizePixel = 0
MainMenu.ClipsDescendants = false
MainMenu.Parent = _STORAGE["ScreenGui"] or ScreenGui

local UICorner_3 = Instance.new("UICorner")
_STORAGE["UICorner_3"] = UICorner_3
UICorner_3.Name = "UICorner"
UICorner_3.Parent = _STORAGE["MainMenu"] or MainMenu

local Name = Instance.new("TextLabel")
_STORAGE["Name"] = Name
Name.Name = "Name"
Name.Size = UDim2.new(1, 0, 0.173611104, 0)
Name.Position = UDim2.new(-0.00284900283, 0, -0.00227659475, 0)
Name.Text = "SM Executor"
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1
Name.TextTransparency = 0
Name.Visible = true
Name.ZIndex = 1
Name.FontFace = Font.new("rbxasset://fonts/families/IndieFlower.json", Enum.FontWeight.Bold, Enum.FontStyle.Italic)
Name.TextScaled = true
Name.TextSize = 20
Name.TextColor3 = Color3.fromRGB(0, 0, 0)
Name.BorderSizePixel = 0
Name.TextXAlignment = Enum.TextXAlignment.Center
Name.TextYAlignment = Enum.TextYAlignment.Center
Name.TextWrapped = true
Name.ClipsDescendants = false
Name.Parent = _STORAGE["MainMenu"] or MainMenu

local UICorner_4 = Instance.new("UICorner")
_STORAGE["UICorner_4"] = UICorner_4
UICorner_4.Name = "UICorner"
UICorner_4.Parent = _STORAGE["Name"] or Name

local TextLabel = Instance.new("TextLabel")
_STORAGE["TextLabel"] = TextLabel
TextLabel.Name = "TextLabel"
TextLabel.Size = UDim2.new(1, 0, 0.173611104, 0)
TextLabel.Position = UDim2.new(0, 0, 0.0649746656, 0)
TextLabel.Text = "-------------------"
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1
TextLabel.TextTransparency = 0
TextLabel.Visible = true
TextLabel.ZIndex = 1
TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.TextXAlignment = Enum.TextXAlignment.Center
TextLabel.TextYAlignment = Enum.TextYAlignment.Center
TextLabel.TextWrapped = true
TextLabel.ClipsDescendants = false
TextLabel.Parent = _STORAGE["MainMenu"] or MainMenu

local Btn = Instance.new("Frame")
_STORAGE["Btn"] = Btn
Btn.Name = "Btn"
Btn.Size = UDim2.new(0.826210797, 0, 0.71875, 0)
Btn.Position = UDim2.new(0.0883190855, 0, 0.203809947, 0)
Btn.BackgroundColor3 = Color3.fromRGB(255, 163, 15)
Btn.BackgroundTransparency = 0.5
Btn.Visible = true
Btn.ZIndex = 1
Btn.BorderSizePixel = 0
Btn.ClipsDescendants = false
Btn.Parent = _STORAGE["MainMenu"] or MainMenu

local HomeBtn = Instance.new("TextButton")
_STORAGE["HomeBtn"] = HomeBtn
HomeBtn.Name = "HomeBtn"
HomeBtn.Size = UDim2.new(0.934482753, 0, 0.241545901, 0)
HomeBtn.Position = UDim2.new(0.0255586822, 0, 0.175240785, 0)
HomeBtn.Text = "Home"
HomeBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
HomeBtn.BackgroundTransparency = 0
HomeBtn.TextTransparency = 0
HomeBtn.Visible = true
HomeBtn.ZIndex = 1
HomeBtn.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
HomeBtn.Font = Enum.Font.FredokaOne
HomeBtn.TextScaled = true
HomeBtn.TextSize = 14
HomeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
HomeBtn.BorderSizePixel = 0
HomeBtn.TextXAlignment = Enum.TextXAlignment.Center
HomeBtn.TextYAlignment = Enum.TextYAlignment.Center
HomeBtn.TextWrapped = true
HomeBtn.ClipsDescendants = false
HomeBtn.Parent = _STORAGE["Btn"] or Btn

local UICorner_5 = Instance.new("UICorner")
_STORAGE["UICorner_5"] = UICorner_5
UICorner_5.Name = "UICorner"
UICorner_5.Parent = _STORAGE["HomeBtn"] or HomeBtn

local UICorner_6 = Instance.new("UICorner")
_STORAGE["UICorner_6"] = UICorner_6
UICorner_6.Name = "UICorner"
UICorner_6.Parent = _STORAGE["Btn"] or Btn

local ExecBtn = Instance.new("TextButton")
_STORAGE["ExecBtn"] = ExecBtn
ExecBtn.Name = "ExecBtn"
ExecBtn.Size = UDim2.new(0.934482753, 0, 0.241545901, 0)
ExecBtn.Position = UDim2.new(0.0324552357, 0, 0.582772195, 0)
ExecBtn.Text = "Executor"
ExecBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
ExecBtn.BackgroundTransparency = 0
ExecBtn.TextTransparency = 0
ExecBtn.Visible = true
ExecBtn.ZIndex = 1
ExecBtn.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ExecBtn.Font = Enum.Font.FredokaOne
ExecBtn.TextScaled = true
ExecBtn.TextSize = 14
ExecBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ExecBtn.BorderSizePixel = 0
ExecBtn.TextXAlignment = Enum.TextXAlignment.Center
ExecBtn.TextYAlignment = Enum.TextYAlignment.Center
ExecBtn.TextWrapped = true
ExecBtn.ClipsDescendants = false
ExecBtn.Parent = _STORAGE["Btn"] or Btn

local UICorner_7 = Instance.new("UICorner")
_STORAGE["UICorner_7"] = UICorner_7
UICorner_7.Name = "UICorner"
UICorner_7.Parent = _STORAGE["ExecBtn"] or ExecBtn

local Menu = Instance.new("Frame")
_STORAGE["Menu"] = Menu
Menu.Name = "Menu"
Menu.Size = UDim2.new(0.376871169, 0, 0.318576396, 0)
Menu.Position = UDim2.new(0.207367197, 0, 0.462673604, 0)
Menu.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
Menu.BackgroundTransparency = 0.5
Menu.Visible = true
Menu.ZIndex = 1
Menu.BorderSizePixel = 0
Menu.ClipsDescendants = false
Menu.Parent = _STORAGE["ScreenGui"] or ScreenGui

local UICorner_8 = Instance.new("UICorner")
_STORAGE["UICorner_8"] = UICorner_8
UICorner_8.Name = "UICorner"
UICorner_8.Parent = _STORAGE["Menu"] or Menu

local Exec = Instance.new("Frame")
_STORAGE["Exec"] = Exec
Exec.Name = "Exec"
Exec.Size = UDim2.new(0.948598146, 0, 0.888283372, 0)
Exec.Position = UDim2.new(0.0257009342, 0, 0.0544957481, 0)
Exec.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
Exec.BackgroundTransparency = 0.30000001192092896
Exec.Visible = true
Exec.ZIndex = 1
Exec.BorderSizePixel = 0
Exec.ClipsDescendants = false
Exec.Parent = _STORAGE["Menu"] or Menu

local UICorner_9 = Instance.new("UICorner")
_STORAGE["UICorner_9"] = UICorner_9
UICorner_9.Name = "UICorner"
UICorner_9.Parent = _STORAGE["Exec"] or Exec

local ExecBtn_2 = Instance.new("TextButton")
_STORAGE["ExecBtn_2"] = ExecBtn_2
ExecBtn_2.Name = "ExecBtn"
ExecBtn_2.Size = UDim2.new(0.174876854, 0, 0.15337424, 0)
ExecBtn_2.Position = UDim2.new(0.00985221658, 0, 0.820194364, 0)
ExecBtn_2.Text = "EXECUTE"
ExecBtn_2.BackgroundColor3 = Color3.fromRGB(255, 230, 102)
ExecBtn_2.BackgroundTransparency = 0
ExecBtn_2.TextTransparency = 0
ExecBtn_2.Visible = true
ExecBtn_2.ZIndex = 1
ExecBtn_2.FontFace = Font.new("rbxasset://fonts/families/IndieFlower.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
ExecBtn_2.TextScaled = true
ExecBtn_2.TextSize = 14
ExecBtn_2.TextColor3 = Color3.fromRGB(0, 0, 0)
ExecBtn_2.BorderSizePixel = 0
ExecBtn_2.TextXAlignment = Enum.TextXAlignment.Center
ExecBtn_2.TextYAlignment = Enum.TextYAlignment.Center
ExecBtn_2.TextWrapped = true
ExecBtn_2.ClipsDescendants = false
ExecBtn_2.Parent = _STORAGE["Exec"] or Exec

local UICorner_10 = Instance.new("UICorner")
_STORAGE["UICorner_10"] = UICorner_10
UICorner_10.Name = "UICorner"
UICorner_10.Parent = _STORAGE["ExecBtn_2"] or ExecBtn_2

local RTSL = Instance.new("TextButton")
_STORAGE["RTSL"] = RTSL
RTSL.Name = "RTSL"
RTSL.Size = UDim2.new(0.174876854, 0, 0.15337424, 0)
RTSL.Position = UDim2.new(0.192118227, 0, 0.820194364, 0)
RTSL.Text = "Return to silent"
RTSL.BackgroundColor3 = Color3.fromRGB(97, 255, 255)
RTSL.BackgroundTransparency = 0
RTSL.TextTransparency = 0
RTSL.Visible = true
RTSL.ZIndex = 1
RTSL.FontFace = Font.new("rbxasset://fonts/families/IndieFlower.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
RTSL.TextScaled = true
RTSL.TextSize = 14
RTSL.TextColor3 = Color3.fromRGB(0, 0, 0)
RTSL.BorderSizePixel = 0
RTSL.TextXAlignment = Enum.TextXAlignment.Center
RTSL.TextYAlignment = Enum.TextYAlignment.Center
RTSL.TextWrapped = true
RTSL.ClipsDescendants = false
RTSL.Parent = _STORAGE["Exec"] or Exec

local UICorner_11 = Instance.new("UICorner")
_STORAGE["UICorner_11"] = UICorner_11
UICorner_11.Name = "UICorner"
UICorner_11.Parent = _STORAGE["RTSL"] or RTSL

local RTSL_2 = Instance.new("TextButton")
_STORAGE["RTSL_2"] = RTSL_2
RTSL_2.Name = "RTSL"
RTSL_2.Size = UDim2.new(0.284482747, 0, 0.15337424, 0)
RTSL_2.Position = UDim2.new(0.697044313, 0, 0.820194364, 0)
RTSL_2.Text = "Scan Backdoor"
RTSL_2.BackgroundColor3 = Color3.fromRGB(255, 115, 90)
RTSL_2.BackgroundTransparency = 0
RTSL_2.TextTransparency = 0
RTSL_2.Visible = true
RTSL_2.ZIndex = 1
RTSL_2.FontFace = Font.new("rbxasset://fonts/families/IndieFlower.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
RTSL_2.TextScaled = true
RTSL_2.TextSize = 14
RTSL_2.TextColor3 = Color3.fromRGB(0, 0, 0)
RTSL_2.BorderSizePixel = 0
RTSL_2.TextXAlignment = Enum.TextXAlignment.Center
RTSL_2.TextYAlignment = Enum.TextYAlignment.Center
RTSL_2.TextWrapped = true
RTSL_2.ClipsDescendants = false
RTSL_2.Parent = _STORAGE["Exec"] or Exec

local UICorner_12 = Instance.new("UICorner")
_STORAGE["UICorner_12"] = UICorner_12
UICorner_12.Name = "UICorner"
UICorner_12.Parent = _STORAGE["RTSL_2"] or RTSL_2

local TextBox = Instance.new("TextBox")
_STORAGE["TextBox"] = TextBox
TextBox.Name = "TextBox"
TextBox.Size = UDim2.new(0.964285731, 0, 0.75460124, 0)
TextBox.Position = UDim2.new(0.0172413792, 0, 0.0306748468, 0)
TextBox.Text = ""
TextBox.BackgroundColor3 = Color3.fromRGB(138, 138, 138)
TextBox.BackgroundTransparency = 0
TextBox.TextTransparency = 0
TextBox.Visible = true
TextBox.ZIndex = 1
TextBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextScaled = true
TextBox.TextSize = 14
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.TextWrapped = true
TextBox.ClipsDescendants = true
TextBox.Parent = _STORAGE["Exec"] or Exec

local UICorner_13 = Instance.new("UICorner")
_STORAGE["UICorner_13"] = UICorner_13
UICorner_13.Name = "UICorner"
UICorner_13.Parent = _STORAGE["TextBox"] or TextBox

local Home = Instance.new("Frame")
_STORAGE["Home"] = Home
Home.Name = "Home"
Home.Size = UDim2.new(0.973130763, 0, 0.942779303, 0)
Home.Position = UDim2.new(0.0128504671, 0, 0.0245231614, 0)
Home.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
Home.BackgroundTransparency = 0.30000001192092896
Home.Visible = true
Home.ZIndex = 1
Home.BorderSizePixel = 0
Home.ClipsDescendants = false
Home.Parent = _STORAGE["Menu"] or Menu

local UICorner_14 = Instance.new("UICorner")
_STORAGE["UICorner_14"] = UICorner_14
UICorner_14.Name = "UICorner"
UICorner_14.Parent = _STORAGE["Home"] or Home

local ImageLabel = Instance.new("ImageLabel")
_STORAGE["ImageLabel"] = ImageLabel
ImageLabel.Name = "ImageLabel"
ImageLabel.Size = UDim2.new(0.0600240156, 0, 0.144508675, 0)
ImageLabel.Position = UDim2.new(0.0192076825, 0, 0.0433526002, 0)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 0
ImageLabel.Image = "rbxassetid://88774721887954"
ImageLabel.ImageTransparency = 0
ImageLabel.Visible = true
ImageLabel.ZIndex = 1
ImageLabel.BorderSizePixel = 0
ImageLabel.ClipsDescendants = false
ImageLabel.Parent = _STORAGE["Home"] or Home

local UICorner_15 = Instance.new("UICorner")
_STORAGE["UICorner_15"] = UICorner_15
UICorner_15.Name = "UICorner"
UICorner_15.Parent = _STORAGE["ImageLabel"] or ImageLabel

local TextLabel_2 = Instance.new("TextLabel")
_STORAGE["TextLabel_2"] = TextLabel_2
TextLabel_2.Name = "TextLabel"
TextLabel_2.Size = UDim2.new(0.240096062, 0, 0.144508675, 0)
TextLabel_2.Position = UDim2.new(0.0936374515, 0, 0.0433526002, 0)
TextLabel_2.Text = "SM Executor"
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.TextTransparency = 0
TextLabel_2.Visible = true
TextLabel_2.ZIndex = 1
TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_2.TextYAlignment = Enum.TextYAlignment.Center
TextLabel_2.TextWrapped = true
TextLabel_2.ClipsDescendants = false
TextLabel_2.Parent = _STORAGE["Home"] or Home

local TextLabel_3 = Instance.new("TextLabel")
_STORAGE["TextLabel_3"] = TextLabel_3
TextLabel_3.Name = "TextLabel"
TextLabel_3.Size = UDim2.new(0.959183753, 0, 0.144508675, 0)
TextLabel_3.Position = UDim2.new(0.0192076825, 0, 0.187861279, 0)
TextLabel_3.Text = "Source : https://github.com/scriptmirroroffical"
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1
TextLabel_3.TextTransparency = 0
TextLabel_3.Visible = true
TextLabel_3.ZIndex = 1
TextLabel_3.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel_3.Font = Enum.Font.Fondamento
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14
TextLabel_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_3.TextYAlignment = Enum.TextYAlignment.Center
TextLabel_3.TextWrapped = true
TextLabel_3.ClipsDescendants = false
TextLabel_3.Parent = _STORAGE["Home"] or Home

local TextLabel_4 = Instance.new("TextLabel")
_STORAGE["TextLabel_4"] = TextLabel_4
TextLabel_4.Name = "TextLabel"
TextLabel_4.Size = UDim2.new(0.959183753, 0, 0.450867057, 0)
TextLabel_4.Position = UDim2.new(0.0204081628, 0, 0.332369953, 0)
TextLabel_4.Text = "Description : This Project had been started in the end month of 2025 and all of this project is open-source ,so you can adjust it . Thank you!"
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1
TextLabel_4.TextTransparency = 0
TextLabel_4.Visible = true
TextLabel_4.ZIndex = 1
TextLabel_4.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel_4.Font = Enum.Font.Fondamento
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14
TextLabel_4.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_4.TextYAlignment = Enum.TextYAlignment.Center
TextLabel_4.TextWrapped = true
TextLabel_4.ClipsDescendants = false
TextLabel_4.Parent = _STORAGE["Home"] or Home

local TextLabel_5 = Instance.new("TextLabel")
_STORAGE["TextLabel_5"] = TextLabel_5
TextLabel_5.Name = "TextLabel"
TextLabel_5.Size = UDim2.new(0.96038425, 0, 0.144508675, 0)
TextLabel_5.Position = UDim2.new(0.0180072021, 0, 0.812138736, 0)
TextLabel_5.Text = "<+><+><+><+><+><+<+><+><+><+><+><+><+><+><+><+><+>"
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BackgroundTransparency = 1
TextLabel_5.TextTransparency = 0
TextLabel_5.Visible = true
TextLabel_5.ZIndex = 1
TextLabel_5.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel_5.Font = Enum.Font.Fondamento
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 14
TextLabel_5.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_5.TextYAlignment = Enum.TextYAlignment.Center
TextLabel_5.TextWrapped = true
TextLabel_5.ClipsDescendants = false
TextLabel_5.Parent = _STORAGE["Home"] or Home

_G.OmniStorage = _STORAGE

--[[
    ======================================================================
    🔥 OMNI-GOD PRO CORE v7.0 - ULTIMATE EDITION 🔥
    Author: son171020 (Powered by SM Engine)
    Description: Advanced Modular Core for OmniStorage UI
    Features: Smooth Drag, Tween Animations, Deep Scanner, SS Injector
    ======================================================================
]]

--=========================================
-- 1. INITIALIZATION & SERVICES
--=========================================
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Lấy UI từ Storage của bạn
local _STORAGE = _G.OmniStorage
if not _STORAGE then
	warn("[SM CORE v7.0]: KHÔNG TÌM THẤY UI! Vui lòng chạy script UI trước.")
	return
end

-- Map các UI Elements
local UI = {
	ScreenGui = _STORAGE["ScreenGui"],
	BtnTgleGui = _STORAGE["BtnTgleGui"],
	ImageButton = _STORAGE["ImageButton"], -- Nút bật/tắt
	MainMenu = _STORAGE["MainMenu"],       -- Menu điều hướng
	HomeBtn = _STORAGE["HomeBtn"],
	ExecBtnNav = _STORAGE["ExecBtn"],      -- Nút chuyển sang tab Exec
	Menu = _STORAGE["Menu"],               -- Menu nội dung chính
	HomeTab = _STORAGE["Home"],            -- Tab Trang chủ
	ExecTab = _STORAGE["Exec"],            -- Tab Executor
	TextBox = _STORAGE["TextBox"],         -- Chỗ nhập code
	ExecuteBtn = _STORAGE["ExecBtn_2"],    -- Nút Execute (Thực thi)
	ScanBtn = _STORAGE["RTSL_2"],          -- Nút Scan
	ReturnBtn = _STORAGE["RTSL"],          -- Nút Return
	NameLabel = _STORAGE["Name"]
}

--=========================================
-- 2. ENGINE STATE (Trạng thái hệ thống)
--=========================================
local EngineState = {
	Version = "7.0.0-PRO",
	SSMode = false,
	TargetRemote = nil,
	Scanning = false,
	UI_Visible = true,
	CurrentTab = "Home" -- "Home" hoặc "Exec"
}

--=========================================
-- 3. HỆ THỐNG LOG & THÔNG BÁO (SAFE LOG)
--=========================================
local Colors = {
	Success = Color3.fromRGB(0, 255, 127),
	Warning = Color3.fromRGB(255, 170, 0),
	Error = Color3.fromRGB(255, 65, 65),
	Info = Color3.fromRGB(97, 255, 255),
	SS = Color3.fromRGB(170, 85, 255)
}

local function safeLog(message, colorType)
	local prefix = "[SM Core v7.0]: "
	-- In ra Console F9
	print(prefix .. message)

	-- Đổi màu viền của TextBox để báo hiệu cho user thay vì dùng label rườm rà
	if UI.TextBox then
		local originalColor = UI.TextBox.BackgroundColor3
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tweenColor = TweenService:Create(UI.TextBox, tweenInfo, {BackgroundColor3 = colorType or Colors.Info})
		local tweenBack = TweenService:Create(UI.TextBox, tweenInfo, {BackgroundColor3 = originalColor})

		tweenColor:Play()
		tweenColor.Completed:Connect(function()
			task.wait(0.5)
			tweenBack:Play()
		end)
	end
end

--=========================================
-- 4. HIỆU ỨNG & CHUYỂN ĐỘNG (ANIMATIONS)
--=========================================
-- Tween cấu hình chuẩn
local tweenConfig = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

-- Lấy chính xác BackGO từ Storage
local backgo = _G.OmniStorage["BackGO"]

local function toggleUI()
	EngineState.UI_Visible = not EngineState.UI_Visible

	local targetPosMenu = EngineState.UI_Visible and UDim2.new(0.207, 0, 0.462, 0) or UDim2.new(0.207, 0, 1.5, 0)
	local targetPosMain = EngineState.UI_Visible and UDim2.new(0.046, 0, 0.535, 0) or UDim2.new(0.046, 0, 1.5, 0)

	-- Trạng thái: Mở = 0.4 (Đậm) | Đóng = 0.9 (Mờ hẳn)
	local targetTrans = EngineState.UI_Visible and 0.155 or 0.655

	-- Chạy các hiệu ứng trượt Menu
	TweenService:Create(UI.Menu, tweenConfig, {Position = targetPosMenu}):Play()
	TweenService:Create(UI.MainMenu, tweenConfig, {Position = targetPosMain}):Play()

	-- FIX: Ép BackGO thay đổi độ mờ
	if backgo then
		TweenService:Create(backgo, tweenConfig, {BackgroundTransparency = targetTrans}):Play()
	end

	-- Xoay nhẹ Logo khi bấm
	local rot = EngineState.UI_Visible and 0 or 180
	TweenService:Create(UI.ImageButton, TweenInfo.new(0.3), {Rotation = rot}):Play()
end

UI.ImageButton.MouseButton1Click:Connect(toggleUI)

-- Chuyển Tab (Home <-> Exec)
local function switchTab(tabName)
	if EngineState.CurrentTab == tabName then return end
	EngineState.CurrentTab = tabName

	if tabName == "Home" then
		UI.HomeTab.Visible = true
		UI.ExecTab.Visible = false
		TweenService:Create(UI.HomeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 200, 0)}):Play()
		TweenService:Create(UI.ExecBtnNav, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 140, 0)}):Play()
	elseif tabName == "Exec" then
		UI.HomeTab.Visible = false
		UI.ExecTab.Visible = true
		TweenService:Create(UI.ExecBtnNav, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 200, 0)}):Play()
		TweenService:Create(UI.HomeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 140, 0)}):Play()
	end
end

UI.HomeBtn.MouseButton1Click:Connect(function() switchTab("Home") end)
UI.ExecBtnNav.MouseButton1Click:Connect(function() switchTab("Exec") end)

-- Ẩn Exec mặc định khi load
UI.ExecTab.Visible = false

--=========================================
-- 5. SMOOTH DRAGGING MODULE (FIXED)
--=========================================
-- Chỉ áp dụng cho Frame, KHÔNG áp dụng cho ScreenGui
local function makeDraggable(guiObject)
	local dragging, dragInput, dragStart, startPos

	local function update(input)
		local delta = input.Position - dragStart
		local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		-- Dùng Tween để kéo mượt hơn thay vì gán cứng
		TweenService:Create(guiObject, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {Position = newPos}):Play()
	end

	guiObject.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = guiObject.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)

	guiObject.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then update(input) end
	end)
end

makeDraggable(UI.MainMenu)
makeDraggable(UI.Menu)

--=========================================
-- SM-EXECUTOR: CORE SCANNER EXTREME V6
-- INTEGRATED LALOL LOGIC + ANTI-KICK
--=========================================

local function runUltraScanExtremeV6()
    if EngineState.Scanning then return end
    EngineState.Scanning = true
    
    EngineState.TargetRemote = nil
    EngineState.ValidKey = nil
    EngineState.ExecuteMethod = 1
    
    UI.ScanBtn.Text = "SCANNING..."
    UI.ScanBtn.BackgroundColor3 = Colors.Warning

    -- Bộ Dictionary kết hợp từ LALOL và SM
    local extremeKeys = {"Run", "Execute", "Load", "SS", "Admin", "F1113", "C00lkidd", "Pex", "Kohl"}
    local verifyToken = "SM_VERIFIED_" .. math.random(1000, 9999)

    task.spawn(function()
        -- GIAI ĐOẠN 1: QUÉT AN TOÀN (GIỮ NGUYÊN ANTI-KICK)
        local allObjects = game:GetDescendants()
        local remotes = {}
        
        for i, v in ipairs(allObjects) do
            if i % 120 == 0 then
                UI.ScanBtn.Text = "SCAN: " .. math.floor((i/#allObjects)*100) .. "%"
                task.wait() 
            end
            if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                local path = v:GetFullName()
                if not path:find("RobloxReplicatedStorage") and not path:find("ChatService") then
                    table.insert(remotes, v)
                end
            end
        end

        safeLog("🔍 Tìm thấy " .. #remotes .. " Remote. Đang áp dụng Check Methods...", Colors.Warning)

        -- GIAI ĐOẠN 2: 5-METHOD VERIFICATION (CHẬM & CHẮC)
        for index, remote in ipairs(remotes) do
            if EngineState.TargetRemote then break end
            
            UI.ScanBtn.Text = "V-CHECK: " .. index .. "/" .. #remotes
            task.wait(0.15) -- Delay để chống bị kick dồn dập

            pcall(function()
                -- Tích hợp logic LALOL: Print Verification
                local checkCode = "print('" .. verifyToken .. "') local p = Instance.new('Part', workspace) p.Name = '" .. verifyToken .. "' p.Transparency = 1 task.wait(0.1) p:Destroy()"

                -- Thử các Method thực thi
                local function fire(k, m)
                    if remote:IsA("RemoteEvent") then
                        if m == 1 then remote:FireServer(checkCode)
                        elseif m == 2 then remote:FireServer("Execute", checkCode)
                        elseif m == 3 then remote:FireServer(k, checkCode) end
                    else
                        local res = remote:InvokeServer("return '" .. verifyToken .. "'")
                        if res == verifyToken then return true end
                    end
                    return false
                end

                -- Vòng lặp check thực tế
                for m = 1, 3 do
                    if fire(nil, m) then 
                        -- Check vật lý (Part) hoặc Log
                        if workspace:FindFirstChild(verifyToken) then
                            EngineState.TargetRemote = remote
                            EngineState.ExecuteMethod = m
                            break
                        end
                    end
                    
                    -- Nếu chưa ra, thử Brute-force Key như LALOL
                    for _, k in ipairs(extremeKeys) do
                        if fire(k, 3) then
                            if workspace:FindFirstChild(verifyToken) then
                                EngineState.TargetRemote = remote
                                EngineState.ValidKey = k
                                EngineState.ExecuteMethod = 3
                                break
                            end
                        end
                    end
                    if EngineState.TargetRemote then break end
                end
            end)
        end

        -- GIAI ĐOẠN KẾT THÚC
        if EngineState.TargetRemote then
            UI.ScanBtn.Text = "SS SECURED!"
            UI.ScanBtn.BackgroundColor3 = Colors.Success
            UI.ExecuteBtn.Text = "EXECUTE (SS)"
            UI.ExecuteBtn.BackgroundColor3 = Colors.SS
            UI.NameLabel.Text = "SM [SS ACTIVE]"
            
            safeLog("✅ Đã khóa mục tiêu: " .. EngineState.TargetRemote.Name, Colors.Success)
            if EngineState.ValidKey then safeLog("🔑 Key: " .. EngineState.ValidKey, Colors.Success) end
        else
            UI.ScanBtn.Text = "SCAN FAILED"
            UI.ScanBtn.BackgroundColor3 = Colors.Error
            safeLog("❌ Không tìm thấy cổng vào khả dụng.", Colors.Error)
            task.wait(2)
            UI.ScanBtn.Text = "Scan Backdoor"
            UI.ScanBtn.BackgroundColor3 = Color3.fromRGB(255, 115, 90)
        end
        EngineState.Scanning = false
    end)
end

--=========================================
-- 3-METHOD EXECUTE (SM-LOGIC)
--=========================================
local function SS_Execute_V6(code)
    if not EngineState.TargetRemote then 
        safeLog("Chưa có Remote SS nào được nạp!", Colors.Error)
        return 
    end
    
    local remote = EngineState.TargetRemote
    local method = EngineState.ExecuteMethod
    local key = EngineState.ValidKey

    local success, err = pcall(function()
        if method == 1 then
            remote:FireServer(code)
        elseif method == 2 then
            remote:FireServer("Execute", code)
        elseif method == 3 then
            remote:FireServer(key, code)
        end
    end)

    if success then
        safeLog("🚀 Gửi lệnh thành công qua Method " .. method, Colors.Success)
    else
        safeLog("⚠️ Lỗi thực thi: " .. tostring(err), Colors.Error)
    end
end

-- Kết nối UI
UI.ScanBtn.MouseButton1Click:Connect(runUltraScanExtremeV6)
UI.ExecuteBtn.MouseButton1Click:Connect(function()
    SS_Execute_V6(UI.Editor.Text)
end)

--=========================================
-- 7. SS & LOCAL EXECUTOR MODULE
--=========================================
UI.ExecuteBtn.MouseButton1Click:Connect(function()
	local inputSource = UI.TextBox.Text
	if inputSource == "" or inputSource == " " then 
		safeLog("Vui lòng nhập script trước!", Colors.Error)
		return 
	end

	local remote = EngineState.TargetRemote

	-- [ THỰC THI SERVER-SIDE ]
	if EngineState.SSMode and remote then
		safeLog("Đang thử nghiệm các Payload vào SS...", Colors.Warning)

		local _, cleanCode = pcall(function() return inputSource:gsub('"', '\\"') end)
		cleanCode = cleanCode or inputSource

		local payloads = {
			inputSource, 
			"spawn(function() " .. inputSource .. " end)",
			[[require(666666).load("]] .. cleanCode .. [[")]],
			{["script"] = inputSource, ["type"] = "execute"}
		}

		task.spawn(function()
			local successCount = 0
			for i, p in ipairs(payloads) do
				local s, _ = pcall(function()
					if remote:IsA("RemoteEvent") then remote:FireServer(p) else remote:InvokeServer(p) end
				end)
				if s then successCount = successCount + 1 end
				task.wait(0.1)
			end

			if successCount > 0 then 
				safeLog("Đã gửi Payload SS! Mở F9 tab Server để kiểm tra.", Colors.Success)
			else
				safeLog("Thất bại. Remote đã chặn hoặc bị lỗi.", Colors.Error)
			end
		end)

		-- [ THỰC THI CLIENT-SIDE ]
	else
		local execFunc = loadstring or getgenv().loadstring
		if execFunc then
			local f, err = execFunc(inputSource)
			if f then 
				local s, rErr = pcall(f)
				if not s then safeLog("Runtime Lỗi: " .. tostring(rErr), Colors.Error) 
				else safeLog("Thực thi Local thành công!", Colors.Success) end
			else 
				safeLog("Syntax Lỗi: " .. tostring(err), Colors.Error) 
			end
		else
			safeLog("Executor này không hỗ trợ lệnh loadstring!", Colors.Error)
		end
	end
end)

--=========================================
-- 8. RETURN TO SILENT MODULE
--=========================================
UI.ReturnBtn.MouseButton1Click:Connect(function()
	EngineState.SSMode = false
	EngineState.TargetRemote = nil

	-- Reset giao diện về bình thường
	UI.ExecuteBtn.Text = "EXECUTE"
	UI.ExecuteBtn.BackgroundColor3 = Color3.fromRGB(255, 230, 102)
	UI.ScanBtn.Text = "Scan Backdoor"
	UI.ScanBtn.BackgroundColor3 = Color3.fromRGB(255, 115, 90)
	UI.NameLabel.Text = "SM Executor"
	UI.NameLabel.TextColor3 = Color3.fromRGB(0, 0, 0)

	safeLog("Đã hủy kết nối SS. Trở về chế độ Client.", Colors.Info)
end)

--=========================================
-- FIX: BACKGO XOAY VÔ TẬN (SM-ROTATION-CORE)
--=========================================

local function StartBackRotation()
	local backgo = _STORAGE["BackGO"] or UI.BackGO

	if backgo then
		-- 1. QUAN TRỌNG: Đặt tâm xoay vào giữa (Tránh xoay lệch)
		backgo.AnchorPoint = Vector2.new(0.5, 0.5)

		-- Cập nhật lại Position để không bị lệch khi đổi AnchorPoint
		-- (Dựa trên tọa độ gốc của bạn: -0.093, -0.087)
		backgo.Position = UDim2.new(0.5, 0, 0.5, 0) 

		-- 2. Thiết lập Tween xoay 360 độ liên tục
		-- Thời gian: 4 giây | Easing: Linear (Xoay đều) | Repeat: -1 (Vô tận)
		local rotateInfo = TweenInfo.new(
			4, 
			Enum.EasingStyle.Linear, 
			Enum.EasingDirection.InOut, 
			-1, 
			false
		)

		-- Tạo và chạy Tween
		local rotateTween = TweenService:Create(backgo, rotateInfo, {
			Rotation = 360
		})

		rotateTween:Play()

		-- Debug (Xóa sau khi chạy tốt)
		print("SM Engine: BackGO Rotation Started.")
	else
		warn("SM Engine: Không tìm thấy BackGO để xoay!")
	end
end

-- Chạy hàm xoay ngay khi load script
task.spawn(StartBackRotation)

-- Reset màu Logo về trắng khi thoát SS
local function resetLogoColor()
	if not UI.ImageButton then return end
	local colorTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	TweenService:Create(UI.ImageButton, colorTweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end

--=========================================
-- FINAL BOOT SEQUENCE
--=========================================
safeLog("OMNI-GOD v7.0 LOADED SUCCESSFULLY!", Colors.Success)
switchTab("Home")
