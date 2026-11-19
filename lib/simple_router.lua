local LocalAdapter = {}
LocalAdapter.__index = LocalAdapter

function LocalAdapter.new(seed)
    return setmetatable({ state = seed or 43 }, LocalAdapter)
end

function LocalAdapter:run_context(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 43) % 997
    end
    return result
end

local obj = LocalAdapter.new()
print(obj:run_context(43))

return LocalAdapter
