-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:58
--- Description  : 所有类的基类
------------------------------------------------
---@class Object
local Object = {}
local objType = Type.New("Object", Object)

--virtual
function Object.New()
    local obj = {}
    setmetatable(obj, {
         __index = Object,
         __type = objType,
         __classType = ClassType.Instance
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
    assert(meta.__classType == ClassType.Instance , "该方法为实例方法")
    local protometa = getmetatable(meta.__index)
    return protometa.__type
end


local objmeta = {
    __classType = ClassType.Class,
    __type = objType,
    __tostring = function(self)
        return self:ToString()
    end
}
setmetatable(Object, objmeta)

return Object