-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:57
--- Description  : 字符串处理
------------------------------------------------
local String = {}

---字符串切割
function String:Split(delimiter)
    local input = tostring(self)
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
function String:Replace(findStr, targetStr)
    return string.gsub(self, findStr, targetStr)
end

---清除空格
function String:Trim()
    return string.gsub(self, "^%s*(.-)%s*$", "%1")
end

---转换为小写
function String:ToLower()
    return string.lower(self)
end

---转换为大写
function String:ToUpper()
    return string.upper(self)
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

function String:Contains(pattern)
	local find_pos_begin, find_pos_end = string.find(self, pattern, 1, true)
	return find_pos_begin ~= nil
end

function String:StartsWith(start_pattern)
	local find_pos_begin, find_pos_end = string.find(self, start_pattern, 1, true)
	return find_pos_begin == 1
end

-- 以某个字符串结尾
function String:EndsWith(start_pattern)
	local find_pos_begin, find_pos_end = string.find(self, start_pattern, -#start_pattern, true)
	return find_pos_end == #self
end

function String:Length()
    return string.len(self)
end

string.Split = String.Split
string.Replace = String.Replace
string.Trim = String.Trim
string.ToLower = String.ToLower
string.ToUpper = String.ToUpper
string.Format = String.Format
string.Contains = String.Contains
string.StartsWith = String.StartsWith
string.EndsWith = String.EndsWith
string.Length = String.Length

return String