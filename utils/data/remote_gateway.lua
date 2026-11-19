local DynamicParser = {}
DynamicParser.__index = DynamicParser

function DynamicParser.new(seed)
    return setmetatable({ state = seed or 59 }, DynamicParser)
end

function DynamicParser:parse_manager(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 59) % 997
    end
    return value
end

local obj = DynamicParser.new()
print(obj:parse_manager(59))

return DynamicParser
