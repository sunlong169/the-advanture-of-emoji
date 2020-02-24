-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:55
--- Description  : 基础函数
------------------------------------------------

---类/实例 枚举
classType = {
    Class = "Class",
    Instance = "Instance"
}

--继承
function extends(className, base)
    local class = {}
    --类型
    local _className = "UnknowClass"
    if className ~= "" or className ~= nil then
        _className = className
    end
    -- class.__type = Type.New(_className, class)
    local classMeta = {}
    classMeta.__index = base or Object
    classMeta.__classType = classType.Class
    classMeta.__type = Type.New(_className, class)
    classMeta.__base = base
    setmetatable(class, classMeta)

    --实例化
    class.New = function(...)

        local instanceMetatable = {}
        instanceMetatable.__index = class
        instanceMetatable.__classType = classType.Instance
        instanceMetatable.__type = Type.New(_className, class)
        instanceMetatable.__base = base
        --运算符重载 + - * / = 
        if rawget(class, "operatorAdd") ~= nil then
            instanceMetatable.__add = rawget(class, "operatorAdd")
        end
        if rawget(class, "operatorSub") ~= nil then
            instanceMetatable.__sub = rawget(class, "operatorSub")
        end
        if rawget(class, "operatorMul") ~= nil then
            instanceMetatable.__mul = rawget(class, "operatorMul")
        end
        if rawget(class, "operatorDiv") ~= nil then
            instanceMetatable.__div = rawget(class, "operatorDiv")
        end
        if rawget(class, "operatorEq") ~= nil then
            instanceMetatable.__eq = rawget(class, "operatorEq")
        end
        --Invoke调用执行
        if rawget(class, "Invoke") ~= nil then
            instanceMetatable.__call = rawget(class, "Invoke")
        end
        --重载tostring函数到对象的ToString方法
        instanceMetatable.__tostring = function(obj)
            return obj:ToString()
        end

        local obj = {}
        setmetatable(obj, instanceMetatable)
        --从基类开始执行构造函数
        local ctor
        ctor = function(b, ...)
            local mt = getmetatable(b)
            if mt ~= nil and mt.__base then
                ctor(mt.__base, ...)
            end
            if b.Constructor then
                b.Constructor(obj, ...)
            end
        end
        ctor(obj, ...)
        return obj
    end

    return class, base
end

---析构对象
function delete(obj)
    local now_base = obj
    while now_base do
        if (now_base.Destructor) then
            now_base:Destructor()
        end
        now_base = now_base.__base
    end
end

---获取类的类型
---@return Type
function gettype(class)
    assert(class ~= nil, "Class nil")
    local mt = getmetatable(class)
    assert(mt.__classType == classType.Class, "只能对类型进行运算")
    return mt.__type
end

function getclasstype(target)
    local m = getmetatable(target)
    if m.__classType then
        return m.__classType
    end
end