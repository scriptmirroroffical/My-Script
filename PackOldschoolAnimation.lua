
local Players = game:GetService("Players")

local LOCAL_PLAYER = Players.LocalPlayer
local ATTR_KEY     = "OldSchool_v6"

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

-- Map: {parent folder, child name, animation id}
local SLOT_MAP = {
    { "run",      "RunAnim",    IDS.run      },
    { "walk",     "WalkAnim",   IDS.walk     },
    { "jump",     "JumpAnim",   IDS.jump     },
    { "fall",     "FallAnim",   IDS.fall     },
    { "climb",    "ClimbAnim",  IDS.climb    },
    { "swim",     "Swim",       IDS.swim     },
    { "swimidle", "SwimIdle",   IDS.swimidle },
    { "idle",     "Animation1", IDS.idle1    },
    { "idle",     "Animation2", IDS.idle2    },
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
    timeout = timeout or 5
    local t0 = os.clock()
    while os.clock() - t0 < timeout do
        local a = char:FindFirstChild("Animate")
        if a
            and a:FindFirstChild("idle")
            and a:FindFirstChild("run")
            and a:FindFirstChild("walk") then
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

-- ─── Watch Animate để tự heal khi game ghi đè ─────────────
local function watchAnimate(animate)
    if not animate or animate:GetAttribute("OS_Watched") then return end
    animate:SetAttribute("OS_Watched", true)

    -- Nếu folder con bị add/remove, patch lại toàn bộ
    animate.DescendantAdded:Connect(function(desc)
        if not LOCAL_PLAYER:GetAttribute(ATTR_KEY) then return end
        if desc:IsA("Animation") or desc:IsA("Folder") then
            task.defer(function() patchAnimate(animate) end)
        end
    end)
end

-- ─── Apply toàn bộ pipeline ───────────────────────────────
local function apply(char)
    char = char or LOCAL_PLAYER.Character
    if not char then return false end

    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return false end

    local animate = waitForAnimate(char)
    if not animate then
        warn("[OldSchool v6] Animate not found")
        return false
    end

    -- Stop animation tracks đang chạy
    for _, t in ipairs(hum:GetPlayingAnimationTracks()) do
        pcall(function() t:Stop(0) end)
    end

    local patched = patchAnimate(animate)
    forceReload(animate, hum)
    watchAnimate(animate)

    LOCAL_PLAYER:SetAttribute(ATTR_KEY, true)
    if patched > 0 then
        print(("[OldSchool v6] patched %d slots"):format(patched))
    end
    return true
end

-- ─── AUTO PATCH ON RESPAWN ────────────────────────────────
-- Bật cờ ngay lập tức để mọi respawn sau đó đều auto apply
LOCAL_PLAYER:SetAttribute(ATTR_KEY, true)

LOCAL_PLAYER.CharacterAdded:Connect(function(char)
    -- Chờ Animate load xong rồi patch
    task.spawn(function()
        task.wait(0.3)
        apply(char)
    end)
end)

-- Apply ngay cho nhân vật hiện tại (nếu có)
if LOCAL_PLAYER.Character then
    task.spawn(function()
        task.wait(0.2)
        apply(LOCAL_PLAYER.Character)
    end)
end

-- ─── Fallback: nếu CharacterAdded không fire (lần đầu) ────
task.defer(function()
    task.wait(0.5)
    if LOCAL_PLAYER.Character then
        apply(LOCAL_PLAYER.Character)
    end
end)a
