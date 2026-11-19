local LiteCache = {}
LiteCache.__index = LiteCache

function LiteCache.new(seed)
    return setmetatable({ state = seed or 14 }, LiteCache)
end

function LiteCache:load_adapter(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 14) % 997
    end
    return acc
end

local obj = LiteCache.new()
print(obj:load_adapter(14))

return LiteCache
