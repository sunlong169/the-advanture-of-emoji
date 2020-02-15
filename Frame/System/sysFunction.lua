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
function extends(base, className)
    local class = {}
    -- assert(type(className) == "string" and #className > 0)
    --元数据
    class.__classType  = classType.Class
    --类型
    local _className = "UnknowClass"
    if className ~= "" or className ~= nil then
        _className = className
    end
    class.__type = Type.New(_className, class)

    --单例特殊处理，如果是单例则禁用实例化
    local isInst = true
    if base.__type then
        if base.__type.name == "Singleton" then
            isInst = false
        end
    end
    if isInst then
        --实例化
        class.New = function(...)
            local base = class.__base
            local obj = {}
            --实例元数据
            obj.__classType = classType.Instance
            local instanceMetatable = {__index = class}
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

            setmetatable(obj, instanceMetatable)
            --按照继承向上执行构造函数
            local ctor
            ctor = function(b, ...)
                if b.__base then
                    ctor(b.__base, ...)
                end
                if b.Constructor then
                    b.Constructor(obj, ...)
                end
            end
            ctor(obj, ...)
            return obj
        end
        --接口实现作用于原型类和继承类之间，接口实现会覆盖继承类方法
        class.implements = function(self, ...)
            assert(self.__classType == classType.Class, "无法用实例调用此方法")
            local args = {...}
            --继承用的元表
            local originMeta = getmetatable(self)
            --self要保持顶端
            local cls = self
            for index, _class in ipairs(args) do
                local metaCls = _class
                setmetatable(cls, metaCls)
                cls = metaCls
            end
            --此时cls成为继承中的最后一个元表，链接继承
            setmetatable(cls, originMeta )
            cls.__base = originMeta.__index
            --原型类链接接口和继承
            setmetatable(self, { __index = cls })
            self.__base = cls
            return self
        end
    else
        class.New = function(self, ...)
            error("该类型无法实例化")
        end
    end

    class.__base = base
    setmetatable(class, {__index = base})
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
function ftypeof(v)
    assert(v ~= nil, "Object nil")
    assert(v.__classType == classType.Class, "只能对类型进行运算")
    return v.__type
end
