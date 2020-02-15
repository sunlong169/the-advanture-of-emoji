local Point, base = extends(Object, "Point")

function Point.One()
    return Point.New(1, 1)
end

function Point:Constructor(x, y)
    self.x = x or 0
    self.y = y or 0
end

function Point:operatorAdd(target)
    return Point.New(self.x + target.x, self.y + target.y)
end

function Point:operatorSub(target)
    return Point.New(self.x - target.x, self.y - target.y)
end

function Point:operatorMul(target)
    return Point.New(self.x * target.x, self.y * target.y)
end

function Point:operatorDiv(target)
    return Point.New(self.x / target.x, self.y / target.y)
end

function Point:operatorEq(target)
    return self.x == target.x and self.y == target.y
end

function Point:ToString(target)
    return String.Format("[x:{0}, y:{1}]", self.x, self.y)
end

return Point