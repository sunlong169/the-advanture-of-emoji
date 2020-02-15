local ArrayList, base = extends(Object, "ArrayList")

function ArrayList:Constructor()
    self.items = {}
end

---@return ArrayItem
function ArrayList:Get(index)
    return self.items[index]
end

function ArrayList:Set(index, value)
    self.items[index] = value
end

function ArrayList:GetCount()
    return #self.items
end

function ArrayList:Add(item)
    assert(item ~= nil , "NullPointerException")
    self.items[#self.items + 1] = item
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
        if self.items[i] == item then
            table.remove(self.items, i)
            break
        end
    end
end

function ArrayList:RemoveAt(index)
    table.remove(self.items, index)
end

---@return number
function ArrayList:IndexOf(item)
    for i = 1, self:GetCount() do
        if self.items[i] == item then
            return i;
        end
    end
    return -1;
end

function ArrayList:ForEach(func)
    for i, v in ipairs(self.items) do
        func(i, v)
    end
end

function ArrayList:ToTable()
    return self.items
end

return ArrayList