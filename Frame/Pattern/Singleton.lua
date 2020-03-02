-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:57
--- Description  : 单例基类
------------------------------------------------
---@class Singleton : Object
local Singleton, base = extends("Singleton", Object)

function Singleton:Instance()
    assert(self.__classType == classType.Class, "实例无法调用此方法")
    if rawget(self, "_Instance") == nil then
        rawset(self, "_Instance", self.New())
    end
    assert(self._Instance ~= nil)
    return self._Instance
end

return Singleton