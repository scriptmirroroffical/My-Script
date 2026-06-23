local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local CollectionService = game:GetService("CollectionService")

local player = Players.LocalPlayer
local active = false
local bypassLevel = 2 
local connections = {}
local targetRemote = nil 

-- Bảo vệ UI
local targetGui = pcall(function() return CoreGui.Name end) and CoreGui or player:WaitForChild("PlayerGui")
if targetGui:FindFirstChild("OmniGodHub") then targetGui.OmniGodHub:Destroy() end

-----------------------------------------------------------
-- 1. TỐI ƯU HÓA GHOST SCAN (PHIÊN BẢN TỐC ĐỘ CAO)
-----------------------------------------------------------
local function GhostScanSS(logCallback)
    -- Chỉ quét các Service có khả năng chứa Backdoor cao nhất
    local targetsToScan = {
        game:GetService("ReplicatedStorage"),
        game:GetService("StarterGui"),
        game:GetService("Workspace"),
        player:WaitForChild("PlayerGui")
    }
    
    local verifyToken = "OMNI_" .. math.random(1000, 9999)
    local keywords = {"defaultserver", "kohl", "admin", "remote", "control", "main", "execute", "v3rm"}
    local payload = "local p = Instance.new('Part', workspace) p.Name = '" .. verifyToken .. "' p.Transparency = 1 task.wait(0.5) p:Destroy()"

    for _, service in ipairs(targetsToScan) do
        if targetRemote then break end
        local objects = service:GetDescendants()
        local count = #objects
        
        if logCallback then logCallback("SCANNING: " .. service.Name) end

        for i = 1, count do
            if targetRemote then break end
            local v = objects[i]

            -- TỐI ƯU: Quét 400 object mỗi nhịp nghỉ
            if i % 400 == 0 then 
                RunService.Heartbeat:Wait() 
                if logCallback then 
                    logCallback(service.Name .. ": " .. math.floor((i/count)*100) .. "%") 
                end
            end

            if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                local n = v.Name:lower()
                local suspicious = false
                
                for _, key in ipairs(keywords) do
                    if n:find(key) then suspicious = true break end
                end

                if suspicious or #n > 25 then
                    pcall(function()
                        v:FireServer(payload)
                        -- Check nhanh 0.1s
                        task.delay(0.1, function()
                            if workspace:FindFirstChild(verifyToken) then
                                targetRemote = v
                            end
                        end)
                    end)
                end
            end
        end
    end
    return targetRemote
end

-----------------------------------------------------------
-- 2. UI CREATION (FIXED & OPTIMIZED)
-----------------------------------------------------------
local sg = Instance.new("ScreenGui", targetGui)
sg.Name = "OmniGodHub"
sg.ResetOnSpawn = false

local term = Instance.new("Frame", sg)
term.Size = UDim2.new(0, 350, 0, 220)
term.Position = UDim2.new(0.5, -175, 0.4, 0)
term.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
Instance.new("UICorner", term)

local termLog = Instance.new("TextLabel", term)
termLog.Size = UDim2.new(1, -20, 1, -20)
termLog.Position = UDim2.new(0, 10, 0, 10)
termLog.BackgroundTransparency = 1
termLog.TextColor3 = Color3.fromRGB(0, 255, 150)
termLog.Font = Enum.Font.Code
termLog.TextSize = 12
termLog.TextXAlignment = Enum.TextXAlignment.Left
termLog.TextYAlignment = Enum.TextYAlignment.Top
termLog.Text = ""

-- UI Chính (Ẩn lúc đầu)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 260, 0, 180)
main.Position = UDim2.new(0.5, -130, 0.3, 0)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.Visible = false
main.Active = true
main.Draggable = true
Instance.new("UICorner", main)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "OMNI-GOD V.MAX"
title.TextColor3 = Color3.fromRGB(0, 200, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.BackgroundTransparency = 1

local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 0.3, 0)
status.Text = "STATUS: STANDBY"
status.TextColor3 = Color3.fromRGB(150, 150, 150)
status.Font = Enum.Font.GothamMedium
status.TextSize = 11
status.BackgroundTransparency = 1

