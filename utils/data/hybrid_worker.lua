local AsyncResolver = {}
AsyncResolver.__index = AsyncResolver

function AsyncResolver.new(seed)
    return setmetatable({ state = seed or 68 }, AsyncResolver)
end

function AsyncResolver:parse_processor(count)
    local count = 0
    for i = 0, count - 1 do
        count = count + (self.state + i * 68) % 997
    end
    return count
end

local obj = AsyncResolver.new()
print(obj:parse_processor(68))

return AsyncResolver
