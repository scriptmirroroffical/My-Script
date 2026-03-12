-- ==========================================
-- NEXUS ADVANCED REMOTE TUNER v2.4 (Spy & Block)
-- ==========================================
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local selectedRemote = nil
local cachedRemotes = {}
local blockedRemotes = {}
local isSpying = false

local guiParent = (pcall(function() return CoreGui.Name end) and CoreGui) or player:WaitForChild("PlayerGui")
if guiParent:FindFirstChild("NexusAdvanced") then guiParent.NexusAdvanced:Destroy() end

-- ==========================================
-- 1. UI SETUP
-- ==========================================
local screenGui = Instance.new("ScreenGui", guiParent)
screenGui.Name = "NexusAdvanced"
screenGui.ResetOnSpawn = false

local main = Instance.new("Frame", screenGui)
main.Size = UDim2.new(0, 650, 0, 500)
main.Position = UDim2.new(0.5, -325, 0.5, -250)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Active = true
main.Draggable = true
main.ClipsDescendants = true 
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)

-- Header
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -110, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "NEXUS ADVANCED TUNER v2.4"
title.TextColor3 = Color3.fromRGB(0, 255, 170)
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.BackgroundTransparency = 1

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", closeBtn)

local minBtn = Instance.new("TextButton", header)
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -75, 0, 5)
minBtn.Text = "-"
minBtn.BackgroundColor3 = Color3.fromRGB(200, 150, 0)
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", minBtn)

-- Container
local container = Instance.new("Frame", main)
-- FIX: Changed Y scale from (1, -40) to a fixed absolute height of 460 (500 total - 40 header).
-- This stops the bottom buttons from flying upwards when the main frame shrinks!
container.Size = UDim2.new(1, 0, 0, 460) 
container.Position = UDim2.new(0, 0, 0, 40)
container.BackgroundTransparency = 1

-- Left Panel (Search & List)
local searchBox = Instance.new("TextBox", container)
searchBox.Size = UDim2.new(0.4, -35, 0, 30)
searchBox.Position = UDim2.new(0, 10, 0, 10)
searchBox.PlaceholderText = "Search Remotes..."
searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
searchBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", searchBox)

local refreshBtn = Instance.new("TextButton", container)
refreshBtn.Size = UDim2.new(0, 30, 0, 30)
refreshBtn.Position = UDim2.new(0.4, -20, 0, 10)
refreshBtn.Text = "↻"
refreshBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
refreshBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", refreshBtn)

local listScroll = Instance.new("ScrollingFrame", container)
listScroll.Size = UDim2.new(0.4, 0, 1, -60)
listScroll.Position = UDim2.new(0, 10, 0, 50)
listScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
listScroll.BorderSizePixel = 0
Instance.new("UICorner", listScroll)
local listLayout = Instance.new("UIListLayout", listScroll)

-- Right Panel (Console, Spy, Block)
local consoleFrame = Instance.new("Frame", container)
consoleFrame.Size = UDim2.new(0.6, -20, 1, -20)
consoleFrame.Position = UDim2.new(0.4, 10, 0, 10)
consoleFrame.BackgroundTransparency = 1

local targetDisplay = Instance.new("TextLabel", consoleFrame)
targetDisplay.Size = UDim2.new(0.7, -5, 0, 30)
targetDisplay.Text = "TARGET: None"
targetDisplay.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
targetDisplay.TextColor3 = Color3.fromRGB(255, 165, 0)
Instance.new("UICorner", targetDisplay)

local spyToggleBtn = Instance.new("TextButton", consoleFrame)
spyToggleBtn.Size = UDim2.new(0.3, 0, 0, 30)
spyToggleBtn.Position = UDim2.new(0.7, 5, 0, 0)
spyToggleBtn.Text = "SPY: OFF"
spyToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
spyToggleBtn.TextColor3 = Color3.new(1, 1, 1)
spyToggleBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", spyToggleBtn)

local argBox = Instance.new("TextBox", consoleFrame)
argBox.Size = UDim2.new(1, 0, 0, 130)
argBox.Position = UDim2.new(0, 0, 0, 40)
argBox.MultiLine = true
argBox.Text = "1, \"Sword\""
argBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
argBox.TextColor3 = Color3.fromRGB(0, 255, 0)
argBox.Font = Enum.Font.Code
argBox.TextXAlignment = 0
argBox.TextYAlignment = 0
argBox.ClearTextOnFocus = false
Instance.new("UICorner", argBox)

local logScroll = Instance.new("ScrollingFrame", consoleFrame)
logScroll.Size = UDim2.new(1, 0, 0, 160)
logScroll.Position = UDim2.new(0, 0, 0, 180)
logScroll.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
logScroll.BorderSizePixel = 0
logScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
logScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Instance.new("UICorner", logScroll)
local logLayout = Instance.new("UIListLayout", logScroll)
logLayout.SortOrder = Enum.SortOrder.LayoutOrder

local fireBtn = Instance.new("TextButton", consoleFrame)
fireBtn.Size = UDim2.new(0.5, -5, 0, 40)
fireBtn.Position = UDim2.new(0, 0, 1, -40)
fireBtn.Text = "EXECUTE"
fireBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
fireBtn.TextColor3 = Color3.new(1, 1, 1)
fireBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", fireBtn)

