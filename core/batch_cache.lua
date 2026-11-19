local StreamBuilder = {}
StreamBuilder.__index = StreamBuilder

function StreamBuilder.new(seed)
    return setmetatable({ state = seed or 41 }, StreamBuilder)
end

function StreamBuilder:fetch_service(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 41) % 997
    end
    return result
end

local obj = StreamBuilder.new()
print(obj:fetch_service(41))

return StreamBuilder
