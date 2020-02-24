-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:38
--- Description  : 绘图接口
------------------------------------------------
local IEngine = {}
local drawEvent = ArrayList.New()

function IEngine:Start()
    Input.Init()
end

function IEngine.__update(dt)
    --先对输入设备进行管理，然后在更新场景
    Input.__update(dt)
    SceneManager.__update(dt)
end

function IEngine.__draw()
    SceneManager.__draw()
end

---@param sprite Sprite
function IEngine.DrawImage(sprite, x, y, r, width, height)
    local mWidth = width / sprite.m_imageData:getWidth()
    local mHeight = height / sprite.m_imageData:getHeight()
    love.graphics.draw(sprite.m_imageData, x, y, math.rad(r),  mWidth,  mHeight)
end

IEngine.Print     = love.graphics.print

---@param color Color
function IEngine.SetBackgroundColor(color)
    love.graphics.setBackgroundColor(color.r, color.g, color.b)
end

return IEngine