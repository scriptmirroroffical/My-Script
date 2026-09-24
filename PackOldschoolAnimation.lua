local Players = game:GetService("Players")
local player = Players.LocalPlayer

local IDS = {
    idle1    = "rbxassetid://5319828216",
    idle2    = "rbxassetid://5319831086",
    run      = "rbxassetid://5319844329",
    walk     = "rbxassetid://5319847204",
    jump     = "rbxassetid://5319841935",
    fall     = "rbxassetid://5319839762",
    climb    = "rbxassetid://5319816685",
    swim     = "rbxassetid://5319850266",
    swimidle = "rbxassetid://5319852613",
}

local ATTR_LAST = "OldSchoolPack_Applied"

local function waitForAnimate(char)
    for _ = 1, 40 do
        local a = char:FindFirstChild("Animate")
        if a and a:FindFirstChild("idle") and a:FindFirstChild("run") and a:FindFirstChild("walk") then
            return a
        end
        task.wait(0.1)
    end
    return nil
end

local function setAnim(obj, id)
    if obj and id then
        obj.AnimationId = id
    end
end

local function ensureAnim(folder, name)
    if not folder then return nil end
    local a = folder:FindFirstChild(name)
    if not a then
        a = Instance.new("Animation")
        a.Name = name
        a.Parent = folder
    end
    return a
end

local function ensureIdleSlots(idleFolder, n)
    if not idleFolder then return end
    n = n or 2
    for i = 1, n do
        ensureAnim(idleFolder, "Animation" .. i)
    end
end

local function stopAllTracks(hum)
    if not hum then return end
    for _, t in ipairs(hum:GetPlayingAnimationTracks()) do
        pcall(function() t:Stop(0) end)
    end
end

local function applyOldSchool()
    local char = player.Character or player.CharacterAdded:Wait()
    local animate = waitForAnimate(char)
    if not animate then
        warn("[OldSchool] Animate not found")
        return false
    end

    local hum = char:FindFirstChildOfClass("Humanoid")
    stopAllTracks(hum)

    local runObj      = ensureAnim(animate:FindFirstChild("run"),      "RunAnim")
    local walkObj     = ensureAnim(animate:FindFirstChild("walk"),     "WalkAnim")
    local jumpObj     = ensureAnim(animate:FindFirstChild("jump"),     "JumpAnim")
    local fallObj     = ensureAnim(animate:FindFirstChild("fall"),     "FallAnim")
    local climbObj    = ensureAnim(animate:FindFirstChild("climb"),    "ClimbAnim")
    local swimObj     = ensureAnim(animate:FindFirstChild("swim"),     "Swim")
    local swimIdleObj = ensureAnim(animate:FindFirstChild("swimidle"), "SwimIdle")
    local idleFolder  = animate:FindFirstChild("idle")

    setAnim(runObj,      IDS.run)
    setAnim(walkObj,     IDS.walk)
    setAnim(jumpObj,     IDS.jump)
    setAnim(fallObj,     IDS.fall)
    setAnim(climbObj,    IDS.climb)
    setAnim(swimObj,     IDS.swim)
    setAnim(swimIdleObj, IDS.swimidle)

    if idleFolder then
        ensureIdleSlots(idleFolder, 2)
        setAnim(idleFolder:FindFirstChild("Animation1"), IDS.idle1)
        setAnim(idleFolder:FindFirstChild("Animation2"), IDS.idle2)
    end

    -- Force reload Animate
    animate.Disabled = true
    task.wait(0.06)
    animate.Disabled = false

    -- Nudge Humanoid state để animation áp dụng ngay
    if hum then
        pcall(function()
            hum:ChangeState(Enum.HumanoidStateType.Landed)
            task.wait(0.03)
            hum:ChangeState(Enum.HumanoidStateType.Running)
        end)
    end

    pcall(function() player:SetAttribute(ATTR_LAST, true) end)
    return true
end

-- Auto reapply sau respawn
player.CharacterAdded:Connect(function()
    task.wait(0.6)
    if player:GetAttribute(ATTR_LAST) then
        applyOldSchool()
    end
end)

-- Auto apply lần đầu
task.defer(function()
    task.wait(0.5)
    applyOldSchool()
end)
