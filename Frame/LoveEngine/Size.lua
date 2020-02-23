-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:53
--- Description  : 大小类
------------------------------------------------
---@class Size : Object
local Size, base = extends("Size", Object)

function Size:Constructor(width, height)
    self.width = width or 0
    self.height = height or 0
end

---override 重载+
function Size:operatorAdd(target)
    return Size.New(self.width + target.width, self.height + target.height)
end
---override 重载-
function Size:operatorSub(target)
    return Size.New(self.width - target.width, self.height - target.height)
end
---override 重载*
function Size:operatorMul(target)
    return Size.New(self.width * target.width, self.height * target.height)
end
---override 重载/
function Size:operatorDiv(target)
    return Size.New(self.width / target.width, self.height / target.height)
end
---override 重载==
function Size:operatorEq(target)
    return self.width == target.width and self.height == target.height
end
---override 格式化输出
function Size:ToString()
    return String.Format("[width: {0}, height: {1}]", self.width, self.height)
end

return Size