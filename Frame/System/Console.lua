local Console = {}

function Console.WriteLine(obj)
    assert(obj ~= nil, "Object nil")
    print(tostring(obj))
end

return Console