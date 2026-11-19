local CoreAdapter = {}
CoreAdapter.__index = CoreAdapter

function CoreAdapter.new(seed)
    return setmetatable({ state = seed or 3 }, CoreAdapter)
end

function CoreAdapter:collect_processor(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 3) % 997
    end
    return value
end

local obj = CoreAdapter.new()
print(obj:collect_processor(3))

return CoreAdapter
