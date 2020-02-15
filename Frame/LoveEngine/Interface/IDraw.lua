---绘图接口
local IDraw = {}
local drawEvent = ArrayList.New()

function IDraw.__draw()
    Scene.__draw()
end

function IDraw.DrawImage(image)
    local transform = image.transform
    local position = transform:GetPosition()
    local rotation = transform:GetRotation()
    local scale    = transform:GetScale()
    love.graphics.draw(image.sprite, position.x, position.y, rotation, scale.x, scale.y)
end

return IDraw