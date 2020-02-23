-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:55
--- Description  : 类原型
------------------------------------------------
---@class Type
local Type = {}

local AllType = {}

-- local metaTb = {
--     __eq = function(a, b)
--         return a.name == b.name
--     end,
--     __type = {
--         name = "Type"
--     }
-- }
-- setmetatable(Type, metaTb)

function Type:Constructor(name, protoType)
    self.name = name
    self.protoType = protoType
end

function Type:CreateInstance(...)
    return self.protoType.New(...)
end

function Type:GetName()
    return self.name
end

function Type:Equals(targetType)
    return self.name == targetType.name
end

function Type:ToString()
    return self.name
end


function Type.New(name, protoType)
    if AllType[protoType] ~= nil then
        return AllType[protoType]
    end
    local tmp = {}
    tmp.name = name
    tmp.protoType = protoType
    tmp.CreateInstance = Type.CreateInstance
    tmp.GetName = Type.GetName
    tmp.Equals = Type.Equals
    tmp.ToString = Type.ToString

    AllType[protoType] = tmp
    return tmp
end

return Type