local btnLevel = Instance.new("TextButton", main)
btnLevel.Size = UDim2.new(0.85, 0, 0, 30)
btnLevel.Position = UDim2.new(0.075, 0, 0.45, 0)
btnLevel.Text = "BYPASS: 2 (GHOST)"
btnLevel.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
btnLevel.TextColor3 = Color3.new(1, 1, 1)
btnLevel.Font = Enum.Font.GothamSemibold
Instance.new("UICorner", btnLevel)

local btnToggle = Instance.new("TextButton", main)
btnToggle.Size = UDim2.new(0.85, 0, 0, 40)
btnToggle.Position = UDim2.new(0.075, 0, 0.7, 0)
btnToggle.Text = "ACTIVATE"
btnToggle.BackgroundColor3 = Color3.fromRGB(30, 180, 100)
btnToggle.TextColor3 = Color3.new(1, 1, 1)
btnToggle.Font = Enum.Font.GothamBold
Instance.new("UICorner", btnToggle)

-----------------------------------------------------------
-- OMNI-GOD V.MAX: FULL CORE LOGIC (UNABRIDGED)
-----------------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CollectionService = game:GetService("CollectionService")

local player = Players.LocalPlayer
local active = false
local bypassLevel = 2 
local connections = {}
local targetRemote = nil 

-----------------------------------------------------------
-- 1. METATABLE BYPASS (ANTI-KICK & DETECTION)
-----------------------------------------------------------
local function InitiateAntiKick()
    local mt = getrawmetatable(game)
    if not mt then return false end
    local oldNamecall = mt.__namecall
    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        -- Chặn lệnh Kick từ phía Client
        if tostring(method):lower() == "kick" then
            return nil 
        end
        
        -- Chặn các Remote dò tìm (Detection)
        if self:IsA("RemoteEvent") then
            local n = self.Name:lower()
            if n:find("check") or n:find("detect") or n:find("log") or n:find("ban") then
                return nil
            end
        end
        
        return oldNamecall(self, unpack(args))
    end)
    setreadonly(mt, true)
    return true
end

-----------------------------------------------------------
-- 2. TURBO GHOST SCAN (SERVER-SIDE ACCESS)
-----------------------------------------------------------
local function GhostScanSS(logCallback)
    local scanAreas = {
        game:GetService("ReplicatedStorage"),
        game:GetService("StarterGui"),
        game:GetService("Workspace"),
        player:WaitForChild("PlayerGui")
    }
    
    local verifyToken = "OMNI_VERIFY_" .. math.random(1000, 9999)
    local keywords = {"defaultserver", "admin", "remote", "control", "execute", "main", "v3rm"}
    local payload = "local p = Instance.new('Part', workspace) p.Name = '" .. verifyToken .. "' p.Transparency = 1 task.wait(0.5) p:Destroy()"

    for _, service in ipairs(scanAreas) do
        if targetRemote then break end
        local objects = service:GetDescendants()
        local total = #objects
        
        for i = 1, total do
            if targetRemote then break end
            local v = objects[i]

            -- Batching: Quét 400 object mỗi frame
            if i % 400 == 0 then 
                RunService.Heartbeat:Wait() 
                if logCallback then logCallback("SCANNING " .. service.Name .. ": " .. math.floor((i/total)*100) .. "%") end
            end

            if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                local n = v.Name:lower()
                local isMatch = false
                for _, key in ipairs(keywords) do if n:find(key) then isMatch = true break end end

                if isMatch or #n > 25 then
                    pcall(function()
                        v:FireServer(payload)
                        task.delay(0.1, function()
                            if workspace:FindFirstChild(verifyToken) then targetRemote = v end
                        end)
                    end)
                end
            end
        end
    end
    return targetRemote
end

-----------------------------------------------------------
-- 3. CHARACTER CORE (STEALTH & GOD MODE)
-----------------------------------------------------------
local function ApplyStealth(char)
    if not char then return end
    pcall(function()
        -- Gỡ bỏ các Tag giám sát từ Server
        for _, tag in ipairs(CollectionService:GetTags(char)) do 
            CollectionService:RemoveTag(char, tag) 
        end
        -- Tối ưu hóa thuộc tính vật lý để tránh Detection
        for _, p in pairs(char:GetDescendants()) do
            if p:IsA("BasePart") then
                p.Massless = true
                p.CanQuery = false -- Chống Raycast dò tìm
            end
        end
    end)
end

