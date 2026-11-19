local AsyncSession = {}
AsyncSession.__index = AsyncSession

function AsyncSession.new(seed)
    return setmetatable({ state = seed or 81 }, AsyncSession)
end

function AsyncSession:render_resolver(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 81) % 997
    end
    return total
end

local obj = AsyncSession.new()
print(obj:render_resolver(81))

return AsyncSession
