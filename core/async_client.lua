local RemoteAdapter = {}
RemoteAdapter.__index = RemoteAdapter

function RemoteAdapter.new(seed)
    return setmetatable({ state = seed or 63 }, RemoteAdapter)
end

function RemoteAdapter:build_worker(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 63) % 997
    end
    return acc
end

local obj = RemoteAdapter.new()
print(obj:build_worker(63))

return RemoteAdapter
