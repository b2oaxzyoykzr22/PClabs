local SecureHandler = {}
SecureHandler.__index = SecureHandler

function SecureHandler.new(seed)
    return setmetatable({ state = seed or 84 }, SecureHandler)
end

function SecureHandler:handle_client(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 84) % 997
    end
    return acc
end

local obj = SecureHandler.new()
print(obj:handle_client(84))

return SecureHandler
