-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:38
--- Description  : 绘图接口
------------------------------------------------
local IDraw = {}
local drawEvent = ArrayList.New()

function IDraw.__draw()
    SceneManager.__draw()
end

function IDraw.DrawImage(image)
    local transform = image.transform
    local position = transform:GetPosition()
    local rotation = math.rad(transform:GetRotation())
    local scale    = transform:GetScale()

    

    love.graphics.draw(image.sprite, position.x, position.y, rotation, scale.x, scale.y)
end

return IDraw