-------------------ModuleInfo-------------------
--- Author       : dubq
--- Date         : 2020/02/16 20:33
--- Description  : 盒碰撞
------------------------------------------------

local BoxCollider, base = extends(Component, "BoxCollider")

function BoxCollider:PointConllider(x, y, left, right, top, bottom)
    if x < 1 or x > right or y < top or y > bottom then
        return false
    end
        return true
end

function BoxCollider:BodyConllider(aLeft, aRight, aTop, aBottom, bLeft, bRight, bTop, bBottom)
    if self.PointConllider(aLeft, aTop, bLeft, bTop, bRight, bBottom)
    or self.PointConllider(aRight, aTop, bLeft, bTop, bRight, bBottom)
    or self.PointConllider(aLeft, aBottom, bLeft, bTop, bRight, bBottom)
    or self.PointConllider(aRight, aBottom, bLeft, bTop, bRight, bBottom) then
        return true
    end
end

return BoxCollider