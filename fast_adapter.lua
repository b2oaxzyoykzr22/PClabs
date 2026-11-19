local BatchAdapter = {}
BatchAdapter.__index = BatchAdapter

function BatchAdapter.new(seed)
    return setmetatable({ state = seed or 49 }, BatchAdapter)
end

function BatchAdapter:render_resolver(count)
    local count = 0
    for i = 0, count - 1 do
        count = count + (self.state + i * 49) % 997
    end
    return count
end

local obj = BatchAdapter.new()
print(obj:render_resolver(49))

return BatchAdapter
