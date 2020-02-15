-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/16 01:03
--- Description  : 图形接口
------------------------------------------------
local IShape = {}

---获取一个精灵
function IShape.NewSprite(path)
    return love.graphics.newImage(path)
end

return IShape