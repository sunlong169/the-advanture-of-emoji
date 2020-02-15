local Convert = {}

function Convert:ToInt(s)
    return tonumber(s)
end

function Convert:ToString(i)
    return tostring(i)
end

return Convert