---@class OrderDict
local DictionaryOrder = {}


DictionaryOrder.__index = DictionaryOrder

function DictionaryOrder.New()
    local temp = {}
    setmetatable(temp, DictionaryOrder)
    temp:ctor()
    return temp
end



function DictionaryOrder:ctor()
    self.Index = {};
    self.count = 0;
end

function DictionaryOrder:ContainsKey(key)
    if (nil ~= self[key]) then
        return true;
    else
        return false;
    end
end

--根据KEY返回value
function DictionaryOrder:GetValueByKey(key)
    return self[key]
end

function DictionaryOrder:GetValueByIndex(index)
    return self[self.Index[index]]
end

function DictionaryOrder:ContainsValue(value)
    for i, k in pairs(self.Index) do
        if (self[k] ~= nil and self[k] == value) then
            return true;
        end
    end
    return false;
end

 --获得字典的Keys,返回一个Array
 function DictionaryOrder:GetKeys()
     local array = Array.New();
     for k, v in ipairs(self.Index) do
         array:Add(v);
     end
     return array;
 end

function DictionaryOrder:GetKeysTable()
    local array = {}
    for k, v in ipairs(self.Index) do
        table.insert(array, v)
    end
    return array;
end

 --获得字典的Values,返回一个Array
 function DictionaryOrder:GetValues()
     local array = Array.New();
     for k, v in ipairs(self.Index) do
         array:Add(self[v]);
     end
     return array;
 end

--返回一个value的table
function DictionaryOrder:GetValuesTable()
    local array = {}
    for k, v in ipairs(self.Index) do
        table.insert(array, self[v])
    end
    return array;
end
--增加
function DictionaryOrder:Add(key, value)
    if value == nil then
        return;
    end
    if (nil == self[key]) then
        self.count = self.count + 1;
    end
    self[key] = value;
    self.Index[self.count] = key
end

--移除
function DictionaryOrder:Remove(key)
    if (self[key] ~= nil) then
        local i = table.indexof(self.Index, key, 1)
        table.remove(self.Index, i)
        self.count = self.count - 1;
        self[key] = nil;
    end
end



-- 有序遍历
function DictionaryOrder:ForEach(fun, ...)
    --local tempIndex = DeepCopy(self.Index)
    local tempIndex = {}
    for i = 1, #self.Index do
        tempIndex[i] = self.Index[i]
    end
    for k, v in ipairs(tempIndex) do
        fun(v, self[v], ...);
    end
    tempIndex = nil
end

-- 排序
function DictionaryOrder:Sort(Action)
    table.sort(self.Index, Action)
end

-- 获取字典的count
function DictionaryOrder:Count()
    return self.count;
end



--清除
function DictionaryOrder:Clear()
    self:ForEach(function(k, v)
        self:Remove(k)
    end)
    self.Index = {};
    self.count = 0;
end

return DictionaryOrder;


