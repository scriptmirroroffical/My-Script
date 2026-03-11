-- Nexus Ultra: Remote Scanner & Tuner
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local selectedRemote = nil -- Lưu trữ Remote đang được chọn

-- ==========================================
-- 1. UI SETUP (Giao diện tối giản, tập trung)
-- ==========================================
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "NexusRemoteTuner"
screenGui.ResetOnSpawn = false

local main = Instance.new("Frame", screenGui)
main.Size = UDim2.new(0, 550, 0, 400)
main.Position = UDim2.new(0.5, -275, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

-- Tiêu đề
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "📡 NEXUS REMOTE TUNER"
title.TextColor3 = Color3.fromRGB(0, 255, 150)
title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
title.Font = Enum.Font.GothamBold

-- Cột trái: Danh sách Remote (Scanner)
local scrollList = Instance.new("ScrollingFrame", main)
scrollList.Size = UDim2.new(0.5, -15, 1, -80)
scrollList.Position = UDim2.new(0, 10, 0, 70)
scrollList.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
scrollList.ScrollBarThickness = 4
local listLayout = Instance.new("UIListLayout", scrollList)
listLayout.Padding = UDim.new(0, 2)

local scanBtn = Instance.new("TextButton", main)
scanBtn.Size = UDim2.new(0.5, -15, 0, 30)
scanBtn.Position = UDim2.new(0, 10, 0, 35)
scanBtn.Text = "🔍 SCAN REMOTES"
scanBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
scanBtn.TextColor3 = Color3.new(1, 1, 1)

-- Cột phải: Bảng điều khiển (Tuner)
local tunerFrame = Instance.new("Frame", main)
tunerFrame.Size = UDim2.new(0.5, -15, 1, -40)
tunerFrame.Position = UDim2.new(0.5, 5, 0, 35)
tunerFrame.BackgroundTransparency = 1

local targetLabel = Instance.new("TextLabel", tunerFrame)
targetLabel.Size = UDim2.new(1, 0, 0, 40)
targetLabel.Text = "Not Selected Remote"
targetLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
targetLabel.TextWrapped = true
targetLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local argInput = Instance.new("TextBox", tunerFrame)
argInput.Size = UDim2.new(1, 0, 0, 150)
argInput.Position = UDim2.new(0, 0, 0, 50)
argInput.MultiLine = true
argInput.Text = "WELCOME"
argInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
argInput.TextColor3 = Color3.new(1, 1, 1)
argInput.Font = Enum.Font.Code
argInput.ClearTextOnFocus = false
argInput.TextXAlignment = 0
argInput.TextYAlignment = 0

local fireBtn = Instance.new("TextButton", tunerFrame)
fireBtn.Size = UDim2.new(1, 0, 0, 50)
fireBtn.Position = UDim2.new(0, 0, 0, 210)
fireBtn.Text = "🚀 FIRE REMOTE"
fireBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
fireBtn.TextColor3 = Color3.new(1, 1, 1)
fireBtn.Font = Enum.Font.GothamBold

-- ==========================================
-- 2. LOGIC XỬ LÝ
-- ==========================================

-- Hàm phân tích tham số từ TextBox thành Lua Arguments
local function parseArgs(str)
    local func = loadstring("return {" .. str .. "}")
    if func then
        return unpack(func())
    end
    return nil
end

-- Hàm thực thi Remote đã chọn
fireBtn.MouseButton1Click:Connect(function()
    if not selectedRemote then 
        targetLabel.Text = "LỖI: Hãy chọn 1 Remote trước!"
        return 
    end
    
    local success, err = pcall(function()
        local args = {parseArgs(argInput.Text)}
        if selectedRemote:IsA("RemoteEvent") then
            selectedRemote:FireServer(unpack(args))
        elseif selectedRemote:IsA("RemoteFunction") then
            local result = selectedRemote:InvokeServer(unpack(args))
            print("Kết quả trả về: ", result)
        end
    end)
    
    if success then
        fireBtn.Text = "✅ SENDED!"
        task.wait(1)
        fireBtn.Text = "🚀 FIRE REMOTE"
    else
        warn("Lỗi khi thực thi: " .. err)
        fireBtn.Text = "❌ CODE ERROR!"
        task.wait(1)
        fireBtn.Text = "🚀 FIRE REMOTE"
    end
end)

-- Hàm Quét và Hiển thị
scanBtn.MouseButton1Click:Connect(function()
    -- Xóa danh sách cũ
    for _, v in pairs(scrollList:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local btn = Instance.new("TextButton", scrollList)
            btn.Size = UDim2.new(1, 0, 0, 30)
            btn.Text = "[" .. obj.ClassName:sub(1,6) .. "] " .. obj.Name
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            btn.BorderSizePixel = 0
            
            -- Khi click vào một Remote trong danh sách
            btn.MouseButton1Click:Connect(function()
                selectedRemote = obj
                targetLabel.Text = "TARGET: " .. obj.Name
                print("Đã chọn: " .. obj:GetFullName())
                
                -- Hiệu ứng chọn
                for _, other in pairs(scrollList:GetChildren()) do 
                    if other:IsA("TextButton") then other.BackgroundColor3 = Color3.fromRGB(40, 40, 40) end
                end
                btn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
            end)
        end
    end
end)