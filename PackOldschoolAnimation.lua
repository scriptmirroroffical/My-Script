local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LOCAL_PLAYER = Players.LocalPlayer
local ATTR_KEY = "OldSchool_v5"

-- ─── Animation IDs ────────────────────────────────────────
local A = "rbxassetid://"
local IDS = {
    idle1    = A .. "5319828216",
    idle2    = A .. "5319831086",
    run      = A .. "5319844329",
    walk     = A .. "5319847204",
    jump     = A .. "5319841935",
    fall     = A .. "5319839762",
    climb    = A .. "5319816685",
    swim     = A .. "5319850266",
    swimidle = A .. "5319852613",
}

-- Map: path trong Animate → AnimationId
local SLOT_MAP = {
    { "run",  "RunAnim",  IDS.run  },
    { "walk", "WalkAnim", IDS.walk },
    { "jump", "JumpAnim", IDS.jump },
    { "fall", "FallAnim", IDS.fall },
    { "climb","ClimbAnim",IDS.climb},
    { "swim", "Swim",     IDS.swim },
    { "swimidle", "SwimIdle", IDS.swimidle },
    { "idle", "Animation1", IDS.idle1 },
    { "idle", "Animation2", IDS.idle2 },
}

-- ─── Helpers ──────────────────────────────────────────────
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

local function waitForAnimate(char, timeout)
    timeout = timeout or 4
    local t0 = os.clock()
    while os.clock() - t0 < timeout do
        local a = char:FindFirstChild("Animate")
        if a and a:FindFirstChild("idle") and a:FindFirstChild("run") and a:FindFirstChild("walk") then
            return a
        end
        task.wait(0.1)
    end
    return nil
end

-- ─── Core patcher ─────────────────────────────────────────
local function patchAnimate(animate)
    if not animate then return 0 end
    local n = 0
    for _, entry in ipairs(SLOT_MAP) do
        local parentName, childName, id = entry[1], entry[2], entry[3]
        local folder = animate:FindFirstChild(parentName)
        local anim = ensureAnim(folder, childName)
        if anim and anim.AnimationId ~= id then
            anim.AnimationId = id
            n += 1
        end
    end
    return n
end

local function forceReload(animate, hum)
    if not animate then return end
    animate.Disabled = true
    task.wait(0.05)
    animate.Disabled = false
    if hum then
        pcall(function()
            hum:ChangeState(Enum.HumanoidStateType.Landed)
            hum:ChangeState(Enum.HumanoidStateType.Running)
        end)
    end
end

-- ─── Apply pipeline ───────────────────────────────────────
local function apply(char)
    char = char or LOCAL_PLAYER.Character or LOCAL_PLAYER.CharacterAdded:Wait()
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return false end

    local animate = waitForAnimate(char)
    if not animate then
        warn("[OldSchool v5] Animate not found")
        return false
    end

    -- Stop animation tracks đang chạy (chỉ trên client)
    for _, t in ipairs(hum:GetPlayingAnimationTracks()) do
        pcall(function() t:Stop(0) end)
    end

    local patched = patchAnimate(animate)
    forceReload(animate, hum)

    LOCAL_PLAYER:SetAttribute(ATTR_KEY, true)
    print(("[OldSchool v5] patched %d slots"):format(patched))
    return true
end

-- ─── Auto reapply khi game ghi đè Animate ─────────────────
local function watchChar(char)
    local animate = waitForAnimate(char)
    if not animate then return end

    -- Nếu game thay Animate hoặc ID → patch lại
    animate.ChildAdded:Connect(function(child)
        if not LOCAL_PLAYER:GetAttribute(ATTR_KEY) then return end
        if child:IsA("Folder") or child:IsA("Animation") then
            task.defer(function() patchAnimate(animate) end)
        end
    end)

    for _, slot in ipairs(SLOT_MAP) do
        local folder = animate:FindFirstChild(slot[1])
        if folder then
            folder.ChildAdded:Connect(function(child)
                if child:IsA("Animation") and LOCAL_PLAYER:GetAttribute(ATTR_KEY) then
                    task.defer(function() patchAnimate(animate) end)
                end
            end)
        end
    end
end

-- ─── Lifecycle ────────────────────────────────────────────
LOCAL_PLAYER.CharacterAdded:Connect(function(char)
    task.wait(0.6)
    if LOCAL_PLAYER:GetAttribute(ATTR_KEY) then
        apply(char)
        watchChar(char)
    end
end)

if LOCAL_PLAYER.Character then
    task.spawn(watchChar, LOCAL_PLAYER.Character)
end

task.defer(function()
    task.wait(0.4)
    apply()
    if LOCAL_PLAYER.Character then
        watchChar(LOCAL_PLAYER.Character)
    end
end)
