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

function Convert:ToBoolean(v)
    local _type = type(v)
    if _type == 'nil' then
        return false
    elseif _type == 'number' then
        return v ~= 0
    elseif _type == 'string' then
        local t = {
            ['true'] = true,
            ['false'] = false,
        }
        local str = v:ToLower()
        return t[str]
    else
        error("type error")
    end
end

return Convert