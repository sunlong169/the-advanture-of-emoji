-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:57
--- Description  : 字符串处理
------------------------------------------------
local String = {}

---字符串切割
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

---替换字符串
function String.Replace(str, findStr, targetStr)
    return string.gsub(str, findStr, targetStr)
end

---清除空格
function String.Trim(str)
    return string.gsub(str, "^%s*(.-)%s*$", "%1")
end

---转换为小写
function String.ToLower(str)
    return string.lower(str)
end

---转换为大写
function String.ToUpper(str)
    return string.upper(str)
end

---字符串格式化
function String.Format(str, ...)
    local parms = {...}
    local result = str
    for index, value in ipairs(parms) do
        result = String.Replace(result, "{"..tostring(index-1).."}", tostring(value))
    end
    return result
end
return String