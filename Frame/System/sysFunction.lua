-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:55
--- Description  : 基础函数
------------------------------------------------

---类/实例 枚举
---@class ClassType
ClassType = {
    Class = "Class",
    Instance = "Instance",
}

function static(className)
    local tb = {}
    return tb
end

---继承
---@param className string
---@param base class
---@param classType ClassType
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
    classMeta.__classType = ClassType.Class
    classMeta.__type = Type.New(_className, class, base)
    setmetatable(class, classMeta)

    --实例化
    class.New = function(...)

        local instanceMetatable = {}
        instanceMetatable.__index = class
        instanceMetatable.__classType = ClassType.Instance
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
            --顶层实例
            if mt.__classType == ClassType.Instance then
                if b.GetType then
                    local baseProto = b:GetType():GetClass()
                    ctor(baseProto, ...)
                    return --构造完毕
                end
            else
                --下层类型
                local baseProto = mt.__type:GetBaseClass()
                if baseProto ~= nil then
                    ctor(baseProto, ...)
                end
            end
            if rawget(b, "Constructor") then
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
    local meta = getmetatable(obj)
    assert(meta.__classType == ClassType.Instance, "TypeException")
    local now_base = meta.__index
    while now_base do
        if rawget(now_base, "Destructor") then
            now_base:Destructor()
        end
        now_base = gettype(now_base):GetBaseClass()
    end
end

---实例化关键字 用法：new(类)(构造实参)
---但还是推荐用 类.New，因为有智能提示
function new(class)
    return function(...)
        return class.New(...)
    end
end

---获取类的类型 类似typeof
---@return Type
function gettype(class)
    assert(class ~= nil, "Class nil")
    local mt = getmetatable(class)
    assert(mt.__classType == ClassType.Class, "TypeException")
    return mt.__type
end

---@return ClassType
function getclasstype(target)
    local m = getmetatable(target)
    if m.__classType then
        return m.__classType
    end
end

---判断实例是否为某类型或某类型的自类
---@return boolean
function istype(instance, class)
    if class == nil then throw(ExceptionType.ArgumentNullException) end
    assert(class ~= nil , "NullPointerException")
    if instance == nil then
        return false
    end

    local meta = getmetatable(instance)
    local classMeta = getmetatable(class)
    if meta.__classType == ClassType.Instance and 
    classMeta.__classType == ClassType.Class then
        throw(ExceptionType.ArgumentException)
    end

    local proto = meta.__index
    while proto do
        local protoMeta = getmetatable(proto)
        if protoMeta.__type == classMeta.__type then
            return true
        end
        proto = gettype(proto):GetBaseClass()
    end
    return false
end

---抛出错误
function throw(exceptionType, msg)
    msg = msg or String.Empty()
    error(exceptionType..": "..msg)
end


try = pcall