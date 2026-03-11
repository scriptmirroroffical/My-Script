-- Nexus Advanced Remote Tuner
local Players = game:GetService("Players")
local LogService = game:GetService("LogService")
local player = Players.LocalPlayer

local selectedRemote = nil

-- ==========================================
-- 1. ADVANCED UI SETUP
-- ==========================================
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "NexusAdvanced"
screenGui.ResetOnSpawn = false

local main = Instance.new("Frame", screenGui)
main.Size = UDim2.new(0, 600, 0, 450)
main.Position = UDim2.new(0.5, -300, 0.5, -225)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main)

-- Tab Bar
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -20, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.Text = "NEXUS ADVANCED TUNER v2.0"
title.TextColor3 = Color3.fromRGB(0, 255, 170)
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left

-- Left Side: Remote Browser
local listScroll = Instance.new("ScrollingFrame", main)
listScroll.Size = UDim2.new(0.45, 0, 1, -100)
listScroll.Position = UDim2.new(0, 10, 0, 90)
listScroll.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
listScroll.CanvasSize = UDim2.new(0,0,10,0)
local listLayout = Instance.new("UIListLayout", listScroll)

local searchBox = Instance.new("TextBox", main)
searchBox.Size = UDim2.new(0.45, 0, 0, 30)
searchBox.Position = UDim2.new(0, 10, 0, 50)
searchBox.PlaceholderText = "Search Remotes..."
searchBox.Text = ""
searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
searchBox.TextColor3 = Color3.new(1, 1, 1)

-- Right Side: Execution Console
local consoleFrame = Instance.new("Frame", main)
consoleFrame.Size = UDim2.new(0.5, 0, 1, -50)
consoleFrame.Position = UDim2.new(0.48, 0, 0, 50)
consoleFrame.BackgroundTransparency = 1

local targetDisplay = Instance.new("TextLabel", consoleFrame)
targetDisplay.Size = UDim2.new(1, 0, 0, 30)
targetDisplay.Text = "No Remote Selected"
targetDisplay.TextColor3 = Color3.fromRGB(255, 165, 0)
targetDisplay.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

local argLabel = Instance.new("TextLabel", consoleFrame)
argLabel.Size = UDim2.new(1, 0, 0, 20)
argLabel.Position = UDim2.new(0, 0, 0, 40)
argLabel.Text = "Arguments (Lua Format):"
argLabel.BackgroundTransparency = 1
argLabel.TextColor3 = Color3.new(0.7, 0.7, 0.7)
argLabel.TextXAlignment = 0

local argBox = Instance.new("TextBox", consoleFrame)
argBox.Size = UDim2.new(1, 0, 0, 200)
argBox.Position = UDim2.new(0, 0, 0, 65)
argBox.MultiLine = true
argBox.Text = "100, \"Sword\", {Level = 50}, math.huge"
argBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
argBox.TextColor3 = Color3.fromRGB(0, 255, 0)
argBox.Font = Enum.Font.Code
argBox.TextXAlignment = 0
argBox.TextYAlignment = 0
argBox.ClearTextOnFocus = false

local fireBtn = Instance.new("TextButton", consoleFrame)
fireBtn.Size = UDim2.new(1, 0, 0, 50)
fireBtn.Position = UDim2.new(0, 0, 0, 275)
fireBtn.Text = "EXECUTE ON SERVER"
fireBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
fireBtn.TextColor3 = Color3.new(1, 1, 1)
fireBtn.Font = Enum.Font.GothamBold

-- ==========================================
-- 2. LOGIC & PARSING
-- ==========================================

-- Secret Sauce: Converts your text box into real Lua types
local function getArgs(rawText)
    local success, func = pcall(function()
        return loadstring("return {" .. rawText .. "}")
    end)
    
    if success and type(func) == "function" then
        return unpack(func())
    end
    return nil
end

fireBtn.MouseButton1Click:Connect(function()
    if not selectedRemote then return end
    
    local args = {getArgs(argBox.Text)}
    
    local success, err = pcall(function()
        if selectedRemote:IsA("RemoteEvent") then
            selectedRemote:FireServer(unpack(args))
        elseif selectedRemote:IsA("RemoteFunction") then
            local res = selectedRemote:InvokeServer(unpack(args))
            print("Server returned:", res)
        end
    end)
    
    if success then
        fireBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        task.wait(0.5)
        fireBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    else
        warn("Execution Failed: " .. tostring(err))
    end
end)

local function updateList()
    for _, v in pairs(listScroll:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    
    for _, obj in pairs(game:GetDescendants()) do
        if (obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction")) and obj.Name:lower():find(searchBox.Text:lower()) then
            local b = Instance.new("TextButton", listScroll)
            b.Size = UDim2.new(1, 0, 0, 25)
            b.Text = obj.Name
            b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            b.TextColor3 = Color3.new(0.8, 0.8, 0.8)
            b.Font = Enum.Font.Code
            
            b.MouseButton1Click:Connect(function()
                selectedRemote = obj
                targetDisplay.Text = "TARGET: " .. obj.Name
                print("Selected Path: " .. obj:GetFullName())
            end)
        end
    end
end

searchBox:GetPropertyChangedSignal("Text"):Connect(updateList)
updateList()