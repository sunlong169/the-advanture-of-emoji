---@class Assets
local Assets = {}

---@return Sprite
function Assets.LoadSprite(path)
    local imgObj = love.graphics.newImage(path)
    local width = imgObj:getWidth()
    local height = imgObj:getHeight()
    return Sprite.New(imgObj, Size.New(width, height))
end

return Assets