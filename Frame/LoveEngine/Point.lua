local Point, base = extends(Object, "Point")

function Point:Constructor()
    self.x = 0
    self.y = 0
end

function Point:Constructor(x, y)
    self.x = x
    self.y = y
end

function Point:operatorAdd(target)
    return Point.New(self.x + target.x, self.y + target.y)
end

function Point:operatorSub(target)
    return Point.New(self.x - target.x, self.y - target.y)
end

return Point