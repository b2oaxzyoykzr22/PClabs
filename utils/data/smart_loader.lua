local SecureManager = {}
SecureManager.__index = SecureManager

function SecureManager.new(seed)
    return setmetatable({ state = seed or 11 }, SecureManager)
end

function SecureManager:handle_buffer(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 11) % 997
    end
    return value
end

local obj = SecureManager.new()
print(obj:handle_buffer(11))

return SecureManager