local blockBtn = Instance.new("TextButton", consoleFrame)
blockBtn.Size = UDim2.new(0.5, -5, 0, 40)
blockBtn.Position = UDim2.new(0.5, 5, 1, -40)
blockBtn.Text = "BLOCK TARGET"
blockBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
blockBtn.TextColor3 = Color3.new(1, 1, 1)
blockBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", blockBtn)

-- ==========================================
-- LOGIC
-- ==========================================

-- UI Helpers
local function logSpy(message, color)
    local msgLabel = Instance.new("TextLabel", logScroll)
    msgLabel.Size = UDim2.new(1, -10, 0, 20)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = color or Color3.fromRGB(200, 200, 200)
    msgLabel.Font = Enum.Font.Code
    msgLabel.TextSize = 12
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextWrapped = true
    msgLabel.AutomaticSize = Enum.AutomaticSize.Y
end

-- Minimize
local isMinimized = false
local originalSize = UDim2.new(0, 650, 0, 500)
local minimizedSize = UDim2.new(0, 650, 0, 40)

minBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    local targetSize = isMinimized and minimizedSize or originalSize
    local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    TweenService:Create(main, tweenInfo, {Size = targetSize}):Play()
    minBtn.Text = isMinimized and "+" or "-"
end)

-- List Updating
local function refreshCache()
    table.clear(cachedRemotes)
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then table.insert(cachedRemotes, obj) end
    end
end

local function updateList()
    for _, v in pairs(listScroll:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    local filter = searchBox.Text:lower()
    for _, obj in ipairs(cachedRemotes) do
        if obj.Parent and (filter == "" or obj.Name:lower():find(filter)) then
            local b = Instance.new("TextButton", listScroll)
            b.Size = UDim2.new(1, 0, 0, 25)
            
            local prefix = blockedRemotes[obj] and "[B] " or " "
            b.Text = prefix .. obj.Name
            
            b.BackgroundColor3 = blockedRemotes[obj] and Color3.fromRGB(80, 20, 20) or Color3.fromRGB(35, 35, 35)
            b.TextColor3 = Color3.new(0.8, 0.8, 0.8)
            Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
            b.MouseButton1Click:Connect(function()
                selectedRemote = obj
                targetDisplay.Text = "TARGET: " .. obj.Name
                blockBtn.Text = blockedRemotes[obj] and "UNBLOCK" or "BLOCK TARGET"
                blockBtn.BackgroundColor3 = blockedRemotes[obj] and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(80, 80, 80)
            end)
        end
    end
end

-- Execute Logic
fireBtn.MouseButton1Click:Connect(function()
    if not selectedRemote then return end
    local success, func = pcall(function() return loadstring("return {" .. argBox.Text .. "}") end)
    if success and type(func) == "function" then
        local args = {func()}
        pcall(function()
            if selectedRemote:IsA("RemoteEvent") then selectedRemote:FireServer(unpack(args))
            else print("Server Res:", selectedRemote:InvokeServer(unpack(args))) end
            logSpy("-> FIRED: " .. selectedRemote.Name, Color3.fromRGB(0, 255, 0))
        end)
    end
end)

-- Spy & Block Toggles
spyToggleBtn.MouseButton1Click:Connect(function()
    isSpying = not isSpying
    spyToggleBtn.Text = isSpying and "SPY: ON" or "SPY: OFF"
    spyToggleBtn.BackgroundColor3 = isSpying and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(50, 50, 50)
    if isSpying then logSpy("--- SPY ENABLED ---", Color3.fromRGB(255, 255, 0)) end
end)

blockBtn.MouseButton1Click:Connect(function()
    if not selectedRemote then return end
    if blockedRemotes[selectedRemote] then
        blockedRemotes[selectedRemote] = nil
        blockBtn.Text = "BLOCK TARGET"
        blockBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        logSpy("Unblocked: " .. selectedRemote.Name, Color3.fromRGB(150, 150, 150))
    else
        blockedRemotes[selectedRemote] = true
        blockBtn.Text = "UNBLOCK"
        blockBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        logSpy("BLOCKED: " .. selectedRemote.Name, Color3.fromRGB(255, 100, 100))
    end
    updateList()
end)

-- Hooking Logic
if hookmetamethod then
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        
        if method == "FireServer" or method == "InvokeServer" then
            if blockedRemotes[self] then
                return 
            end
            
            if isSpying and not checkcaller() then
                local args = {...}
                local argString = ""
                for i, v in ipairs(args) do
                    argString = argString .. tostring(v) .. (i < #args and ", " or "")
                end
                task.defer(function()
                    logSpy(self.Name .. " | Args: {" .. argString .. "}", Color3.fromRGB(150, 200, 255))
                end)
            end
        end
        
        return oldNamecall(self, ...)
    end)
else
    warn("Your executor does not support hookmetamethod! Spy and Block will not function.")
    logSpy("ERROR: hookmetamethod not supported by executor.", Color3.fromRGB(255, 0, 0))
end

-- Init
searchBox:GetPropertyChangedSignal("Text"):Connect(updateList)
refreshBtn.MouseButton1Click:Connect(function() refreshCache() updateList() end)
closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)

refreshCache()
updateList()
