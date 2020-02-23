-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/23 19:31
--- Description  : 有序字典
------------------------------------------------
---@class Dictionary : Object
local Dictionary, base = extends("Dictionary", Object)

function Dictionary:Constructor()
    local meta = getmetatable(self)
    meta.__meta_index = {}
    meta.__meta_count = 0
end

function Dictionary:Add(key, value)
    local k = rawget(self, key)
    assert(k == nil, "Existing key "..tostring(key))

    self[key] = value
    local meta = getmetatable(self)
    meta.__meta_count = meta.__meta_count + 1
    meta.__meta_index[meta.__meta_count] = key
end

local function indexof(table, key)
    for index, value in ipairs(table) do
        if value == key then
            return index
        end
    end
    return -1
end

function Dictionary:Remove(key)
    assert(self[key] ~= nil , "key not found")

    local meta = getmetatable(self)

    local index = indexof(meta.__meta_index, key)
    assert(index ~= -1, "not found")

    table.remove(self.__meta_index, index)
    self.__meta_count = self.__meta_count - 1;
    self[key] = nil
end

function Dictionary:Clear()
    local meta = getmetatable(self)
    for _, key in ipairs(meta.__meta_index) do
        self:Remove(key)
    end
end

function Dictionary:Count()
    local meta = getmetatable(self)
    return meta.__meta_count
end

function Dictionary:ContainsKey(key)
    return self[key] ~= nil and true or false
end

function Dictionary:ForEach(fun)
    local m = getmetatable(self)
    local tempIndex = {}
    --拷贝一份，防止在外面循环时对字典操作可能会出现的错误
    for i = 1, m.__meta_count do
        tempIndex[i] = m.__meta_index[i]
    end
    for _, value in ipairs(tempIndex) do
        fun(value, self[value])
    end
    tempIndex = nil
end

return Dictionary;


