-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:50
--- Description  : 一个点，常用于位置
------------------------------------------------
local Point, base = extends(Object, "Point")

function Point.One()
    return Point.New(1, 1)
end

function Point:Constructor(x, y)
    self.x = x or 0
    self.y = y or 0
end

---override 重载+
function Point:operatorAdd(target)
    return Point.New(self.x + target.x, self.y + target.y)
end
---override 重载-
function Point:operatorSub(target)
    return Point.New(self.x - target.x, self.y - target.y)
end
---override 重载*
function Point:operatorMul(target)
    return Point.New(self.x * target.x, self.y * target.y)
end
---override 重载/
function Point:operatorDiv(target)
    return Point.New(self.x / target.x, self.y / target.y)
end
---override 重载==
function Point:operatorEq(target)
    return self.x == target.x and self.y == target.y
end
---override 格式化输出
function Point:ToString(target)
    return String.Format("[x:{0}, y:{1}]", self.x, self.y)
end

return Point