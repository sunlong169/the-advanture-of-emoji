-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:59
--- Description  : 控制台接口
------------------------------------------------
local Console = {}

function Console.WriteLine(obj)
    assert(obj ~= nil, "Object nil")
    print(tostring(obj))
end

return Console