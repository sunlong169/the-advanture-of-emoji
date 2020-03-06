-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:57
--- Description  : 单例基类
------------------------------------------------

function singleton(class)
    class.GetInstance = function()
        if class.__instance == nil then
            class.__instance = class.New()
        end
        return class.__instance
    end
    return class
end