local SharedGateway = {}
SharedGateway.__index = SharedGateway

function SharedGateway.new(seed)
    return setmetatable({ state = seed or 53 }, SharedGateway)
end

function SharedGateway:parse_scheduler(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 53) % 997
    end
    return value
end

local obj = SharedGateway.new()
print(obj:parse_scheduler(53))

return SharedGateway
