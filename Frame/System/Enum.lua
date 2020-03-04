-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/03/04 19:43
--- Description  : 
------------------------------------------------
---@class Enum
local Enum = static("Enum")

-- local Enum = class("Enum", ClassType.Class, Enum.NewFlag(ClassAttribute.Singleton))

function Enum.NewFlag(...)
    local t = {...}
    local result = 0
    for i = 1, #t do
        if result ~= 0 then
            result = BitMath.Or(result, t[i])
        else
            result = t[1]
        end
    end
    return result
end

function Enum:IsFlag(flag)

end

return Enum