-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:50
--- Description  : 一个点，常用于位置
------------------------------------------------
---@class Vector2 : Object
local Vector2, base = extends("Vector2", Object)

function Vector2.One()
    return Vector2.New(1, 1)
end

function Vector2:Constructor(x, y)
    self.x = x or 0
    self.y = y or 0
end

---判断距离
---@return number
function Vector2.Distance(a, b)
    local x = math.abs(a.x - b.x)
    local y = math.abs(a.y - b.y)
    return math.sqrt((x * x + y * y))
end

---override 重载+
function Vector2:operatorAdd(target)
    return Vector2.New(self.x + target.x, self.y + target.y)
end
---override 重载-
function Vector2:operatorSub(target)
    return Vector2.New(self.x - target.x, self.y - target.y)
end
---override 重载*
function Vector2:operatorMul(target)
    return Vector2.New(self.x * target.x, self.y * target.y)
end
---override 重载/
function Vector2:operatorDiv(target)
    return Vector2.New(self.x / target.x, self.y / target.y)
end
---override 重载==
function Vector2:operatorEq(target)
    return self.x == target.x and self.y == target.y
end
---override 格式化输出
function Vector2:ToString(target)
    return String.Format("[x:{0}, y:{1}]", self.x, self.y)
end

return Vector2