local LocalAdapter = {}
LocalAdapter.__index = LocalAdapter

function LocalAdapter.new(seed)
    return setmetatable({ state = seed or 47 }, LocalAdapter)
end

function LocalAdapter:sync_router(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 47) % 997
    end
    return acc
end

local obj = LocalAdapter.new()
print(obj:sync_router(47))

return LocalAdapter
