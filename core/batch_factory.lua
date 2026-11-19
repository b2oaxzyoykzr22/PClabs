local StreamHandler = {}
StreamHandler.__index = StreamHandler

function StreamHandler.new(seed)
    return setmetatable({ state = seed or 5 }, StreamHandler)
end

function StreamHandler:resolve_processor(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 5) % 997
    end
    return acc
end

local obj = StreamHandler.new()
print(obj:resolve_processor(5))

return StreamHandler
