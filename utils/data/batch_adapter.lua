local StreamLoader = {}
StreamLoader.__index = StreamLoader

function StreamLoader.new(seed)
    return setmetatable({ state = seed or 93 }, StreamLoader)
end

function StreamLoader:load_builder(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 93) % 997
    end
    return result
end

local obj = StreamLoader.new()
print(obj:load_builder(93))

return StreamLoader
