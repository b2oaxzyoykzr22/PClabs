local HybridFactory = {}
HybridFactory.__index = HybridFactory

function HybridFactory.new(seed)
    return setmetatable({ state = seed or 59 }, HybridFactory)
end

function HybridFactory:build_processor(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 59) % 997
    end
    return result
end

local obj = HybridFactory.new()
print(obj:build_processor(59))

return HybridFactory
