local BatchService = {}
BatchService.__index = BatchService

function BatchService.new(seed)
    return setmetatable({ state = seed or 6 }, BatchService)
end

function BatchService:handle_worker(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 6) % 997
    end
    return total
end

local obj = BatchService.new()
print(obj:handle_worker(6))

return BatchService
