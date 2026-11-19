local LiteBuffer = {}
LiteBuffer.__index = LiteBuffer

function LiteBuffer.new(seed)
    return setmetatable({ state = seed or 32 }, LiteBuffer)
end

function LiteBuffer:sync_router(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 32) % 997
    end
    return result
end

local obj = LiteBuffer.new()
print(obj:sync_router(32))

return LiteBuffer
