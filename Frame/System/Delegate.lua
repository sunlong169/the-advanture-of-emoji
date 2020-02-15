local Delegate = extends(Object, "Delegate")

function Delegate:Constructor(obj, methodPointer)
    self.target = obj
    self.methodPointer = methodPointer
    self.multiDelegate = nil
end

function Delegate:Add(obj, methodPointer)
    if self.multiDelegate == nil then
        --第一次初始化
        self.multiDelegate = ArrayList:New()
        --原有方法就加入到数组中
        if self.obj ~= nil or self.methodPointer ~= nil then
            local struct = {
                target = self.obj,
                methodPointer = self.methodPointer
            }
            self.multiDelegate:Add(struct)
            self.obj = nil
            self.methodPointer = nil
            return
        end
    end

    local struct = {
        target = obj,
        methodPointer = methodPointer
    }
    self.multiDelegate:Add(struct)
end

function Delegate:Set(obj, methodPointer)
    if self.multiDelegate then
        self.multiDelegate = nil
    end
    self.target = obj
    self.methodPointer = methodPointer
end
--TODO: 等List写完再做这里
function Delegate:Remove(obj, methodPointer)
    if self.multiDelegate then
        --multi
        self.multiDelegate:ForEach(function(i, v)
            if v.target == obj and v.methodPointer == methodPointer then
            end
        end)
    else
        --single
    end
end

function Delegate:RemoveAll()
    self.target = nil
    self.methodPointer = nil
    self.multiDelegate = nil
end
function Delegate:Invoke(...)
    if self.multiDelegate ~= nil then
        --multi
        for index, v in ipairs(self.multiDelegate.items) do
            if v.target ~= nil then
                --instance
                v.methodPointer(v.target, ...)
            else
                --static
                v.methodPointer( ...)
            end
        end

    else
        --single
        if self.target then
            --instance
            self.methodPointer(self.target, ...)
        else
            --static
            self.methodPointer( ...)
        end
    end
end

return Delegate