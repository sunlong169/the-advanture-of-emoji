local ArrayList, base = extends(Object, "ArrayList")

function ArrayList:Constructor()

end

---@return ArrayItem
function ArrayList:Get(index)
    return self[index]
end

function ArrayList:Set(index, value)
    self[index] = value
end

function ArrayList:GetCount()
    return #self
end

function ArrayList:Add(item)
    assert(item ~= nil , "NullPointerException")
    self[#self + 1] = item
end

function ArrayList:Clear()
    self:ForEach(function(v)
        self:Remove(v)
    end)
end

---@return boolean
function ArrayList:Contains(item)
    if self:IndexOf(item) ~= -1 then
        return true
    else
        return false
    end
end

function ArrayList:Clone()
    --body
end

function ArrayList:Remove(item)
    if item == nil then
        return
    end
    for i = 1, self:GetCount() do
        if self[i] == item then
            table.remove(self, i)
            break
        end
    end
end

function ArrayList:RemoveAt(index)
    table.remove(self, index)
end

---@return number
function ArrayList:IndexOf(item)
    for i = 1, self:GetCount() do
        if self[i] == item then
            return i;
        end
    end
    return -1;
end

function ArrayList:ForEach(func)
    for i, v in ipairs(self) do
        local ret = func(i, v)
        if ret ~= nil then
            return ret
        end
    end
end

function ArrayList.TableToList(_table)
    local arr = ArrayList.New()
    local meta = getmetatable(arr)
    return setmetatable(_table, meta)
end

return ArrayList