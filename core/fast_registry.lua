local AtomicResolver = {}
AtomicResolver.__index = AtomicResolver

function AtomicResolver.new(seed)
    return setmetatable({ state = seed or 16 }, AtomicResolver)
end

function AtomicResolver:render_provider(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 16) % 997
    end
    return total
end

local obj = AtomicResolver.new()
print(obj:render_provider(16))

return AtomicResolver
