-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:58
--- Description  : 所有类的基类
------------------------------------------------
---@class Object
local Object = {}

--virtual
function Object.New()
    local obj = {}
    setmetatable(obj, {
         __index = Object,
         __type = Type.New("Object", Object),
         __classType = classType.Instance
    })
    return obj
end

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

---@return Type
function Object:GetType()
    local meta = getmetatable(self)
    assert(meta.__classType == classType.Instance , "该方法为实例方法")
    return meta.__type
end

return Object