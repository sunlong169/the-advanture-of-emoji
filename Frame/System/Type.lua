-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:55
--- Description  : 类原型
------------------------------------------------
local Type = {}

function Type.New(name, protoType)
    local tmp = {}
    tmp.name = name
    tmp.__classType = classType.Instance
    tmp.__protoType = protoType

    tmp.CreateInstance = function(self, ...)
        return tmp.__protoType.New(...)
    end
    tmp.GetName = function(self)
        assert(self ~= nil and self.__classType == classType.Instance, "该方法为实例方法")
        return self.name
    end
    tmp.Equals = function(self, targetType)
        return self.name == targetType.name
    end
    tmp.ToString = function(self)
        return self.name
    end
    
    tmp.GetMethod = function(self, methodName)
        local methodInfo = {}
        methodInfo.Invoke = function(self,obj,...)
            protoType[methodName](obj, ...)
        end
        return methodInfo
    end

    local metaTb = {
        __eq = function(a, b)
            return a.name == b.name
        end
    }
    
    setmetatable(tmp, metaTb)
    return tmp
end

return Type