local function ApplyGodMode(char)
    -- Dọn dẹp các kết nối Heartbeat/Input cũ
    for _, c in pairs(connections) do if c then c:Disconnect() end end
    table.clear(connections)

    local hum = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")

    -- BYPASS LEVEL 3: HUMANOID CLONING (Vượt qua các script theo dõi mạng sống)
    if bypassLevel == 3 then
        local oldHum = hum
        local newHum = oldHum:Clone()
        newHum.Parent = char
        oldHum:Destroy()
        hum = newHum
        workspace.CurrentCamera.CameraSubject = hum
        
        -- Khôi phục Animation sau khi clone
        local animate = char:FindFirstChild("Animate")
        if animate then
            animate.Disabled = true
            task.wait(0.1)
            animate.Disabled = false
        end
    end

    -- Hiệu ứng Visual (Omni Highlight)
    if not char:FindFirstChild("OmniHL") then
        local hl = Instance.new("Highlight", char)
        hl.Name = "OmniHL"
        hl.FillColor = Color3.fromRGB(0, 255, 255)
        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
        hl.FillTransparency = 0.6
        hl.OutlineTransparency = 0
    end

    -- Thiết lập trạng thái bất tử
    hum.MaxHealth = math.huge
    hum.Health = math.huge
    hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)

    -- Loop duy trì trạng thái liên tục
    local mainLoop = RunService.Heartbeat:Connect(function()
        if not active or not hum or not root then return end
        
        hum.Health = math.huge
        
        -- GHOST MODE (Level 2+): Vô hiệu hóa va chạm với Kill-parts
        if bypassLevel >= 2 then
            for _, p in pairs(char:GetChildren()) do
                if p:IsA("BasePart") then p.CanTouch = false end
            end
        end

        -- ANTI-VOID: Tự động đưa nhân vật lên khi rơi quá sâu
        if root.Position.Y < -450 then
            root.Velocity = Vector3.new(0, 0, 0)
            root.CFrame = CFrame.new(root.Position.X, 200, root.Position.Z)
        end
    end)
    table.insert(connections, mainLoop)

    -- FIX JUMP FOR CLONED HUMANOID
    local jumpConn = UserInputService.JumpRequest:Connect(function()
        if active and hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
    table.insert(connections, jumpConn)
end

-----------------------------------------------------------
-- 4. UTILITY FUNCTIONS
-----------------------------------------------------------
local function RestoreNormal(char)
    for _, c in pairs(connections) do if c then c:Disconnect() end end
    table.clear(connections)

    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.MaxHealth = 100
        hum.Health = 100
        hum:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
    end
    
    if char:FindFirstChild("OmniHL") then char.OmniHL:Destroy() end
    
    for _, p in pairs(char:GetDescendants()) do
        if p:IsA("BasePart") then p.CanTouch = true end
    end
end

-----------------------------------------------------------
-- 4. BOOTING & LOGIC
-----------------------------------------------------------
task.spawn(function()
    local function log(t) 
        if not termLog then return end
        local lines = termLog.Text:split("\n")
        if #lines > 12 then termLog.Text = "" end
        termLog.Text = termLog.Text .. "> " .. t .. "\n" 
    end

    log("OMNI-GHOST INITIALIZING...")
    task.wait(0.5)
    
    -- Fast Scan
    local found = GhostScanSS(log)
    
    if found then
        log("FOUND BACKDOOR: " .. found.Name)
    else
        log("NO BACKDOOR FOUND.")
    end

    log("SYSTEM READY.")
    task.wait(1)
    term:Destroy()
    main.Visible = true
end)

btnLevel.MouseButton1Click:Connect(function()
    if active then return end
    bypassLevel = (bypassLevel % 3) + 1
    local names = {"1 (STEALTH)", "2 (GHOST)", "3 (CLONE)"}
    btnLevel.Text = "BYPASS: " .. names[bypassLevel]
end)

btnToggle.MouseButton1Click:Connect(function()
    active = not active
    if active then
        btnToggle.Text = "DEACTIVATE"
        btnToggle.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
        status.Text = "STATUS: ACTIVE (LV " .. bypassLevel .. ")"
        if player.Character then ApplyGodMode(player.Character) end
    else
        btnToggle.Text = "ACTIVATE"
        btnToggle.BackgroundColor3 = Color3.fromRGB(30, 180, 100)
        status.Text = "STATUS: STANDBY"
    end
end)
