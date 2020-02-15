local Object = {
    __type = Type.New("Object", Object),
    __classType = classType.Class
}

function Object:New()
    self.__classType = classType.Instance
end

--virtual
function Object:ToString()
    return "<class: "..self:GetType():GetName()..">"
end

function Object:Constructor()

end

function Object:Destructor()

end
--virtual
function Object:Equals(b, c)
    --判断对象地址
    if c == nil then
        --instance
        c = b
        b = self
    end
    return b == c
end

function Object:GetType()
    assert(self ~= nil , "该方法为实例方法")
    return self.__type
end

return Object