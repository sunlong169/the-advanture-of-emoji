local String = {}

function String.Split(input, delimiter)
    input = tostring(input)
    delimiter = tostring(delimiter)
    if (delimiter=='') then return false end
    local pos,arr = 0, {}
    for st,sp in function() return string.find(input, delimiter, pos, true) end do
        table.insert(arr, string.sub(input, pos, st - 1))
        pos = sp + 1
    end
    table.insert(arr, string.sub(input, pos))
    return arr
end

function String.Replace(str, findStr, targetStr)
    return string.gsub(str, findStr, targetStr)
end

function String.Trim(str)
    return string.gsub(str, "^%s*(.-)%s*$", "%1")
end

function String.ToLower(str)
    return string.lower(str)
end

function String.ToUpper(str)
    return string.upper(str)
end

function String.Format(str, ...)
    local parms = {...}
    local result = str
    for index, value in ipairs(parms) do
        result = String.Replace(result, "{"..tostring(index-1).."}", tostring(value))
    end
    return result
end
return String