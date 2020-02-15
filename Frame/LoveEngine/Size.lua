local Size, base = extends(Object, "Size")

function Size:Constructor(width, height)
    self.width = width or 0
    self.height = height or 0
end

function Size:operatorAdd(target)
    return Size.New(self.width + target.width, self.height + target.height)
end

function Size:operatorSub(target)
    return Size.New(self.width - target.width, self.height - target.height)
end

return Size