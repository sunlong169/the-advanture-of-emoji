-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:59
--- Description  : 类型转换操作类
------------------------------------------------
local Convert = {}

function Convert.ToInt(s)
    return tonumber(s)
end

function Convert.ToString(i)
    return tostring(i)
end

return Convert