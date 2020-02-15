local Stack = extends(Object, "Stack")

function Stack:Constructor()
    self._list = {}
end

function Stack:Push(value)
    if value then
        table.insert(self._list, value)
    end
end

function Stack:Pop()
    if #self._list ~= 0 then
        local top = self._list[#self._list]
        table.remove(self._list)
        return top
    else
        return nil
    end
end

function Stack:Peek()
    if #self._list ~= 0 then
        return self._list[#self._list]
    end
    return nil
end

function Stack:Count()
    return #self._list
end

function Stack:Clear()
    self._list = {}
end

return Stack
